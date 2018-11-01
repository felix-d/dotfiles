# this is the root folder where all globally installed node packages will  go
export NPM_PACKAGES="/usr/local/npm_packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# add to PATH
export PATH=$NPM_PACKAGES/bin:$PATH
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin

# Shopify
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Chruby
source /usr/local/share/chruby/chruby.sh
chruby 2.3

# Lang
export LANG=en_US.UTF-8
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Go
export GOPATH="$HOME"

# passwords and stuff
source ~/.secrets

# Terminal color
# export TERM=xterm-256color-italic

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --files-with-matches --no-ignore --hidden --follow --glob "!.git/*"'

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Aliases
alias vim="nvim"
alias fixup="git commit --amend -C HEAD"
alias gpf='git push --force-with-lease --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gap='git commit --amend -C HEAD && git push --force --set-upstream origin "$(git-branch-current 2> /dev/null)"'
alias gup='git pull --rebase origin "$(git-branch-current 2> /dev/null)"'
alias gcf="git commit -a --fixup HEAD"
alias gpm="git pull --rebase origin master"
alias gpms="git fetch origin master && git rebase --interactive --autosquash origin/master"
alias wip="git commit -am \"WIP\""
alias delete-old-branches="git branch --merged | grep -v '\*\|master\|develop' | xargs -n 1 git branch -d"

git_recent_branches() {
    git branch --sort=committerdate | tail -n 10
}

git_checkout_recent_branch() {
    local current_branch_name="$(git branch | grep \* | cut -d ' ' -f2)"

    local new_branch_name="${$(git_recent_branches | fzf)//[[:blank:]]/}"

    echo "Switching to \e[36m$new_branch_name\e[0m..."

    {
        git add .
        git stash save "$current_branch_name-AUTOSTASH"

        git co $new_branch_name

        local previous_stash="$new_branch_name-AUTOSTASH"
        local stash_found="$(git stash list | grep $previous_stash | head -n 1 | sed 's/:.*//')"

        if [ ! -z "$stash_found" ]
        then
            git stash apply $stash_found
            git stash drop $stash_found
        fi
    } &> /dev/null
}

alias gcor=git_checkout_recent_branch

# alias gcor="branch_name=$(git_recent_branches | fzf); git add . && git stash save $branch_name && git co $branch_name"

alias lastb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
git config --global alias.up 'pull --rebase --autostash'

export EDITOR=nvim
export VISUAL=nvim
chruby 2.5
export PATH=$HOME/.cargo/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Fixes Ctr-A and Ctrl-E because of oh my zsh
bindkey -e

export DEFAULT_USER=$USER
zstyle ':prezto:module:git:info:dirty' format "%%B%F{$secondary_color}]%f%%b %F{yellow}✗%f"