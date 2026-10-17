-- copy the table that defines the electric miner item to make our own miner
local heaterDrill = table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])
local heaterDrillItem = table.deepcopy(data.raw["item"]["electric-mining-drill"])




heaterDrill.name = "heater-drill"
heaterDrill.minable.results = {{type = "item", name = "heater-drill", amount = 1}}

heaterDrillItem.name = "heater-drill"
heaterDrillItem.place_result = "heater-drill"

heaterDrillItem.icons = {
  {
    icon = heaterDrillItem.icon,
    icon_size = heaterDrillItem.icon_size,
    tint = {r=1,g=0,b=0,a=0.3}
  },
}

heaterDrill.energy_source = {
  type = "heat",
  max_temperature = 1000,
  specific_heat = "10MJ",
  max_transfer = "10MW",
  min_working_temperature = 100,
  connections = {
    {
      position = {0, 1},
      direction = defines.direction.south
    },
    {
      position = {-1, 0},
      direction = defines.direction.west
    },{
      position = {1, 0},
      direction = defines.direction.east
    }
  }
}


-- create the recipe prototype from scratch
local heaterDrillRecipe = {
  type = "recipe",
  name = "heater-drill",
  enabled = true,
  energy_required = 2, -- time to craft in seconds (at crafting speed 1)
  ingredients = {
    {type = "item", name = "iron-gear-wheel", amount = 5},
    {type = "item", name = "iron-plate", amount = 10},
    {type = "item", name = "heat-pipe", amount = 10}
  },
  results = {{type = "item", name = "heater-drill", amount = 1}}
}

data:extend{heaterDrill, heaterDrillItem, heaterDrillRecipe}