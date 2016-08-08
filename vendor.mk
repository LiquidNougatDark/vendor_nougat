# Export rom name
export VENDOR := mallow

# Target device name
export TARGET_DEVICE := angler

# Kernel toolchain
ifeq ($(TARGET_DEVICE),shamu)
export TARGET_GCC_VERSION_ARM := 7.0
else
export TARGET_GCC_VERSION_ARM64 := 7.0
endif

