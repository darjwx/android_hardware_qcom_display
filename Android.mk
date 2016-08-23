# TODO:  Find a better way to separate build configs for ADP vs non-ADP devices
ifneq ($(TARGET_BOARD_AUTO),true)
  ifneq ($(filter msm8084 msm8x84,$(TARGET_BOARD_PLATFORM)),)
    #This is for 8084 based platforms
    include $(call all-named-subdir-makefiles,msm8084)
  else
    ifneq ($(filter msm8974 msm8x74,$(TARGET_BOARD_PLATFORM)),)
      #This is for 8974 based (and B-family) platforms
      ifeq ($(SONY_AOSP),true)
	include $(call all-named-subdir-makefiles,msm8994)
      else
        include $(call all-named-subdir-makefiles,msm8974)
      endif
    else
      ifneq ($(filter msm8226 msm8x26,$(TARGET_BOARD_PLATFORM)),)
        ifeq ($(SONY_AOSP),true)
          include $(call all-named-subdir-makefiles,msm8994)
        else
          include $(call all-named-subdir-makefiles,msm8226)
	endif
      else
        ifneq ($(filter msm8960,$(TARGET_BOARD_PLATFORM)),)
          include $(call all-named-subdir-makefiles,msm8960)
        else
          ifneq ($(filter msm8994 msm8916 msm8992,$(TARGET_BOARD_PLATFORM)),)
            include $(call all-named-subdir-makefiles,msm8994)
          else
            ifneq ($(filter msm8909,$(TARGET_BOARD_PLATFORM)),)
              include $(call all-named-subdir-makefiles,msm8909)
            else
              ifneq ($(filter msm8996,$(TARGET_BOARD_PLATFORM)),)
                include $(call all-named-subdir-makefiles,msm8996)
              endif
            endif
          endif
        endif
      endif
    endif
  endif
endif
