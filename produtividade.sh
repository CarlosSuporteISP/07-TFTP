apt-get install vim bash-completion fzf grc -y

echo '' >> /etc/bash.bashrc
echo '# Autocompletar extra' >> /etc/bash.bashrc
echo 'if ! shopt -oq posix; then' >> /etc/bash.bashrc
echo '  if [ -f /usr/share/bash-completion/bash_completion ]; then' >> /etc/bash.bashrc
echo '    . /usr/share/bash-completion/bash_completion' >> /etc/bash.bashrc
echo '  elif [ -f /etc/bash_completion ]; then' >> /etc/bash.bashrc
echo '    . /etc/bash_completion' >> /etc/bash.bashrc
echo '  fi' >> /etc/bash.bashrc
echo 'fi' >> /etc/bash.bashrc
sed -i 's/"syntax on/syntax on/' /etc/vim/vimrc
sed -i 's/"set background=dark/set background=dark/' /etc/vim/vimrc
cat <<EOF >/root/.vimrc
set showmatch " Mostrar colchetes correspondentes
set ts=4 " Ajuste tab
set sts=4 " Ajuste tab
set sw=4 " Ajuste tab
set autoindent " Ajuste tab
set smartindent " Ajuste tab
set smarttab " Ajuste tab
set expandtab " Ajuste tab
set number " Mostra numero da linhas
EOF
sed -i "s/# export LS_OPTIONS='--color=auto'/export LS_OPTIONS='--color=auto'/" /root/.bashrc
sed -i 's/# eval "`dircolors`"/eval "`dircolors`"/' /root/.bashrc
#sed -i 's/# eval "$(dircolors)"/eval "$(dircolors)"/' /root/.bashrc
sed -i "s/# alias ls='ls \$LS_OPTIONS'/alias ls='ls \$LS_OPTIONS'/" /root/.bashrc
sed -i "s/# alias ll='ls \$LS_OPTIONS -l'/alias ll='ls \$LS_OPTIONS -l'/" /root/.bashrc
sed -i "s/# alias l='ls \$LS_OPTIONS -lA'/alias l='ls \$LS_OPTIONS -lha'/" /root/.bashrc
echo '# Para usar o fzf use: CTRL+R' >> ~/.bashrc
#echo 'source /usr/share/doc/fzf/examples/key-bindings.bash' >> ~/.bashrc
echo "alias grep='grep --color'" >> /root/.bashrc
echo "alias egrep='egrep --color'" >> /root/.bashrc
echo "alias ip='ip -c'" >> /root/.bashrc
echo "alias diff='diff --color'" >> /root/.bashrc
echo "alias tail='grc tail'" >> /root/.bashrc
echo "alias ping='grc ping'" >> /root/.bashrc
echo "alias ps='grc ps'" >> /root/.bashrc
echo "PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;31m\]\u\[\033[01;34m\]@\[\033[01;33m\]\h\[\033[01;34m\][\[\033[00m\]\[\033[01;37m\]\w\[\033[01;34m\]]\[\033[01;31m\]\\$\[\033[00m\] '" >> /root/.bashrc
su -