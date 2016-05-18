# SELinux override
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Extra packages
PRODUCT_PACKAGES += \
    Busybox \
    Viper4Android

# Included packages
PRODUCT_PACKAGES += \
    Browser \
    ExactCalculator \
    Gallery2 \
    Launcher3 \
    messaging

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
