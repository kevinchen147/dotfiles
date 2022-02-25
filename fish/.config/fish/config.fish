if status is-interactive
    # +-----+
    # | GPG |
    # +-----+
    set -x GPG_TTY (tty)

    # +-------------+
    # | Key Binding |
    # +-------------+
    fish_vi_key_bindings
    bind -M insert \ci forward-word
    bind -M insert \co accept-autosuggestion
    bind -M insert \t complete-and-search
end