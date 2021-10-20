:: call me using in PowerShell: ./publish
:: call me using in Command Prompt/cmd: publish
:: Batch file by Ramires Oliv
:: this batch used to publish changed, created, removed files in github directory
:: NEED THE GIT INSTALLED
:: NEED USE "git init" BEFORE USE THE BATCH

@echo off

echo.
echo [Copyright Ramires Oliv]

if exist ".git" ( goto commands ) else (
    echo Not Success.
    echo Result: Error in try use git. pls verify if "git init" was used.
    exit
)

:commands
echo.
echo 1. pull        (PULL) Incorporates changes from a remote repository into the current branch. In its default mode
echo 2. publish     (AUTO PUBLISH) add, commit, pull to local branch
echo 3. add         (MANUAL PUBLISH) This command updates the index using the current content found in the working tree, to prepare the content staged for the next commit.
echo 4. commit      (MANUAL PUBLISH) Updates remote refs using local refs, while sending objects necessary to complete the given refs.
echo 5. push        (MANUAL PUBLISH) Updates remote refs using local refs, while sending objects necessary to complete the given refs.
echo 6. leave/exit  (HELPER COMMAND) Leave of the Git Helper
echo 7. help        (HELPER COMMAND) get help commands
goto main

:main
echo.
title %CD% running git helper by RamiresOliv
echo ---------------------
echo type "help" for help
set /p select= Run: 


if %select% equ pl goto pull
if %select% equ ph goto push
if %select% equ a goto add
if %select% equ ct goto commit
if %select% equ ph goto publish
if %select% equ cls goto clear

if %select% equ pull goto pull
if %select% equ push goto push
if %select% equ add goto add
if %select% equ commit goto commit
if %select% equ publish goto publish
if %select% equ leave goto leave
if %select% equ exit goto leave
if %select% equ help goto commands
if %select% equ clear goto clear

if %select% GEQ 0 goto Error

:Error
    title %CD% Error...
    echo Error: The Command "%select%" not exist.
    goto main

:clear
cls
goto main

:push
    title %CD% running git push...
    git pull
    echo Success!
    echo Result: pushed to GitHub Local Branch.
    goto main

:pull
    title %CD% running git pull...
    title pull
    git pull
    echo Success!
    echo Result: pulled to GitHub Local Branch.
    goto main

:add
    title %CD% running git add -A...
    git add -A
    echo Success!
    echo Result: added local Branch.
    goto main

:commit
    title %CD% running git commit -m "Cool Commit"...
    git commit -m "Cool Commit"
    echo Success!
    echo Result: commit local Branch.
    goto main

:publish
    title %CD% running git add -A...
    git add -A
    title commit
    :: change here the commit name the normal name its "Cool Commit"
    git commit -m "Cool Commit"
    title push
    git push
    title %CD% - cmd
    echo [Copyright Ramires Oliv]
    echo Success!
    echo Result: added, commited and pushed to GitHub local Branch.
    goto main

:leave
title %CD% - cmd
echo.
@echo on