package android
type Product_variables struct {
	Additional_gralloc_10_usage_bits struct {
		Cppflags []string
	}
	Bootloader_message_offset struct {
		Cflags []string
	}
	Should_skip_waiting_for_qsee struct {
		Cflags []string
	}
	Supports_legacy_hw_fde struct {
		Cflags []string
	}
	Target_init_vendor_lib struct {
		Whole_static_libs []string
	}
	Target_shim_libs struct {
		Cppflags []string
	}
	Target_uses_color_metadata struct {
		Cppflags []string
	}
	Target_process_sdk_version_override struct {
		Cppflags []string
	}
	Uses_qti_camera_device struct {
		Cppflags []string
		Shared_libs []string
		Export_shared_lib_headers []string
	}
	Needs_text_relocations struct {
		Cppflags []string
	}
	Uses_generic_camera_parameter_library struct {
		Srcs []string
	}
	Has_legacy_camera_hal1 struct {
		Cflags []string
		Overrides []string
		Shared_libs  []string
        }
  	Uses_qcom_bsp_legacy struct {
		Cppflags []string
	}
}

type ProductVariables struct {
	Bootloader_message_offset  *int `json:",omitempty"`
	Target_shim_libs  *string `json:",omitempty"`
	Target_uses_color_metadata  *bool `json:",omitempty"`
        Additional_gralloc_10_usage_bits  *string `json:",omitempty"`
	Target_process_sdk_version_override *string `json:",omitempty"`
	Uses_qti_camera_device  *bool `json:",omitempty"`
	Needs_text_relocations  *bool `json:",omitempty"`
	Uses_generic_camera_parameter_library  *bool `json:",omitempty"`
	Should_skip_waiting_for_qsee  *bool `json:",omitempty"`
	Specific_camera_parameter_library  *string `json:",omitempty"`
	Supports_legacy_hw_fde  *bool `json:",omitempty"`
	Has_legacy_camera_hal1  *bool `json:",omitempty"`
	Target_init_vendor_lib  *string `json:",omitempty"`
	Uses_qcom_bsp_legacy  *bool `json:",omitempty"`
}
