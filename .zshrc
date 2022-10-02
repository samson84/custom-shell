# Powerlvel10k  theme instant load if installed
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ZSH history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# zsh options
setopt autocd extendedglob notify correctall nomatch globdots

# Install and setup Zi
if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
zicompinit # <- https://wiki.zshell.dev/docs/guides/commands
zi light-mode for z-shell/z-a-meta-plugins @annexes

# Powerlevel10k
# fonts
zi ice if"[[ -d ${HOME}/.fonts/ttf ]] && [[ $OSTYPE = linux* ]]" \
  id-as"meslo" from"gh-r" bpick"Meslo.zip" extract nocompile depth"1" \
  atclone="rm -f *Windows*; mv -vf *.ttf ${HOME}/.fonts/ttf/; fc-cache -v -f" atpull"%atclone"
zi light ryanoasis/nerd-fonts
# plugin, configured
zi ice depth'1' atload"[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" nocd
zi light romkatv/powerlevel10k

zi ice from'gh-r' as'program' mv'lsd* lsd' sbin'**/lsd -> lsd'
zi light Peltoche/lsd

zi ice from'gh-r' as'program' mv'bat* bat' sbin'**/bat(.exe|) -> bat'
zi light @sharkdp/bat

zi ice from'gh-r' as'program'
zi light junegunn/fzf

zi wait lucid for \
  OMZ::plugins/git/git.plugin.zsh \
  OMZP::colored-man-pages \
  zsh-users/zsh-autosuggestions \
  Aloxaf/fzf-tab \
  joshskidmore/zsh-fzf-history-search \
  agkozak/zsh-z \
  zsh-users/zsh-syntax-highlighting

# Settings for zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Settings for zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"

# aliases

# Unzipping
alias untar='tar –-extract --verbose --gzip'

# LSD aliasses
alias ls='lsd --group-dirs first'
alias ll='ls -l -a'
alias tree='lsd --tree'

# Bat aliases
alias bat='bat --theme=1337 --style=auto'
alias cat='bat --pager=never --plain' 
alias less='bat'

# Gt Aliases
alias go="git checkout"
alias plog="git log --graph --pretty='format:%C(red)%d%C(reset) %C(yellow)%h%C(reset) %ar %C(green)%aN%C(reset) %s'"
alias tlog="git log --stat --since='1 Day Ago' --graph --pretty=oneline --abbrev-commit --date=relative"
alias lg="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

#Color aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

#node js aliases
alias node_modules_ls="find . -name 'node_modules' -type d -prune"
alias node_modules_rm="find . -name 'node_modules' -type d -prune -exec rm -rf '{}' +"

#docker and docker compose aliases
alias d="docker"
alias dcm="docker compose"
alias dcmb="docker compose build"
alias dcmr="docker compose run"
alias dcml="docker compose logs --follow --tail 100"
alias dcmu="docker compuse up"
alias dcmd="docker compose down"
