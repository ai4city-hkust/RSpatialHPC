# Setup R-GeoSpatial Environment for HPC

This repository contains a Shell script (`setup.sh`) to set up an R environment with necessary dependencies and configurations for geocomputing on an Ubuntu system.

## Prerequisites

- **Ubuntu**: The script is designed for Ubuntu systems. Ensure you are running a compatible version.
- **sudo privileges**: You need administrative privileges to install packages and modify system settings.

## Steps to Download and Run the Script

### 1. Download the Script

You can download the `setup.sh` script directly from GitHub using the following command:

```bash
wget https://raw.githubusercontent.com/ai4city-hkust/RSpatialHPC/main/setup.sh
```

This will download the script to your current directory.

### 2. Make the Script Executable

Before running the script, you need to make it executable. Run the following command:

```bash
chmod +x setup.sh
```

This grants execution permissions to the script.

### 3. Run the Script

Execute the script with the following command:

```bash
./setup.sh
```

The script will:
1. Prompt you for your `sudo` password to cache it for the session.
2. Install necessary system dependencies.
3. Set up R and configure the R package installation path.
4. Install required R packages.
5. Optionally install RStudio Server (if you choose to).

### 4. Follow On-Screen Instructions

The script is interactive and will guide you through the process. For example:
- You will be asked if you want to install RStudio Server.
- The script will automatically configure the R library paths based on your system.

### 5. Verify the Setup

After the script completes, you can verify the setup by starting R and checking the library paths:

```bash
R
```

Inside the R console, run:

```R
.libPaths()
```

This will display the configured library paths, ensuring the setup was successful.

---

## Script Details

The script performs the following tasks:
1. **System Information**: Displays Ubuntu version and CPU information.
2. **System Updates**: Updates the package indices and installs necessary helper packages.
3. **R Installation**: Adds the CRAN repository and installs base R.
4. **R Dependencies**: Installs system dependencies required for R packages.
5. **RStudio Server (Optional)**: Installs RStudio Server if requested.
6. **R Library Path Configuration**: Sets up a custom R library path (`~/pkgR` or `~/pkgRUserLocal`) and writes it to `~/.Rprofile` for persistence.
7. **R Package Installation**: Installs essential R packages like `tidyverse`, `sf`, `terra`, and others.

---

## Notes

- **RStudio Server**: Installation of RStudio Server is optional. If you choose not to install it, you can still use R from the terminal or install RStudio Desktop separately.
- **Custom Library Path**: The script checks if `~/pkgR` exists. If it does, it uses `~/pkgRUserLocal` as the R library path; otherwise, it uses `~/pkgR`.
- **Persistent Configuration**: The R library path is written to `~/.Rprofile`, ensuring it is applied every time R starts.

---

## Troubleshooting

- **Permission Issues**: Ensure you have `sudo` privileges to run the script.
- **Network Issues**: If the script fails to download packages or keys, check your internet connection.
- **R Path Issues**: If `.libPaths()` does not show the expected paths, manually check the `~/.Rprofile` file for correct configuration.

