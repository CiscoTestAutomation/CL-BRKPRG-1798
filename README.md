# Cisco Live! BRKPRG-1798: Everybody Can Automate Now 

This repository contains the files shown during 
[Cisco Live US 2020](https://www.ciscolive.com/us.html?zid=cl-global) breakout session
**BRKPRG-1798: Everybody Can Automate Now**

## General Information

- Cisco Live US: https://www.ciscolive.com/us.html?zid=cl-global
- pyATS/Genie Portal: https://cs.co/pyats
- Genie Documentation: https://pubhub.devnetcloud.com/media/genie-docs/docs/index.html
  - Genie CLI: https://pubhub.devnetcloud.com/media/genie-docs/docs/cli/index.html
  - Parsers, Models: https://pubhub.devnetcloud.com/media/genie-docs/docs/cli/genie_parse.html
  - Blitz: https://pubhub.devnetcloud.com/media/pyats-development-guide/docs/writeblitz/writeblitz.html
- pyATS Documentation: https://developer.cisco.com/docs/pyats/
- RobotFramework standard libraries: http://robotframework.org/robotframework/
- Support Email: pyats-support-ext@cisco.com

## Requirements

- Mac OSX, Linux or Windows 10 [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- Python 3.5, 3.6, 3.7, 3.8
- Network connectivity (for downloading PyPI packages)

## Preparation

**Step 1: Create a Python Virtual Environment**

In a new terminal window:

```bash
# go to your workspace directory
# (or where you typicaly work from)
cd ~/workspace

# create python virtual environment
python3 -m venv brkprg-1798

# activate virtual environment
cd brkprg-1798
source bin/activate

# update your pip/setuptools
pip install --upgrade pip setuptools
```

**Step 2: Install pyATS, Genie**

```bash
# install pyATS
pip install pyats[full]
```

**Step 3: Clone This Repository**

```bash
# clone this repo
git clone https://github.com/CiscoTestAutomation/CL-BRKPRG-1798 class

# cd to the directory
cd workshop
```

and now you should be ready to get going!

All the scripts with their own README are within the directory workshop.

**Head to the >[Main Workshop](workshop.md)< to start!**
