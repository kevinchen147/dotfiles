if status is-interactive
    # +----------+
    # | Greeting |
    # +----------+
    set -g fish_greeting

    # +----+
    # | Vi |
    # +----+
    fish_vi_key_bindings

    # +------+
    # | Path |
    # +------+
    if test -d "$HOME/.local/bin/"
        fish_add_path -m "$HOME/.local/bin/"
    end
    if test -d "/usr/local/go/bin"
        fish_add_path -m "/usr/local/go/bin"
    end

    # +------+
    # | Abbr |
    # +------+
    abbr --add g "git"
    abbr --add .... "cd ../../.."
    abbr --add ... "cd ../.."
    abbr --add .. "cd .."
    abbr --add - "cd -"
    abbr --add _ "sudo"
    abbr --add c "code"
    abbr --add d "sudo docker"
    abbr --add g "git"
    abbr --add py "python3"
    abbr --add on "gsettings set org.gnome.system.proxy mode manual"
    abbr --add off "gsettings set org.gnome.system.proxy mode none"
end
