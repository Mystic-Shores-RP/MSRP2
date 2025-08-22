fx_version 'cerulean'
game 'gta5'
author '*BOOM*'
description 'Driving_School'
version '1.0.0'
lua54 'yes'
this_is_a_map 'yes'

dependencies { 
    '/server:4960',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 4960.
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
}

escrow_ignore {
    'stream/**/*.ytd',
    'stream/**/**/*.ytd',
}

dependency '/assetpacks'