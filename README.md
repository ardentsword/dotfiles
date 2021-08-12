# Dotfiles
To make the files simlinks use

```
stow <folder>
```

For example:

```
stow bash
```

To solve all conflicts: (this will backup all conflicted files to file.back, to delete instead of backup simply uncomment the rm line and comment the mv line)

```
./solve-stow.sh <folder>
```

# Documentation
[Overview](docs/readme.md)