#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# This file includes all definitions that apply to ALL tuna devices, and
# are also specific to tuna devices
#
# Everything in this directory will become public

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/GT-I8530/kernel.bin
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

DEVICE_PACKAGE_OVERLAYS := device/samsung/GT-I8530/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES := \
	lights.tuna \
	charger \
	charger_res_images


PRODUCT_PACKAGES += \
	power.tuna

# Audio
PRODUCT_PACKAGES += \
	audio.primary.tuna \
	audio.a2dp.default \
	audio.usb.default \
	audio.r_submix.default

PRODUCT_COPY_FILES += \
	device/samsung/GT-I8530/audio/audio_policy.conf:system/etc/audio_policy.conf \
	device/samsung/GT-I8530/audio_effects.conf:system/vendor/etc/audio_effects.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_KERNEL):kernel \
	device/samsung/GT-I8530/init.samsung.rc:root/init.samsung.rc \
	device/samsung/GT-I8530/init.samsung.usb.rc:root/init.samsung.usb.rc \
	device/samsung/GT-I8530/fstab.samsunggavini:root/fstab.samsunggavini \
	device/samsung/GT-I8530/init.samsunggavini.rc:root/init.samsunggavini.rc \
	device/samsung/GT-I8530/init.samsunggavini.usb.rc:root/init.samsunggavini.usb.rc \
	device/samsung/GT-I8530/prerecovery.rc:root/prerecovery.rc \
	device/samsung/GT-I8530/ueventd.tuna.rc:root/ueventd.tuna.rc \
	device/samsung/GT-I8530/recovery.rc:root/recovery.rc \
	device/samsung/GT-I8530/ueventd.samsung.rc:root/ueventd.samsung.rc \
	device/samsung/GT-I8530/ueventd.samsunggavini.rc:root/ueventd.samsunggavini.rc \
	device/samsung/GT-I8530/media_profiles.xml:system/etc/media_profiles.xml \
	device/samsung/GT-I8530/media_codecs.xml:system/etc/media_codecs.xml \
	device/samsung/GT-I8530/gps.conf:system/etc/gps.conf \
	device/samsung/GT-I8530/gps.conf:system/etc/gps.xml

# Wifi
# ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
# PRODUCT_COPY_FILES += \
# 	$(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcmdhd.ko
# endif
# PRODUCT_COPY_FILES += \
# 	device/samsung/tuna/bcmdhd.cal:system/etc/wifi/bcmdhd.cal

 PRODUCT_PROPERTY_OVERRIDES := \
 	wifi.interface=wlan0

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
	media.aac_51_output_enabled=true

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# Key maps
PRODUCT_COPY_FILES += \
	device/samsung/GT-I8530/gavini-kp.kl:system/usr/keylayout/gavini-kp.kl

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
  frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml

# Portrait dock image
PRODUCT_COPY_FILES += \
    device/samsung/GT-I8530/dock.png:system/vendor/res/images/dock/dock.png

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
	ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
	ro.com.google.clientidbase=android-google \
	ro.com.android.wifi-watchlist=GoogleGuest \
	ro.setupwizard.enterprise_mode=1 \
	ro.com.android.dateformat=MM-dd-yyyy

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	librs_jni \
	com.android.future.usb.accessory

# Filesystem management tools
PRODUCT_PACKAGES += \
	e2fsck \
	setup_fs

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# $(call inherit-product-if-exists, vendor/nxp/pn544/nxp-pn544-fw-vendor.mk)
# $(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
# $(call inherit-product-if-exists, vendor/ti/proprietary/omap4/ti-omap4-vendor.mk)
# $(call inherit-product-if-exists, vendor/samsung/tuna/device-vendor.mk)

BOARD_WLAN_DEVICE_REV := bcm4330_b2
WIFI_BAND             := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
