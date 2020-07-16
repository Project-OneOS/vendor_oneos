DEVICE_PACKAGE_OVERLAYS += vendor/one/overlay/common

# Ignore overlays on RRO builds
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/one/overlay/common/packages/apps/Messaging

# Disable qmi EAP-SIM security
DISABLE_EAP_PROXY := true

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

# Face Unlock
TARGET_FACE_UNLOCK_SUPPORTED := false
ifeq ($(TARGET_GAPPS_ARCH),arm64)
ifneq ($(TARGET_DISABLE_ALTERNATIVE_FACE_UNLOCK), true)
PRODUCT_PACKAGES += \
    FaceUnlockService
TARGET_FACE_UNLOCK_SUPPORTED := true
endif
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.moto_unlock_service=$(TARGET_FACE_UNLOCK_SUPPORTED)

ifneq ($(HOST_OS),linux)
ifneq ($(sdclang_already_warned),true)
$(warning **********************************************)
$(warning * SDCLANG is not supported on non-linux hosts.)
$(warning **********************************************)
sdclang_already_warned := true
endif
else
# include definitions for SDCLANG
include vendor/one/sdclang/sdclang.mk
endif

# Build Miui-Style Brightness Slider
PRODUCT_PACKAGES += \
    BrightnessSliderOverlay

# GApps
ifeq ($(WITH_GAPPS),true)
include vendor/gapps/config.mk
PRODUCT_PACKAGES += \
    ModuleMetadataGooglePrebuilt
IS_PHONE := true
endif

# Perf Configs
$(call inherit-product-if-exists, vendor/qcom/common/perf/perf-vendor.mk)

include vendor/one/config/prebuilt.mk
include vendor/one/config/packages.mk
include vendor/one/config/branding.mk
include vendor/one/config/prop.mk
include vendor/one/config/gapps.mk

