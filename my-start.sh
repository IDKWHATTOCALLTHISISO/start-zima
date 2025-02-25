sudo apt update
sudo apt install -y openssh-server
sudo systemctl enable --now ssh
pip install flask
sudo hostnamectl set-hostname zimaboard.localhost
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo wget -O - https://github.com/OpenMediaVault-Plugin-Developers/installScript/raw/master/install | sudo bash
mkdir file
curl https://raw.githubusercontent.com/IDKWHATTOCALLTHISISO/py/refs/heads/main/app.py -O
mkdir static
cd static
mkdir files
cd ..
mkdir templates
cd templates
curl https://raw.githubusercontent.com/IDKWHATTOCALLTHISISO/py/refs/heads/main/index.html -O
cd ../..
echo "I am finished doing stuff"
