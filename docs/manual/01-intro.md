## Introduction

**TTS_ULib** is a collection of Lua packages, modules, classes, scripts, and code snippets (curated by [eruber](https://github.com/eruber/TTS_ULib)) for developing [Tabletop Simulator](http://berserk-games.com/tabletop-simulator/) projects.

## Tabletop Simulator Sandbox
The runtime environment of Tabeltop Simulator (TTS) restricts what Lua standard library
components are available. For example, there is no file system functionality in
the TTS sandbox; no debug library; and most notably, no **require** functionality.

The next section lists what portions of the Lua standard library are available
for use in the TTS sandbox.

## Lua Standard Libraries
A subset of the Lua standard libraries are included in the TTS sandbox's Lua interpreter to provide a safe sandbox for user scripts to run.

Library | Description

--------- | ------------

Basic | The basic methods. Includes assert, collectgarbage, error, print, select, type, tonumber, and tostring.

Bit32 | The bit32 package.

Coroutine | The coroutine package.
Dynamic | The dynamic package (introduced by MoonSharp).
ErrorHandling | The error handling methods pcall and xpcall.
GlobalConsts | The global constants _G, _VERSION, and _MOONSHARP.
Math | The math package.
Metatables | The metatable methods setmetatable, getmetatable, rawset, rawget, rawequal, and rawlen.
OS_Time | The time methods of the os package: clock, difftime, date, and time.
String | The string package.
Table | The table package.
TableIterators | The table iterators next, ipairs, and pairs.



## For further information
* [Official Lua Website](http://www.lua.org/home.html)
* [MoonSharp](http://www.moonsharp.org/)


**ADD SOME GENERAL INFO FROM MY TTS DEV NOTES ABOUT DEVELOPING FOR TTS**


