fx_version "cerulean"

game 'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

version '1.0.0'

client_script {
	'@menuv/menuv.lua',
	'config.lua',
	'client/client.lua'
}

lua54 'yes'
