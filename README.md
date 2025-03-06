# **Script for creating multiple Python versions for Windows**

This project automates the installation of **pyenv** on Windows, allowing users to manage multiple Python versions seamlessly. The provided PowerShell script simplifies the setup and configuration of **pyenv**, setting environment variables and handling version management.

## Table of Contents
1. [Introduction](#introduction)
2. [Features](#features)
3. [Installation](#installation)
   - [Automated Installation](#automated-installation)
   - [Manual Setup](#manual-setup)
4. [Usage](#usage)
   - [Setting Global Python Version](#setting-global-python-version)
   - [Setting Local Python Version](#setting-local-python-version)
   - [Virtual Environment Setup](#virtual-environment-setup)
5. [VSCode Configuration](#vscode-configuration)
6. [Acknowledgments](#acknowledgments)

---

## **Introduction**

This project provides a PowerShell script to automate the installation of **pyenv-win**, a Python version manager for Windows. It simplifies setting up **pyenv**, handling multiple Python versions, and integrating with virtual environments.

## **Features**
- Automates the download and installation of **pyenv-win**.
- Sets environment variables for **pyenv** automatically.
- Adds **pyenv** to the system **PATH** for seamless access.
- Creates a virtual environment for Python projects and integrates it with **VSCode**.

---

## **Installation**

### **Automated Installation**

To automate the pyenv installation, follow these steps:

1. **Download the PowerShell Script:**
   - Download the PowerShell script (`https://github.com/mustafa-ali0/install-Multiple-Python-Versions/archive/refs/heads/main.zip`) from this repository.

2. **Run the Script:**
   - Right-click the script file and select **Run with PowerShell**. The script will:
     - Download the pyenv repository.
     - Extract the pyenv files to your **.pyenv** folder.
     - Set environment variables for **pyenv**.
     - Add **pyenv** directories to the **PATH** variable.
     - Unblock the pyenv script if necessary.

3. **Restart PowerShell:**
   - After the script finishes, restart your PowerShell terminal to apply the changes.

---

### **Manual Setup**

If you prefer to manually set up **pyenv** or need more control, follow these steps:

1. **Download pyenv-win**:
   - Go to the [pyenv-win GitHub repository](https://github.com/pyenv-win/pyenv-win) and follow the instructions there.

2. **Create `.pyenv` Directory**:
   - Manually create a `.pyenv` folder in your home directory.

3. **Set Environment Variables**:
   - Set the `PYENV` and `PYENV_HOME` environment variables to the pyenv installation path.

4. **Add pyenv to PATH**:
   - Add the `bin` and `shims` directories of **pyenv** to the system **PATH**.

---

## **Usage**

### **Setting Global Python Version**

To set the global Python version:

```bash
pyenv global 3.13.2  # Or any version of your choice
```

This sets the default Python version for your system.

### **Setting Local Python Version for a Specific Project**

To set a local Python version for a specific project:

1. Navigate to your project folder:
   ```bash
   cd (your project path)
   ```

2. Set the local Python version:
   ```bash
   pyenv local 3.12.2  # Or any version of your choice
   ```

### **Virtual Environment Setup**

To create and activate a virtual environment for your project:

1. Navigate to your project folder:
   ```bash
   cd (your project path)
   ```

2. Create the virtual environment:
   ```bash
   python -m venv .venv
   ```

3. Activate the virtual environment:
   ```bash
   .\.venv\Scripts\activate
   ```

---

## **VSCode Configuration**

To use **pyenv** in **VSCode**, follow these steps to configure the terminal to activate the virtual environment:

1. **Open VSCode Command Palette:**
   - Press `Ctrl + Shift + P` in VSCode.
   - Type and select `Open Workspace Settings (JSON)`.

2. **Modify JSON Settings:**
   - Add the following configuration to your `settings.json` file:
     ```json
     {
         "python.terminal.activateEnvironment": true
     }
     ```

3. **Restart VSCode:**
   - After saving the settings, restart VSCode to ensure the changes take effect.

---

## **Acknowledgments**

This project utilizes the [pyenv-win](https://github.com/pyenv-win/pyenv-win) repository to manage Python versions on Windows. Special thanks to the contributors of **pyenv-win** for their work.

- **Repository**: [pyenv-win on GitHub](https://github.com/pyenv-win/pyenv-win)
- **Creator**: [pyenv-win Contributors](https://github.com/pyenv-win/pyenv-win/graphs/contributors)

---

### Conclusion

With this automation script and manual setup guide, you can efficiently manage multiple Python versions on your Windows system. Enjoy working with **pyenv** and simplifying your Python development workflows!

---

Feel free to use this README as a professional guide to your project, and share it with the community. Let me know if you'd like further modifications!
