# Bash profile

add to `~/.bash_aliases` (recommended),
else to `~/.bash_profile` or `~/.profile`

```shell script
(echo "" > ~/.bash_aliases) && nano ~/.bash_aliases
```

###### default ubuntu `.bashrc` may be found at `/etc/skel/.bashrc`

```shell script
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
alias git-log='git log'
alias git-log-16='git-log -16'
alias git-log-oneline='git log --date=short --pretty=format:"%C(auto,yellow)%h %C(auto,blue)%>(12,trunc)%ad %C(auto,green)%<(7,trunc)%aN%C(auto,reset)%s%C(auto,red)% gD% D"'
alias git-log-oneline-16='git-log-oneline -16'
alias git-log-graph='git log --graph --oneline'
alias git-log-graph-16='git-log-graph -16'

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
alias GL=git-log
alias GL16=git-log-16
alias GLO=git-log-oneline
alias GLO16=git-log-oneline-16
alias GLG=git-log-graph
alias GLG16=git-log-graph-16

# =============================
# apt aliases (A*)
alias apt-list-installed='sudo apt list --installed'
alias apt-update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y --purge'
  
alias AL=apt-list-installed
alias AU=apt-update

# =============================
# system aliases (S*)
alias system-reboot-required='sudo ls /var/run/reboot-required'
alias system-queue-reboot-4am='echo "sudo reboot" | sudo at 4am'

alias SRR=system-reboot-required
alias SQR4AM=system-queue-reboot-4am

## sudo at -l           # list pending job
## sudo at -c <jobId>   # print job command

# =============================
# systemd aliases (SD*)
alias systemd-list-active='sudo systemctl list-units --type=service --state=active'
alias systemd-list-enabled='sudo systemctl list-unit-files --type=service --state=enabled,generated'
alias systemd-daemon-reload='sudo systemctl daemon-reload'
alias systemd-start='sudo systemctl start'
alias systemd-stop='sudo systemctl stop'
alias systemd-status='sudo systemctl status'
alias systemd-enable='sudo systemctl enable'
alias systemd-disable='sudo systemctl disable'
alias systemd-restart='sudo systemctl restart'
alias systemd-reload='sudo systemctl reload'

alias SDLA=systemd-list-active
alias SDLE=systemd-list-enabled
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
alias npm-install-host-puppeteer='PUPPETEER_DOWNLOAD_HOST=https://npm.taobao.org/mirrors npm i'
alias npm-outdated='npm out'
alias npm-dedup-install='npm ddp && npm i --prefer-offline'

alias NLSG=npm-list-global
alias NI=npm-install
alias NIG=npm-install-global
alias NIO=npm-install-prefer-offline
alias NIHP=npm-install-host-puppeteer
alias NO=npm-outdated
alias NDI=npm-dedup-install

# =============================
# screen aliases (S*)
alias screen-resume='screen -R'
alias screen-list='screen -ls'

alias SR=screen-resume
alias SL=screen-list

# =============================
# quick path alias (C*)
PATH_GIT_ROOT_LIST="Git/ GitHub/ Documents/Git/ Documents/GitHub/" # list to search
PATH_GIT_ROOT=""
for path in ${PATH_GIT_ROOT_LIST}; do
  path="${HOME}/${path}"
  # echo ${path}
  # test -d "${path}" && echo FOUND: ${path}
  test -d "${path}" && PATH_GIT_ROOT="${path}"
done

alias cd-git="cd ${PATH_GIT_ROOT}"
alias cd-shadowsocks="cd /etc/shadowsocks-libev/"
alias cd-nginx="cd /etc/nginx/"
alias cd-systemd="cd /lib/systemd/system/"

alias CG=cd-git
alias CSS=cd-shadowsocks
alias CN=cd-nginx
alias CSD=cd-systemd

# =============================
# proxy alias (P*)
# (ALL_PROXY is for git)
PROXY_SOCK5="socks5://127.0.0.1:1080"
PROXY_HTTP="http://127.0.0.1:1080"

# PROXY_SOCK5="socks5://127.0.0.1:8118" # with privoxy
# PROXY_HTTP="http://127.0.0.1:8118" # with privoxy

alias proxy-on="export \
  ALL_PROXY=${PROXY_SOCK5}/ \
  http_proxy=${PROXY_HTTP}/ \
  https_proxy=${PROXY_HTTP}/ \
  HTTP_PROXY=${PROXY_HTTP}/ \
  HTTPS_PROXY=${PROXY_HTTP}/"
alias proxy-off="unset \
  ALL_PROXY \
  http_proxy \
  https_proxy \
  HTTP_PROXY \
  HTTPS_PROXY"
alias proxy-once=" \
  ALL_PROXY=${PROXY_SOCK5}/ \
  http_proxy=${PROXY_HTTP}/ \
  https_proxy=${PROXY_HTTP}/ \
  HTTP_PROXY=${PROXY_HTTP}/ \
  HTTPS_PROXY=${PROXY_HTTP}/"

alias PON=proxy-on
alias POFF=proxy-off
alias P1=proxy-once
```