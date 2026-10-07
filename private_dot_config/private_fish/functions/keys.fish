function keys
    echo test | gpg --clear-sign &>/dev/null
    ssh-add ~/.ssh/id_ed25519
end
