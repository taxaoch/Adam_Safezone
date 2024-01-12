fx_version 'cerulean'
games { 'gta5' }
author 'catherina'
-- description ''

version '1.0.1'


client_scripts {
    --'setting.lua',
    'code/cl.lua',
    -- 'Config.lua'
}

shared_script{'Config.lua'}

server_scripts {
    --'setting.lua',
    'code/sv.lua',
    -- 'Config.lua'
}