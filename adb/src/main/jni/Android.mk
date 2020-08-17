# adb host tool for device-as-host

LOCAL_PATH:= $(call my-dir)


include $(CLEAR_VARS)

LOCAL_MODULE := crypto_static
LOCAL_SRC_FILES := $(LOCAL_PATH)/lib/$(APP_ABI)/libcrypto_static.a

include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)

LOCAL_MODULE := adbd

LOCAL_SRC_FILES := \
	src/adb/adb.c \
	src/adb/backup_service.c \
	src/adb/fdevent.c \
	src/adb/transport.c \
	src/adb/transport_local.c \
	src/adb/transport_usb.c \
	src/adb/adb_auth_client.c \
	src/adb/sockets.c \
	src/adb/services.c \
	src/adb/file_sync_service.c \
	src/adb/jdwp_service.c \
	src/adb/framebuffer_service.c \
	src/adb/remount_service.c \
	src/adb/usb_linux_client.c \
	src/adb/log_service.c \
	src/libcutils/list.c \
	src/libcutils/load_file.c \
	src/libcutils/properties.c \
	src/libcutils/socket_inaddr_any_server.c \
	src/libcutils/socket_local_client.c \
	src/libcutils/socket_local_server.c \
	src/libcutils/socket_loopback_client.c \
	src/libcutils/socket_loopback_server.c \
	src/libcutils/socket_network_client.c \
	src/libcutils/sockets.c \
	src/libmincrypt/rsa.c \
	src/libmincrypt/sha.c \
	src/libmincrypt/sha256.c

LOCAL_CFLAGS := -O2 -g -DADB_HOST=0 -Wall -Wno-unused-parameter
LOCAL_CFLAGS += -D_XOPEN_SOURCE -D_GNU_SOURCE
LOCAL_CFLAGS += -DHAVE_ANDROID_OS -DHAVE_SYS_SOCKET_H -DHAVE_PTHREADS -DHAVE_FORKEXEC
LOCAL_CFLAGS += -DALLOW_ADBD_ROOT=1

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/adb

LOCAL_STATIC_LIBRARIES := crypto_static

LOCAL_LDLIBS := -llog

include $(BUILD_EXECUTABLE)


include $(CLEAR_VARS)

LOCAL_MODULE := adb

LOCAL_SRC_FILES := \
	src/adb/adb.c \
	src/adb/console.c \
	src/adb/transport.c \
	src/adb/transport_local.c \
	src/adb/transport_usb.c \
	src/adb/commandline.c \
	src/adb/adb_client.c \
	src/adb/adb_auth_host.c \
	src/adb/sockets.c \
	src/adb/services.c \
	src/adb/file_sync_client.c \
	src/adb/get_my_path_linux.c \
	src/adb/usb_linux.c \
	src/adb/usb_vendors.c \
	src/adb/fdevent.c \
	src/libcutils/list.c \
	src/libcutils/load_file.c \
	src/libcutils/socket_inaddr_any_server.c \
	src/libcutils/socket_local_client.c \
	src/libcutils/socket_local_server.c \
	src/libcutils/socket_loopback_client.c \
	src/libcutils/socket_loopback_server.c \
	src/libcutils/socket_network_client.c \
	src/libcutils/sockets.c \
	src/libmincrypt/rsa.c \
	src/libmincrypt/sha.c \
	src/libmincrypt/sha256.c \
	src/libzipfile/centraldir.c \
	src/libzipfile/zipfile.c \

LOCAL_CFLAGS := \
	-O2 \
	-g \
	-DADB_HOST=1 \
	-DADB_HOST_ON_TARGET=1 \
	-Wall \
	-Wno-unused-parameter \
	-D_XOPEN_SOURCE \
	-D_GNU_SOURCE \
	-DHAVE_FORKEXEC \

LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/adb
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/openssl
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/openssl/crypto
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/openssl/crypto/asn1
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/openssl/crypto/evp
LOCAL_C_INCLUDES += $(LOCAL_PATH)/src/openssl/crypto/modes

LOCAL_STATIC_LIBRARIES := crypto_static

LOCAL_LDLIBS := -ldl

include $(BUILD_EXECUTABLE)
