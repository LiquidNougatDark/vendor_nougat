# System ccache
export USE_CCACHE := 1
export USE_SYSTEM_CCACHE := 1
export ANDROID_COMPILE_WITH_JACK := true

# Target device
export TARGET_DEVICE := angler

# Optimizes build
export CLANG_O3 := true
export GRAPHITE_OPTS := true
ifeq ($(TARGET_DEVICE),shamu)
export KRAIT_TUNINGS := true
else
export CORTEX_TUNINGS := true
endif
export ENABLE_ARM_MODE := true
export ENABLE_GCCONLY := true
export ENABLE_SANITIZE := true
export STRICT_ALIASING := true
export USE_PIPE := true

# Toolchain versions
export TARGET_NDK_GCC_VERSION := 4.9
export TARGET_GCC_VERSION_EXP := 4.9
ifeq ($(TARGET_DEVICE),shamu)
export TARGET_GCC_VERSION := 5.4
export TARGET_GCC_VERSION_ARM := 7.0
else
export TARGET_GCC_VERSION := 6.1
export TARGET_GCC_VERSION_ARM64 := 7.0
endif

