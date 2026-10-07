# dotfiles

<!--toc:start-->
- [dotfiles](#dotfiles)
  - [Init](#init)
  - [zsh](#zsh)
  - [Neovim stuff](#neovim-stuff)
    - [Install](#install)
  - [Git stuff](#git-stuff)
  - [Alacritty conf](#alacritty-conf)
<!--toc:end-->

## Init

```console
sudo apt install curl wget unzip
curl https://mise.run | sh
~/.local/bin/mise exec chezmoi@latest -- chezmoi init https://github.com/Joss-d/dotfiles.git
~/.local/bin/mise exec chezmoi@latest -- chezmoi apply -v

mkdir ~/.local/share/font
wget -O ~/.local/share/fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/JetBrainsMono.zip
cd ~/.local/share/fonts/ && unzip JetBrainsMono.zip && cd -
```

### Fish

```console
sudo apt install fish
chsh -s $(command -v fish)
```

### zsh

```console
sudo apt install zsh 
chsh -s /bin/zsh
curl https://mise.run | sh
~/.local/bin/mise exec chezmoi@latest -- chezmoi init https://github.com/Joss-d/dotfiles.git
~/.local/bin/mise exec chezmoi@latest -- chezmoi apply -v

#mkdir ~/.local/share/font
#wget -O ~/.local/share/fonts/ https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/JetBrainsMono.zip
#cd ~/.local/share/fonts/ && unzip JetBrainsMono.zip && cd -
```

```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
uv tool install pygments
```

## Neovim stuff

### Install

```console
sudo apt install xclip
sudo apt install python3-venv
```

## Git stuff

```console
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
# sec   rsa3072/xxxxxxxxxxxx 2026-10-03 [SC] [expires: 2027-04-01]
# Put "xxxxxxxxxxxx" part in ~/.my_git_config, [user] signingkey = xxxxxxxxxxxx
gpg --armor --export
# Put key in gitlab/github
```

## Alacritty conf

```toml
[terminal.shell]
program = "wsl.exe"
args = ["~"]

[window]
opacity = 0.95
decorations = "Full"
dynamic_title = false

[window.padding]
x = 12
y = 12

[font]
size = 11.0

[cursor]
style = { shape = "Block", blinking = "On" }

[font.normal]
family = "JetBrainsMono NFM"
style = "Regular"
# https://github.com/ryanoasis/nerd-fonts/releases/download/v3.5.1/JetBrainsMono.zip

[general]
import = ["./catppuccin_mocha.toml"]
# https://github.com/catppuccin/alacritty/blob/main/catppuccin-mocha.toml
```
