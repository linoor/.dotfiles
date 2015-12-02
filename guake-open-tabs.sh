#!/bin/bash
/usr/bin/guake &
sleep 1
guake -r "home"
guake -n k -r "Minesweeper" --execute-command='cd ~/Dev/Studia/Minesweeper/'
guake -n k -r "haskell" --execute-command='cd ~/Dev/Practice/Haskell'
guake -n k -r "ghci" --execute-command='cd ~/Dev/Practice/Haskell; ghci'
guake -n k -r "Parallel" --execute-command='cd ~/Dev/Studia/Parallel/Projekty'
guake -n k -r "Perl" --execute-command='cd ~/Dev/Studia/Skrypty/Perl'
