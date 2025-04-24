#!/bin/sh -e

brew install node
brew install dotnet-sdk
brew install powershell

brew install --cask cleanshot

# caps_lock -> escape mapping - needed for some Mac keyboard at some point?
brew install karabiner-elements

# for some reason this didn't work for me, had to install manually
#brew install homebrew/cask/docker
# enable Rosetta in Docker Desktop settings manually


# The app currently targets framework version 6, which has no official, programmatic installation method.
# So either install it manually (download and run an installer) or do this to install it unofficially
brew tap isen-ng/dotnet-sdk-versions
brew install dotnet-sdk6-0-400
brew install duckdb
brew install llm

brew install visual-studio-code
brew install azure-data-studio
brew install foreman

brew install microsoft-teams
brew install microsoft-word
brew install microsoft-excel

# todo - is the browser version good enough?
#brew install 1password

"/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" --install-extension vscodevim.vim
"/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" --install-extension ms-dotnettools.csharp

# needed for full SQL
softwareupdate --install-rosetta
docker create --name sqlserver --platform linux/amd64 -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Password123!' -p 1433:1433 mcr.microsoft.com/mssql/server:2022-latest
