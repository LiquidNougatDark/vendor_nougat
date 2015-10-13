# Brand
PRODUCT_BRAND ?= mallow

# Local path for prebuilts
LOCAL_PATH:= vendor/mallow/prebuilts/common/system

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    drm.service.enabled=true \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.setupwizard.network_required=false \
    ro.setupwizard.gservices_delay=-1 \
    ro.build.selinux=1 \
    ro.adb.secure=1

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += \
    vendor/mallow/overlay/common

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# media effects
PRODUCT_COPY_FILES +=  \
    vendor/mallow/prebuilt/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/mallow/prebuilt/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd

# Latin IME lib - gesture typing
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Extra packages
PRODUCT_PACKAGES += \
    Busybox \
    Launcher3 \
    Stk

# APN list
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/etc/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/mallow/prebuilt/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/bin/sysinit:system/bin/sysinit

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/addon.d/50-mallow.sh:system/addon.d/50-mallow.sh \
    vendor/mallow/prebuilt/addon.d/99-backup.sh:system/addon.d/99-backup.sh \
    vendor/mallow/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/mallow/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/mallow/prebuilt/etc/backup.conf:system/etc/backup.conf

# Bootanimation support
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Versioning System
PRODUCT_VERSION_MAJOR = 6.0.0
PRODUCT_VERSION_MINOR = alpha
PRODUCT_VERSION_MAINTENANCE = 0.1

ifdef MALLOW_BUILD_EXTRA
    MALLOW_POSTFIX := -$(MALLOW_BUILD_EXTRA)
endif
ifndef MALLOW_BUILD_TYPE
    MALLOW_BUILD_TYPE := alpha
    MALLOW_POSTFIX := $(shell date +"%Y%m%d")
endif

# Set all versions
MALLOW_VERSION := Mallow-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)
MALLOW_MOD_VERSION := Mallow-$(MALLOW_BUILD)-$(MALLOW_BUILD_TYPE).$(PRODUCT_VERSION_MAINTENANCE)-$(MALLOW_POSTFIX)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    mallow.ota.version=$(PRODUCT_VERSION_MAJOR)-$(MALLOW_POSTFIX) \
    ro.mallow.version=$(MALLOW_VERSION) \
    ro.modversion=$(MALLOW_MOD_VERSION) \
    ro.mallow.buildtype=$(MALLOW_BUILD_TYPE)

FINISHER_SCRIPT := vendor/mallow/tools/finisher
SQUISHER_SCRIPT := vendor/mallow/tools/squisher
CHANGELOG_SCRIPT := vendor/mallow/tools/changelog.sh

