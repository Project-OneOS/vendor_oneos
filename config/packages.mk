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
    MediaProvider \
    NoCutoutOverlay

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
