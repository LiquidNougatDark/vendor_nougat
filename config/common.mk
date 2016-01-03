# Brand
PRODUCT_BRAND ?= mallow

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy= vendor/mallow/prebuilts/common/system

# UBER property overides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.bg_apps_limit=20 \
    pm.sleep.mode=1 \
    wifi.supplicant_scan_interval=180 \
    windowsmgr.max_events_per_sec=150 \
    debug.performance.tuning=1 \
    ro.ril.power_collapse=1 \
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
    ro.adb.secure=0

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/mallow/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/mallow/overlay/$(TARGET_PRODUCT)

# APN list
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Proprietary latinime lib needed for swyping
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Extra packages
PRODUCT_PACKAGES += \
    Busybox \
    Camera2 \
    Exchange2 \
    Gallery2 \
    Launcher3 \
    Stk

# Camera Effects
ifneq ($(filter mallow_flounder mallow_hammerhead mallow_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES +=  \
    vendor/mallow/prebuilt/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/mallow/prebuilt/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif

# Backuptool support
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/addon.d/50-mallow.sh:system/addon.d/50-mallow.sh \
    vendor/mallow/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/mallow/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh

# Bootanimation support
PRODUCT_COPY_FILES += \
    vendor/mallow/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Versioning System
PRODUCT_VERSION_MAJOR = 6.0.1
PRODUCT_VERSION_MINOR = build
PRODUCT_VERSION_MAINTENANCE = 1.0

ifdef MALLOW_BUILD_EXTRA
    MALLOW_POSTFIX := -$(MALLOW_BUILD_EXTRA)
endif
ifndef MALLOW_BUILD_TYPE
    MALLOW_BUILD_TYPE := beta
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
