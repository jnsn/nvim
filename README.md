Installation
============

```
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
```

```
sudo apt-get update
sudo apt-get -y install curl fzf ripgrep tree git xclip python3 python3-pip nodejs npm tzdata ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config zip unzip

sudo npm install -g neovim
```
