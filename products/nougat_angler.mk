# Inherit device configuration
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Inherit some common stuff
$(call inherit-product, vendor/nougat/config/common.mk)

# Inherit some phone stuff
$(call inherit-product, vendor/nougat/config/common_full_phone.mk)

# Override build properties

PRODUCT_NAME := nougat_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

# Device fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    PRIVATE_BUILD_DESC="angler-user 7.1.1 N4F26J 3549317 release-keys" \
    BUILD_FINGERPRINT=google/angler/angler:7.1.1/N4F26J/3549317:user/release-keys

