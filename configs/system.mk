# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \

# UBER property overides
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=150 \
    persist.service.lgospd.enable=0 \
    persist.service.pcsync.enable=0 \
    ro.facelock.black_timeout=400 \
    ro.facelock.det_timeout=1500 \
    ro.facelock.rec_timeout=2500 \
    ro.facelock.lively_timeout=2500 \
    ro.facelock.est_max_time=600 \
    ro.facelock.use_intro_anim=false \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.sys.fw.bg_apps_limit=20 \
    debug.performance.tuning=1 \
    ro.cmte.legacy.version=1 \
    ro.ril.power_collapse=1 \
    pm.sleep.mode=1

# SELinux override
PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0

# Enable MTP by default
PRODUCT_PROPERTY_OVERRIDES += \
    sys.usb.config=mtp,adb \
    persist.sys.usb.config=mtp,adb

# GoogleDNS
PRODUCT_PROPERTY_OVERRIDES += \
    net.rmnet0.dns1=8.8.8.8 \
    net.rmnet0.dns2=8.8.4.4 \
    net.dns1=8.8.8.8 \
    net.dns2=8.8.4.4

# Hide KA launcher
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kerneladiutor.hide=true

# Don't compile SystemUITests
EXCLUDE_SYSTEMUI_TESTS := true

# APN list
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Backup script
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/$(VENDOR)/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/$(VENDOR)/prebuilt/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Custom overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/$(VENDOR)/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/$(VENDOR)/overlay/$(TARGET_PRODUCT)

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Extra packages
PRODUCT_PACKAGES += \
    Busybox \
    KernelAdiutor \
    ViPER4Android

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat

# Included packages
PRODUCT_PACKAGES += \
    Browser \
    ExactCalculator \
    Gallery2 \
    Launcher3 \
    messaging

# Custom ramdisk
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/init.$(VENDOR).rc:root/init.$(VENDOR).rc

# Init.d support
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/bin/sysinit:system/bin/sysinit

# Keyboard libs
ifneq ($(filter mallow_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif

# Media effects
ifneq ($(filter mallow_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES +=  \
    vendor/$(VENDOR)/prebuilt/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/$(VENDOR)/prebuilt/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif

# Superuser
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon \
    vendor/$(VENDOR)/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip

# Userinit support
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# Viperaudio
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/v4a.zip:system/addon.d/v4a.zip \
    vendor/$(VENDOR)/prebuilt/addon.d/91-v4a.sh:system/addon.d/91-v4a.sh

ifeq ($(TARGET_DEVICE),shamu)
   include vendor/mallow/configs/optimize/arm.mk
else
   include vendor/mallow/configs/optimize/arm64.mk
endif

