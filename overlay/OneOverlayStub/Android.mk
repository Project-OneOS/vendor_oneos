LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_PACKAGE_NAME := OneOverlayStub
LOCAL_SDK_VERSION := current
LOCAL_CERTIFICATE := platform
LOCAL_PRIVILEGED_MODULE := false
LOCAL_REQUIRED_MODULES := \
    AccentColorDodgerBlueOverlay \
    AccentColorHadalZoneOverlay \
    AccentColorLostInForestOverlay \
    AccentColorPixelBlueOverlay \
    AccentColorPurpleHeatOverlay \
    AccentColorRedOverlay \
    AccentColorRoseOverlay \
    AccentColorScooterOverlay \
    AccentColorSlateOverlay \
    AccentColorSuperNovaOverlay \
    AccentColorTealOverlay \
    AccentColorTorchRedOverlay \
    FontGoogleSansOverlay \
    FontSlateForOnePlusOverlay \
    IconShapePebbleOverlay
include $(BUILD_PACKAGE)
