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

if test -z (pgrep ssh-agent | string collect)
  eval (ssh-agent -c) > /dev/null
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
  set -Ux SSH_AGENT_PID $SSH_AGENT_PID
  set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
end

