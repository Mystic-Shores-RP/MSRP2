--[[ 

    /$$$$$  /$$$$$$        /$$$$$$$                      /$$                              
   |__  $$ /$$__  $$      | $$__  $$                    |__/                              
      | $$| $$  \ $$      | $$  \ $$  /$$$$$$   /$$$$$$$ /$$  /$$$$$$  /$$$$$$$   /$$$$$$$
      | $$| $$$$$$$$      | $$  | $$ /$$__  $$ /$$_____/| $$ /$$__  $$| $$__  $$ /$$_____/
 /$$  | $$| $$__  $$      | $$  | $$| $$$$$$$$|  $$$$$$ | $$| $$  \ $$| $$  \ $$|  $$$$$$ 
| $$  | $$| $$  | $$      | $$  | $$| $$_____/ \____  $$| $$| $$  | $$| $$  | $$ \____  $$
|  $$$$$$/| $$  | $$      | $$$$$$$/|  $$$$$$$ /$$$$$$$/| $$|  $$$$$$$| $$  | $$ /$$$$$$$/
 \______/ |__/  |__/      |_______/  \_______/|_______/ |__/ \____  $$|__/  |__/|_______/ 
                                                             /$$  \ $$                    
                                                            |  $$$$$$/                    
                                                             \______/                        

Author: Luthous
Discord: discord.gg/jadesigns
Website: https://jadesignsfivem.com/ ]]

Config = {}

Config.Elevators = {
    { -- List your access points here, where you want to be able to access the elevator menu.
        name = "Elevator",
        accessPoints = {
            { x = -406.54, y = -345.61, z = 37.43 }, 
            { x = -407.24, y = -347.92, z = 37.43 },
            { x = -407.03, y = -348.24, z = 42.59 }, 
            { x = -406.69, y = -345.41, z = 42.59 },			
            { x = -407.27, y = -348.36, z = 47.54 }, 
            { x = -406.97, y = -345.39, z = 47.54 },			
            { x = -406.74, y = -345.24, z = 52.26 }, 
            { x = -407.24, y = -348.09, z = 52.26 },			
			
        },
        floors = { -- List your desitnation points here, where you want to be able to teleport to in the elevator menu.
            { label = "Lobby", coords = { x = -406.54, y = -345.61, z = 37.43 } },
            { label = "Floor 1", coords = { x = -407.03, y = -348.24, z = 42.59 } },
            { label = "Floor 2", coords = { x = -407.27, y = -348.36, z = 47.54 } },
            { label = "Floor 3", coords = { x = -406.74, y = -345.24, z = 52.26 } },					
        }
    }
}
