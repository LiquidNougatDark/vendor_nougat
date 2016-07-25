# Theme engine
PRODUCT_PACKAGES += \
    aapt \
    ThemeChooser \
    ThemesProvider

PRODUCT_COPY_FILES += \
    vendor/mallow/configs/permissions/com.tmobile.software.themes.xml:system/etc/permissions/com.tmobile.software.themes.xml \
    vendor/mallow/configs/permissions/org.cyanogenmod.theme.xml:system/etc/permissions/org.cyanogenmod.theme.xml
