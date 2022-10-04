set -x PATH $PATH /usr/bin
set -x PATH $PATH /sbin/
set -x PATH $PATH /home/paul/Skripte
set -x LANG "de_DE.UTF-8"

#correct behavior for ssh agent
eval 'ssh-agent -s'

ssh-add ~/.ssh/id_rsa

alias g "googler -n 7 -l DE"

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end
