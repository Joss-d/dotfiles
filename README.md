# dotfiles

<!--toc:start-->
- [dotfiles](#dotfiles)
  - [Neovim stuff](#neovim-stuff)
    - [Install](#install)
  - [Git stuff](#git-stuff)
  - [zsh](#zsh)
<!--toc:end-->

## Neovim stuff

### Install

```console
install tree-sitter-cli
install npm
install python3-venv
install fd-find
install ripgrep
install lazygit
install fzf

# Clipboard : 
install tmux
# install wl-clipboard
```

## Git stuff

```console
gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
gpg --armor --export
```

## zsh

```console
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
uv tool install pygments
uv tool install virtualenvwrapper
```
