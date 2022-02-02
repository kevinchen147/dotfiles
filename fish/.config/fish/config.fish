if status is-interactive
    # +----------+
    # | Greeting |
    # +----------+
    set -g fish_greeting

    # +-----+
    # | GPG |
    # +-----+
    set -gx GPG_TTY (tty)

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

    # +------+
    # | Abbr |
    # +------+
    abbr --add - "cd -"
    abbr --add .. "cd .."
    abbr --add ... "cd ../.."
    abbr --add .... "cd ../../.."
    abbr --add _ "sudo"
    abbr --add c "code"
    abbr --add d "sudo docker"
    abbr --add g "git"
    abbr --add o "explorer.exe"
    abbr --add py "python3"
    abbr --add v "nvim"

    # +-------+
    # | Proxy |
    # +-------+
    on
end