# dotfiles

---

## Instructions for managing my dotfiles using GNU Stow

Refer to [GNU Stow manual](https://www.gnu.org/software/stow/manual/).

### Using the stowed dotfiles on a new system

1. Install GNU Stow
    ```sh
    sudo apt update
    sudo apt install stow
    ```

2. Clone the remote `dotfiles` repository.
    ```sh
    cd ~
    git clone git@github.com:manrjv/dotfiles.git
    ```

3. **Delete** existing dotfiles or **move** them to another directory.
    ```sh
    rm ~/.bashrc
    rm ~/.zshrc
    rm ~/.config/nvim/init.vim
    rm ~/.config/alacritty/alacritty.yml
    rm ~/.config/user-dirs.dirs
    ```

4. Create dotfile symlinks using stow.

    * Do a dry-run first. With `-n` stow does not do the changes. It just shows what would happen.
    ```sh
    cd ~/dotfiles
    stow -nvSt ~ bash
    stow -nvSt ~ zsh
    stow -nvSt ~ nvim
    stow -nvSt ~ alacritty
    stow -nvSt ~ user-dirs
    ```

    * Do the actual changes.
    ```sh
    cd ~/dotfiles
    stow -vSt ~ bash
    stow -vSt ~ zsh
    stow -vSt ~ nvim
    stow -vSt ~ alacritty
    stow -vSt ~ user-dirs
    ```

---

## Instructions for setting everything up from scratch


### Getting things ready

1. Install GNU Stow
    ```sh
    sudo apt update
    sudo apt install stow
    ```

2. Create a GitHub repository.
    * Select **Add a README file** to initialize the repository.

3. Clone the new repository in the `$HOME` directory.
    ```sh
    cd ~
    git clone git@github.com:manrjv/dotfiles.git
    ```

4. Since this is the first time the dotfiles are being stowed, create the directories and empty files in `~/dotfiles`.
    ```sh
    mkdir -p ~/dotfiles/bash/
    touch ~/dotfiles/bash/.bashrc

    mkdir -p ~/dotfiles/zsh/
    touch ~/dotfiles/zsh/.zshrc

    mkdir -p ~/dotfiles/nvim/.config/nvim/
    touch ~/dotfiles/nvim/.config/nvim/init.vim

    mkdir -p ~/dotfiles/alacritty/.config/alacritty/
    touch ~/dotfiles/alacritty/.config/alacritty/alacritty.yml

    mkdir -p ~/dotfiles/user-dirs/.config/
    touch ~/dotfiles/user-dirs/.config/user-dirs.dirs
    ```

### Stowing dotfiles for the first time

***WARNING:*** *This section will delete/overwrite contents of* `~/dotfiles`. *And since this is the first time the files are being stowed, only empty dotfiles should exist in* `~/dotfiles`.

#### Option 1

1. Move and stow the dotfiles using `--adopt` - do a dry-run first. With `-n`, stow does not do the changes. It just shows what would happen.
    ```sh
    cd ~/dotfiles
    stow --adopt -nvSt ~ bash
    stow --adopt -nvSt ~ zsh
    stow --adopt -nvSt ~ nvim
    stow --adopt -nvSt ~ alacritty
    stow --adopt -nvSt ~ user-dirs
    ```
2. Move and stow the dotfiles using `--adopt` - do the actual changes.
    ```sh
    cd ~/dotfiles
    stow --adopt -vSt ~ bash
    stow --adopt -vSt ~ zsh
    stow --adopt -vSt ~ nvim
    stow --adopt -vSt ~ alacritty
    stow --adopt -vSt ~ user-dirs
    ```
#### Option 2

1. Manually move existing dotfiles to `~/dotfiles`.
    ```sh
    cd ~/dotfiles
    mv ~/.bashrc bash/.bashrc
    mv ~/.zshrc zsh/.zshrc
    mv ~/.config/nvim/init.vim nvim/.config/nvim/init.vim
    mv ~/.config/alacritty/alacritty.yml alacritty/.config/alacritty/alacritty.yml
    mv ~/.config/user-dirs.dirs user-dirs/.config/user-dirs.dirs
    ```

2. Stow the dotfiles - do a dry-run first.
    ```sh
    stow -nvSt ~ bash
    stow -nvSt ~ zsh
    stow -nvSt ~ nvim
    stow -nvSt ~ alacritty
    stow -nvSt ~ user-dirs
    ```

3. Stow the dotfiles - do the actual changes.
    ```sh
    stow -vSt ~ bash
    stow -vSt ~ zsh
    stow -vSt ~ nvim
    stow -vSt ~ alacritty
    stow -vSt ~ user-dirs
    ```

### Push the stowed dotfiles to the remote repository
```sh
cd ~/dotfiles
git status -u
git add -A
git commit -m "initial commit of tracked dotfiles and put instructions in README.md"
git log
git push
```

---

## Instructions for unstowing or deleting the symlinks
```sh
cd ~/dotfiles
stow -vDt ~ bash
stow -vDt ~ zsh
stow -vDt ~ nvim
stow -vDt ~ alacritty
stow -vDt ~ user-dirs
```
Note: Use `-n` to do a dry-run.

---
