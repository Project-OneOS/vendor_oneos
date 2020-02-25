LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := OneBrowser
LOCAL_OVERRIDES_PACKAGES := Browser2 QuickSearchBox
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := common/app/$(LOCAL_MODULE)/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := OneCalendar
LOCAL_OVERRIDES_PACKAGES := Calendar
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := common/app/$(LOCAL_MODULE)/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := OneMusic
LOCAL_OVERRIDES_PACKAGES := Music
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := common/app/$(LOCAL_MODULE)/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := SafetyHubPrebuilt
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := common/priv-app/$(LOCAL_MODULE)/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := EmergencyInfo
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_PRODUCT_MODULE := true
LOCAL_REQUIRED_MODULES := EmergencyInfoGoogleNoUi
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := SettingsIntelligenceGooglePrebuilt
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := common/priv-app/$(LOCAL_MODULE)/$(LOCAL_MODULE).apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := SettingsIntelligence
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_PRODUCT_MODULE := true
include $(BUILD_PREBUILT)