BData = BData or {}
BData.Version = 1.01

function BData_CheckVersion()
	http.Fetch( "https://raw.githubusercontent.com/xbeastguyx/Script-Versions/master/BData.txt", function( body )
		if tonumber( body ) != tonumber( BData.Version ) then
			if CLIENT then
				if LocalPlayer():IsAdmin() then
					LocalPlayer():ChatPrint( "[BData] There has been an update! You are running version " .. BData.Version .. ", the latest version is " .. body .. "." )
				end
			else
				print( "[BData] There has been an update! You are running version " .. BData.Version .. ", the latest version is " .. body .. "." )
			end
		end
	end )
end
hook.Add( "Initialize", "BData_CheckVersion", BData_CheckVersion )