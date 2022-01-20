#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."

  # Install the correct homebrew for each OS type
  if test "$(uname)" = "Darwin"
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  elif test "$(expr substr $(uname -s) 1 5)" = "Linux"
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/jpslewis/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"

  brew analytics off

  brew install git
  brew install fish

  brew install --cask iterm2
  brew install  --cask rectangle
  brew install  --cask gpg-suite # For signed commits; for instructions, see: https://help.github.com/en/articles/generating-a-new-gpg-key
  brew install --cask mullvadvpn
  brew install --cask postman

  brew tap homebrew/cask-fonts
  brew install --cask font-juliamono
  brew install --cask font-menlo-for-powerline

  brew install shellcheck
  
  brew install zoxide
  brew install starship


fi

exit 0
