# setup with:
#   (echo "" > ~/.bash_aliases_extend) && nano ~/.bash_aliases_extend # reset the file and open for edit
# then add to `~/.bashrc`
#   [[ -f ~/.bash_aliases_extend ]] && . ~/.bash_aliases_extend

# =============================
# mark version
alias bash-aliases-extend-version='echo 0.2.2'

alias BAEV=bash-aliases-extend-version

# =============================
# ls aliases (l*)
alias llh='ls -ahlF'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# =============================
# screen clear aliases, should be supported in xterm/VT100
alias CLS="clear && printf '\e[3J'"

# =============================
# cd aliases (c*)
alias cb='cd ../'
alias cbb='cd ../../'
alias cbbb='cd ../../../'
alias cbbbb='cd ../../../../'

# =============================
# git aliases (G*)
alias git-fetch='git fetch'
alias git-git-combo='git fetch --prune' # no `--prune-tags`
alias git-git-git-combo='git fetch --prune && git gc --auto'
alias git-git-git-git-combo='git fetch --prune && git gc --prune=now'
alias git-status='git status'
alias git-push='git push'
alias git-reset-hard='git reset --hard @{upstream}'
alias git-git-reset-head='git-git-combo && git-reset-hard'
alias git-branch-delete='git branch -D'
alias git-branch-checkout='git checkout -B'
function git-cherry-pack-range { git cherry-pick "$1"^.."$2" ; } # $1=commit-from, $1=commit-to # will include both from/to commit
alias git-cherry-pack-abort='git cherry-pick --abort'
alias git-cherry-pack-continue='git cherry-pick --continue'
alias git-clear='git remote prune origin && git gc --prune=now'
alias git-tag-clear-local='git tag -d $(git tag -l)'
alias git-ls-files-stage='git ls-files --stage'
alias git-update-644='git update-index --chmod=-x'
alias git-update-755='git update-index --chmod=+x'
alias git-log='git log'
alias git-log-16='git-log -16'
alias git-log-oneline='git log --date=short --pretty=format:"%C(auto,yellow)%h %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(7,trunc)%aN%C(auto,reset)%s%C(auto,red)% gD% D"'
alias git-log-oneline-16='git-log-oneline -16'
alias git-log-graph='git log --graph --oneline'
alias git-log-graph-16='git-log-graph -16'
alias git-trace='GIT_TRACE=1'

alias G=git-fetch
alias GG=git-git-combo
alias GGG=git-git-git-combo
alias GGGG=git-git-git-git-combo
alias GS=git-status
alias GP=git-push
alias GRH=git-reset-hard
alias GGRH=git-git-reset-head
alias GBD=git-branch-delete
alias GBC=git-branch-checkout
alias GCPR=git-cherry-pack-range
alias GCPA=git-cherry-pack-abort
alias GCPC=git-cherry-pack-continue
alias GC=git-clear
alias GTCL=git-tag-clear-local
alias GLS=git-ls-files-stage
alias G644=git-update-644
alias G755=git-update-755
alias GL=git-log
alias GL16=git-log-16
alias GLO=git-log-oneline
alias GLO16=git-log-oneline-16
alias GLG=git-log-graph
alias GLG16=git-log-graph-16
alias GT=git-trace

# =============================
# systemd aliases (SD*)
alias systemd-list-active='sudo systemctl list-units --type=service --state=active'
alias systemd-list-enabled='sudo systemctl list-unit-files --type=service --state=enabled,generated'
alias systemd-list-timers='sudo systemctl list-timers'
alias systemd-daemon-reload='sudo systemctl daemon-reload'
alias systemd-start='sudo systemctl start'
alias systemd-stop='sudo systemctl stop'
alias systemd-status='sudo systemctl status'
alias systemd-enable='sudo systemctl enable'
alias systemd-disable='sudo systemctl disable'
alias systemd-restart='sudo systemctl restart'
alias systemd-reload='sudo systemctl reload'
# TODO: add reset failed from: https://serverfault.com/questions/606520/how-to-remove-missing-systemd-units

