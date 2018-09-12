# Go Lang
set -x GOPATH $HOME/Projects/tradesy/go
set -x GOROOT /usr/local/opt/go/libexec

# Set up PATH
# set PATH $PATH $GOPATH/bin $GOROOT/bin ~/Library/Python/3.7/bin $HOME/.npm-global/bin
set PATH $PATH $GOPATH/bin $GOROOT/bin ~/Library/Python/3.7/bin

# The next line updates PATH for the Google Cloud SDK
if [ -f $HOME/google-cloud-sdk/path.fish.inc ]; if type source > /dev/null; source $HOME/google-cloud-sdk/path.fish.inc; else; . $HOME/google-cloud-sdk/path.fish.inc; end; end

# Set up VirtualFish: http://virtualfish.readthedocs.org/en/latest/install.html
# set -g VIRTUALFISH_COMPAT_ALIASES # virtualenvwrapper-style commands
# eval (python -m virtualfish)
# eval (python -m virtualfish compat_aliases)
# eval (python -m virtualfish auto_activation)

# Set up rbenv (Ruby Env)
#status --is-interactive; and . (rbenv init -|psub)

# Textmate
set -g VISUAL "/usr/local/bin/mate -w"
set -g EDITOR $VISUAL
set -g GIT_EDITOR $VISUAL

# Set up the Prompt
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1
set -g __fish_git_prompt_color_branch magenta --bold
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
set -g __fish_git_prompt_color_cleanstate green --bold

function my_prompt
  echo $PWD | sed -e "s|^$HOME|~|"
end

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
  # echo -n (prompt_pwd)
  echo -n (my_prompt)
  set_color normal

  printf '%s ' (__fish_git_prompt)
end


# Aliases
#function ack
#  command ack -v -g '\/.webassets-cache\/|\/gen\/|\/tmp\/' | command ack -x $argv
#end

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


test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
