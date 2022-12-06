# //==========// system upgrade
# update packages
sudo apt update && sudo apt upgrade -y;
# dependencies
sudo apt install curl libcanberra-gtk-module software-properties-common apt-transport-https gnupg2 ubuntu-keyring -y;
sudo apt install libglib2.0-0 libxcb-shape0 libxcb-shm0 libxcb-xfixes0 libxcb-randr0 libxcb-image0 libfontconfig1 libgl1-mesa-glx libxi6 libsm6 libxrender1 libpulse0 libxcomposite1 libxslt1.1 libsqlite3-0 libxcb-keysyms1 libxcb-xtest0 ibus -y;
# basic
sudo apt install curl git wget -y;
# media codecs
sudo apt install ubuntu-restricted-extras -y;
# work with files
sudo apt install rar unrar p7zip-full p7zip-rar -y;
# pip
sudo apt install pip -y
# must have tools
sudo apt install python3-pip  net-tools wget curl software-properties-common apt-transport-https hwinfo aptitude build-essential lm-sensors nvme-cli -y
# nala apt manager
echo "deb [arch=amd64,arm64,armhf] http://deb.volian.org/volian/ scar main" | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null
sudo apt update && sudo apt install nala -y


# //==========// software
cd ~/Downloads/
# spotify
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add -;
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list;
sudo apt-get update && sudo apt-get install spotify-client -y;
# zoom
sudo apt install ./mz_zoom.deb -y
# google chrome
wget -O mz_chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
sudo apt install ./mz_chrome.deb -y;
# vscode
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -;
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main";
sudo apt update && sudo apt install code -y; 
# marktext
wget https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-amd64.deb
sudo apt install ./marktext-amd64.deb
# synaptic
sudo apt install synaptic -y
# okular
sudo apt-get install okular -y


# //==========// tools
# mechvibes
wget -O mz_mechvibes.deb https://github.com/hainguyents13/mechvibes/releases/download/v2.3.0/mechvibes_2.3.0_amd64.deb
sudo apt install ./mz_mechvibes.deb -y;
# plank
sudo apt update && sudo apt install plank -y;
# neofetch
sudo apt install neofetch -y
mkdir ~/.config/neofetch/
mkdir ~/.config/neofetch/ascii/
cp ~/mz-ubuntu-post-install/neofetch/ascii/sword.txt ~/.config/neofetch/ascii/
cp ~/mz-ubuntu-post-install/neofetch/config.conf  ~/.config/neofetch/


# //==========// development
# lsd
cd ~/Downloads/
wget https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd-musl_0.21.0_amd64.deb
sudo apt install ./lsd-musl_0.21.0_amd64.deb -y
# bat
sudo apt install bat -y
# fd
sudo apt install fd-find -y
# alacritty
sudo add-apt-repository ppa:aslatter/ppa -y; sudo apt update -y && sudo apt install alacritty -y
mkdir ~/.config/alacritty
cp ~/mz-ubuntu-post-install/alacritty/alacritty.yml ~/.config/alacritty/
# nvim
sudo apt-get install neovim -y
cp ~/mz-ubuntu-post-install/neovim/init.vim ~/.config/nvim
# ranger
sudo apt install ranger -y
# install ranger dev icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf 
# starship
sudo snap install starship
mv ~/mz-ubuntu-post-install/starship/starship.toml ~/.config
# zsh
sudo apt install zsh -y
chsh -s $(which zsh) 
grep zsh /etc/passwd
cp -R ~/mz-ubuntu-post-install/zsh/.zshrc ~/


# //==========// customize
# tweaks
sudo apt install gnome-tweaks -y;
# extensions
sudo apt install gnome-shell-extensions -y;
# os theme
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git;
cd WhiteSur-gtk-theme.git
./install.sh -n mz_theme -o solid -c Dark -t red -p 75 -P smaller -s 180 -i gnome -N mojave --darker
# icon theme
cd ..
git clone https://github.com/vinceliuice/WhiteSur-icon-theme.git;
cd WhiteSur-icon-theme;
./install.sh -t red -a
# cursor
cd ~/mz-ubuntu-post-install/assets/
cp -R ./mz_cursor/ ~/.icons
# fonts -> CaskaydiaCove Nerd Font
sudo cp -r ~/mz-ubuntu-post-install/assets/fonts/*/*.ttf /usr/share/fonts 
sudo apt install fonts-firacode -y
# scaling factor (normal: 1)
gsettings set org.gnome.desktop.interface text-scaling-factor .9


# --------------------------------------------------// clean seaction //--------------------------------------------- #
cd ~/Downloads
sudo apt-get autoclean -y
sudo apt-get autoremove -y
sudo apt-get clean -y
sudo rm *.deb
sudo rm *.tar.xz
sudo rm *.tar.gz
