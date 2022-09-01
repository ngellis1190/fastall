
# Fastall Deployment Utility  

![GitHub](https://img.shields.io/github/license/ngellis1190/fastall?style=for-the-badge)
![GitHub release (latest by date)](https://img.shields.io/github/v/release/ngellis1190/fastall?style=for-the-badge)
![GitHub last commit](https://img.shields.io/github/last-commit/ngellis1190/fastall?style=for-the-badge)
![GitHub top language](https://img.shields.io/github/languages/top/ngellis1190/fastall?style=for-the-badge)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/ngellis1190/fastall?style=for-the-badge)  

**Fastall is a utility designed to aid in the quick deployment of systems running Windows 10 and above**  
**It is configurable and lightweight, leveraging inbuilt utilities whenever possible** 


## Features

- Automatically connect to a predefined wireless network
- Prompt system to scan for and install Windows updates
- Install the WinGet package manager and dependencies
- Install desired applications via WinGet silently
- Copy designated files into user directories
- Create a system restore point after completion
- Alert user with audio when script has finished
## Roadmap

- Allow a default usecase that does not require configuration
- Easier customization of apps installed via WinGet manager
- Prompt to force install hash-mismatched WinGet packages
- Clean system temp files after updates applied
- Copy files to directories other than desktop
- Better error handling for wireless issues
- Detect and uninstall antivirus programs
- Ability to set user background
## Usage

**You must configure this utility before running it for the first time**

Once properly configured, this script can be run by using the shortcut named **start**  
The utility will run automatically from here, and require no input until it completes  

*Note: You will need to have administrative access to accept the UAC prompt one time upon start*


## Configuration

All files are located in the **config** directory

| Filename  | Configuration Details |
| :-------- | :-------------------- |
| net-secure.xml  | A Microsoft WLAN Profile v1 Schema - configure your wireless settings here       |
| variables.ini   | A collection of variables required for scripts to run - some have default values |

## Directory Layout

Below is an overview of the directories required to run this utility.

| Directory | Usage |
| :-------- |:----- |
| binary    | Packages that cannot be fetched online for install       |
| config    | Files to be configured before running for the first time |
| desktop   | Items to be copied to the user desktop (not installers)  |
| script    | Collection of scripts required for program to run        |

## Appendix

**Q: Why is there a shortcut called chrome?**  
A: For some reason, the Google Chrome package that is fetched by WinGet often does not match the expected hash. This means that WinGet must be told to force the installation, which cannot be done in the default script as it runs in an elevated mode. Should Chrome fail to install, simply run the shortcut **chrome** in standard, non-administrative mode to force override the hash verification and procceed to installation. Note this has security implications and you should be ready to take on any risks skipping the hash check should entail.

**Q: This program deleted everything, burned down my house, and lied to me about cake! How are you going to fix this?**  
A: You should restore from backup and file an insurance claim as this software is provided “as is”, without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.