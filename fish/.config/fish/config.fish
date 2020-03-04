set -x PATH $PATH /usr/bin
set -x PATH $PATH /sbin/
set -x PATH $PATH /home/paul/Skripte
set -x LANG "de_DE.UTF-8"

#correct behavior for ssh agent
eval 'ssh-agent -s'

ssh-add ~/.ssh/id_rsa
ssh-add ~/.ssh/git_ed25519
ssh-add ~/.ssh/hetzneruser_priv
ssh-add ~/.ssh/id_ed25519
ssh-add ~/.ssh/pi_buntu

clear

alias g "googler -n 7 -l DE"

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
