# Inherit device configuration
$(call inherit-product, device/lge/bullhead/aosp_bullhead.mk)

# Inherit some common stuff
$(call inherit-product, vendor/nougat/config/common.mk)

# Inherit some phone stuff
$(call inherit-product, vendor/nougat/config/common_full_phone.mk)

# Target device
TARGET_DEVICE := bullhead
export TARGET_DEVICE

# Override build properties
PRODUCT_NAME := nougat_bullhead
PRODUCT_BRAND := google
PRODUCT_DEVICE := bullhead
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE

# Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bullhead \
    BUILD_FINGERPRINT=google/bullhead/bullhead:7.1.2/N2G47F/3769476:user/release-keys \
    PRIVATE_BUILD_DESC="bullhead-user 7.1.2 N2G47F 3769476 release-keys"

