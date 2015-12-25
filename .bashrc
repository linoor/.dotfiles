eval $(thefuck --alias)

alias olyaphoto=~/copy-olya.sh

alias gim="git commit -m"
alias gap="git add -p"

export ibisnet="pomaranski_m@spk-ssh.if.uj.edu.pl"
alias conibisnet="SSHPASS=301480732 sshpass -e ssh $ibisnet"

function jobsdone() {
	paplay ~/warcraft_sounds/$(ls ~/warcraft_sounds | sort -R | tail -1)
}
alias jd=jobsdone

export TERM=xterm-256color

export HISTFILESIZE=
export HISTSIZE=

alias emacs="emacs -nw"

alias cabal="cabal-1.22"

alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
