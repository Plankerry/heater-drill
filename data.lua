local fireArmor = table.deepcopy(data.raw["armor"]["heavy-armor"]) -- copy the table that defines the heavy armor item into the fireArmor variable

fireArmor.name = "fire-armor"
fireArmor.icons = {
  {
    icon = fireArmor.icon,
    icon_size = fireArmor.icon_size,
    tint = {r=1,g=0,b=0,a=0.3}
  },
}

fireArmor.resistances = {
  {
    type = "physical",
    decrease = 6,
    percent = 10
  },
  {
    type = "explosion",
    decrease = 10,
    percent = 30
  },
  {
    type = "acid",
    decrease = 5,
    percent = 30
  },
  {
    type = "fire",
    decrease = 0,
    percent = 100
  }
}

local lightningArmor = table.deepcopy(data.raw["armor"]["heavy-armor"])

lightningArmor.name = "lightning-armor"
lightningArmor.icons = {
  {
    icon = lightningArmor.icon,
    icon_size = lightningArmor.icon_size,
    tint = {r=0.55,g=0,b=0.83,a=0.3}
  },
}
lightningArmor.resistances = {
  {
    type = "physical",
    decrease = 6,
    percent = 10
  },
  {
    type = "explosion",
    decrease = 10,
    percent = 30
  },
  {
    type = "acid",
    decrease = 10,
    percent = 30
  },
  {
    type = "fire",
    decrease = 0,
    percent = 20
  },
  {
    type = "electric",
    decrease = 0,
    percent = 100
  }
}

local lightningArmorRecipe = {
  type = "recipe",
  name = "lightning-armor",
  enabled = true,
  energy_required = 8,
  ingredients = {
    {type = "item", name = "copper-cable", amount = 500},
    {type = "item", name = "steel-plate", amount = 50},
  },
  results = {{type = "item", name = "lightning-armor", amount = 1}}
}

-- create the recipe prototype from scratch
local fireAmorRecipe = {
  type = "recipe",
  name = "fire-armor",
  enabled = true,
  energy_required = 8, -- time to craft in seconds (at crafting speed 1)
  ingredients = {
    {type = "item", name = "copper-plate", amount = 200},
    {type = "item", name = "steel-plate", amount = 50}
  },
  results = {{type = "item", name = "fire-armor", amount = 1}}
}

data:extend{fireArmor, fireAmorRecipe, lightningArmor, lightningArmorRecipe}