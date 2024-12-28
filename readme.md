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



