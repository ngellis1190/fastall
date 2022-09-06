
# Fastall Deployment Utility

![GitHub](https://img.shields.io/github/license/ngellis1190/fastall?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/ngellis1190/fastall?style=for-the-badge)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/ngellis1190/fastall?style=for-the-badge)
![GitHub top language](https://img.shields.io/github/languages/top/ngellis1190/fastall?style=for-the-badge)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/ngellis1190/fastall?style=for-the-badge)

**Fastall is designed to aid in the rapid deployment of systems running Windows 10 and later. It is configurable and lightweight, leveraging inbuilt utilities wherever possible. This utility is also designed not to leave any traces of itself behind after is has completed.**

## Features

- Automatically connect to a predefined wireless network
  - **NEW!** Reattempt to connect if a system is initially slow to connect
  - **NEW!** Alert the operator if an internet connection cannot be made
- Prompt system to scan for and install Windows updates
  - **NEW!** Provide detailed installation status and name information
  - **NEW!** Alert the operator should a restart be required
- Install the WinGet package manager and dependencies
- Install desired applications via WinGet silently
  - **NEW!** Provide the option to uninstall packages via WInGet interactively
  - **NEW!** Manage installs/uninstalls via simple line-separated ini files
- **NEW!** Copy designated files into any default user directories
- Create a system restore point after completion
  - **NEW!** Enable system protection prior to creation if disabled
  - **NEW!** Alert the operator should an issue arise during generation
- Alert user with audio when script has finished
- **NEW!** Run fastall core scripts individually as needed

## Roadmap

- Recheck for updates after system restart to ensure all installed
- Allow a default usecase that does not require configuration
- Prompt to force install hash-mismatched WinGet packages
- Clean system temp files after updates applied
- Ability to set user background
- Ability to fetch date/timezone

## Usage

**You must configure this utility before running it for the first time**

Once properly configured, this script can be run by using the shortcut named **start**
The utility will run automatically from here, and require no input until it completes

*Should you wish to uninstall packages, operator interaction may be required*
*You will need to have administrative access to accept the UAC prompt one time upon start*


## Configuration

All files are located in the **config** directory

| Filename  | Configuration Details |
| :-------- | :-------------------- |
| net-secure.xml  | A Microsoft WLAN Profile v1 Schema - configure your wireless settings here              |
| variables.ini   | A collection of variables required for scripts to run - some have default values        |
| installs.ini    | A line-separated list of programs to be installed by WinGet in developer.program format |
| uninstalls.ini  | A line-separated list of programs to be uninstalled by WinGet in friendly name format   |

*Examples for most of the files above is included*

## Directory Layout

Below is an overview of the directories required to run this utility.

| Directory | Usage  |
| :-------- | :----- |
| binary    | Packages that cannot be fetched online for install       |
| config    | Files to be configured before running for the first time |
| place     | Items to be copied to user directories (not installers)  |
| script    | Collection of scripts required for program to run        |

*The baseline folder directory within place should not be altered*

## Appendix

**Q: Why is there a shortcut called chrome?**
A: For some reason, the Google Chrome package that is fetched by WinGet often does not match the expected hash. This means that WinGet must be told to force the installation, which cannot be done in the default script as it runs in an elevated mode. Should Chrome fail to install, simply run the shortcut **chrome** in standard, non-administrative mode to force override the hash verification and proceed to installation. Note this has security implications and you should be ready to take on any risks skipping the hash check should entail.

**Q: This utility deleted everything, burned down my house, and lied to me about cake! How are you going to fix this, you terrible person?**
A: You should restore from that backup you totally have and file an insurance claim as this software is provided “as is”, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.
