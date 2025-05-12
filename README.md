>[!TIP]
> Author: Aaron Surina
> Date: May 12, 2025
> ## aaron-repoadmin.sh

>[!IMPORTANT]
> This is actually me using the very script that I created to create the repository you are viewing

root@sandbox:~/Github/aaron-repoadmin#``` nano create_github_repo.sh ```
root@sandbox:~/Github/aaron-repoadmin#``` chmod +x create_github_repo.sh ```
root@sandbox:~/Github/aaron-repoadmin#``` ./create_github_repo.sh ```
Repository name [aaron-repoadmin]: ```[ENTER]```
Repository description (optional): ```A custom bash script for linux terminal coding and committing to github repositories. Makes sharing code publicly or privately simple from a linux terminal once gh has been installed.```
Private repository? [y/N]: ```N```
GitHub username: ```aaronlumen```
Personal Access Token (will not echo):```                   ```
Remote type (ssh/https) [ssh]: ```^M```
* Creating GitHub repository using api integration: 'aaron-repoadmin'...
* Repository 'aaron-repoadmin' created on GitHub.
* Initializing local repository...
* git init
* Initialized empty Git repository in /root/Github/aaron-repoadmin/.git/
* git branch -M main
* git add .
* git commit -m "Initial commit by Aaron Surina"
[main (root-commit) 03d1791] Initial commit by Aaron Surina
* 1 file changed, 103 insertions(+)
* create mode 100755 create_github_repo.sh
* Adding remote origin...
* ```git remote add origin "git@github.com:aaronlumen/aaron-repoadmin.git"```
* Pushing to GitHub (ssh)...
* ```git push -u origin main```
* Enumerating objects: 3, done.
* Counting objects: 100% (3/3), done.
* Compressing objects: 100% (2/2), done.
* Writing objects: 100% (3/3), 2.11 KiB | 2.11 MiB/s, done.
* Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
* To github.com:aaronlumen/aaron-repoadmin.git
 * [new branch]      main -> main
* Branch 'main' set up to track remote branch 'main' from 'origin'.
* Success! Repository available at: git@github.com:aaronlumen/aaron-repoadmin.git
