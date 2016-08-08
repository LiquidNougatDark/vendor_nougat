# System ccache
export USE_CCACHE := 1
export USE_SYSTEM_CCACHE := 1
export ANDROID_COMPILE_WITH_JACK := true

# Optimize build
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
