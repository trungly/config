# Set up PATH
set PATH $PATH $HOME/bin $HOME/google-cloud-sdk/bin

# Set up VirtualFish: http://virtualfish.readthedocs.org/en/latest/install.html
set -g VIRTUALFISH_COMPAT_ALIASES # virtualenvwrapper-style commands
eval (python -m virtualfish)
# eval (python -m virtualfish compat_aliases)
eval (python -m virtualfish auto_activation)

# Textmate
set -g EDITOR "/usr/local/bin/mate -w"

# Docker
set -x DOCKER_HOST tcp://192.168.59.103:2376
set -x DOCKER_CERT_PATH $HOME/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1

# Set up the Prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1
set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green bold

function fish_prompt --description 'Write out the prompt'

  if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
  end

  # VirtualEnv
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b blue white) "[" (basename "$VIRTUAL_ENV") "]" (set_color normal) " "
  end

  # PWD
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal

  printf '%s ' (__fish_git_prompt)

  echo -n '$ '

end


# Aliases
function ack
  command ack -v -g '\/.webassets-cache\/|\/gen\/' | command ack -x $argv
end

function ip
  ipython $argv
end

function bn
  /usr/local/bin/babel-node $argv
end

function pfon
  sudo pfctl -ef /etc/pf-pympp.conf
end

function pfoff
  sudo pfctl -d
  sudo pfctl -F all -f /etc/pf.conf
end

function pg
  postgres -D /usr/local/var/postgres
end

