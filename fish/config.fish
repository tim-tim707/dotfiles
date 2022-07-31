# Start X at login
if status is-login
   if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        echo "Starting X server from fish"
        exec startx -- -keeptty
    end
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# zoxide
zoxide init fish | source

# colored man pages
set -g man_blink -o red
set -g man_bold -o red

# Vim
fish_vi_key_bindings

# ssh agent
fish_ssh_agent

