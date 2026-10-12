# ~/.zshrc
# Interactive shells: options, completion, prompt, tool hooks, aliases.
# PATH and exported variables live in ~/.zprofile.

# ---- History --------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY          # share history across all open sessions
setopt HIST_IGNORE_ALL_DUPS   # don't store duplicates
setopt HIST_REDUCE_BLANKS     # trim whitespace

# ---- Options --------------------------------------------------------------
setopt AUTO_CD                # type a directory name to cd into it
setopt CORRECT                # offer spelling corrections
setopt INTERACTIVE_COMMENTS   # allow # comments in interactive shell

# ---- Completion -----------------------------------------------------------
# Homebrew packages (gcloud included) install completions here; must be on fpath before compinit.
typeset -U fpath
fpath=($HOMEBREW_PREFIX/share/zsh/site-functions(N-/) $fpath)
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'   # case-insensitive tab completion
zstyle ':completion:*' menu select                      # arrow-key menu for completions

# ---- Node (fnm) -----------------------------------------------------------
# Switches Node automatically when you cd into a project with .nvmrc / .node-version
# (recursive = also finds the file in parent directories, handy in monorepos).
eval "$(fnm env --use-on-cd --version-file-strategy=recursive --shell zsh)"

# ---- Tools ----------------------------------------------------------------
eval "$(starship init zsh)"   # prompt
source <(fzf --zsh)           # Ctrl+R history search, Ctrl+T file search
eval "$(zoxide init zsh)"     # smarter cd: use `z`

# ---- Aliases --------------------------------------------------------------
# eza (modern ls)
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -la"
alias lt="eza --icons --tree --level=2"

# git shortcuts
alias gs="git status"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate -20"
alias gp="git push"
alias gc="git commit"

# convenience
alias ..="cd .."
alias ...="cd ../.."
alias reload="exec zsh -l"    # fresh shell that re-reads .zprofile and .zshrc

# ---- Machine-specific settings (not in git) -------------------------------
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ---- Plugins: keep last; syntax-highlighting must be the final line -------
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh