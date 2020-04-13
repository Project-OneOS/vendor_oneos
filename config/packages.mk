# Build OneOS apps
PRODUCT_PACKAGES += \
    Aurora \
    OneMusic \
    SnapdragonGallery \
    messaging \
    OneCalender \
    OneBrowser \
    ThemePicker \
    FMRadio \
    Updater \
    OnePapers \
    StitchImage \
    NoCutoutOverlay

# Build sound recorder
PRODUCT_PACKAGES += Recorder

# Override AOSP/CAF PACKAGES
PRODUCT_PACKAGES += \
    SafetyHubPrebuilt  \
    SettingsIntelligenceGooglePrebuilt

#include vendor/one/prebuilt/common/app/Android.mk
