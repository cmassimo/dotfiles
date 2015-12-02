#!/bin/sh

# Setup some variables needed for bootstrapping the environment
ROOT=root_path
REPOS=${ROOT}/code

# Bootstrap a new session called "proj"
tmux new-session     -d -s proj

# Rename the first window (using the session-name:id notation)
tmux rename-window      -t proj:0 "1"


# Create and label three other windows, splitting the last one horizontally
tmux new-window         -t proj:1 -n "2"
tmux new-window         -t proj:2 -n "3"
tmux new-window         -t proj:3 -n "4"
#tmux split-window    -h -t proj:3 

# Send commands to the windows, use "C-m" to emulate "enter"

# On window 1, just let a console sit there and wait for commands!!1 (with virtualenv)
# Lolnope not anymore.
tmux send-keys          -t proj:1 "cd ${ROOT}" C-m
tmux send-keys          -t proj:1 "pew workon proj" C-m
tmux send-keys          -t proj:1 "vim" C-m
tmux split-window       -t proj:1 -h -p 32
tmux send-keys          -t proj:1.1 "pew workon proj" C-m
tmux send-keys          -t proj:1.1 "ipython" C-m


# On window 2 setup Git.
tmux send-keys          -t proj:2 "cd ${ROOT}" C-m
tmux send-keys          -t proj:2 "pew workon proj" C-m
tmux send-keys          -t proj:2 "git status" C-m

# On window 3 empty console with python virtualenv
tmux send-keys          -t proj:3 "cd ${ROOT}" C-m
tmux send-keys          -t proj:3 "pew workon proj" C-m

# Window 0, editor with virtualenv
tmux send-keys          -t proj:0 "cd ${ROOT}" C-m
tmux send-keys          -t proj:0 "pew workon proj" C-m
tmux send-keys          -t proj:0 "vim" C-m
tmux split-window       -t proj:0 -h -p 32
tmux send-keys          -t proj:0.1 "pew workon proj" C-m
tmux send-keys          -t proj:0.1 "ipython" C-m

# Switch to window 0
tmux select-window -t proj:0

# Force tmux to assume the terminal supports 256 colors and attach to the target session "proj"
tmux -2 attach-session -t proj
