DEVICE_PACKAGE_OVERLAYS += vendor/one/overlay/common

# Ignore overlays on RRO builds
PRODUCT_ENFORCE_RRO_EXCLUDED_OVERLAYS += \
    vendor/one/overlay/common/packages/apps/Messaging

# Disable qmi EAP-SIM security
DISABLE_EAP_PROXY := true

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
include vendor/partner_gms/products/gms.mk
include vendor/partner_gms/products/turbo.mk
endif

# Perf Configs
$(call inherit-product-if-exists, vendor/qcom/common/perf/perf-vendor.mk)

include vendor/google-customization/config.mk

include vendor/one/config/prebuilt.mk
include vendor/one/config/packages.mk
include vendor/one/config/branding.mk
include vendor/one/config/prop.mk
include vendor/one/config/gapps.mk

