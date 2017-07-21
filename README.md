# git-uber-prompt
A configurable bash prompt for git that integrates some of the best features from other git prompt scripts and heavily based on the [posh-git-sh prompt](https://github.com/lyze/posh-git-sh).

# Repo Contents
The non-self explanatory files in this repository are:

- **.bashrc**

	This is just an example **.bashrc** file to demonstrate what you have to do to your own **.bashrc** file to use this prompt.

- **.bash_aliases**

	Sets up the bash prompt **PS1** variable using the code in **posh-git-prompt.sh** described below.	

- **posh-git-prompt.sh**

	Modified version of **git-prompt.sh** from [posh-git-sh prompt](https://github.com/lyze/posh-git-sh). The changes made most notably are:

	1. Re-ordered the **Index** and **Working Directory** git file status indicators. I tend to theing of them in the order shown in [NDP Software's Git Cheatsheet](https://ndpsoftware.com/git-cheatsheet.html), namely:
		
		**Stash** --> **Working Directory** --> **Index**
	
		rather than:
	
		**Index** --> **Working Directory** --> **Stash**
	
	2. Changed the **Stash** indicator to include the number of stashed instances
	
	3. Added the **Remote Repository Name** to the prompt string along with the git configuration setting **bash.showRemoteRepoName** to control enabling/disabling the display of the **Remote Repository Name**.


# Installation
1. Copy the **.bash\_aliases** file to your home directory or where ever your **.bashrc** file lives.
If you already have a **.bash_aliases** file, then integrate the contents of into your version.
2. Add the following line to your **.bashrc** file (if it is not already there)::

		source ~./.bash_aliases



# The Prompt in Action
The following sections provide some screen shots of the prompt in various configurations.

## Minimal Prompt
The minimal prompt occurs when the current directory is not the root of a git project and it consists of four parts:

1. Time of Day
2. Bash Version
3. Return Code of the last shell command executed
4. Current directory

![Minimum prompt displays time, bash version, return code, and current directory](http://i.imgur.com/kFNRiHZ.png)

When the current directory is the root of a git project, the git status portion of the prompt is displayed between the **return code** and the **current directory**.

## Minimal Default Git Prompt
The following sequence of shell commands creates a project directory, changes directory into the project directory, and then initializes a local git repository -- watch the prompt change with each command...

![Minimum Git Prompt](http://i.imgur.com/cFl5ClF.png)


## The Git Prompt
The git specific portion of the prompt is displayed between the **return code** and the **current directory**.

By default, the status summary has the following format::

	[S:n {HEAD-name} x +A ~B -C !D | +E ~F -G !H] << remote-repository-name >>

* S:n is the **Stash Indicator**. If the Stash is empty it will display **S:0** and if the Stash has one saved instance, it will display **S:1**. By default, if empty, the **Stash Indicator** is not displayed.

* `{HEAD-name}` is the **Current Branch Indicator**, or the SHA of a detached HEAD. The color
  of `{HEAD-name}` represents the divergence from upstream. `{HEAD-name}` also
  changes to indicate progress if you are in the middle of a cherry-pick, a
  merge, a rebase, etc.
  * `cyan`   the branch **matches** its remote
  * `green`  the branch is **ahead** of its remote (green light to push)
  * `red`    the branch is **behind** its remote
  * `yellow` the branch is both **ahead** of and **behind** its remote
* `x` is a symbol that represents the **divergence** from upstream.
  * `≡` the branch **matches** its remote
  * `↑` the branch is **ahead** of its remote
  * `↓` the branch is **behind** its remote
  * `↕` the branch is both **ahead** of and **behind** its remote
* Status changes are indicated by prefixes to `A` through `H`, where `A` through
  `D` represent counts for the **working directory** and `E` through `H` represent counts for
  the **Index**. As in `git status`, **index status** is dark green and
  **working directory** status is dark red.
  * `+` added
  * `~` modified
  * `-` removed
  * `!` conflicting
* The angle brackets << and >> are used to delimit the name of the remote repository, if there is one; otherwise, **<< No Remote Repo Defined >>** is displayed.



# Git Prompt Configuration
See the header of the **posh-git-prompt.sh** for complete details on what git configuration settings are available to control what the git prompt displays. The two configuration settings that you may want to set to something other than their default values are:

1. **bash.showStatusWhenZero**

	Set to **true** and indicators will be shown even if there are no updates to the stash, index, or working directory.
	Set to **false** (*the Default*) no indicators shown if there are no changes to the stash, index, or working directory.


2. **bash.showRemoteRepoName**

	Set to **true** (*the Default*) to include the Remote Repository Name in the git prompt.
	Set to **false** to remove the Remote Repository Name from the git prompt.

For example::

	git config bash.showStatusWhenZero true
	git config bash.showRemoveRepoName false

will set the two configuration settings discussed above to their *non-default* values.


See the examples below for demonstrations of each configuration setting's impact on the git prompt.

![git config base settings](http://i.imgur.com/q4BNbqM.png)

The *other* git config bash settings discussed in detail in the header of **posh-git-prompt.sh** are:

- **bash.describeStyle**
- **bash.enableFileStatus**
- **bash.enableGitStatus**
- **bash.showStashState**
- **bash.showUpstream**
- **bash.enableStatusSymbol**


#To Do
1. Attempt to optimize the git prompt portion of the code, it is rather slow.