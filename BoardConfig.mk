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

LOCAL_PATH := device/hardkernel/odroidu

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include


# Architecture
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_NEON := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a9 -mfpu=neon -mfloat-abi=softfp

EXYNOS4X12_ENHANCEMENTS := true
EXYNOS4_ENHANCEMENTS := true
ifdef EXYNOS4X12_ENHANCEMENTS
COMMON_GLOBAL_CFLAGS += -DEXYNOS4_ENHANCEMENTS
COMMON_GLOBAL_CFLAGS += -DEXYNOS4X12_ENHANCEMENTS
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
endif
BOARD_VENDOR := samsung
TARGET_BOARD_PLATFORM := exynos4
TARGET_SOC := exynos4x12
TARGET_BOOTLOADER_BOARD_NAME := odroidu
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
# Kernel
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_CONFIG := odroidu_android_442_defconfig
TARGET_KERNEL_SOURCE := kernel/hardkernel/odroidu


# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_I2S_AUDIO := true
BOARD_USES_PCM_AUDIO := false
BOARD_USES_SPDIF_AUDIO := false
# ULP Audio
USE_ULP_AUDIO := false
# ALP Audio
BOARD_USE_ALP_AUDIO := false


#
# Bluetooth
#
BOARD_HAVE_BLUETOOTH 			:= true
BLUETOOTH_HCI_USE_USB 			:= true
BOARD_HAVE_BLUETOOTH_BCM 		:= true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/hardkernel/odroidu/bluetooth
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL    	:= true

# Boot animation
TARGET_BOOTANIMATION_PRELOAD := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true

# Camera
USE_SEC_CAMERA := false
CAMERA_USE_DIGITALZOOM := true
BOARD_USE_S5K3H2 := true
BOARD_USE_USBCAM := false
BOARD_USE_S5K4H5 := false

BOARD_USES_CAMERA_LIB   := odroid
BOARD_USES_CAMERA_IF    := uvc_video

# Enable JIT
WITH_JIT := true

# Filesystems
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_CACHEIMAGE_PARTITION_SIZE := 134217728
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_USES_HGL := true


#Enable HDMI
BOARD_USES_HDMI_SUBTITLES := true
BOARD_USES_HDMI := true
BOARD_HDMI_STD := STD_720P
BOARD_HDMI_DDC_CH := DDC_CH_I2C_2
BOARD_USES_SAMSUNG_HDMI := true

# FIMG2D HW acceleration
BOARD_USES_FIMGAPI := true
BOARD_USES_SKIA_FIMGAPI := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true
#
# if BOARD_USES_HDMI_EDID == false && BOARD_USES_HDMI_JUMPER == true
# JP1 short = HDMI 1080P, JP1 open = HDMI 720P
#
BOARD_USES_HDMI_EDID := false
BOARD_USES_HDMI_JUMPER := true


# OMX
BOARD_USE_SAMSUNG_COLORFORMAT := true
BOARD_NONBLOCK_MODE_PROCESS := true
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USES_MFC_FPS := false
BOARD_USE_S3D_SUPPORT := false
BOARD_USE_CSC_FIMC := false
BOARD_USE_H264_PREPEND_SPS_PPS := true

# Enable V4L2 & ION
BOARD_USE_V4L2 := false
BOARD_USE_V4L2_ION := false
BOARD_NO_OVERLAY := false
DEFAULT_FB_NUM := 0
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
#TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
#BOARD_USE_BGRA_8888 := true
TARGET_DISABLE_TRIPLE_BUFFERING := true

#
# Wifi related defines
#
# ralink module = rt5370sta, realtek = rtl8191su
#
BOARD_WIFI_VENDOR	:= realtek
BOARD_WLAN_DEVICE	:= rtl819xxu

ifeq ($(BOARD_WLAN_DEVICE), rt5370sta)
    WPA_SUPPLICANT_VERSION              := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER         := WEXT
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB    := lib_driver_cmd
    WIFI_DRIVER_MODULE_NAME		        := "rt5370sta"
    WIFI_DRIVER_MODULE_PATH             := "/system/lib/modules/rt5370sta.ko"
endif    

ifeq ($(BOARD_WLAN_DEVICE), rtl819xxu)
    WPA_SUPPLICANT_VERSION              := VER_0_8_X
    BOARD_WPA_SUPPLICANT_DRIVER := NL80211
    BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_rtl
    BOARD_HOSTAPD_DRIVER        := NL80211
    BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_rtl

    WIFI_DRIVER_MODULE_NAME		        := "rtl8191su"
    WIFI_DRIVER_MODULE_PATH             := "/system/lib/modules/rtl8191su.ko"

    WIFI_DRIVER_MODULE_NAME2	        := "rtl8192cu"
    WIFI_DRIVER_MODULE_PATH2             := "/system/lib/modules/rtl8192cu.ko"
    

    # Realtek driver has FW embedded inside, and will automatically load FW
    # at NIC initialization process. So there is no need to set these 
    # 5 variables.
    WIFI_DRIVER_MODULE_ARG           := ""
    WIFI_FIRMWARE_LOADER             := ""
    WIFI_DRIVER_FW_PATH_STA          := ""
    WIFI_DRIVER_FW_PATH_AP           := ""
    WIFI_DRIVER_FW_PATH_P2P          := ""
    WIFI_DRIVER_FW_PATH_PARAM        := ""
endif

# Recovery
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.odroidu
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_RECOVERY_SWIPE := true

# SELinux
BOARD_SEPOLICY_DIRS += \
    device/hardkernel/odroidu/selinux

BOARD_SEPOLICY_UNION += \
    device.te \
    domain.te \
    file.te \
    file_contexts \
    init.te \
    mediaserver.te \
    rild.te \
    system.te \
    ueventd.te \
    wpa_supplicant.te

# Charging mode
#BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS
BOARD_BATTERY_DEVICE_NAME := battery

