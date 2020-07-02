# Build OneOS apps
PRODUCT_PACKAGES += \
    Aurora \
    OneBrowser \
    ThemePicker \
    FMRadio \
    Updater \
    OnePapers \
    StitchImage \
    MediaProvider

# Build sound recorder
PRODUCT_PACKAGES += Recorder

# Override AOSP/CAF PACKAGES
PRODUCT_PACKAGES += \
    SafetyHubPrebuilt  \
    SettingsIntelligenceGooglePrebuilt

# Telephony packages
PRODUCT_PACKAGES += \
    Stk \
    CellBroadcastReceiver

PRODUCT_DEXPREOPT_SPEED_APPS += \
    Aurora \
    Settings \
    SystemUI

# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# Offline charger
PRODUCT_PACKAGES += \
    charger_res_images \
    product_charger_res_images

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

# Font
PRODUCT_PACKAGES += \
    FontGoogleSansOverlay \
    FontSlateForOnePlusOverlay \

