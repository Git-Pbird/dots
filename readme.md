#bash_profile
 Define basic root constant.
 Used for set current project folder, for further script execution point.

#git
> \>git lg\
will show the chronological order of commits\
(with relative date marker)
```
* 5ee464f (52 seconds ago) |  (HEAD -> master, origin/master) [readme]
* 20725b7 (9 weeks ago)    |  update .gitignore file
* 92f8053 (3 months ago)   |  include GIT auto-completion
* d26595e (3 months ago)   |  adjust installation sequence
```
> \>git hist\
will show the chronological order of commits\
(with absolute date marker)
```
* 5ee464f (2019-03-18) |  (HEAD -> master, origin/master) [readme]
* 20725b7 (2019-01-17) |  update .gitignore file
* 92f8053 (2018-12-28) |  include GIT auto-completion
* d26595e (2018-12-27) |  adjust installation sequence
```
> \>git fullhist
will show the chronological order of commits\
(with absolute date marker) & `diff` in the changed files
```
* 5ee464f (2019-03-18) | [readme]| 
|  readme.md | 0
|  1 file changed, 0 insertions(+), 0 deletions(-)
* 20725b7 (2019-01-17) | update .gitignore file| 
|  git/.gitignore | 1 +
|  1 file changed, 1 insertion(+)
* 92f8053 (2018-12-28) | include GIT auto-completion| 
|  git/.git-promt | 4 ++--
|  1 file changed, 2 insertions(+), 2 deletions(-)
* d26595e (2018-12-27) | adjust installation sequence| 
|  scripts/laravel_install.sh    | 34 ++++++++++++++++++++++++----------
|  scripts/nginx_host_install.sh |  8 ++++++--
|  2 files changed, 30 insertions(+), 12 deletions(-)
```

## git-promt
 contain promt for console view. It use `.colors` file as color source & `/git/.git-completion.bash` for auto-comlete
 it contain several preview state based on git status.
 >in case of some files are not added to track.
 ```
 ┌──username: ~/path/to/folder
 • master
 •        20725b7    'My commit message'
 ⨯     Untracked files are present
 └──▶  
 ```
#patterns

#scripts
