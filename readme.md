### view the ubuntu system information

```shell
lsb_release -a
```

### check the cpu information

```
cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c
```

### install base R

```
sudo apt update
```

```
sudo apt install r-base r-base-dev
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

### install R packages

```
sudo apt install libcurl4-openssl-dev libssl-dev libxml2-dev
```

```
sudo apt install libudunits2-dev
```

```
sudo apt install libudunits2-dev libgdal-dev libproj-dev
```

