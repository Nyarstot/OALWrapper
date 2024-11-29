include "Premake5/scripts/helpers.lua"
include "dependencies.lua"

print(os.date() .. " Initialize submodules...")
os.execute("git submodule update --init --recursive")

workspace "OALWrapper"
    architecture "x64"
    startproject "OALWrapper"
    configurations {"Debug", "Release"}

    buildpattern = "%{cfg.buildcfg}.%{cfg.system}.%{cfg.architecture}"

    project "OALWRapper"
        kind "StaticLib"
        language "C++"
        cppdialect "C++17"
        staticruntime "on"

        targetdir("build/bin/" .. buildpattern .. "/%{prj.name}")
        objdir("build/int/" .. buildpattern .. "/%{prj.name}")

        files
        {
            "%{wks.location}/include/OALWrapper/*.h",
            "%{wks.location}/sources/OALWrapper/*.cpp"
        }

        includedirs
        {
            "%{wks.location}/include"
        }

        links
        {

        }

        filter "configurations:Debug"
            symbols "on"

        filter "configurations:Release"
            optimize "on"

        filter "system:windows"
            systemversion "latest"