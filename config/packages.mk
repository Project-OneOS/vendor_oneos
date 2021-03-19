# Build OneOS apps
PRODUCT_PACKAGES += \
    Aurora \
    ThemePicker \
    FMRadio \
    Updater \
    OnePapers \
    YadaYada \
    StitchImage \
    QuickAccessWallet

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
PRODUCT_PACKAGES += \
    FaceUnlockService
TARGET_FACE_UNLOCK_SUPPORTED := true
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face_unlock_service.enabled=$(TARGET_FACE_UNLOCK_SUPPORTED)
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.biometrics.face.xml

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

# Custom Overlays
PRODUCT_PACKAGES += \
    ONEImmersiveNavigationOverlay \

$(call inherit-product-if-exists, external/google-fonts/lato/fonts.mk)
$(call inherit-product-if-exists, external/google-fonts/rubik/fonts.mk)

