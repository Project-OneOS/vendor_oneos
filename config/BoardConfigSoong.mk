# Setup SOONG_CONFIG_* vars to export the vars listed above.
# Documentation here:
# https://github.com/LineageOS/android_build_soong/commit/8328367c44085b948c003116c0ed74a047237a69

# PA Variables

SOONG_CONFIG_NAMESPACES += oneVarsPlugin

SOONG_CONFIG_oneVarsPlugin :=

define addVar
  SOONG_CONFIG_oneVarsPlugin += $(1)
  SOONG_CONFIG_oneVarsPlugin_$(1) := $$(subst ",\",$$($1))
endef

$(foreach v,$(EXPORT_TO_SOONG),$(eval $(call addVar,$(v))))

SOONG_CONFIG_NAMESPACES += oneGlobalVars
SOONG_CONFIG_oneGlobalVars += \
    target_surfaceflinger_fod_lib \
    target_init_vendor_lib \
    additional_gralloc_10_usage_bits \
    no_mask_layer \
    target_camera_needs_client_info \

# Set default values
TARGET_SURFACEFLINGER_FOD_LIB ?= surfaceflinger_fod_lib
TARGET_INIT_VENDOR_LIB ?= vendor_init
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS ?= 0

# Soong value variables
SOONG_CONFIG_oneGlobalVars_target_surfaceflinger_fod_lib := $(TARGET_SURFACEFLINGER_FOD_LIB)
SOONG_CONFIG_oneGlobalVars_target_init_vendor_lib := $(TARGET_INIT_VENDOR_LIB)
SOONG_CONFIG_oneGlobalVars_additional_gralloc_10_usage_bits := $(TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS)
SOONG_CONFIG_oneGlobalVars_no_mask_layer := $(TARGET_DISPLAY_HAS_NO_MASK_LAYER)
SOONG_CONFIG_oneGlobalVars_target_camera_needs_client_info := $(TARGET_CAMERA_NEEDS_CLIENT_INFO)
