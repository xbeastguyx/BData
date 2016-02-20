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

-- Creates a database for BData to use.

local function CreateDatabase()
	sql.Query( "CREATE TABLE IF NOT EXISTS playerbdata ( id TEXT NOT NULL, value TEXT NOT NULL )" )
end
hook.Add( "Initialize", "BData_CreateDatabase", CreateDatabase )

-- Player side for setting, getting, and removing BData. 
-- All of the features that PData has.

local ply = FindMetaTable( "Player" )

function ply:SetBData( key, val )
	key = string.format( "%s[%s]", self:SteamID64(), key )
	sql.Query( "REPLACE INTO playerbdata ( id, value ) VALUES ( " .. SQLStr( key ) .. ", " .. SQLStr( val ) .. " )" )
end

function ply:GetBData( key, def )	
	key = string.format( "%s[%s]", self:SteamID64(), key )
	local val = sql.QueryValue( "SELECT value FROM playerbdata WHERE id = " .. SQLStr( key ) .. " LIMIT 1" )
	if val == nil then return def end
	
	return val
end

function ply:RemoveBData( key )
	key = string.format( "%s[%s]", self:SteamID64(), key )
	sql.Query( "DELETE FROM playerbdata WHERE infoid = " .. SQLStr( key ) )
end

-- Grabbing data from the database without the player extension.

if !util then return end

function util.SetBData( sid, key, val )
	key = string.format( "%s[%s]", util.SteamIDTo64( sid ), key )
	sql.Query( "REPLACE INTO playerbdata ( id, value ) VALUES ( " .. SQLStr( key ) .. ", " .. SQLStr( val ) .. " )" )
end

function util.SetBData( sid, key, def )
	key = string.format( "%s[%s]", util.SteamIDTo64( sid ), key )
	local val = sql.QueryValue( "SELECT value FROM playerbdata WHERE id = " .. SQLStr( key ) .. " LIMIT 1" )
	if val == nil then return def end
	
	return val
end

function util.SetBData( sid, key )
	key = string.format( "%s[%s]", util.SteamIDTo64( sid ), key )
	sql.Query( "DELETE FROM playerbdata WHERE infoid = " .. SQLStr( key ) )
end
