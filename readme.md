### view the ubuntu system information

```shell
lsb_release -a
```

### check the cpu information

```
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
```

### set the system dependencies

```
# update indices
sudo apt update -qq
```

```
# install two helper packages we need
sudo apt install --no-install-recommends software-properties-common dirmngr
```

```
# setup the gcc compiler
sudo apt install build-essential gfortran -y
```

### install base R

```
sudo apt install --no-install-recommends r-base r-base-dev
```

### install Rstudio Server

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


