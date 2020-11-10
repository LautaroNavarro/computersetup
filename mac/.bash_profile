# [BREW INSTALLATION]

if ! which brew; then
    echo 'Installing brew, this will only be required the first time'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

# [BREW INSTALLATION END]


# [SUBLIME TEXT INSTALLATION]

if ! which subl; then
    echo 'Installing sublime text, this will only be required the first time'
    brew cask install sublime-text
fi

# [SUBLIME TEXT INSTALLATION END]

# [GIT INSTALLATION]

if ! which subl; then
    echo 'Installing git, this will only be required the first time'
    brew install git
fi

# [GIT INSTALLATION END]


# [BASH GIT PROMPT SECTION]
# This snippet will give us git information when bash open in git repository
# More information: https://github.com/magicmonty/bash-git-prompt

if [ ! -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi

GIT_PROMPT_ONLY_IN_REPO=1
source $HOME/.bash-git-prompt/gitprompt.sh

# [BASH GIT PROMPT SECTION END]


# [ADD PATHs]

PATH=$PATH:$HOME/bin

# [ADD PATHs END]

# [LOAD ALIASES]

source ~/.bash_aliases

# [LOAD ALIASES END]

# [LOAD SCRIPTS]

source ~/.bash_scripts

# [LOAD SCRIPTS END]
