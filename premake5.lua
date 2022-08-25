project "glfw"
	kind "StaticLib"
	language "C"
	staticruntime "Off"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files {
		"include/GLFW/glfw3.h", 
		"include/GLFW/glfw3native.h", 
		"src/internal.h", 
		"src/platform.h", 
		"src/mappings.h", 
		"src/context.c", 
		"src/init.c", 
		"src/input.c", 
		"src/monitor.c", 
		"src/platform.c", 
		"src/vulkan.c", 
		"src/window.c", 
		"src/egl_context.c", 
		"src/osmesa_context.c", 
		"src/null_platform.h", 
		"src/null_joystick.h", 
		"src/null_init.c", 
		"src/null_monitor.c", 
		"src/null_window.c", 
		"src/null_joystick.c"
	}
	
	includedirs {
		"include"
	}
	
	
	filter "system:windows"
		systemversion "latest"
		defines {
			"_GLFW_WIN32", 
			"_CRT_SECURE_NO_WARNINGS"
		}
		files {
			"src/win32_time.h", 
			"src/win32_thread.h", 
			"src/win32_module.c", 
			"src/win32_time.c", 
			"src/win32_thread.c", 
			"src/win32_platform.h", 
			"src/win32_joystick.h", 
			"src/win32_init.c", 
			"src/win32_joystick.c", 
			"src/win32_monitor.c", 
			"src/win32_window.c", 
			"src/wgl_context.c"
		}

	filter "system:macosx"
		defines "_GLFW_COCOA"
		files {
			"src/cocoa_time.h", 
			"src/posix_thread.h", 
			"src/posix_module.c", 
			"src/cocoa_time.c", 
			"src/posix_thread.c", 
			"src/cocoa_platform.h", 
			"src/cocoa_joystick.h", 
			"src/cocoa_init.m", 
			"src/cocoa_joystick.m", 
			"src/cocoa_monitor.m", 
			"src/cocoa_window.m", 
			"src/nsgl_context.m"
		}
		links {
			"Cocoa.framework", 
			"IOKit.framework", 
			"CoreFoundation.framework"
		}
	
	filter "configurations:Debug"
		runtime "Debug"
		symbols "On"
	
	filter "configurations:Release"
		runtime "Release"
		optimize "On"
