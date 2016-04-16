# Property overrides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    persist.service.adb.enable=1 \
    net.tethering.noprovisioning=true \
    drm.service.enabled=true \
    persist.sys.dun.override=0 \
    ro.build.selinux=1 \
    ro.adb.secure=0

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Proprietary latinime libs
ifneq ($(filter mallow_hammerhead mallow_flo mallow_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/lib/libjni_latinimegoogle.so:system/lib/libjni_latinimegoogle.so
else
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif
