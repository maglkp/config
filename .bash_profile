# user stuff
alias gst='git status'
alias gcd='git checkout develop'
alias gbst='./gradlew build -x test'
alias gb='./gradlew build'
alias gbr='./gradlew bootRun'
alias buildManifest2='./gradlew -P activeProfile=release build titanManifest -x test'
alias buildManifest='./gradlew titanManifest -x test'
alias loginDev='cf login -a https://api.system.titan2.lab.emc.com -u koziol -p pazz -s development'
alias gmfh='git merge FETCH_HEAD'
alias gfod='git fetch origin develop'
alias dp='docker ps'
alias cfp='echo -ne "cf push -f <manifest.yml> dev-app -p app.war\ncf push dev-ux2-app\n"'
alias xclipc='xclip -selection clipboard'  # copy to system wide clipboard (register +)

