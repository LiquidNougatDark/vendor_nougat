ifeq (nougat_angler,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/nougat_angler.mk
endif
ifeq (nougat_shamu,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/nougat_shamu.mk
endif
ifeq (nougat_bullhead,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/nougat_bullhead.mk
endif
