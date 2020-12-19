# Go Lang
#set -x GOPATH $HOME/projects/go
#set -x GOBIN $HOME/projects/go/bin
#set -x GOROOT /usr/local/opt/go/libexec

# Set up PATH
#set PATH $PATH $GOPATH/bin $GOROOT/bin $HOME/google-cloud-sdk/bin
set PATH $PATH $HOME/google-cloud-sdk/bin

# The next line updates PATH for the Google Cloud SDK
# if [ -f $HOME/google-cloud-sdk/path.fish.inc ]; if type source > /dev/null; source $HOME/google-cloud-sdk/path.fish.inc; else; . $HOME/google-cloud-sdk/path.fish.inc; end; end

# Set up VirtualFish: http://virtualfish.readthedocs.org/en/latest/install.html
#set -g VIRTUALFISH_COMPAT_ALIASES # virtualenvwrapper-style commands
#eval (python3 -m virtualfish)
#eval (python3 -m virtualfish compat_waliases)
#eval (python3 -m virtualfish auto_activation)

# Pyenv
if test -d $HOME/.pyenv
    set -x PYENV_ROOT $HOME/.pyenv
    set -x PATH $PYENV_ROOT/bin $PATH
    status --is-interactive; and pyenv init - | source
    status --is-interactive; and pyenv virtualenv-init - | source
end

# Set up rbenv (Ruby Env)
if command -sq rbenv
    status --is-interactive && source (rbenv init -|psub)
end

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

  # virtualenv
  if set -q VIRTUAL_ENV
      echo -n -s (set_color -b blue white) "[" (basename "$VIRTUAL_ENV") "]" (set_color normal) " "
  end

  # user and hostname
  if test (whoami) = "root"
    set_color red
  end
  printf '%s@' (whoami)
  set_color normal
  printf '%s:' (hostname -s)
  set_color $fish_color_cwd

  # path
  echo -n (my_prompt)
  set_color normal

  # git
  printf '%s ' (__fish_git_prompt)
end

function m
    pushd $HOME/Projects/tradesy/core/tradesy-containers
    make $argv
    popd
end

function sudobangbang --on-event fish_postexec
    abbr !! sudo $argv[1]
end

# Aliases
alias cm="cd $HOME/Projects/tradesy/core/tradesy-catalog-mapping"
alias tc="cd $HOME/Projects/tradesy/core/tradesy-containers"
alias t="cd $HOME/Projects/tradesy/core"
alias k="kubectl"
alias kt="kubectl -n trung"
alias pods="kubectl get pods"
alias logs="kubectl logs"
alias ag="ag -G '.*(?<!chunk.js)(?<!min.js)(?<!bundle.js)(?<!.css)(?<![b|a|t].sql)(?<!model.pkl)\$'"
alias nag="ag --nogroup"
alias pg="postgres -D /usr/local/var/postgres"

test -e {$HOME}/.iterm2_shell_integration.fish && source {$HOME}/.iterm2_shell_integration.fish

set -g fish_user_paths "/usr/local/opt/mysql@5.7/bin" $fish_user_paths
