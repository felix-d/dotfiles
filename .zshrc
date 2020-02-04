# this is the root folder where all globally installed node packages will  go
export NPM_PACKAGES="/usr/local/npm_packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
# add to PATH
export PATH=$NPM_PACKAGES/bin:$PATH
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/Downloads/luarocks-3.0.4/lua_modules/bin

# Shopify
[ -f /opt/dev/dev.sh ] && source /opt/dev/dev.sh

# Chruby
source /usr/local/share/chruby/chruby.sh
chruby 2.5

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
export GOPATH="$HOME/go"
export PATH=$GOPATH/bin:$PATH

# passwords and stuff
source ~/.secrets

# Terminal color
# export TERM=xterm-256color-italic

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --files-with-matches --no-ignore --hidden --follow --glob "!.git/*"'

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

search_rake() {
    local task_name="$(rake -T -A | fzf | sed -E 's/(rake|#.*)//g;s/^ *//;s/ *$//')"
    rake -D $task_name
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

clone_repo() {
    local repo_url=$1

    local repo_domain="$(echo "$1" | awk -F/ '{print $3}')"
    local git_user="$(echo "$1" | awk -F/ '{print $4}')"
    local user_path="$HOME/src/$repo_domain/$git_user"

    mkdir -p $user_path
    cd $user_path
    git clone $repo_url

    local repo_name="$(echo "$1" | awk -F/ '{print $5}')"
    local src_dir="$(echo $repo_name | sed -e "s/\.git//g")"

    cd $src_dir
}

alias gcor=git_checkout_recent_branch

# alias gcor="branch_name=$(git_recent_branches | fzf); git add . && git stash save $branch_name && git co $branch_name"

alias lastb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
git config --global alias.up 'pull --rebase --autostash'

export EDITOR=nvim
export VISUAL=nvim
chruby 2.6
export PATH=$HOME/.cargo/bin:$PATH
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# Fixes Ctr-A and Ctrl-E because of oh my zsh
bindkey -e

export DEFAULT_USER=$USER
zstyle ':prezto:module:git:info:dirty' format "%%B%F{$secondary_color}]%f%%b %F{yellow}✗%f"

# cloudplatform: add Shopify clusters to your local kubernetes config
export KUBECONFIG=${KUBECONFIG:+$KUBECONFIG:}/Users/felixdescoteaux/.kube/config:/Users/felixdescoteaux/.kube/config.shopify.cloudplatform
for file in /Users/felixdescoteaux/src/github.com/Shopify/cloudplatform/workflow-utils/*.bash; do source ${file}; done

kubectl-short-aliases

klogs() {
  kgpn | fzf | head -1 | xargs kubectl logs
}


kbash() {
    k exec -it $(kgpn | fzf --prompt "/bin/bash > ") -- /bin/bash
}

magellan-proxy () {
        kubectl port-forward $(kubectl --context core-us-east1-1 -n magellan-production get pods | tail -n 1 | cut -f 1 -d ' ') --context core-us-east1-1 -n magellan-production 8438:8438
}
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
