# ~/.zprofile
# Login shells (every new Terminal/iTerm tab on macOS). Runs before ~/.zshrc.
# Environment only: PATH and exported variables. Interactive stuff lives in ~/.zshrc.

# ---- Homebrew -------------------------------------------------------------
# Sets HOMEBREW_PREFIX and puts /opt/homebrew/bin on PATH.
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# ---- PATH -----------------------------------------------------------------
# `path` is zsh's array view of $PATH. Entries higher in the list win.
# -U drops duplicates (keeping the first), so re-running this never stacks entries.
# (N-/) skips any directory that doesn't exist, so this file is safe on any Mac.
typeset -U path PATH

export PNPM_HOME="$HOME/Library/pnpm"

path=(
  $HOME/.local/bin(N-/)                                        # uv, uv-installed Pythons and tools
  $PNPM_HOME(N-/)                                              # pnpm and its global packages
  /Library/Frameworks/Python.framework/Versions/3.14/bin(N-/)  # python.org Python (remove once on uv)
  $HOMEBREW_PREFIX/opt/libpq/bin(N-/)                          # psql, pg_dump (keg-only formula)
  $path
)

# ---- Environment ----------------------------------------------------------
export EDITOR="code --wait"   # --wait so git commit etc. block until you close the tab
export VISUAL="$EDITOR"