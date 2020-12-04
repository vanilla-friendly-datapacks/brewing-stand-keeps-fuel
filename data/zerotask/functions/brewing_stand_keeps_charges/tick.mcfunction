#######################################################################
# Author:  SirWindfield (https://github.com/SirWindfield)             #
# License: GNU GPLv3                                                  #
#                                                                     #
# If applicable, credit to other people's work is given in the readme #
#######################################################################

execute as @e[type=minecraft:item,tag=!zerotask.bskf.tooltip,nbt={Item: {id: "minecraft:brewing_stand"}},tag=!global.ignore,limit=1] at @s run function zerotask:brewing_stand_keeps_charges/private/add_tooltip
