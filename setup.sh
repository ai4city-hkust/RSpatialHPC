#!/bin/bash

# Prompt the user to enter their sudo password and cache it
echo "Please enter your sudo password to continue. It will be cached for a short time."
sudo ls > /dev/null 2>&1  # This will prompt for the password and cache it

# Check if the password was successfully cached
if [ $? -ne 0 ]; then
    echo "Failed to cache sudo password. Exiting."
    exit 1
fi

# View Ubuntu system information
echo "Viewing Ubuntu system information..."
lsb_release -a

# Check CPU information
echo "Checking CPU information..."
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c

# Update system indices
echo "Updating system indices..."
sudo apt update -qq

# Install necessary helper packages
echo "Installing helper packages..."
sudo apt install --no-install-recommends software-properties-common dirmngr -y

# Add the R project signing key
echo "Adding R project signing key..."
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# Add the R 4.0 repository
echo "Adding R 4.0 repository..."
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# Install base R
echo "Installing base R..."
sudo apt install --no-install-recommends r-base r-base-dev -y

# Install R package dependencies
echo "Installing R package dependencies..."
sudo apt install libfontconfig1-dev libcurl4-openssl-dev libssl-dev libxml2-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev -y

# Add ubuntugis unstable PPA
echo "Adding ubuntugis unstable PPA..."
sudo add-apt-repository ppa:ubuntugis/ubuntugis-unstable -y

# Install additional R package dependencies
echo "Installing additional R package dependencies..."
sudo apt install libudunits2-dev libgdal-dev libgeos-dev libproj-dev libsqlite0-dev -y

# Ask the user if they want to install RStudio Server
read -p "Do you want to install RStudio Server? (y/n): " install_rstudio
if [[ "$install_rstudio" =~ ^[Yy]$ ]]; then
    echo "Installing RStudio Server..."
    sudo apt install gdebi-core -y
    wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2024.12.0-467-amd64.deb
    sudo gdebi rstudio-server-2024.12.0-467-amd64.deb -n
else
    echo "Skipping RStudio Server installation."
fi

# Set up R package installation path
echo "Setting up R package installation path..."
cd ~

# Check if ~/pkgR exists
if [ -d "~/pkgR" ]; then
    echo "Directory ~/pkgR already exists. Using ~/pkgRUserLocal instead."
    mkdir -p ~/pkgRUserLocal
    R_LIB_PATH="~/pkgRUserLocal"
else
    echo "Directory ~/pkgR does not exist. Using ~/pkgR."
    mkdir -p ~/pkgR
    R_LIB_PATH="~/pkgR"
fi

# Write the .libPaths() configuration to ~/.Rprofile
echo "Configuring .libPaths() in ~/.Rprofile..."
echo ".libPaths(c(\"$R_LIB_PATH\", .libPaths()))" >> ~/.Rprofile

# Verify the .Rprofile configuration
echo "Current ~/.Rprofile content:"
cat ~/.Rprofile

# Restart R to apply the new .libPaths() settings
echo "Restarting R to apply the new library paths..."
Rscript -e 'quit(save="no")'

# Install R packages
echo "Installing R packages..."
Rscript -e 'install.packages("devtools")'
Rscript -e 'install.packages("tidyverse")'
Rscript -e 'install.packages(c("sf","terra"), dep = TRUE)'
Rscript -e 'install.packages(c("sdsfun","gdverse","geocomplexity", "spEDM", "itmsa"), dep = TRUE)'

echo "All tasks completed!"