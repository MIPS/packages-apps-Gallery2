LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CFLAGS += -DEGL_EGLEXT_PROTOTYPES

LOCAL_SRC_FILES := jni_egl_fence.cpp

LOCAL_SDK_VERSION := 9

LOCAL_LDFLAGS :=  -llog -lEGL

LOCAL_MODULE_TAGS := optional
ifeq ($(USE_GMS_LIBS),true)
	LOCAL_MODULE := libjni_eglfence_old
else
	LOCAL_MODULE := libjni_eglfence
endif


include $(BUILD_SHARED_LIBRARY)

# Filtershow

include $(CLEAR_VARS)

LOCAL_CPP_EXTENSION := .cc
LOCAL_LDFLAGS	:= -llog -ljnigraphics
LOCAL_SDK_VERSION := 9
ifeq ($(USE_GMS_LIBS),true)
	LOCAL_MODULE    := libjni_filtershow_filters_old
else
	LOCAL_MODULE    := libjni_filtershow_filters
endif
LOCAL_SRC_FILES := filters/gradient.c \
                   filters/saturated.c \
                   filters/exposure.c \
                   filters/edge.c \
                   filters/contrast.c \
                   filters/hue.c \
                   filters/shadows.c \
                   filters/highlight.c \
                   filters/hsv.c \
                   filters/vibrance.c \
                   filters/geometry.c \
                   filters/negative.c \
                   filters/redEyeMath.c \
                   filters/fx.c \
                   filters/wbalance.c \
                   filters/redeye.c \
                   filters/bwfilter.c \
                   filters/tinyplanet.cc \
                   filters/kmeans.cc

LOCAL_CFLAGS    += -ffast-math -O3 -funroll-loops
LOCAL_ARM_MODE := arm

include $(BUILD_SHARED_LIBRARY)
