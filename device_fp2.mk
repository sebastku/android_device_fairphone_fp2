$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/fairphone/fp2/fp2-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/fairphone/fp2/overlay


ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/fairphone/fp2/prebuilts/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


LOCAL_KERNEL_DT := device/fairphone/fp2/prebuilts/dt.img
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL_DT):dt.img

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_fp2
PRODUCT_DEVICE := fp2