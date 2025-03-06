# install-Multiple-Python-Versions

This Script automates the process of installing and managing multiple Python versions using pyenv on your Windows system. The script ensures a smooth setup and handles Python versions efficiently.

# Table of Contents
Automated Installation
Manual Steps
VSCode Configuration
Automated Installation
The provided PowerShell script automates the installation of pyenv, setting the environment variables, and ensuring that everything is in place for managing Python versions on your system. To run the script, follow these steps:

Download the Script:

Download the PowerShell script to your computer.
Run the Script:

Right-click on the script (install_pyenv.ps1) and select Run with PowerShell.
The script will:
Download the pyenv repository.
Extract it to a folder named .pyenv in your home directory.
Set the required environment variables for pyenv.
Add pyenv’s bin and shim folders to the PATH environment variable.
Unblock the pyenv script for execution if necessary.
Restart PowerShell:

After the script finishes, restart your PowerShell terminal to apply the changes.
Manual Steps
If you prefer to set up pyenv manually or need further guidance, follow these steps:

Set Global Python Version:

To set a global Python version, use the following command:
bash
Copy
Edit
pyenv global 3.13.2  # Or any other version you prefer
Set Local Python Version for a Specific Project:

Navigate to your project folder and set the Python version:
bash
Copy
Edit
cd (your project path)
pyenv local 3.12.2  # Or any version you prefer
Set Up a Virtual Environment:

To create and activate a virtual environment for your project:
bash
Copy
Edit
cd (your project path)
python -m venv .venv
.\.venv\Scripts\activate
VSCode Configuration
To use pyenv in VSCode, follow these steps to configure the terminal to activate the virtual environment:

Open VSCode Command Palette:

Press Ctrl + Shift + P in VSCode.
Type and select Open Workspace Settings (JSON).
Modify JSON Settings:

Add the following configuration to your settings.json file:
json
Copy
Edit
{
    "python.terminal.activateEnvironment": true
}
Restart VSCode:

After saving the settings, restart VSCode to ensure the changes take effect.
Conclusion
By using this automation and following the manual steps, you'll be able to easily manage multiple Python versions with pyenv and streamline your Python project setups.
