# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017, 2020 The LineageOS Project
# Copyright (C) 2019 OneOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# OneOS OTA update package

TARGET_ROM_PACKAGE := $(PRODUCT_OUT)/OneOS-$(ONE_VERSION).zip

MD5 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/md5sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(TARGET_ROM_PACKAGE)
	$(hide) $(MD5) $(TARGET_ROM_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(TARGET_ROM_PACKAGE).md5sum
	@echo "Package Complete: $(TARGET_ROM_PACKAGE)" >&2
