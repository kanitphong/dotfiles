# System
alias shutdown='sudo shutdown -h now'
alias restart='sudo reboot' 
alias suspend='sudo pm-suspend'
alias sleep='pmset sleepnow'
alias c='clear'
alias e='exit'

# Git
alias current_branch='git branch --show-current'
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gafzf='git ls-files -m -o --exclude-standard | grep -v "__pycache__" | fzf -m --print0 | xargs -0 -o -t git add' # Git add with fzf
alias grmfzf='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git rm' # Git rm with fzf
alias grfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore' # Git restore with fzf
alias grsfzf='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore --staged' # Git restore --staged with fzf
alias gf='git fetch'
alias gs='git status'
alias gss='git status -s'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gb='git branch '
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbr='git branch -r'
alias gd='git diff'
alias gdc='git diff --cached'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout main'
alias gcod='git checkout develop'
alias gcofzf='git branch | fzf | xargs git checkout' # Select branch with fzf
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcl='git clone'
alias grm='git rm'
alias grs='git reset'
alias grsh='git reset --hard'
alias gru='git reset --'
alias gre='git remote'
alias gres='git remote show'
alias grev='git remote -v'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbs='git rebase --skip'
alias grbi='git rebase -i'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph --max-count=5 --decorate --pretty="oneline"'
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'
alias gmt='git mergetool --no-prompt --tool=vimdiff'
alias gl='git pull'
alias glo='git pull origin'
alias gup='git pull --rebase'
alias gp='git push'
alias gpd='git push --dry-run'
alias gpo='git push origin'
alias ggpull='git pull origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gcmnv='git commit --no-verify -m'
alias gcanenv='git commit --amend --no-edit --no-verify'
alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
# Function to commit with ticket ID from current branch, with optional push
quick_commit() {
  local branch_name ticket_id commit_message push_flag
  branch_name=$(git branch --show-current)
  ticket_id=$(echo "$branch_name" | awk -F '-' '{print toupper($1"-"$2)}')
  commit_message="$ticket_id: $*"
  push_flag=$1

  if [[ "$push_flag" == "push" ]]; then
    # Remove 'push' from the commit message
    commit_message="$ticket_id: ${*:2}" # take all positional parameters starting from the second one
    git commit --no-verify -m "$commit_message" && git push
  else
    git commit --no-verify -m "$commit_message"
  fi
}

alias gqc='quick_commit'
alias gqcp='quick_commit push'

# Shortcuts
alias t='tmux'
alias v='nvim'

# Folders
alias doc='cd $HOME/Documents'
alias dow='cd $HOME/Downloads'

# Better ls
# alias ls='eza --all --icons=always'
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# Lazygit
alias lg='lazygit'

# --- Zoxide (better cd) ---
alias cd="z"
