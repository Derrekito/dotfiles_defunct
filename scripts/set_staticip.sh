#!/bin/bash

# Function to list available network connections with their UUIDs and interfaces
list_interfaces() {
    echo "Available network connections, their UUIDs, and interfaces:"
    nmcli connection show | awk 'NR>1 {print $1 " (" $2 ") [" $4 "]"}'
}

# Check if at least two arguments are provided
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <connection name or UUID> <static_ip> [CIDR netmask]"
    list_interfaces
    exit 1
fi

# Assign command line arguments
CON_NAME="$1" # This is now treated as connection name or UUID
STATIC_IP="$2"
CIDR_NETMASK="${3:-24}" # Default to CIDR /24 if no netmask is provided

# Check if the connection name or UUID exists
if ! nmcli connection show "$CON_NAME" &> /dev/null; then
    echo "No active connection profile found for $CON_NAME."
    exit 1
fi

# Set the static IP with CIDR notation
nmcli con mod "$CON_NAME" ipv4.addresses $STATIC_IP/$CIDR_NETMASK
nmcli con mod "$CON_NAME" ipv4.method manual

# Restart the network interface to apply changes
nmcli con down "$CON_NAME"
nmcli con up "$CON_NAME"

echo "Static IP set to $STATIC_IP with CIDR netmask /$CIDR_NETMASK on connection $CON_NAME"
