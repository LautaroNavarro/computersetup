#!/bin/bash

# [BREW INSTALLATION]
if ! which brew; then
    echo '[DEBUG] Installing brew'
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi
# [BREW INSTALLATION END]

# [SUBLIME TEXT INSTALLATION]
if ! which subl; then
    echo '[DEBUG] Installing sublime text'
    brew cask install sublime-text
fi
# [SUBLIME TEXT INSTALLATION END]

# [VIRTUALENV INSTALLATION]
if ! which virtualenv; then
    echo '[DEBUG] Installing virtualenv'
    python -m pip install --user virtualenv
fi
# [VIRTUALENV INSTALLATION END]

# [GIT INSTALLATION]
if ! which git; then
    echo '[DEBUG] Installing git'
    brew install git
fi
# [GIT INSTALLATION END]

# [BASH GIT PROMPT SECTION]
# This snippet will give us git information when bash open in git repository
# More information: https://github.com/magicmonty/bash-git-prompt
echo "[DEBUG] Installing bash git prompt"
if [ ! -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
fi
echo $'\n# [BASH GIT PROMPT SECTION]' >> ~/.bash_profile
echo 'GIT_PROMPT_ONLY_IN_REPO=1' >> ~/.bash_profile
echo 'source $HOME/.bash-git-prompt/gitprompt.sh'  >> ~/.bash_profile
echo $'# [BASH GIT PROMPT SECTION END]\n' >> ~/.bash_profile
# [BASH GIT PROMPT SECTION END]

# [COPY BINARIES]
echo "[DEBUG] Copying binaries"
cp -r ./bin ~/
chmod -R +x .
# [COPY BINARIES END]

# [CONFIGURE GITHUB]
echo "[DEBUG] Configuring github"
cp ./.gitconfig ./.personal.gitconfig ./.company.gitconfig ~/
echo '[INFO] Make sure you fill your .company.gitconfig file'
# [CONFIGURE GITHUB END]

# [ADD PATHs]
echo "[DEBUG] Adding ~/bin to PATH"
echo 'PATH=$PATH:$HOME/bin' >> ~/.bash_profile
# [ADD PATHs END]

# [LOAD ALIASES]
echo "[DEBUG] Loading aliases"
cp ./bash_aliases ~/.bash_aliases
echo 'source ~/.bash_aliases' >> ~/.bash_profile
# [LOAD ALIASES END]

# [LOAD SCRIPTS]
echo "[DEBUG] Loading scripts"
cp ./bash_scripts ~/.bash_scripts
echo 'source ~/.bash_scripts' >> ~/.bash_profile
# [LOAD SCRIPTS END]
