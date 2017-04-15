# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.setupwizard.rotation_locked=true

# UBER property overides
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.fw.bg_apps_limit=20 \
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
    ro.substratum.verified=true \
    ro.opa.eligible_device=true \
    ro.adb.secure=1

# Include Substratum unless SUBSTRATUM is set to false
ifneq ($(SUBSTRATUM),false)
    PRODUCT_PACKAGES += \
        Substratum
endif

# APN config
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml

# Backup script
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/nougat/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions

# Boot animation
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/media/bootanimation.zip:system/media/bootanimation.zip

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Gestures libraries
PRODUCT_COPY_FILES += \
    vendor/nougat/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so

# Viper4Android
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/addon.d/viper.zip:system/addon.d/viper.zip

# Camera effects
ifneq ($(filter nougat_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES +=  \
    vendor/nougat/prebuilt/vendor/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
    vendor/nougat/prebuilt/vendor/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
endif

# Include packages
PRODUCT_PACKAGES += \
    AOSPLinks \
    Busybox \
    Gallery2 \
    Launcher3 \
    QuickSearchBox \
    ThemeInterfacer

# Facelock issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# Exclude SystemUI tests
EXCLUDE_SYSTEMUI_TESTS := true

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/nougat/overlay/common

# Inherit build prop overrides
-include vendor/nougat/config/common_version.mk
