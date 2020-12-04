#######################################################################
# Author:  SirWindfield (https://github.com/SirWindfield)             #
# License: GNU GPLv3                                                  #
#                                                                     #
# If applicable, credit to other people's work is given in the readme #
#######################################################################

# Calculate the percentage of the fuel (two digits).
scoreboard players set #temp zt.bskf.var 100
scoreboard players operation @s zt.bskf.var *= #temp zt.bskf.var
scoreboard players operation @s zt.bskf.var /= #max_brewing_stand_fuel zt.bskf.var

# Apply the tooltip.
setblock ~ 255 ~ minecraft:oak_sign{Text1: '[{"text":"Fuel: ","color":"yellow","italic":false},{"score":{"name": "@e[tag=zerotask.bskf.resolving_tooltip,limit=1]", "objective": "zt.bskf.var"}},{"text":"%","color":"yellow","italic":false}]'} replace
data modify entity @s Item.tag.display.Lore append from block ~ 255 ~ Text1

# Remove the sign as it's not needed anymore.
setblock ~ 255 ~ minecraft:air replace
