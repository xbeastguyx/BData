BData = BData or {}
BData.Version = 1.02

if SERVER then
	AddCSLuaFile()
	AddCSLuaFile( "bdata/bdata.lua" )
	AddCSLuaFile( "bdata/bdata_version.lua" )
	
	include( "bdata/bdata.lua" )
	include( "bdata/bdata_version.lua" )
else
	include( "bdata/bdata.lua" )
	include( "bdata/bdata_version.lua" )
end

-- Every cool script has to have a cool loading entry!

local msg = [[
 ______  ______                   
(____  \(______)         _         
 ____)  )_     _ _____ _| |_ _____ 
|  __  (| |   | (____ (_   _|____ |
| |__)  ) |__/ // ___ | | |_/ ___ |
|______/|_____/ \_____|  \__)_____|
Version ]] .. BData.Version .. [[ by xbeastguyx.
]]

print( msg )