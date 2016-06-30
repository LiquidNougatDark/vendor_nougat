# Target device name
#export TARGET_DEVICE := angler
export TARGET_DEVICE := shamu

# Build ccache
export USE_CCACHE := 1
export USE_SYSTEM_CCACHE := 1
export ANDROID_COMPILE_WITH_JACK := true

# Kernel toolchain
ifeq ($(TARGET_DEVICE),shamu)
export TARGET_GCC_VERSION_ARM := 7.0
else
export TARGET_GCC_VERSION_ARM64 := 7.0
endif

# Optimize build
export USE_O3_OPTIMIZATIONS := false
export FORCE_DISABLE_DEBUGGING := true
export ENABLE_ARM_MODE := true
export ENABLE_IPA_ANALYSER := true
export TARGET_USE_PIPE := true
ifeq ($(TARGET_DEVICE),shamu)
export KRAIT_TUNINGS := true
else
export CORTEX_TUNINGS := true
endif
export ENABLE_PTHREAD := true
export ENABLE_GOMP := true
export GRAPHITE_OPTS := true
export ENABLE_EXTRAGCC := true
export STRICT_ALIASING := true
export ENABLE_SANITIZE := true

