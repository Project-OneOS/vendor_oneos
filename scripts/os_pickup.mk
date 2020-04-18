LOCAL_PATH := $(call my-dir)

HAL_P := $(shell basename $(LOCAL_PATH))

ifeq ($(HAL_P), $(QCOM_HARDWARE_VARIANT))
include $(call all-subdir-makefiles,$(HAL_P))
endif

