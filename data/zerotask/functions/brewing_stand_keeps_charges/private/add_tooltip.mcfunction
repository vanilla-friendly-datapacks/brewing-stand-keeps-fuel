#######################################################################
# Author:  SirWindfield (https://github.com/SirWindfield)             #
# License: GNU GPLv3                                                  #
#                                                                     #
# If applicable, credit to other people's work is given in the readme #
#######################################################################

# Tag the item stack so we can resolve its fuel percentage.
tag @s add zerotask.bskf.resolving_tooltip

# Remove the old tooltip as it might be outdated.
data remove entity @s Item.tag.display.Lore

# Store the amount of fuel in a scoreboard.
execute store result score @s zt.bskf.var run data get entity @s Item.tag.BlockEntityTag.Fuel

# Calculate the percentage of the fuel (two digits).
scoreboard players set #temp zt.bskf.var 100
scoreboard players operation @s zt.bskf.var *= #temp zt.bskf.var
scoreboard players operation @s zt.bskf.var /= #max_brewing_stand_fuel zt.bskf.var

# Apply the tooltip.
setblock ~ 255 ~ minecraft:oak_sign{Text1: '[{"text":"Fuel: ","color":"yellow","italic":false},{"score":{"name": "@e[tag=zerotask.bskf.resolving_tooltip,limit=1]", "objective": "zt.bskf.var"}},{"text":"%","color":"yellow","italic":false}]'} replace
data modify entity @s Item.tag.display.Lore append from block ~ 255 ~ Text1

# Remove the sign as it's not needed anymore.
setblock ~ 255 ~ minecraft:air replace

# Mark the item as processed and remove the resolving tag.
tag @s add zerotask.bskf.tooltip
tag @s remove zerotask.bskf.resolving_tooltip
