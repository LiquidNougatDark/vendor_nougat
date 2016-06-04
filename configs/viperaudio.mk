# Viper4Android
PRODUCT_PACKAGES += \
    ViPER4Android

PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/addon.d/91-v4a.sh:system/addon.d/91-v4a.sh \
    vendor/$(VENDOR)/prebuilt/etc/v4a.zip:system/addon.d/v4a.zip

PRODUCT_PROPERTY_OVERRIDES += \
    AUDIODRIVER=alsa \
    ro.sound.driver=alsa \
    ro.audio.driver=alsa \
    ro.enforce.driver.priority=alsa \
    ro.sound.alsa=snd_pcm \
    alsa.mixer.playback.master=Speaker \
    alsa.mixer.capture.master=Mic \
    alsa.mixer.playback.earpiece=Earpiece \
    alsa.mixer.capture.earpiece=Mic \
    alsa.mixer.playback.headset=Headset \
    alsa.mixer.capture.headset=Mic \
    alsa.mixer.playback.speaker=Speaker \
    alsa.mixer.capture.speaker=Mic \
    alsa.mixer.playback.bt.sco=BTHeadset \
    alsa.mixer.capture.bt.sco=BTHeadset \
    audio.offload.pcm.enable=true \
    audio.offload.pcm.16bit.enable=false \
    audio.offload.pcm.24bit.enable=true \
    audio.offload.pcm.32bit.enable=true \
    audio.offload.track.enable=true \
    audio.offload.gapless.enabled=true \
    audio.offload.video=false \
    sys.keep_app_1=com.vipercn.viper4android_v2 \
    ro.media.enc.jpeg.quality=100 \
    audio.deep_buffer.media=false \
    persist.sys.media.use-awesome=1 \
    af.resampler.quality=255 \
    persist.af.resampler.quality=255 \
    persist.dev.pm.dyn_samplingrate=1 \
    ro.sound.driver=alsa \
    ro.sound.alsa=snd_pcm \
    ro.sound.driver=alsa \
    media.stagefright.use-awesome=false \
    persist.sys.media.use-awesome=0 \
    lpa.decode=false \
    lpa.releaselock=false \
    lpa.use-stagefright=false \
    tunnel.audio.encode=false \
    tunnel.multiple=true \
    tunnel.decode=false \
    tunnel.audiovideo.decode=false \
    clock.allow_streaming_errors=false \
    default.pcm.rate_converter=samplerate_best \
    sony.effect.custom.sp_bundle=0x122 \
    sony.effect.custom.caplus_hs=0x298 \
    sony.effect.custom.caplus_sp=0x2B8 \
    sony.support.effect=0x1FF \
    ro.semc.clearaudio.supported=true \
    ro.semc.xloud.supported=true \
    ro.somc.sforce.supported=true \
    persist.service.xloud.enable=1 \
    persist.service.clearphase.enable=1 \
    persist.service.sforce.enable=1 \
    persist.audio.hp=true \
    mmp.enable.3g2=true \
    media.aac_51_output_enabled=true \
    persist.hwc.ptor.enable=true \
    persist.speaker.prot.enable=false
