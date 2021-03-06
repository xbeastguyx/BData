-- Checks version of BData.

function BData_CheckVersion()
	http.Fetch( "https://raw.githubusercontent.com/xbeastguyx/Script-Versions/master/BData.txt", function( body )
		if tonumber( body ) != tonumber( BData.Version ) then
			print( "[BData] There has been an update! You are running version " .. BData.Version .. ", the latest version is " .. body .. "." )
		end
	end )
end
hook.Add( "Initialize", "BData_CheckVersion", BData_CheckVersion )
timer.Create( "BData_CheckVersion", 1200, 0, BData_CheckVersion )