LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

PREFIX := $(LOCAL_PATH)/dnscrupt-proxy-android-arm

LOCAL_MODULE := dnscrypt-proxy

LOCAL_C_INCLUDES := $(LOCAL_PATH) \
        $(LOCAL_PATH)/../libsodium/src \
        $(LOCAL_PATH)/../libsodium/src/libsodium \
        $(LOCAL_PATH)/../libsodium/src/libsodium/include \
        $(LOCAL_PATH)/../libsodium/src/libsodium/include/sodium \
	$(LOCAL_PATH)/ext \
	$(LOCAL_PATH)/src \
	$(LOCAL_PATH)/src/proxy \
	$(LOCAL_PATH)/src/libevent-modified/ \
	$(LOCAL_PATH)/src/libevent-modified/include \
	$(LOCAL_PATH)/src/libevent-modified/compat \
	$(LOCAL_PATH)/src/libevent-modified/compat/sys \
	$(LOCAL_PATH)/src/libevent-modified/m4 \
	$(LOCAL_PATH)/src/libevent-modified/WIN32-Code 

LOCAL_SHARED_LIBRARIES := \
	libstdc++ \
	libsodium \
	libcutils \
	libsysutils 

LOCAL_SRC_FILES := \
	src/hostip/app.c \
	src/hostip/options.c \
	src/proxy/tcp_request.c \
	src/proxy/pid_file.c \
	src/proxy/safe_rw.c \
	src/proxy/cert.c \
	src/proxy/minicsv.c \
	src/proxy/dnscrypt_client.c \
	src/proxy/udp_request.c \
	src/proxy/stack_trace.c \
	src/proxy/app.c \
	src/proxy/sandboxes.c \
	src/proxy/edns.c \
	src/proxy/utils.c \
	src/proxy/dnscrypt.c \
	src/proxy/options.c \
	src/proxy/windows_service.c \
	src/proxy/logger.c  \
	src/libevent-modified/arc4random.c \
	src/libevent-modified/buffer.c \
	src/libevent-modified/bufferevent_async.c \
	src/libevent-modified/bufferevent.c \
	src/libevent-modified/bufferevent_filter.c \
	src/libevent-modified/bufferevent_openssl.c \
	src/libevent-modified/bufferevent_pair.c \
	src/libevent-modified/bufferevent_ratelim.c \
	src/libevent-modified/bufferevent_sock.c \
	src/libevent-modified/buffer_iocp.c \
	src/libevent-modified/devpoll.c \
	src/libevent-modified/epoll.c \
	src/libevent-modified/epoll_sub.c \
	src/libevent-modified/evdns.c \
	src/libevent-modified/event.c \
	src/libevent-modified/event_iocp.c \
	src/libevent-modified/event_tagging.c \
	src/libevent-modified/evmap.c \
	src/libevent-modified/evport.c \
	src/libevent-modified/evrpc.c \
	src/libevent-modified/evthread.c \
	src/libevent-modified/evthread_pthread.c \
	src/libevent-modified/evthread_win32.c \
	src/libevent-modified/evutil.c \
	src/libevent-modified/evutil_rand.c \
	src/libevent-modified/http.c \
	src/libevent-modified/kqueue.c \
	src/libevent-modified/listener.c \
	src/libevent-modified/log.c \
	src/libevent-modified/poll.c \
	src/libevent-modified/select.c \
	src/libevent-modified/signal.c \
	src/libevent-modified/strlcpy.c \
	src/libevent-modified/win32select.c \
	libltdl/lt__strl.c \
	libltdl/ltdl.c \
	libltdl/lt__argz.c \
	libltdl/lt__dirent.c \
	libltdl/lt__alloc.c \
	libltdl/lt_dlloader.c \
	libltdl/slist.c \
	libltdl/lt_error.c \
	libltdl/loaders/preopen.c \
	libltdl/loaders/dlopen.c \
	libltdl/loaders/dyld.c \
	libltdl/loaders/loadlibrary.c \
	libltdl/loaders/load_add_on.c \
	libltdl/loaders/dld_link.c \
	libltdl/loaders/shl_load.c

LOCAL_CFLAGS += \
	-w \
        -Os \
        -DPACKAGE_STRING="dnscrypt-proxy" \
        -DPACKAGE_TARNAME="dnscrypt-proxy"

LDFLAGS += \
	-L../libsodium/src/libsodium/include \
        -Lsrc/proxy/libevent-modified \
        -Lsrc/proxy/libevent-modified/include \

include $(BUILD_EXECUTABLE)

include $(call all-makefiles-under,$(LOCAL_PATH))

