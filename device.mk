#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := nosdcard

# Rootdir
PRODUCT_PACKAGES += \
    init.gadgethal.sh \
    init.gourami.sh \
    init.insmod.sh \
    init.mi.btmac.sh \
    init.qti.chg_policy.sh \
    init.radio.sh \
    init.ramoops.sh \
    init.sensors.sh \
    install-recovery.sh \

PRODUCT_PACKAGES += \
    fstab.persist \
    init.gourami.rc \
    init.sm8250.diag.rc \
    init.sm8250.logging.rc \
    init.sm8250.mpssrfs.rc \
    init.sm8250.power.rc \
    init.sm8250.rc \
    init.sm8250.usb.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.persist:$(TARGET_COPY_OUT_RAMDISK)/fstab.persist

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/xiaomi/apollo/apollo-vendor.mk)
