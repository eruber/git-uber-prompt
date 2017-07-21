# git-uber-prompt
A configurable bash prompt for git that integrates some of the best features from other git prompt scripts and is heavily based on the [posh-git-sh prompt](https://github.com/lyze/posh-git-sh).

# Repo Contents
The non-self explanatory files in this repository are:

- **.bashrc**

	This is just an example **.bashrc** file to demonstrate what you have to do to your own **.bashrc** file to use this prompt.

- **.bash_aliases**

	Sets up the bash prompt **PS1** variable using the code in **posh-git-prompt.sh** described below.	

- **posh-git-prompt.sh**

	Modified version of **git-prompt.sh** from [posh-git-sh prompt](https://github.com/lyze/posh-git-sh). The changes made most notably are:

	1. Re-ordered the **Index** and **Working Directory** git file status indicators. I tend to think of them in the order shown in [NDP Software's Git Cheatsheet](https://ndpsoftware.com/git-cheatsheet.html), namely:
		
		**Stash** --> **Working Directory** --> **Index**
	
		rather than:
	
		**Index** --> **Working Directory** --> **Stash**
	
	2. Changed the **Stash** indicator to include the number of stashed instances
	
	3. Added the **Remote Repository Name** to the prompt string along with the git configuration setting **bash.showRemoteRepoName** to control enabling/disabling the display of the **Remote Repository Name**.


# Installation
1. Copy the **.bash\_aliases** file to your home directory or where ever your **.bashrc** file lives.
If you already have a **.bash_aliases** file, then integrate the contents into your version.
2. Add the following line to your **.bashrc** file (if it is not already there)::

		source ~/.bash_aliases



# The Prompt in Action
The following sections provide some screen shots of the prompt in various configurations.

## Minimal Prompt
The minimal prompt occurs when the current directory is *not* the root of a git project and it consists of four parts:

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

* S:n is the **Stash Indicator**. If the Stash is empty it will display **S:0** and if the Stash has one saved instance, it will display **S:1**. By default, if empty, the **Stash Indicator** is not displayed. See the section *Git Prompt Configuration* below for how to change this behavior.
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
* **File Status** changes are indicated by prefixes to `A` through `H`, where `A` through
  `D` represent counts for the **working directory** and `E` through `H` represent counts for
  the **Index**. As in `git status`, **index status** is dark green and
  **working directory** status is dark red.
  * `+` added
  * `~` modified
  * `-` removed
  * `!` conflicting
* The letters themselves, A thru H, will be integers indicating how many files of each of the above **File Status** indicators are in the **Working Directory** (A thru D) and staged in the **Index** (E thru H).
* The angle brackets << and >> are used to delimit the name of the **remote repository**, if there is one; otherwise, **<< No Remote Repo Defined >>** is displayed.

The following images demonstrate some of the more common prompt indicators.

![File Status Indicators](http://i.imgur.com/AOFurIG.png)

![After Commit](http://i.imgur.com/5oFYZz7.png)

![Maximum Indicators Dislpayed](http://i.imgur.com/Zjws3KQ.png)
The above images illustrates turning on the git config bash settings to maximize the information displayed.

![Git Stash Indicator Changes](http://i.imgur.com/TNDHVKQ.png)

# Git Prompt Configuration
See the header of the **posh-git-prompt.sh** file for complete details on what git configuration settings are available to control what the git prompt displays. The two configuration settings that you may want to set to something other than their default values are:

1. **bash.showStatusWhenZero**

	Set to **true** and indicators will be shown even if there are no updates to the stash, index, or working directory.
	Set to **false** (*the Default*) no indicators shown if there are no changes to the stash, index, or working directory.


2. **bash.showRemoteRepoName**

	Set to **true** (*the Default*) to include the **Remote Repository Name** in the git prompt.
	Set to **false** to remove the **Remote Repository Name** from the git prompt.

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


#Thanks
Many appreciations go out to those individuals whose websites helped me to learn how to accomplish my design goals for a git prompt. The websites listed below are my attempt at an exhaustive list of my wanderings.

- [The posh-git-bash by lyze on GitHub](https://github.com/lyze/posh-git-sh)
- [Bash Reference Manual](https://www.gnu.org/software/bash/manual/bashref.html)
- [Git's Bash Prompt on GitHub](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
- [Bash-it a Community Bash Framework](https://github.com/Bash-it/bash-it)
- [Customize Git Bash Prompt on Windows](https://alanbarber.com/2015/12/30/how-to-customize-the-git-for-windows-bash-shell-prompt/)
- [git-aware-prompt on GitHub](https://github.com/jimeh/git-aware-prompt)
- [nixCraft's How to Change/Setup Bash Prompt](https://www.cyberciti.biz/tips/howto-linux-unix-bash-shell-setup-prompt.html)
- [Improving Your Gti Experience in Bash](http://maximomussini.com/posts/bash-git-prompt/)
- [Ultimate Git PS1 Bash Prompt](http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt)
- [Add git Branch Name to Bash Prompt](https://coderwall.com/p/fasnya/add-git-branch-name-to-bash-prompt)