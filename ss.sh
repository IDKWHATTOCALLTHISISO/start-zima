sudo apt update && sudo apt upgrade -y
sudo apt install -y openssh-server
sudo systemctl enable --now ssh
sudo hostnamectl set-hostname zima.local
curl -fsSL https://get.casaos.io | sudo bash
