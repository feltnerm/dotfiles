# vim: set ft=sh

function brewski
    brew update; and brew upgrade; brew cleanup; brew cask cleanup; brew doctor
end
