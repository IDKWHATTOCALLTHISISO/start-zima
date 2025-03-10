#!/bin/bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y openssh-server
sudo systemctl enable --now ssh
sudo hostnamectl set-hostname zima.local
sudo apt install gnome-terminal
sudo apt install fzf chafa
curl -fsSL https://get.casaos.io | sudo bash

echo "Installing Conky..."
sudo apt update && sudo apt install -y conky-all

echo "Creating Conky configuration..."
mkdir -p ~/.config/conky

cat <<EOL > ~/.config/conky/conky.conf
conky.config = {
    alignment = 'top_right',
    background = false,
    double_buffer = true,
    update_interval = 1,
    border_width = 0,
    default_color = 'white',
    own_window = true,
    own_window_type = 'desktop',  # Keeps Conky below app windows
    own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',
    own_window_transparent = true,
    use_xft = true,
    font = 'Ubuntu Mono:size=12',
    gap_x = 20,
    gap_y = 20,
    minimum_width = 200,
    minimum_height = 50,
}

conky.text = [[
\${color white}CPU: \${cpu cpu0}% \${cpubar 4}
RAM: \$mem / \$memmax (\$memperc%) \${membar 4}
]]
EOL

echo "Setting up Conky to start on boot..."
mkdir -p ~/.config/autostart

cat <<EOL > ~/.config/autostart/conky.desktop
[Desktop Entry]
Type=Application
Exec=conky -c ~/.config/conky/conky.conf
Hidden=false
NoDisplay=false
X-GNOME-Autostart-enabled=true
Name=Conky
Comment=System Monitor Widget
EOL

echo "Starting Conky..."
(conky -c ~/.config/conky/conky.conf &)

echo "Conky setup complete! It will now run on startup."

