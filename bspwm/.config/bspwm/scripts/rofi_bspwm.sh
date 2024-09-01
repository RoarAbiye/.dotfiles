#!/bin/bash

# Path to list_hidden_nodes.sh script
script_path="~/.config/bspwm/scripts/list_hidden_nodes.sh"

# Get list of hidden nodes
hidden_nodes=$(eval "$script_path")

# Show rofi menu with hidden nodes
chosen=$(echo "$hidden_nodes" | rofi -dmenu -p "Hidden Nodes:")

# If a node is chosen, unhide it
if [ -n "$chosen" ]; then
    node_id=$(bspc query -N -n "$chosen" | head -n 1)
    bspc node "$node_id" -g hidden=off
fi
