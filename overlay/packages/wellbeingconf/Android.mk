LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_PACKAGE_NAME := wellbeingconf
LOCAL_PRODUCT_MODULE := true
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res
LOCAL_SDK_VERSION := current
include $(BUILD_RRO_PACKAGE)
