#!/bin/sh

# Bootstrap file for Rails projects (courtesy of vrde, https://github.com/vrde)

# Setup some variables needed for bootstrapping the environment
ROOT=/home/cmass/<path_to_proj>
REPOS=${ROOT}/src

# Bootstrap a new session called "proj"
tmux new-session     -d -s proj

# Rename the first window (using the session-name:id notation)
tmux rename-window      -t proj:0 "dev"

# Create and label three other windows
tmux new-window         -t proj:1 -n "server"
tmux new-window         -t proj:2 -n "console"
tmux new-window         -t proj:3 -n "git"
#tmux split-window    -h -t proj:3 

# Send commands to the windows, use "C-m" to emulate "enter"

# start teh vim!!1!
tmux send-keys          -t proj:0 "cd ${REPOS}" C-m
tmux send-keys          -t proj:0 "vim" C-m

# On window 1, load env via RVM and start Rails app server of choice.
tmux send-keys          -t proj:1 "cd ${REPOS}" C-m
tmux send-keys          -t proj:1 "rails s" C-m

# On window 2, load env via RVM and start Rails app interactive console
tmux send-keys          -t proj:1 "cd ${REPOS}" C-m
tmux send-keys          -t proj:2 "rails c" C-m

# Window 3 is dedicated to git.
#tmux send-keys          -t proj:3.left "cd ${REPOS}" C-m
#tmux send-keys          -t proj:3.left "git watchtree" C-m
tmux send-keys          -t proj:3 "cd ${REPOS}" C-m
tmux send-keys          -t proj:3 "git status" C-m

# Switch to window 0
tmux select-window -t proj:0

# Force tmux to assume the terminal supports 256 colors and attach to the target session "proj"
tmux -2 attach-session -t proj
