# Bash-Collection [![Build Status](https://travis-ci.com/LamdaLamdaLamda/bash-collection.svg?branch=main)](https://travis-ci.com/LamdaLamdaLamda/bash-collection) [![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)


This  small collection contains runnable shell code, but also code-snippets (e.g Alias).
These have the intention to improve your daily workflow.
All shellscripts stick to the [Shell Style Guide](https://google.github.io/styleguide/shellguide.html) by Google (probably with some minor exceptions).

Beware of running script you may not understood completely.

## Contribution

You want to contribute? Great!
At first make sure you did installed **shellcheck**.
If you contribute to this repository make sure you did run **verify.sh** successfully. This script will verify whether your contribution is valid shellscript or not.

## Project structure

**Alias** - All alias terminal commands belong here. A alias needs to be specified explicitly with the _alias_ keyword and does not accept any arguments.

**Files** - File manipulation scripts.

**Misc** - Script which are not categorized in any other directory.

**Network** - Network related scripts.

**Sec** - Script which are security or safety related. If a script touches any other category but is security related, it belongs in the Sec directory.
