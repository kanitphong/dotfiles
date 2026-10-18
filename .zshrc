# zsh Options
setopt HIST_IGNORE_ALL_DUPS

# Custom zsh
[ -f "$HOME/.config/zsh/custom.zsh" ] && source "$HOME/.config/zsh/custom.zsh"

# Aliases
[ -f "$HOME/.config/zsh/aliases.zsh" ] && source "$HOME/.config/zsh/aliases.zsh"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# pnpm
export PNPM_HOME='/Users/kanitphong/Library/pnpm'
case ":$PATH:" in
  ":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

# Added by the Postman CLI installer
export PATH='/Users/kanitphong/.local/bin':"$PATH"
