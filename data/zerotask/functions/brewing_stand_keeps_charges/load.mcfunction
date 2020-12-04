#######################################################################
# Author:  SirWindfield (https://github.com/SirWindfield)             #
# License: GNU GPLv3                                                  #
#                                                                     #
# If applicable, credit to other people's work is given in the readme #
#######################################################################

scoreboard objectives add zt.bskf.var dummy

# The maximum fuel value.
scoreboard players set #max_brewing_stand_fuel zt.bskf.var 20

# Used to compare against the item's `tag` NBT to check if it is empty or not.
# This is needed to make the item stackable again if no fuel is inside of it.
data modify storage zerotask:bskf Item set value {BlockEntityTag: {Fuel: 0b}}
