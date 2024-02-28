# About Terraform:
Terraform is an open-source Infrastructure as Code (IaC) tool created by HashiCorp. It allows developers to define and provide infrastructure using a declarative configuration language. This means you describe your infrastructure as code, and Terraform will ensure that the infrastructure is in the state you described.

# Advantages:
- Platform Agnostic: Terraform supports a multitude of providers such as AWS, Google Cloud, Azure, and many others. This means you can manage a multi-cloud environment using the same tool and the same language.
- Immutable Infrastructure: Terraform treats infrastructure as immutable, meaning it avoids updating existing resources. Instead, it will destroy and recreate the resource, ensuring that your infrastructure stays in the desired state.
- Modular and Reusable: Terraform allows you to create modules, which are reusable components of your infrastructure. This promotes code reuse and infrastructure consistency.
- State Management: Terraform maintains a state file which allows it to create plans and make changes to your infrastructure with a high degree of accuracy.
- Integration with Existing Tools: Terraform can be easily integrated with existing tools and services, such as Packer for creating machine images or Kubernetes for container orchestration.

# Key Usability Points:
- Configuration Files: Terraform uses configuration files to describe the infrastructure. These files can be shared and collaborated on, making it easy to version control your infrastructure.
- Execution Plans: Terraform has a ‘planning’ step where it generates an execution plan describing what it will do to reach the desired state.
- Resource Graph: Terraform builds a graph of all your resources and parallelizes the creation and modification of any non-dependent resources.
- Change Automation: With Terraform, you can apply a set of changes to your infrastructure in an automatic and efficient way.


# Terraform Installation Guide

## Linux:
1. Download the Terraform binary: You can download the latest version of Terraform from the official [Terraform downloads page](https://developer.hashicorp.com/terraform/install?product_intent=terraform). Choose the package that corresponds to your system architecture, either 32-bit or 64-bit.
2. Extract the downloaded file: Once the zip file is downloaded, you can extract it using the unzip command in your terminal:
```bash
unzip <downloaded_file>
```
Replace <downloaded_file> with the name of the file you downloaded.

3. Move the Terraform binary to /usr/local/bin/: After extracting the zip file, you will find a file named terraform in your current directory. This is the Terraform binary. You need to move this file to a directory that is on your system’s PATH, such as /usr/local/bin/:
```bash
sudo mv terraform /usr/local/bin/
```
4. Verify the installation: You can verify that Terraform is installed correctly by running:
```bash
terraform --version
```

## Windows:
1. Download the Terraform binary: You can download the latest version of Terraform from the official [Terraform downloads page](https://developer.hashicorp.com/terraform/install?product_intent=terraform). Choose the package that corresponds to your system architecture, either 32-bit or 64-bit.
2. Extract the downloaded file: Once the zip file is downloaded, you can extract it by right-clicking the file and selecting “Extract All…”.
3. Add the Terraform binary to your PATH: After extracting the zip file, you will find a file named terraform.exe in the extracted folder. This is the Terraform binary. You need to add the directory containing this file to your system’s PATH:
- Right-click on “This PC” (or “My Computer”) and select “Properties”.
- Click on “Advanced system settings”.
- Click on “Environment Variables…”.
- Under “System variables”, find the Path variable, select it, and click on “Edit…”.
- In the “Variable value” field, append the full path of the directory containing terraform.exe. Make sure to separate this path from the existing paths using a semicolon (;).
4. Verify the installation: You can verify that Terraform is installed correctly by opening a new command prompt and running:
```cmd
terraform --version
```
This command should print the version of Terraform that you installed.

## Windows | Chocolatey
To install Terraform using [Chocolatey](https://chocolatey.org/), a package manager for Windows, you can follow these steps:
1. Open a Command Prompt or PowerShell as an Administrator: You can do this by searching for cmd or PowerShell in the Start menu, right-clicking on the Command Prompt or PowerShell, and selecting “Run as administrator”.
2. Check if Chocolatey is installed: Type choco -? in the Command Prompt or PowerShell. If you see some options appear, it means that Chocolatey is already installed. If not, proceed to the next step.
3. Install Chocolatey: If Chocolatey is not installed, you can install it by running the following command1:
```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
4. Install Terraform: After Chocolatey is installed, you can install Terraform by running the following command1:
```powershell
choco install terraform
```
You can add -y at the end of the command to automatically agree to the installation
5. Verify the installation: You can verify that Terraform is installed correctly by opening a new Command Prompt or PowerShell window and typing 
```cmd
terraform --version
```
This command should print the version of Terraform that you installed.
