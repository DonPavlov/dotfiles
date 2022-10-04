set -x PATH $PATH /usr/bin
set -x PATH $PATH /sbin/
# set -x PATH $PATH /home/paul/Skripte
set -x LANG "de_DE.UTF-8"

#add rust tools
set -x PATH $PATH /home/paul/.cargo/bin

#correct behavior for ssh agent
eval 'ssh-agent -s'

ssh-add ~/.ssh/git_ed25519
ssh-add ~/.ssh/pi4key
ssh-add ~/.ssh/ryzen2nas
ssh-add ~/.ssh/id_ed25519

clear

alias g "googler -n 7 -l DE"

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

thefuck --alias | source