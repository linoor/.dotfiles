# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/mpomaran/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# alias deploy-local="ansible-playbook -i local/inventory local.yml --vault-password-file ~/.ansible_vault_password"
alias deploy-integr="ansible-playbook -i integration/inventory integration.yml --vault-password-file ~/.ansible_vault_password"
alias package-without-tests="mvn clean package -DskipTests"
alias clean-and-build='bash -c "mvn package -DskipTests=true && mvn nova:deb -pl sae-dropwizard -amd -DskipTests=true"'

# fish like autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


# PeopleDoc

deploy() {
  if ls | grep ansible; then
    echo "changing directory to ansible..."
    cd ansible    
  fi

  ENV=$1

  # ask for sudo password
  if [ $EUID != 0 ]; then
    sudo "$0" "$@"
  fi

  CMD="ansible-playbook -i $ENV/inventory $ENV.yml --vault-password-file ~/.ansible_vault_password"
  echo $CMD
  eval $CMD
}

echo_step() {
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
  echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
  echo "$1"
  echo "*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*"
  echo ""
  echo ""
  echo ""
  echo ""
  echo ""
}

run-integration-tests() {
  CURRENT_DIR=$(basename "$PWD")

  case "$1" in
    install)
        echo_step "running mvn install"
        mvn install -DskipTests
        ;;
  esac

  # change directory
  if [[ $CURRENT_DIR != *"behaviour"* ]]; then
    echo_step "changing directory to behaviour tests dir"
    cd "${CURRENT_DIR}_behaviour_test"
  fi

  CMD="mvn integration-test -P lxc-staging"
  echo_step $CMD
  eval $CMD
}

alias org-current="emacsclient -ne '(make-orgcapture-frame)'"
