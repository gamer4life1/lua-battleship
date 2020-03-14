git clone https://github.com/torch/distro.git ~/torch --recursive
brew install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cd ~/torch
echo 'In ~/torch, run TORCH_LUA_VERSION=LUA52 ./install.sh to install. Then, do source ~/.bashrc'