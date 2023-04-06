Config = {}

Config.Locale = 'en' -- choose language 'en' or 'pl'
Config.ox_notification = true -- if false will use esx notification

Config.ox_fuel = false
Config.sy_carkeys = false

Config.ox_skillcheck = true -- if false will use ox progressbar
Config.ox_textui = true -- to display the amount of fruit in the vehicle
Config.ox_progressbar_duration = 8000 -- work only when use ox progressbar

Config.grow_time = 300 -- in seconds

Config.orange_give_min = 5 -- minimum amount of fruit obtained
Config.orange_give_max = 10 -- maximum amount of fruit obtained
Config.orange_vehicle_max = 150  -- maximum amount of fruit in the vehicle
Config.orange_fee = 200 -- salary for oranges in percent (%) | if Config.orange_fee = 200 then for example for 50 orange you earn 100$

Config.vehilce_advance_payment = false -- collects the amount before renting the vehicle and returns it after return
Config.vehilce_advance_price = 300 -- work only when is true vehilce advance

Config.dressing_ped_coords = vector3(412.89, 6539.02, 27.73)
Config.dressing_ped_coords_heading = 352.0
Config.vehicle_ped_coords = vector3(410.3, 6492.38, 28.17)
Config.vehicle_ped_coords_heading = 173.0
Config.vehicle_spawn_coords = vector3(410.49, 6489.17, 28.87)
Config.vehicle_spawn_coords_heading = 82.0

Config.clothes = {
    male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 43,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 48,
        pants_1 = 0,   pants_2 = 0,
        shoes_1 = 12,   shoes_2 = 5,
        helmet_1 = 10,  helmet_2 = 7,
    },
    female = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 43,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 45,
        pants_1 = 0,   pants_2 = 0,
        shoes_1 = 12,   shoes_2 = 5,
        helmet_1 = 10,  helmet_2 = 7,
    }
}