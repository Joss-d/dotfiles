fish_add_path $HOME/.local/bin
if status is-interactive
    # Commands to run in interactive sessions can go here
    mise activate fish | source
    starship init fish | source
    atuin init fish | source
    zoxide init fish | source

    set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

end

alias ll="eza -l"
alias grep="rg"
alias cat="bat --paging never"
alias zn="zellij -s"
alias za="zellij attach"
alias zl="zellij list-sessions"
