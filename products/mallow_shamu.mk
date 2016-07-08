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
$(call inherit-product, device/moto/shamu/aosp_shamu.mk)

# Override build properties
PRODUCT_NAME := mallow_shamu
PRODUCT_BRAND := Google
PRODUCT_DEVICE := shamu
PRODUCT_MODEL := Nexus 6
PRODUCT_MANUFACTURER := motorola

# Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=shamu \
    BUILD_FINGERPRINT=google/shamu/shamu:6.0.1/MOB30O/2920157:user/release-keys \
    PRIVATE_BUILD_DESC="shamu-user 6.0.1 MOB30O 2920157 release-keys"

# Inline kernel building
TARGET_GCC_VERSION_ARM := 6.1
TARGET_KERNEL_CONFIG := B14CKB1RD_defconfig
TARGET_KERNEL_SOURCE := kernel/moto/shamu
BOARD_KERNEL_IMAGE_NAME := zImage-dtb

# UBER optimizations
export CLANG_O3 := true
export USE_PIPE := true
export KRAIT_TUNINGS := true
export GRAPHITE_OPTS := true
export ENABLE_GCCONLY := true
export STRICT_ALIASING := true
export ENABLE_SANITIZE := true
