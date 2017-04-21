function ll
    ls -lh $argv
end

function jd
    mpg123 ~/Jobs\ Done.mp3 > /dev/null ^ /dev/null &
end

alias gs="git status"
