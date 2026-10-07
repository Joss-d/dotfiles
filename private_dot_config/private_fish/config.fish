fish_add_path $HOME/.local/bin
if status is-interactive
    # Commands to run in interactive sessions can go here
    mise activate fish | source
    starship init fish | source
    atuin init fish | source
    zoxide init fish | source

    # Définit le terminal actuel pour GPG (indispensable pour les boîtes de dialogue de mot de passe)
    set -gx GPG_TTY (tty)

    # Optionnel : Si vous utilisez GPG Agent pour gérer également vos clés SSH
    if gpgconf --list-options gpg-agent | grep -q enable-ssh-support
        set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
    end
end

alias ll="eza -l"
alias grep="rg"
alias cat="bat --paging never"
alias zn="zellij -s"
alias za="zellij attach"
alias zl="zellij list-sessions"
alias zka="zellij delete-all-sessions"
