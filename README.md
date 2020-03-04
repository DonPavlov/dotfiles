    ██████╗  ██████╗ ████████╗███████╗██╗██╗     ███████╗███████╗
    ██╔══██╗██╔═══██╗╚══██╔══╝██╔════╝██║██║     ██╔════╝██╔════╝
    ██║  ██║██║   ██║   ██║   █████╗  ██║██║     █████╗  ███████╗
    ██║  ██║██║   ██║   ██║   ██╔══╝  ██║██║     ██╔══╝  ╚════██║
    ██████╔╝╚██████╔╝   ██║   ██║     ██║███████╗███████╗███████║
    ╚═════╝  ╚═════╝    ╚═╝   ╚═╝     ╚═╝╚══════╝╚══════╝╚══════╝
                                                             

My private dotfiles. Not to be openly shared.

## table of contents
 - [introduction](#dotfiles)
 - [managing](#managing)
 - [installing](#installing)
 - [how it works](#how-it-works)
 - [tl;dr](#tldr)

# dotfiles
in the unix world programs are commonly configured in two different ways, via shell arguments or text based configuration files. programs with many options like window managers or text editors are configured on a per-user basis with files in your home directory `~`. in unix like operating systems any file or directory name that starts with a period or full stop character is considered hidden, and in a default view will not be displayed. thus the name dotfiles.

it's been said of every console user:
> _"you are your dotfiles"_.

since they dictate how your system will look and function. to many users (see [ricers](http://unixporn.net) and [beaners](http://nixers.net)) these files are very important, and need to be backed up and shared. The easiest way is the following.

# managing
i manage mine with [gnu stow](http://www.gnu.org/software/stow/), a free, portable, lightweight symlink farm manager. this allows me to keep a versioned directory of all my config files that are virtually linked into place via a single command. this makes sharing these files among many users (root) and computers super simple. and does not clutter your home directory with version control files.

# installing
stow is available for all linux and most other unix like distributions via your package manager.

- `sudo pacman -S stow`
- `sudo apt-get install stow`
- `brew install stow`

or clone it [from source](https://savannah.gnu.org/git/?group=stow) and [build it](http://git.savannah.gnu.org/cgit/stow.git/tree/INSTALL) yourself.

# how it works
by default the stow command will create symlinks for files in the parent directory of where you execute the command. so my dotfiles setup assumes this repo is located in the root of your home directory `~/dotfiles`. and all stow commands should be executed in that directory. otherwise you'll need to use the `-d` flag with the repo directory location.

to install most of my configs you execute the stow command with the folder name as the only argument.

to install my **i3 config** use the command:

`stow i3`

this will symlink files to `~/.config/i3/` and various other places.

But you can override the default behavior add symlink files to another location with the `-t` (target) argument flag.

to install the **connman config** you need to execute the command:

`sudo stow -t / connman`

this will symlink the file to `/etc/connman`.

# tl;dr
navigate to your home directory

`cd ~`

clone the repo:

`git clone git@github.com:DonPavlov/dotfiles.git`

enter the dotfiles directory

`cd dotfiles`

install the fish settings

`stow fish`

install fish settings for the root user

`sudo stow fish -t /root`

install connman (for i3)

`stow connman`

uninstall connman (for i3)

`stow -D connman`

install i3

`stow i3`

etc, etc, etc...

Add a new thing by creating a folder in dotfiles directory and create the original structure, move the config file over into your dotfiles directory and `stow newthing`

sync it with git

`git add .`
`git commit -m " commit"`
`git push`
