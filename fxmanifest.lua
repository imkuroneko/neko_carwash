fx_version 'cerulean'
game 'gta5'

description 'Sistema de lavaderos'
author 'KuroNeko'

lua54 'yes'

version '2.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

files {
    'locales/es.json',
}