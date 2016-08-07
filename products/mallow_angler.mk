# Copyright (C) 2015 MallowRom
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

# Include common configuration
include vendor/mallow/main.mk

# Inherit device configuration
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Override build properties
PRODUCT_NAME := mallow_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:6.0.1/MTC20F/3031278:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 6.0.1 MTC20F 3031278 release-keys"

# Inline kernel building
TARGET_GCC_VERSION_ARM64 := 7.0
TARGET_KERNEL_SOURCE := kernel/huawei/angler
TARGET_KERNEL_CONFIG := saber_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

# UBER optimizations
export CLANG_O3 := true
export USE_PIPE := true
export GRAPHITE_OPTS := true
export CORTEX_TUNINGS := true
export ENABLE_GCCONLY := true
export ENABLE_ARM_MODE := true
export STRICT_ALIASING := true
export ENABLE_SANITIZE := true
