### view the ubuntu system information

```shell
lsb_release -a
```

### check the cpu information

```
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
```

### setup the system dependencies

```
# update indices
sudo apt update -qq
```

```
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
```

```
# add the signing key (by Michael Rutter) for these repos
# To verify key, run gpg --show-keys /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc 
# Fingerprint: E298A3A825C0D65DFD57CBB651716619E084DAB9
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
```

```
# add the R 4.0 repo from CRAN -- adjust 'focal' to 'groovy' or 'bionic' as needed
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
```

### install base R

```
sudo apt install --no-install-recommends r-base r-base-dev
```

### install Rstudio Server (not necessary)

```
sudo apt install gdebi-core
```

```
# remember to change the ubuntu version number
wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2024.12.0-467-amd64.deb
```

```
sudo gdebi rstudio-server-2024.12.0-467-amd64.deb
```

### setup R packages installation path

```
cd ~
```

```
mkdir -p ~/pkgR
```

```
Rscript -e '.libPaths()'
```

```
Rscript -e '.libPaths(c("~/pkgR", .libPaths()))'
```

```
Rscript -e '.libPaths()'
```

### install R packages dependencies

```
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev
```

```
sudo apt install libudunits2-dev
```

```
sudo apt install libudunits2-dev libgdal-dev libproj-dev
```

### install R packages

```
Rscript -e 'install.packages("devtools")'
```
