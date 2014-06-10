#!/bin/sh

# Bootstrap file for Rails projects (courtesy of vrde, https://github.com/vrde)

# Setup some variables needed for bootstrapping the environment
ROOT=/home/cmass/<path_to_proj>
REPOS=${ROOT}/src

# Bootstrap a new session called "proj"
tmux new-session     -d -s proj


# Rename the first window (using the session-name:id notation)
tmux rename-window      -t proj:0 "dev"


# Create and label three other windows, splitting the last one horizontally
tmux new-window         -t proj:1 -n "server"
tmux new-window         -t proj:2 -n "console"
tmux new-window         -t proj:3 -n "git"
#tmux split-window    -h -t proj:3 

# Send commands to the windows, use "C-m" to emulate "enter"

# On window 1, Start the virtualenv and run Rails app server of choice.
tmux send-keys          -t proj:1 "cd ${REPOS}" C-m
tmux send-keys          -t proj:1 "rails s" C-m

# On window 2, move to the directory with the source code for the client, and start Vim
tmux send-keys          -t proj:1 "cd ${REPOS}" C-m
tmux send-keys          -t proj:2 "rails c" C-m

# On window 3 setup Git. On the left launch an alias to watch the current tree, while...
#tmux send-keys          -t proj:3.left "cd ${REPOS}" C-m
#tmux send-keys          -t proj:3.left "git watchtree" C-m
# on the right keep a shell to interact with Git
tmux send-keys          -t proj:3 "cd ${REPOS}" C-m
tmux send-keys          -t proj:3 "git status" C-m


# Switch to window 0
tmux select-window -t proj:0

# Force tmux to assume the terminal supports 256 colors and attach to the target session "proj"
tmux -2 attach-session -t proj
