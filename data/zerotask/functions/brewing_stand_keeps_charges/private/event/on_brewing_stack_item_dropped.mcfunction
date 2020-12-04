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

# Only calculate and apply the tooltip if there is any.
execute if score @s zt.bskf.var matches 1.. run function zerotask:brewing_stand_keeps_charges/private/brewing_stand/add_tooltip

# Check if the NBT of the item is empty. If that is the case, remove the Item.tag so it can be stacked again.
execute store result score $is_empty_item_tag zt.bskf.var run data modify storage zerotask:bskf Item set from entity @s Item.tag
execute if score $is_empty_item_tag zt.bskf.var matches 0 run data remove entity @s Item.tag

# Mark the item as processed and remove the resolving tag.
tag @s add zerotask.bskf.tooltip
tag @s remove zerotask.bskf.resolving_tooltip
