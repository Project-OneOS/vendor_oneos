function __print_one_functions_help() {
cat <<EOF
Additional CAF functions:
- cout:            Changes directory to out.
- mka:             Builds using SCHED_BATCH on all processors.
- repolastsync:    Prints date and time of last repo sync.
EOF
}

function brunch()
{
    breakfast $*

    if [ $? -eq 0 ]; then
        mka bacon
    else
        echo "No such item in brunch menu. Try 'breakfast'"
        return 1
    fi
    return $?
}

function link_hals() {
    local TARGET_QCOM_VARIANT=$(get_build_var QCOM_HARDWARE_VARIANT)
    local TARGET_BOARD_PLATFORM=$(get_build_var TARGET_BOARD_PLATFORM)
    local DISPLAY_PATH=$(gettop)/hardware/qcom/${TARGET_QCOM_VARIANT}/display
    local MEDIA_PATH=$(gettop)/hardware/qcom/${TARGET_QCOM_VARIANT}/media
    local AUDIO_PATH=$(gettop)/vendor/qcom/opensource/audio-hal/primary-hal/${TARGET_QCOM_VARIANT}
    [ ! -d ${AUDIO_PATH} ] && {
        AUDIO_PATH=$(gettop)/hardware/qcom/${TARGET_QCOM_VARIANT}/audio
    }
    local HAL_LIST="${DISPLAY_PATH} ${MEDIA_PATH} ${AUDIO_PATH}"
    local BOARD_PATH=$(gettop)/vendor/qcom/defs/board-defs/vendor
    local PRODUCT_PATH=$(gettop)/vendor/qcom/defs/product-defs/vendor
    [ ! -d ${BOARD_PATH} ] && mkdir -p ${BOARD_PATH}
    [ ! -d ${PRODUCT_PATH} ] && mkdir -p ${PRODUCT_PATH}
    cd ${PRODUCT_PATH} && rm -f $(echo " $(get_build_var QCOM_BOARD_PLATFORMS)" | tr -s [:space:] ' ' | sed "s: :.mk :g" | sed "s: : *:g")
    cd $(gettop)
    for HAL in ${HAL_LIST}; do
        [ -d ${HAL} ] && {
            local HAL_NAME=$(basename ${HAL})
            [ "${HAL_NAME}" == "${TARGET_QCOM_VARIANT}" ] && {
                HAL_NAME="audio"
            }
            local REAL_LINK=$(gettop)/hardware/qcom/${HAL_NAME}
            [ ! -f ${REAL_LINK}/.${TARGET_QCOM_VARIANT} ] && rm -rf ${REAL_LINK}
            [ ! -d ${REAL_LINK} ] || \
               (cd ${HAL} && \
               ([ $(git rev-parse HEAD) != $(git rev-parse m/eleven-caf) ] || \
               git status | grep -q "Untracked files" || \
               git status | grep -q "Changes to be committed" || \
               git status | grep -q "Changes not staged for commit")) && {
                croot
                rm -rf $(gettop)/hardware/qcom/${HAL_NAME}
                cp -r ${HAL} ${REAL_LINK}
                touch ${REAL_LINK}/.${TARGET_QCOM_VARIANT}
                find ${REAL_LINK} -type f -exec sed -i "s:vendor/qcom/opensource/audio-hal/primary-hal:hardware/qcom/audio:g" {} \;
                find ${REAL_LINK} -type f -exec sed -i "s:\$(QCOM_MEDIA_ROOT):hardware/qcom/media:g" {} \;
#                rm -rf ${REAL_LINK}/.git
#                ln -f ${HAL}/.git ${REAL_LINK}/.git
            }
            rm -rf ${BOARD_PATH}/*${HAL_NAME}*mk ${PRODUCT_PATH}/*${HAL_NAME}*mk 2&>/dev/null
            PRODUCT_MK=$(find ${REAL_LINK}/ -type f -name "*product*.mk")
            BOARD_MK=$(find ${REAL_LINK}/ -type f -name "*board*.mk")
            TARGET_MK=$(find ${REAL_LINK}/ -type f -name "${TARGET_BOARD_PLATFORM}.mk")
            [ -f ${PRODUCT_MK} ] && {
                ln -f ${PRODUCT_MK} ${PRODUCT_PATH}/${HAL_NAME}-product.mk
            }
            [ -f ${BOARD_MK} ] && {
                ln -f ${BOARD_MK} ${BOARD_PATH}/${HAL_NAME}-board.mk
            }
            [ -f ${TARGET_MK} ] && {
                ln -f ${TARGET_MK} ${PRODUCT_PATH}/${HAL_NAME}-${TARGET_BOARD_PLATFORM}.mk
            }
        }
    done
    [ -d $(gettop)/device/qcom/kernelscripts ] && {
        rm -rf $(gettop)/vendor/one/build/tasks/kernel_definitions.mk
        ln -f $(gettop)/device/qcom/kernelscripts/kernel_definitions.mk vendor/one/build/tasks/kernel_definitions.mk
    }
}

function breakfast()
{
    target=$1
    local variant=$2
    if [ $# -eq 0 ]; then
        # No arguments, so let's have the full menu
        lunch
    else
        echo "z$target" | grep -q "-"
        if [ $? -eq 0 ]; then
            # A buildtype was specified, assume a full device name
            lunch $target
        else
            # This is probably just the Lineage model name
            if [ -z "$variant" ]; then
                variant="userdebug"
            fi
            lunch one_$target-$variant
        fi
    fi

    # PREBUILT RECOVERY RAMDISK CPIO
    local TARGET_PREBUILT_RECOVERY_RAMDISK_CPIO=$(get_abs_build_var TARGET_PREBUILT_RECOVERY_RAMDISK_CPIO)
    local TARGET_RECOVERY_ROOT_OUT=$(get_abs_build_var TARGET_RECOVERY_ROOT_OUT)
    if [ ! -z "$TARGET_PREBUILT_RECOVERY_RAMDISK_CPIO" ]
    then
        if [ -d $TARGET_RECOVERY_ROOT_OUT ]
        then
            rm -rf $TARGET_RECOVERY_ROOT_OUT
        fi
    fi
    return $?
}

alias bib=breakfast

function cout()
{
    if [  "$OUT" ]; then
        cd $OUT
    else
        echo "Couldn't locate out directory.  Try setting OUT."
    fi
}

# Make using all available CPUs
function mka() {
    if [ -f $ANDROID_BUILD_TOP/$QTI_BUILDTOOLS_DIR/build/update-vendor-hal-makefiles.sh ]; then
        vendor_hal_script=$ANDROID_BUILD_TOP/$QTI_BUILDTOOLS_DIR/build/update-vendor-hal-makefiles.sh
        source $vendor_hal_script --check
        regen_needed=$?
    else
        vendor_hal_script=$ANDROID_BUILD_TOP/vendor/one/scripts/vendor_hal_makefile_generator.sh
        regen_needed=1
    fi

    if [ $regen_needed -eq 1 ]; then
        _wrap_build $(get_make_command hidl-gen) hidl-gen ALLOW_MISSING_DEPENDENCIES=true
        RET=$?
        if [ $RET -ne 0 ]; then
            echo -n "${color_failed}#### hidl-gen compilation failed, check above errors"
            echo " ####${color_reset}"
            return $RET
        fi
        source $vendor_hal_script
        RET=$?
        if [ $RET -ne 0 ]; then
            echo -n "${color_failed}#### HAL file .bp generation failed dure to incpomaptible HAL files , please check above error log"
            echo " ####${color_reset}"
            return $RET
        fi
    fi

    schedtool -B -n 1 -e ionice -n 1 make -j$(($(nproc --all) * 2)) "$@"
}

function repolastsync() {
    RLSPATH="$ANDROID_BUILD_TOP/.repo/.repo_fetchtimes.json"
    RLSLOCAL=$(date -d "$(stat -c %z $RLSPATH)" +"%e %b %Y, %T %Z")
    RLSUTC=$(date -d "$(stat -c %z $RLSPATH)" -u +"%e %b %Y, %T %Z")
    echo "Last repo sync: $RLSLOCAL / $RLSUTC"
}

# Android specific JACK args
if [ -n "$JACK_SERVER_VM_ARGUMENTS" ] && [ -z "$ANDROID_JACK_VM_ARGS" ]; then
    export ANDROID_JACK_VM_ARGS=$JACK_SERVER_VM_ARGUMENTS
fi
