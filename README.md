# iFTP - Automatic FTP Client

iFTP is a PowerShell script that automates FTP file transfers using the cmdftp utility. It reads configuration values from a JSON file and performs file upload to an FTP server.

## Prerequisites

- Windows operating system
- PowerShell execution policy set to Bypass (To change the execution policy, run `Set-ExecutionPolicy Bypass` in PowerShell with administrative privileges.)

## Setup

1. Clone or download the iFTP project to your desired directory.

2. Open a PowerShell session with administrative privileges and navigate to the project directory.

3. Run the setup script `setup.ps1` to set up the required dependencies and configuration.

   ```powershell
   .\setup.ps1
    ```
This script will create a directory C:\iftp, download the cmdftp utility, and add the directory to the system's PATH.
Open the fconfig.json file located in the project directory and provide the FTP server and authentication details.

Example fconfig.json:
{
"hostname": "ftp.example.com",
"port": 21,
"username": "your_username",
"password": "your_password",
"rootdir": "/test",
"delwrite": true
}

| Name         | Description  | Type    |
|--------------|--------------|---------|
| hostname | The FTP server hostname or IP address. | int, string |
| port | The FTP server port | int     |
| username | Your FTP server username | string  |
| password | Your FTP server password | string  |
| rootdir | The remote directory on the FTP server where files will be uploaded. | string  |
| delwrite | A boolean value indicating whether to delete existing files in the remote directory before uploading. | boolean |

## Usage

1. Open a PowerShell session and navigate to the project directory.

2. Run the iftp.ps1 script to initiate the FTP file transfer.
    ```
    .\iftp.ps1
    ```

3. The script will display the progress of the file transfer.

4. Once the file transfer is completed, the script will exit, and the files will be available in the specified remote directory on the FTP server.

## License
This project is licensed under the MIT License.