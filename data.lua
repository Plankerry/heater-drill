-- copy the table that defines the electric miner item to make our own miner
local heaterMiner = table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"]) 

heaterMiner.name = "heater-miner"
heaterMiner.icons = {
  {
    icon = heaterMiner.icon,
    icon_size = heaterMiner.icon_size,
    tint = {r=1,g=0,b=0,a=0.3}
  },
}

heaterMiner.energy_source = {
  type = "heat",
  max_temperature = 1000,
  specific_heat = "10MJ",
  max_transfer = "10MW",
  min_working_temperature = 100,
  connections = {
    {
      position = {1, 0},
      direction = defines.direction.west
    },
    {
      position = {-1, 0},
      direction = defines.direction.east
    }
  }
}


-- create the recipe prototype from scratch
local heaterMinerRecipe = {
  type = "recipe",
  name = "heater-miner",
  enabled = true,
  energy_required = 2, -- time to craft in seconds (at crafting speed 1)
  ingredients = {
    {type = "item", name = "iron-gear-wheel", amount = 5},
    {type = "item", name = "iron-plate", amount = 10}
    {type = "item", name = "heat-pipe", amount = 10}
  },
  results = {{type = "item", name = "heater-miner", amount = 1}}
}

data:extend{heaterMiner, heaterMinerRecipe}