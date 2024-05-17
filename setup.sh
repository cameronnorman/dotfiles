if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "$OSTYPE"
        # install zshrc
        curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
        apt install exa bat ripgrep bandwhich dog
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
        # lazygit installation
        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin

        export BIN_DIR=/usr/local/bin
        curl -sL https://raw.githubusercontent.com/denisidoro/navi/master/scripts/install

        $ wget https://github.com/knqyf263/pet/releases/download/v0.3.6/pet_0.3.6_linux_amd64.deb
        dpkg -i pet_0.3.6_linux_amd64.deb
elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "MacOS - $OSTYPE"
        # install zshrc
        brew install zoxide exa bat diff-so-fancy fzf jq ripgrep bandwhich dog lazygit navi knqyf263/pet/pet
elif [[ "$OSTYPE" == "cygwin" ]]; then
        echo "$OSTYPE"
else
        echo "OS not supported"
fi

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global interactive.diffFilter "diff-so-fancy --patch"

cp .zshrc ~/.zshrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
exec $SHELL
