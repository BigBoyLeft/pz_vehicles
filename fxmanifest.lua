fx_version 'cerulean'
game 'gta5'

shared_script 'config.lua'
client_scripts {
	'@PolyZone/client.lua',
	'enumerate.lua',
	'client.lua',
}
server_script 'server.lua'

lua54 'yes'
use_experimental_fxv2_oal 'yes'

dependency 'PolyZone'
