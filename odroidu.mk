#
# Copyright (C) 2013 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

LOCAL_PATH := device/hardkernel/odroidu

# overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
        hardware/samsung_slsi/exynos4/lib/mali_ump/libEGL_mali.so:system/lib/egl/libEGL_mali.so \
        hardware/samsung_slsi/exynos4/lib/mali_ump/libGLESv1_CM_mali.so:system/lib/egl/libGLESv1_CM_mali.so \
        hardware/samsung_slsi/exynos4/lib/mali_ump/libGLESv2_mali.so:system/lib/egl/libGLESv2_mali.so \
        hardware/samsung_slsi/exynos4/lib/mali_ump/libMali.so:system/lib/libMali.so \
	hardware/samsung_slsi/exynos4/lib/mali_ump/libMali.so:obj/lib/libMali.so \
	hardware/samsung_slsi/exynos4/lib/mali_ump/libUMP.so:system/lib/libUMP.so \
	hardware/samsung_slsi/exynos4/lib/mali_ump/libUMP.so:obj/lib/libUMP.so \
	hardware/samsung_slsi/exynos4/lib/mali_ump/libion.so:system/lib/libion.so \
	hardware/samsung_slsi/exynos4/lib/mali_ump/libion.so:obj/lib/libion.so	

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.odroidu \
    fstab.odroidu.sdboot \
    init.odroidu.rc \
    init.odroidu.usb.rc \
    init.odroidu.wifi.rc \
    lpm.rc \
    ueventd.odroidu.rc


# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf


#codec.bin for audio analog parameters ---Add by CYIT
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/codec.bin:system/etc/audio/codec.bin

# audio
PRODUCT_PACKAGES += \
	audio_policy.odroidu \
	audio.primary.odroidu \
	audio.a2dp.default \
	audio.usb.default \
	libaudioutils \
	audio.r_submix.default


# Camera
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/init.exynos.cam.sh:system/etc/init.exynos.cam.sh

PRODUCT_PACKAGES += \
    camera.odroidu

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    e2fsck \
    setup_fs

# HW composer
PRODUCT_PACKAGES += \
    gralloc.odroidu \
    hwcomposer.exynos4 \
    libfimg \
    libnetcmdiface \
    libsync

# Keylayouts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/idc/odroid-ts.idc:system/usr/idc/odroidxu-ts.idc \
    $(LOCAL_PATH)/keylayout/odroid-ts.kl:system/usr/keylayout/odroidxu-ts.kl \
    $(LOCAL_PATH)/keylayout/odroid-keypad.kl:system/usr/keylayout/odroidxu-keypad.kl



# Lights
PRODUCT_PACKAGES += \
    lights.odroidu

# Media profile
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml

# Misc
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory



# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libSEC_OMX_Resourcemanager \
    libSEC_OMX_Core \
    libOMX.SEC.AVC.Decoder \
    libOMX.SEC.M4V.Decoder \
    libOMX.SEC.WMV.Decoder \
    libOMX.SEC.AVC.Encoder \
    libOMX.SEC.M4V.Encoder
#   libOMX.SEC.VP8.Decoder

# Radio
PRODUCT_PACKAGES += \
	rild \
	chat

# hwconvertor modules
PRODUCT_PACKAGES += \
	libhwconverter \
	libswconverter \
	libswscaler

# MFC firmware
PRODUCT_COPY_FILES += \
	hardware/samsung_slsi/exynos4/firmware/mfc_fw.bin:system/vendor/firmware/mfc_fw.bin

#USB 3g support
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    vendor/cm/prebuilt/common/etc/spn-conf.xml:system/etc/spn-conf.xml \
    $(LOCAL_PATH)/usb3g/etc/ppp/ip-down:system/etc/ppp/ip-down \
    $(LOCAL_PATH)/usb3g/etc/ppp/ip-up:system/etc/ppp/ip-up \
    $(LOCAL_PATH)/usb3g/etc/ppp/call-pppd:system/etc/ppp/call-pppd \
    $(LOCAL_PATH)/usb3g/etc/operator_table:system/etc/operator_table \
    $(LOCAL_PATH)/usb3g/bin/usb_modeswitch.sh:system/bin/usb_modeswitch.sh \
    $(LOCAL_PATH)/usb3g/bin/usb_modeswitch:system/bin/usb_modeswitch \
    $(LOCAL_PATH)/usb3g/lib/libril-rk29-dataonly.so:system/lib/libril-rk29-dataonly.so

modeswitch_files := $(shell ls $(LOCAL_PATH)/usb3g/etc/usb_modeswitch.d)
PRODUCT_COPY_FILES += \
    $(foreach file, $(modeswitch_files), \
    $(LOCAL_PATH)/usb3g/etc/usb_modeswitch.d/$(file):system/etc/usb_modeswitch.d/$(file))

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-rk29-dataonly.so \
    ril.function.dataonly=1

#USB GPS support
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/usb3g/lib/gps.default.so:system/lib/hw/gps.default.so \
    $(LOCAL_PATH)/configs/init.gps.sh:system/etc/init.gps.sh

#RT5370 module
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/usb3g/modules/rt5370sta.ko:system/lib/modules/rt5370sta.ko

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.gps=ttyUSB3 \
    ro.kernel.android.gps.speed=4800

#Hardkernel
PRODUCT_PACKAGES += \
	OdroidUpdater \
	Utility



ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.sys.root_access=3



# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mass_storage \
    ro.sf.hdmirotation=0 \
    ro.kernel.android.checkjni=0 

# Enable repeatable keys in CWM
PRODUCT_PROPERTY_OVERRIDES += \
    ro.cwm.enable_key_repeat=true \
    ro.cwm.repeatable_keys=114,115

# System properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.adb.secure=0 \
    ro.secure=0 \
    persist.sys.root_access=3 \
    mouse.right.click=back \
    ro.rfkilldisabled=1 \
    wifi.interface=wlan0

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardwardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    debug.hwui.render_dirty_regions=false


# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_CHARACTERISTICS := tablet

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

PRODUCT_TAGS += dalvik.gc.type-precise

