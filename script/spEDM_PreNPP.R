library(spEDM)

npp = terra::rast(system.file("extdata/npp.tif", package = "spEDM"))

pred = as.matrix(merge(seq(10,terra::nrow(npp),10), seq(10,terra::ncol(npp),10)))

startTime = Sys.time()
npp_res = gccm(data = npp,
               cause = "pre",
               effect = "npp",
               libsizes = seq(20,300,20),
               E = 3,
               k = 5,
               tau = 0,
               pred = pred,
               progressbar = TRUE)
endTime = Sys.time()
print(difftime(endTime,startTime, units ="mins"))

npp_res

plot(npp_res)


