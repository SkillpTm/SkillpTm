#!/usr/bin/env fish


# Define color codes
set BLUE "\033[1;34m"
set PURPLE "\033[1;35m"
set RESET "\033[0m"


# Update the package list
echo -e "$PURPLE(sudo apt update)$BLUE Updating package list...$RESET"
sudo apt update -y


# Upgrade installed packages
echo -e "$PURPLE(sudo apt upgrade -y)$BLUE Upgrading packages...$RESET"
sudo apt upgrade -y


# Perform a full upgrade
echo -e "$PURPLE(sudo apt full-upgrade -y)$BLUE Performing full upgrade...$RESET"
sudo apt full-upgrade -y


# Remove unnecessary packages
echo -e "$PURPLE(sudo apt autoremove -y)$BLUE Removing unnecessary packages...$RESET"
sudo apt autoremove -y


# Clean up cached package files
echo -e "$PURPLE(sudo apt clean)$BLUE Cleaning up...$RESET"
sudo apt clean


#Update Flatpak packages
echo -e "$PURPLE(sudo flatpak update -y)$BLUE Updating Flatpak packages...$RESET"
sudo flatpak update -y


# Update Snap packages
echo -e "$PURPLE(sudo snap refresh)$BLUE Updating Snap packages...$RESET"
sudo snap refresh


# Update Kitty
echo -e "$PURPLE(curl -L 'https://sw.kovidgoyal.net/kitty/installer.sh' | sh /dev/stdin)$BLUE Updating Kitty Emulator...$RESET"

set kitty_current_version (kitty --version | grep "kitty " | awk '{print $2}')
set kitty_latest_version (curl "https://sw.kovidgoyal.net/kitty/current-version.txt")

if test "$kitty_current_version" = "$kitty_latest_version"
    echo -e "Kitty is up to date ($kitty_current_version)"
else
    echo -e "Updating Kitty from version $kitty_current_version to $kitty_latest_version..."
    curl -L "https://sw.kovidgoyal.net/kitty/installer.sh" | sh /dev/stdin
end


# Update pyenv
echo -e "$PURPLE(pyenv update)$BLUE Updating pyenv..."
pyenv update


# Update Discord
echo -e "$PURPLE(curl -L 'https://discord.com/api/download/canary?platform=linux&format=deb' 2>/dev/null -o discord-canary.deb)$BLUE Updating Discord...$RESET"

set discord_current_version (apt search discord-canary | grep "discord-canary/now" | awk '{print $2}')
set discord_latest_version (curl -s "https://discord.com/api/download/canary?platform=linux&format=deb" | grep -oP "discord-canary-\K[0-9]+\.[0-9]+\.[0-9]+" | head -n1)

if test "$discord_current_version" = "$discord_latest_version"
    echo -e "Discord is up to date ($discord_current_version)"
else
    echo -e "Updating Discord from version $discord_current_version to $discord_latest_version..."
    curl -L "https://discord.com/api/download/canary?platform=linux&format=deb" 2>/dev/null -o discord-canary.deb
    sudo apt install ~/discord-canary.deb
    sudo rm ~/discord-canary.deb
end


# Finished
echo -e "$BLUE System updated successfully.$RESET"
