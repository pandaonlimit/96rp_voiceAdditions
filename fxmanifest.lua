-- Resource Metadata
fx_version 'cerulean'
games { 'gta5' }

name "Mute Button"
author 'PandaOnLimit'
description 'Resource to handle pma-voice mutebutton'
version '1.0.0'
lua54 'yes'

-- What to run
client_scripts {
    'client.lua',
}
server_script {
    'server.lua',
}
shared_scripts {
    'config.lua',
}
files {
    'nui/*'
}
ui_page "nui/index.html"