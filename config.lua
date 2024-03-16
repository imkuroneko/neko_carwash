lib.locale()

Config = {}

-- ===== Ajustes Blip
Config.blip = {
    show    = true,         -- mostrar o no blip
    sprite  = 100,          -- icono                    https://docs.fivem.net/docs/game-references/blips/
    display = 6,            -- como mostrar en el mapa
    scale   = 0.85,         -- tamaño
    colour  = 9,            -- color                    https://docs.fivem.net/docs/game-references/hud-colors/
    name    = "Fast Wash"   -- nombre
}

-- ===== Ajustes de los marcdores de las estaciones de lavado
Config.station = {
    marker = 36,            -- https://docs.fivem.net/docs/game-references/markers/
    size = 0.45,
    color = {
        r = 93,
        g = 182,
        b = 229,
        a = 120,
    },
}

-- ===== Precios
Config.tiers = {
    [1] = { label = 'tier_1__label', description = 'tier_1__description', timeSeconds = 10, decal = false, cleanLevel = 10.0, price = 200 },
    [2] = { label = 'tier_2__label', description = 'tier_2__description', timeSeconds = 15, decal = false, cleanLevel =  5.0, price = 450 },
    [3] = { label = 'tier_3__label', description = 'tier_3__description', timeSeconds = 20, decal = true,  cleanLevel =  0.0, price = 1000 },
}

-- ===== Debug (opción para ensuciar vehículo)
Config.debug = false

-- ===== Crear area o puntos (estaciones) de lavado
Config.useStations = true

-- ===== Lugares de lavado
Config.places = {
    {
        debug = false,
        blip  = vector3(1361.4520, 3594.2712, 34.9135),
        stations = {
            vector3(1359.9709, 3598.8928, 34.8909),
            vector3(1361.6948, 3594.2556, 34.9128),
            vector3(1363.0935, 3590.2358, 34.9299),
        },
        area = {
            vector3(1362.6367, 3604.1611, 34.9135),
            vector3(1368.0621, 3589.4878, 34.9135),
            vector3(1359.8029, 3586.1274, 34.9135),
            vector3(1354.4663, 3601.0088, 34.9135),
        }
    },
    {
        debug = false,
        blip = vector3(-77.6188, 6432.8135, 31.4405),
        stations = {
            vector3(-75.4857, 6424.8442, 31.4906),
            vector3(-71.3792, 6429.1157, 31.4395),
        },
        area = {
            vector3(-64.4977, 6429.8765, 31.4405),
            vector3(-74.4590, 6440.6938, 31.4405),
            vector3(-85.9080, 6429.3457, 31.4405),
            vector3(-75.1195, 6419.7407, 31.4405),
        }
    },
    {
        debug = false,
        blip = vector3(-700.2711, -930.4586, 19.0139),
        stations = {
            vector3(-699.8018, -932.0698, 19.0140)
        },
        area = {
            vector3(-702.8813, -940.8573, 19.0139),
            vector3(-697.2095, -940.8650, 19.0139),
            vector3(-697.2108, -925.5441, 19.0139),
            vector3(-702.3300, -925.7694, 19.0139),
        }
    },
    {
        debug = false,
        blip = vector3(34.3289, -1392.0691, 29.3507),
        stations = {
            vector3(21.2189, -1391.9249, 29.3273),
        },
        area = {
            vector3(-2.6144, -1395.4847, 29.3507),
            vector3(-2.2807, -1387.9045, 29.3507),
            vector3(46.6471, -1387.8466, 29.3507),
            vector3(47.9932, -1396.3639, 29.3507),
        }
    },
    {
        debug = false,
        blip = vector3(166.5291, -1727.4183, 29.2917),
        stations = {
            vector3(175.0493, -1743.3632, 29.2901),
            vector3(175.2068, -1738.7042, 29.2901),
            vector3(174.9937, -1735.0205, 29.2920),
            vector3(175.2586, -1730.2799, 29.2917),
            vector3(168.0266, -1715.5608, 29.2917),
            vector3(170.7712, -1718.2665, 29.3017),
        },
        area = {
            vector3(149.0686, -1726.1401, 29.2917),
            vector3(170.9052, -1699.6775, 29.2917),
            vector3(188.4216, -1715.0599, 29.2917),
            vector3(195.1625, -1733.1704, 29.2917),
            vector3(175.6788, -1746.5549, 29.2917),
        }
    },

}