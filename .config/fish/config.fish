if status is-interactive
	# Commands to run in interactive sessions can go here
	neofetch
end

set -x GOPATH $HOME/go
set -x GOROOT /usr/lib/go
set -x PATH $PATH $GOPATH
set -x PATH $PATH $GOROOT/bin $GOPATH/bin

function vim
	nvim $argv
end

function vi
	nvim $argv
end
