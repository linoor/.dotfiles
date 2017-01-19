alias gcm "git commit -m"
alias gs "git status"
alias gap "git add -p"

function ll
    ls -lh $argv
end

function jd
    mpg123 ~/Jobs\ Done.mp3 > /dev/null ^ /dev/null &
end
