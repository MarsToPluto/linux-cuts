#!/bin/bash

# Function to add a rule if it does not already exist
add_ufw_rule() {
    local port="$1"
    local protocol="$2"
    
    if ! sudo ufw status | grep -q "${port}/${protocol}"; then
        sudo ufw allow "${port}/${protocol}"
        echo "Allowed ${port}/${protocol}."
    else
        echo "${port}/${protocol} already allowed."
    fi
}

# List of ports and protocols to allow
declare -a ports=(22 8081 3000 8965 3003 8100 3005)
protocol="tcp"

# Allow each port for both IPv4 and IPv6
for port in "${ports[@]}"; do
    add_ufw_rule "$port" "$protocol"
done

# Enable UFW if it is not already enabled
if ! sudo ufw status | grep -q "Status: active"; then
    sudo ufw enable
    echo "UFW enabled."
fi

# Reload UFW to apply changes
sudo ufw reload
echo "UFW rules applied and reloaded."

echo "Configuration complete."
