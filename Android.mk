LOCAL_PATH := $(call my-dir)

ifneq ($(filter a10 a20 a20e a30 a40, $(TARGET_DEVICE)),)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

LIBGLES_MALI_LIBRARY := /vendor/lib/egl/libGLES_mali.so

LIBOPENCL_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libOpenCL.so
$(LIBOPENCL_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/libOpenCL.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf libOpenCL.so.1 $@

LIBOPENCL1_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libOpenCL.so.1
$(LIBOPENCL1_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/libOpenCL.so.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf libOpenCL.so.1.1 $@

LIBOPENCL11_SYMLINK := $(TARGET_OUT_VENDOR)/lib/libOpenCL.so.1.1
$(LIBOPENCL11_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/libOpenCL.so.1.1 symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(LIBGLES_MALI_LIBRARY) $@

VULKAN_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/vulkan.universal7884B.so
$(VULKAN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/hw/vulkan.universal7884B.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(LIBGLES_MALI_LIBRARY) $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(LIBOPENCL_SYMLINK) \
	$(LIBOPENCL1_SYMLINK) \
	$(LIBOPENCL11_SYMLINK) \
	$(VULKAN_SYMLINK)
endif
