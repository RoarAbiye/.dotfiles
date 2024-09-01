#!/bin/bash

# Get list of hidden nodes
hidden_nodes=$(bspc query -N -n .hidden)

# Output each node's window class or instance name
while IFS= read -r node; do
    # Get detailed node information
    node_info=$(bspc query -T -n "$node")

    # Check if node_info is valid JSON
    if jq -e . >/dev/null 2>&1 <<<"$node_info"; then
        # Extract className or instanceName using jq
        window_class=$(echo "$node_info" | jq -r '.client.className // .client.instanceName // "Unknown"')
        echo "$window_class"
    else
        echo "Error: Invalid descriptor for node $node"
    fi
done <<< "$hidden_nodes"

