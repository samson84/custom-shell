# Custom shell env

This config describes my custom zsh shell environment. 
I just wanted to make my life easier, but I'm sharing because you can find
some ideas, snippets from it. It is not intended to use as a stable, fully portable
solution.

Tested and used on Linux Mint.

It uses [zi](https://wiki.zshell.dev/) with a [powerlevel 10k](https://github.com/romkatv/powerlevel10k) 
zsh theme with some custom alias, and custom helper commands.

## Install

Backup your `~/.zshrc` and `~/.p10k.zsh` files if exist in your home dir.

Check out the repo to a custom dir, e.g. to `custom-shell-dir` in your home dir:

`git clone https://github.com/samson84/custom-shell.git ~/custom-shell-dir`

Run and/or check the `./install-dependencies.sh` which add some basic APT ubuntu
dependencies. These stuff most probably installed to your system. 
`sudo` is needed for this command

Install `.p10k.zsh` config file to your home dir with `./install-p10k.zsh`. 
Do not use `sudo`.

Source the repo's `.zshrc` file to your semi empty* `~/.zshrc`. 

```bash
# top of your ~/.zshrc
source <custom_dir_where_chedked_out>/.zshrc

# ... other settings
```

### Semi empty .zshrc

This config uses `zi` and the `powerlevel 10k` theme. If you have a heavily configured
zsh shell with different frameworks or plugin managers, they can be conflict with this
config. So just add basic aliases, paths etc... to your zsh config before loading this.

### Using custom p10k config

You can configure anytime the p10k with `p10k configure`. Simply do not save the
changes to your `.zshrc` at the end of the config wizard.

### Changing the default terminal to zsh

`chsh -s /bin/zsh`

### Adding fonts manually

Theoretically, the zi config installs the needed fonts, if something is not working
install them manually from here.

https://github.com/romkatv/powerlevel10k#fonts

## Usage

- At the first invocation of the `.zshrc` (sourcing it, or opening a new terminal window)
it installs the needed dependencies, plugins with [zi](https://wiki.zshell.dev/) dependency manager.

- The `ls` is aliased to [lsd](https://github.com/Peltoche/lsd), `cat` and `less` to [bat](https://github.com/sharkdp/bat).

- It uses [fzf](https://github.com/junegunn/fzf) for autocompletion and history search.

- Also a fish like [syntax highlighter](https://github.com/zsh-users/zsh-syntax-highlighting) and [auto suggestion](https://github.com/zsh-users/zsh-autosuggestions) [OMZ](https://ohmyz.sh/) plugin is added to it.

- It uses [zsh-z](https://github.com/agkozak/zsh-z) (aliased to `j`) for dir autojump.

- Some custom aliases is added to `docker`, `docker compose`, `git`, `tar` and `nodejs`.

- and of course it contains the usual git plugin