alias SDLA=systemd-list-active
alias SDLE=systemd-list-enabled
alias SDLT=systemd-list-timers
alias SDDR=systemd-daemon-reload
alias SDON=systemd-start
alias SDOFF=systemd-stop
alias SDS=systemd-status
alias SDE=systemd-enable
alias SDD=systemd-disable
alias SDRS=systemd-restart
alias SDRL=systemd-reload

# =============================
# npm aliases (N*)
alias npm-list-global='npm ls -g --depth=0'
alias npm-install='npm i'
alias npm-install-global='sudo npm i -g'
alias npm-install-prefer-offline='npm i --prefer-offline'
alias npm-install-package-lock-only='npm i --package-lock-only'
alias npm-outdated='npm out'
alias npm-dedup-install='npm ddp && npm i --prefer-offline'
alias npm-audit='npm audit'
alias npm-audit-fix='npm audit fix'

alias NLSG=npm-list-global
alias NI=npm-install
alias NIG=npm-install-global
alias NIO=npm-install-prefer-offline
alias NIPLO=npm-install-package-lock-only
alias NO=npm-outdated
alias NDI=npm-dedup-install
alias NA=npm-audit
alias NAF=npm-audit-fix

# =============================
# screen aliases (S*)
alias screen-resume='screen -R'
alias screen-list='screen -ls'

alias SR=screen-resume
alias SL=screen-list

# =============================
# nano aliases (NN*)
function nano-reset { (echo "" > "$1") ; nano "$1" ; } # $1=file-to-reset-and-edit

alias NNR=nano-reset

# =============================
# @dr-js aliases (D*)
alias dr-js-npm-install-global-all='sudo npm i -g @dr-js/core @dr-js/node @dr-js/dev'
alias dr-js-npm-install-global-all-dev='sudo npm i -g @dr-js/core@dev @dr-js/node@dev @dr-js/dev@dev'
alias dr-js-package-reset='dr-js --rm package-lock.json node_modules'

alias DNIGA=dr-js-npm-install-global-all
alias DNIGAD=dr-js-npm-install-global-all-dev
alias DPR=dr-js-package-reset

# =============================
# quick path alias (C*)
PATH_GIT_ROOT_LIST="Git/ GitHub/ Documents/Git/ Documents/GitHub/" # list to search
PATH_GIT_ROOT=""
for path in ${PATH_GIT_ROOT_LIST}; do
  [[ -d "${HOME}/${path}" ]] && PATH_GIT_ROOT="${HOME}/${path}"
done

alias cd-git="cd ${PATH_GIT_ROOT}"
alias cd-log="cd /var/log/"
alias cd-systemd="cd /lib/systemd/system/"
alias cd-nginx="cd /etc/nginx/"

alias CG=cd-git
alias CL=cd-log
alias CSD=cd-systemd
alias CN=cd-nginx

# =============================
# proxy alias (PX*)
PROXY_SOCKS5="socks5://127.0.0.1:$(node -e "process.exitCode = Number(os.platform() === 'win32')" && echo "1081" || echo "1080")" # win10 SS have auto redirect
PROXY_HTTP="http://127.0.0.1:1080"

alias proxy-on="export \
  http_proxy=${PROXY_HTTP} \
  https_proxy=${PROXY_HTTP} \
  HTTP_PROXY=${PROXY_HTTP} \
  HTTPS_PROXY=${PROXY_HTTP} \
"
alias proxy-off="unset \
  http_proxy \
  https_proxy \
  HTTP_PROXY \
  HTTPS_PROXY \
"
alias proxy-once=" \
  http_proxy=${PROXY_HTTP} \
  https_proxy=${PROXY_HTTP} \
  HTTP_PROXY=${PROXY_HTTP} \
  HTTPS_PROXY=${PROXY_HTTP} \
"

alias PXON=proxy-on
alias PXOFF=proxy-off
alias PX1=proxy-once
