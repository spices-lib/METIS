project "METIS"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"libmetis/auxapi.c",
		"libmetis/balance.c",
		"libmetis/bucketsort.c",
		"libmetis/checkgraph.c",
		"libmetis/coarsen.c",
		"libmetis/compress.c",
		"libmetis/contig.c",
		"libmetis/debug.c",
		"libmetis/fm.c",
		"libmetis/fortran.c",
		"libmetis/frename.c",
		"libmetis/gklib.c",
		"libmetis/graph.c",
		"libmetis/initpart.c",
		"libmetis/kmetis.c",
		"libmetis/kwayfm.c",
		"libmetis/kwayrefine.c",
		"libmetis/mcutil.c",
		"libmetis/mesh.c",
		"libmetis/meshpart.c",
		"libmetis/minconn.c",
		"libmetis/mincover.c",
		"libmetis/mmd.c",
		"libmetis/ometis.c",
		"libmetis/options.c",
		"libmetis/parmetis.c",
		"libmetis/pmetis.c",
		"libmetis/refine.c",
		"libmetis/separator.c",
		"libmetis/sfm.c",
		"libmetis/srefine.c",
		"libmetis/stat.c",
		"libmetis/timing.c",
		"libmetis/util.c",
		"libmetis/wspace.c"
	}

	includedirs
	{
		"%{IncludeDir.GKlib}",
		"%{IncludeDir.METIS}/include",
		"%{IncludeDir.METIS}/libmetis",
	}

	defines
	{
		"WIN32",
		"_WINDOWS",
		"MSC",
		"_CRT_SECURE_NO_DEPRECATE",
		"USE_GKREGEX",
		"NDEBUG",
		"NDEBUG2",
		"__thread=__declspec(thread)",
		"__thread=",
		'CMAKE_INTDIR="Debug"',
	}

	links
	{
		"GKlib",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
