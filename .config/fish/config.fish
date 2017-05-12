function ll
    ls -lh $argv
end

function jd
    mpg123 ~/Jobs\ Done.mp3 > /dev/null ^ /dev/null &
end

alias gs="git status"

function find-word-in-files
    grep -rnw '$argv[1]' -e '$argv[2]'
end


alias deploy-local="ansible-playbook -i local/inventory local.yml --vault-password-file ~/.ansible_vault_password"
alias deploy-integr="ansible-playbook -i integration/inventory integration.yml --vault-password-file ~/.ansible_vault_password"
alias package-without-tests="mvn clean package -DskipTests"
