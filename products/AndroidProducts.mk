ifeq (mallow_angler,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/mallow_angler.mk
endif
ifeq (mallow_shamu,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/mallow_shamu.mk
endif
