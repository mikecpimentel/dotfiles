# dotfiles

macOS shell config, symlinked into ~ with GNU Stow.

- `zsh/` → `~/.zprofile`, `~/.zshrc`
- `Brewfile` → everything installed with Homebrew

## Restore on a new Mac

1. Install Homebrew from https://brew.sh. Skip its "Next steps" that edit
   ~/.zprofile (this repo already has that line); just run this in the current terminal:

```
   eval "$(/opt/homebrew/bin/brew shellenv)"
```

2. Clone:

```
   brew install gh && gh auth login
   gh repo clone dotfiles ~/dotfiles
```

3. Install packages:

```
   brew bundle --file=~/dotfiles/Brewfile
```

4. Link configs (if stow reports a conflict, move that file out of ~ and rerun):

```
   cd ~/dotfiles && stow zsh
```

5. Open a new terminal tab, then install runtimes:

```
   fnm install --lts --use && fnm default "$(fnm current)"
   uv python install 3.14 --default
   brew install pnpm
```

## Day to day

- Edit ~/.zshrc and ~/.zprofile normally; they're symlinks into this repo.
  `git -C ~/dotfiles diff` shows what changed, including lines installers append.
- After installing things with brew: `brew bundle dump --force --file=~/dotfiles/Brewfile`
- Machine-only settings go in ~/.zshrc.local (not tracked).
