# How to dump and load gnome terminal profiles

## dump
```sh
dconf dump /org/gnome/terminal/ >~/dotfiles/gnome-terminal/profiles
```

## load
```sh
cat ~/dotfiles/gnome-terminal/profiles | dconf load /org/gnome/terminal/
```
