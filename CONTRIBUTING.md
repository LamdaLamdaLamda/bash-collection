# Contribution

If you want to contribute, you need to install [Shellcheck](https://www.shellcheck.net/) to run the **verify.sh** script. Stick to the following contribution order:


1. Fork it (https://github.com/yourname/yourproject/fork)
2. Create your feature branch (git checkout -b feature/fooBar)
3. Add you bash-script.
4. Run **./verify.sh** successfully.
5. Commit your changes (git commit -am '[MESSAGE]') according to **Commit-Messages**
6. Push to the branch (git push origin feature/fooBar)
7. Create a new Pull Request

## Commit-Messages 

Please use the following template as reference for commit messages.

```
git commit -am '[CHANGE_TYPE] - [MESSAGE]'
```

The part where you can get creative is the [MESSAGE] placeholder. The [CHANGE_TYPE] placeholder refers to one of the following:

* **Added** for new features.
* **Changed** for changes in existing functionality.
* **Deprecated** for soon-to-be removed features.
* **Removed** for now removed features.
* **Fixed** for any bug fixes.
* **Security** in case of vulnerabilities.

A proper example would be:

```
git commit -am 'Fixed - Fixed a common foobar issue by replacing foo with bar'
```

## Styleguide

* Append the file extension **.sh** to you bash-script, for identification purposes (yes its not mandatory on Linux).
* Add the shebang at the top of you bash-script: **#!/bin/bash**
* Insert the header right after the shebang:
* Stick to shellcheck correction proposals.

```sh
###################################################################
#Script Name  : foobar.sh
#Description  : Some fancy description.
#Args         : None
#Author       : LamdaLamdaLamda
#Email        : 25778959+LamdaLamdaLamda@users.noreply.github.com
###################################################################
```


## Shellcheck-Exeptions

The following exceptions are currently included when you run **./verify.sh**:

```
SC2216  -   Piping to 'rm', a command that doesn't read stdin.
            See: https://github.com/koalaman/shellcheck/wiki/SC2216

C2044   -   For loops over find output are fragile.
            See: https://github.com/koalaman/shellcheck/wiki/SC2044

SC2039  -   In POSIX sh, something is undefined. Bash as interpreter is used.
            See: https://github.com/koalaman/shellcheck/wiki/SC2039


SC2112  -   'function' keyword is non-standard. Bash as interpreter is used.
            See: https://github.com/koalaman/shellcheck/wiki/SC2112

SC2002  -   Useless cat. Consider 'cmd < file | ..' or 'cmd file | ..' instead. 
            See: https://github.com/koalaman/shellcheck/wiki/SC2002

SC2010  -   Don't use ls | grep. Use a glob or a for loop with a condition to   
            allow non-alphanumeric filenames.
            See: https://github.com/koalaman/shellcheck/wiki/SC2010

SC2129 -    Consider using { cmd1; cmd2; } >> file instead of individual        
            redirects.
            See: https://github.com/koalaman/shellcheck/wiki/SC2129

```         

They will be resolved (for each script) successively with the time. 
