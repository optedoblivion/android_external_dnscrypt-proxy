LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	src/proxy/app.c \
	src/proxy/cert.c \
	src/proxy/dnscrypt.c \
	src/proxy/dnscrypt_client.c \
	src/proxy/edns.c \
	src/proxy/logger.c \
	src/proxy/minicsv.c \
	src/proxy/options.c \
	src/proxy/pid_file.c \
	src/proxy/plugin_options.c \
	src/proxy/safe_rw.c \
	src/proxy/sandboxes.c \
	src/proxy/stack_trace.c \
	src/proxy/tcp_request.c \
	src/proxy/udp_request.c \
	src/proxy/utils.c \
	src/proxy/windows_service.c \
	src/libevent-modified/listener.c \
	src/libevent-modified/log.c \
	src/libevent-modified/select.c \
	src/libevent-modified/strlcpy.c \
	src/libevent-modified/event.c \
	src/libevent-modified/bufferevent.c \
	src/libevent-modified/epoll.c \
	src/libevent-modified/evthread.c \
	src/libevent-modified/signal.c \
	src/libevent-modified/event_tagging.c \
	src/libevent-modified/bufferevent_filter.c \
	src/libevent-modified/poll.c \
	src/libevent-modified/evmap.c \
	src/libevent-modified/bufferevent_sock.c \
	src/libevent-modified/evutil_rand.c \
	src/libevent-modified/http.c \
	src/libevent-modified/bufferevent_pair.c \
	src/libevent-modified/evrpc.c \
	src/libevent-modified/evdns.c \
	src/libevent-modified/evutil.c \
	src/libevent-modified/buffer.c \
	src/libevent-modified/bufferevent_ratelim.c

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/ \
	$(LOCAL_PATH)/src/include \
	$(LOCAL_PATH)/src/include/dnscrypt \
	$(LOCAL_PATH)/src/libevent-modified/include \
	$(LOCAL_PATH)/src/ext \
	$(LOCAL_PATH)/../libsodium/src/libsodium/include

LOCAL_CFLAGS := \
	-std=gnu99 \
	-Werror=implicit

CONFIG_DIR := /system/etc

LOCAL_CFLAGS += -DPKGDATADIR="\"$(CONFIG_DIR)\""

LOCAL_MODULE := dnscrypt-proxy
LOCAL_MODULE_PATH := $(TARGET_OUT_OPTIONAL_EXECUTABLES)
LOCAL_MODULE_TAGS := eng
LOCAL_SHARED_LIBRARIES += libsodium

include $(BUILD_EXECUTABLE)

#============== Copy Resolvers File ============

include $(CLEAR_VARS)
LOCAL_MODULE := dnscrypt-resolvers.csv
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
