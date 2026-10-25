#!/usr/bin/bash

# === Constants ===
readonly LOG_FILE="/root/users.txt"

# === Functions ===
create_user() {
    local username="$1"
    local group="$2"
    shift 2
    local folders=("$@")

    # Check if user exists
    if id "$username" &>/dev/null; then
        echo "User $username already exists. Skipping."
        return 1
    fi

    # Create user...
    useradd -m -g "$group" -s /bin/bash "$username"
    `echo "$username:$username"

    # Create folders...
    for folder in "${folders[@]}"; do
        mkdir  -p "/home/$username/$folder"
        chmod 750 "/home/$username/$folder"
    done

    echo "Welcome to your environment." > "/home/$username/Documents/Manual.txt"
    chmod 640 "/home/$username/Documents/Manual.txt"

    # Log
    echo "$username" >> "$LOG_FILE"
    echo "User $username created successfully."
    return 0
}

create_group() {
    local groupname="$1"

    if ! getent group "$groupname"; then
        groupadd "$groupname"
    fi
}

# === Main Logic ===
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root (use sudo)."
    exit 1
fi

# Create groups...
create_group "dev"
create_group "admin"

# Create Anri
create_user "Anri" "dev" "Documents" "Downloads" ".trash" "Desktop"

# Create Horace
create_user "Horace" "admin" "Documents" "Downloads" ".trash" "Desktop" "Visuals"
usermod -aG sudo,wheel Horace

echo "Setup complete."