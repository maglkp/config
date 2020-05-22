echo 'Logging in the pcf dev space'
@echo off
CALL cf login -a https://api.system.titan2.lab.emc.com -u XXXXXX -p XXXXXX -s development
@echo on
CALL gradlew build titanManifest -P activeProfile=release -x test
for %%I in (.) do set CurrDirName=%%~nxI
echo %CurrDirName%
for %%x in (build\libs\%CurrDirName%-*-SNAPSHOT.jar build\libs\%CurrDirName%-*-SNAPSHOT.war) do set artifact=%%x

CALL cf push -f build\libs\manifest.lab.yml %CurrDirName% -p %artifact%