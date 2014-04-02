ifeq ($(TARGET_QCOM_DISPLAY_VARIANT),caf-v500)

display-hals := libgralloc libgenlock libcopybit libvirtual
display-hals += libhwcomposer liboverlay libqdutils libexternal libqservice
display-hals += libmemtrack

ifneq ($(TARGET_PROVIDES_LIBLIGHT),true)
display-hals += liblight
endif

ifneq ($(filter msm8974 msm8x74,$(TARGET_BOARD_PLATFORM)),)
    #This is for 8974 based platforms
    include $(call all-named-subdir-makefiles,msm8974)
else
ifneq ($(filter msm8226,$(TARGET_BOARD_PLATFORM)),)
    #This is for 8226 based platforms
    include $(call all-named-subdir-makefiles,msm8974)
else
    #This is for 8960 based platforms
    include $(call all-named-subdir-makefiles,msm8960)
endif
endif
endif
