#!/bin/bash

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

# [VIRTUALENV INSTALLATION]
if ! which virtualenv; then
    echo 'Installing virtualenv, this will only be required the first time'
    python -m pip install --user virtualenv
fi
# [VIRTUALENV INSTALLATION END]

# [GIT INSTALLATION]
if ! which git; then
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
echo $'\n# [BASH GIT PROMPT SECTION]' >> ~/.bash_profile
echo 'GIT_PROMPT_ONLY_IN_REPO=1' >> ~/.bash_profile
echo 'source $HOME/.bash-git-prompt/gitprompt.sh'  >> ~/.bash_profile
echo $'# [BASH GIT PROMPT SECTION END]\n' >> ~/.bash_profile
# [BASH GIT PROMPT SECTION END]

# [COPY BINARIES]
cp -r ./bin ~/
chmod -R +x .
# [COPY BINARIES END]


# [ADD PATHs]
echo 'PATH=$PATH:$HOME/bin' >> ~/.bash_profile
# [ADD PATHs END]

# [LOAD ALIASES]
echo 'source ~/.bash_aliases' >> ~/.bash_profile
# [LOAD ALIASES END]

# [LOAD SCRIPTS]
echo 'source ~/.bash_scripts' >> ~/.bash_profile
# [LOAD SCRIPTS END]
