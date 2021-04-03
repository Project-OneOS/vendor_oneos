DEVICE_PACKAGE_OVERLAYS += vendor/one/overlay/common

# Ignore overlays on RRO builds
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/one/overlay/common/packages/apps/Messaging

# Disable qmi EAP-SIM security
DISABLE_EAP_PROXY := true

# Enable Debug art
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := true

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images \
    libc++.vendor

# Vendor libgui
PRODUCT_PACKAGES += \
    libgui_vendor

# Vendor libstdc++
PRODUCT_PACKAGES += \
    libstdc++.vendor

#VNDK
PRODUCT_PACKAGES += \
    libhidltransport \
    libhidltransport.vendor \
    libhwbinder \
    libhwbinder.vendor

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.base@1.0 \
    android.hidl.manager@1.0 \
    android.hidl.base@1.0.vendor \
    android.hidl.manager@1.0.vendor

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

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=1
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
endif

PRODUCT_PROPERTY_OVERRIDES += ro.control_privapp_permissions=log

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

# Sounds
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.ringtone=Beyond_The_Line.ogg \
    ro.config.notification_sound=Tethys.ogg \
    ro.config.alarm_alert=Argon.ogg

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    ro.com.android.dataroaming=false \
    ro.com.android.dateformat=MM-dd-yyyy \
    persist.sys.disable_rescue=true

# GApps
ifeq ($(WITH_GAPPS),true)
   include vendor/partner_gms/products/gms.mk
   include vendor/partner_gms/products/turbo.mk
   include vendor/partner_modules/build/mainline_modules.mk
endif

include vendor/one/config/prebuilt.mk
include vendor/one/config/packages.mk
include vendor/one/config/branding.mk
include vendor/one/config/prop.mk
include vendor/one/config/telephony.mk
