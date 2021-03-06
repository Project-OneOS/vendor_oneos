LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := OneMusic
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := Music/Music.apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_PRODUCT_MODULE := true
TARGET_OUT_PRODUCT_APPS := $(target_out_product_app_base)

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := OneCalendar
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := Calendar/Calendar.apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_PRODUCT_MODULE := true

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)

LOCAL_MODULE := OneBrowser
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := Browser2 QuickSearchBox
LOCAL_SRC_FILES := Browser/Browser.apk
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_DEX_PREOPT := false
LOCAL_PRODUCT_MODULE := true

include $(BUILD_PREBUILT)
