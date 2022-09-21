rm(list=ls())
setwd("/Users/jz/Documents/Project/SingleCell/HiC/PFC/")
library(data.table)
options(scipen=999)

rel=1000000
library(matrixStats)

file_raw_bin=paste("hg38-raw-bin-",rel, ".txt",sep="")
file_used_bin=paste("gap.blacklist.hg38.",rel, ".4col.autosomal.bed",sep="")
file_mat_brg=paste("sigMat.BrainGVEX.bin.",rel, ".txt",sep="")
file_mat_HFC=paste("sigMat.HumanFC.bin.",rel, ".txt",sep="")

d_bin_raw <- fread(file_raw_bin,header = F, sep="\t")
d_bin_used <- fread(file_used_bin,header = F, sep="\t")
colnames(d_bin_raw) <- c("chr","start","end","name")
colnames(d_bin_used) <- c("chr","start","end","name")


d_mat_brg=as.matrix(fread(file_mat_brg,header = F, sep="\t"))
d_mat_hfc=as.matrix(fread(file_mat_HFC,header = F, sep="\t"))
d_mat_brg <- d_mat_brg[,1:(ncol(d_mat_brg)-1)] #/*last line is empty*/
d_mat_hfc <- d_mat_hfc[,1:(ncol(d_mat_hfc)-1)] #/*last line is empty*/

d_mat_brg_norm <- t(scale(t(d_mat_brg), scale = T, center = T))
d_mat_hfc_norm <- t(scale(t(d_mat_hfc), scale = T, center = T))

summary(rowSds(d_mat_brg_norm))
summary(rowSums(d_mat_brg_norm))

file_out = paste("bulk.atac.brg.norm.",rel,".txt",sep="")
fwrite(data.frame(d_mat_brg_norm), file = file_out, append = F, quote = F,
       sep = "\t",row.names = FALSE, col.names = F)

file_out = paste("bulk.atac.hfc.norm.",rel,".txt",sep="")
fwrite(data.frame(d_mat_hfc_norm), file = file_out, append = F, quote = F,
       sep = "\t",row.names = FALSE, col.names = F)



chr=15
hic_prefix="PFCMergeBulk"
hic_norm_method="KR"
path_eign="/Users/jz/Documents/Project/SingleCell/HiC/PFC/Eigen"
file_eign=paste(path_eign,'/',"eign.",hic_prefix,".",hic_norm_method,
                ".",rel,".",chr,".txt",sep="")
d_eign=fread(file_eign,header=F, sep="\t")


#/*=== only keep the useful eignen vector ===*/ 
idx_tmp <- which(d_bin_raw$chr== paste("chr",chr,sep=""))
tmp <- d_bin_raw[idx_tmp,]
idx_bin_eign <- which(is.element(tmp$name,d_bin_used$name))
idx_bin_matSig <- which(d_bin_used$chr==paste("chr",chr,sep=""))

mat_sel_brg <- d_mat_brg_norm[,idx_bin_matSig]
mat_sel_hfc <- d_mat_hfc_norm[,idx_bin_matSig]
x_eign <- d_eign$V1[idx_bin_eign]
x_eign_norm <- scale(x_eign, scale = T, center = T)


par(mfrow=c(2,1))
plot(x_eign_norm, type = "b", main="Hi-C")
abline(h=0,col="red")
plot(colMeans(mat_sel_hfc), type = "b", ylim=c(-1,1), main=paste("mean humanFC chr", chr))
abline(h=0,col="red")


i=20
par(mfrow=c(2,1))
plot(x_eign_norm, type = "b", main="Hi-C")
abline(h=0,col="red")
plot(mat_sel_hfc[i,], type = "b", ylim=c(-1.5,1.5),
     main=paste("humanFC sample",i,"chr",chr))
abline(h=0,col="red")

par(mfrow=c(2,1))
plot(x_eign_norm, type = "b", main=paste("Hi-C chr",chr))
abline(h=0,col="red")
plot(colMeans(mat_sel_brg), type = "b", ylim=c(-1,1),
     main=paste("brain gvc sample",i,"chr",chr))
abline(h=0,col="red")


i=12
par(mfrow=c(2,1))
plot(x_eign_norm, type = "b", main="Hi-C")
abline(h=0,col="red")
plot(mat_sel_brg[i,], type = "b", ylim=c(-1.5,1.5), 
     main = paste("brain gvc sample",i,"chr",chr))
abline(h=0,col="red")

######################### correlation based #############################

#/*========= start from scratch ==========*/
rm(list=ls())
setwd("/Users/jz/Documents/Project/SingleCell/HiC/PFC/")
library(data.table)
options(scipen=999)

rel=1000000
library(matrixStats)

file_raw_bin=paste("hg38-raw-bin-",rel, ".txt",sep="")
file_used_bin=paste("gap.blacklist.hg38.",rel, ".4col.autosomal.bed",sep="")
file_mat_brg=paste("sigMat.BrainGVEX.bin.",rel, ".txt",sep="")
file_mat_HFC=paste("sigMat.HumanFC.bin.",rel, ".txt",sep="")

d_bin_raw <- fread(file_raw_bin,header = F, sep="\t")
d_bin_used <- fread(file_used_bin,header = F, sep="\t")
colnames(d_bin_raw) <- c("chr","start","end","name")
colnames(d_bin_used) <- c("chr","start","end","name")


d_mat_brg=as.matrix(fread(file_mat_brg,header = F, sep="\t"))
d_mat_hfc=as.matrix(fread(file_mat_HFC,header = F, sep="\t"))
d_mat_brg <- d_mat_brg[,1:(ncol(d_mat_brg)-1)]
d_mat_hfc <- d_mat_hfc[,1:(ncol(d_mat_hfc)-1)]

d_mat_brg_norm <- t(scale(t(d_mat_brg), scale = T, center = T))
d_mat_hfc_norm <- t(scale(t(d_mat_hfc), scale = T, center = T))

summary(rowSds(d_mat_brg_norm))
summary(rowSums(d_mat_brg_norm))

file <- paste(path_file,"BRG.vs.HFC.human.EignPlot.",rel,".bulkATAC.normCor.pdf",sep="")
pdf(file, height = 6, width = 8)
par(mfrow=c(2,1))
for (i in 1:22){
  chr=i
  print(chr)
  hic_prefix="PFCMergeBulk"
  hic_norm_method="KR"
  path_eign="/Users/jz/Documents/Project/SingleCell/HiC/PFC/Eigen"
  file_eign=paste(path_eign,'/',"eign.",hic_prefix,".",hic_norm_method,
                  ".",rel,".",chr,".txt",sep="")
  d_eign=fread(file_eign,header=F, sep="\t")
  
  #/*=== only keep the useful eignen vector ===*/ 
  idx_tmp <- which(d_bin_raw$chr== paste("chr",chr,sep=""))
  tmp <- d_bin_raw[idx_tmp,]
  idx_bin_eign <- which(is.element(tmp$name,d_bin_used$name))
  idx_bin_matSig <- which(d_bin_used$chr==paste("chr",chr,sep=""))
  
  mat_sel_brg <- d_mat_brg_norm[,idx_bin_matSig]
  mat_sel_hfc <- d_mat_hfc_norm[,idx_bin_matSig]
  x_eign <- d_eign$V1[idx_bin_eign]
  x_eign_norm <- scale(x_eign, scale = T, center = T)
  
  #/*=== remove the NAs from Hi-C===*/
  
  idx.keep <- which(!is.na(x_eign_norm))
  x_eign_norm <- x_eign_norm[idx.keep]
  mat_sel_brg <- mat_sel_brg[,idx.keep]
  mat_sel_hfc <- mat_sel_hfc[,idx.keep]
  
  
  cor_mat_brg <- cor(mat_sel_brg)
  cor_mat_hfc <- cor(mat_sel_hfc)
  colnames(cor_mat_brg) <- 1:ncol(cor_mat_brg)
  rownames(cor_mat_brg) <- 1:nrow(cor_mat_brg)
  colnames(cor_mat_hfc) <- 1:ncol(cor_mat_hfc)
  rownames(cor_mat_hfc) <- 1:nrow(cor_mat_hfc)
  
  path_out="/Users/jz/Documents/Project/SingleCell/HiC/PFC/Share2ZHD/"
  file_out <- paste(path_out, "brg.normalized.sig.mat.chr",chr,".rel",rel,".txt", sep="")
  write.table(mat_sel_brg, file = file_out, append = F, quote = F, sep = "\t",
              eol = "\n", na = "NA", dec = ".", row.names = F,
              col.names = F)
  
  file_out <- paste(path_out, "hfc.normalized.sig.mat.chr",chr,".rel",rel,".txt", sep="")
  write.table(mat_sel_hfc, file = file_out, append = F, quote = F, sep = "\t",
              eol = "\n", na = "NA", dec = ".", row.names = F,
              col.names = F)

  file_out <- paste(path_out, "eigen.matched.normalized",chr,".rel",rel,".txt", sep="")
  write.table(x_eign_norm, file = file_out, append = F, quote = F, sep = "\t",
              eol = "\n", na = "NA", dec = ".", row.names = F,
              col.names = F)
  
  
  library(reshape2)
  library(ggplot2)

  # merge_corr_mat <- cor_mat_brg 
  # #/*------ replace the upper mat to hfc ------*/
  # merge_corr_mat[upper.tri(merge_corr_mat)] <- cor_mat_hfc[upper.tri(cor_mat_hfc)]
  # library(ggcorrplot)
  # path_file="/Users/jz/Documents/Project/SingleCell/HiC/PFC/Plots/"
  # file <- paste(path_file,"BRG.vs.HFC.human.hybridHeatMap.chr",chr,".",rel,".bulkATAC.normCor.pdf",sep="")
  # pdf(file, height = 6, width = 6)
  # ggcorrplot(merge_corr_mat,
  #            outline.col = "white",
  #            ggtheme = ggplot2::theme_gray,
  #            colors = c("#6D9EC1", "white", "#E46726")) 
  # dev.off()
    
  
  ev_brg <- eigen(cor_mat_brg)
  eigen_cor_brg_nrom <- scale(ev_brg$vectors[,1])
  ev_hfc <- eigen(cor_mat_hfc)
  eigen_cor_hfc_nrom <- scale(ev_hfc$vectors[,1])

  cor_sign <- cor(x_eign_norm,eigen_cor_brg_nrom)
  if(cor_sign>0){
    plot(x_eign_norm, type="l",  ylim = c(-1.5,1.5), 
         main=paste(chr,"chr"," BRG", sep=""))
    lines(eigen_cor_brg_nrom, type="l",col=3)
    abline(h=0,col=2,lty=5)
  }else{
    plot(x_eign_norm, type="l",  ylim = c(-1.5,1.5))
    lines(-eigen_cor_brg_nrom, type="l",col=3)
    abline(h=0,col=2,lty=5)
  }
  
  cor_sign <- cor(x_eign_norm,eigen_cor_hfc_nrom)
  if(cor_sign>0){
    plot(x_eign_norm, type="l",  ylim = c(-1.5,1.5), 
         main=paste(chr,"chr"," HFC", sep=""))
    lines(eigen_cor_hfc_nrom, type="l",col=3)
    abline(h=0,col=2,lty=5)
  }else{
    plot(x_eign_norm, type="l",  ylim = c(-1.5,1.5))
    lines(-eigen_cor_hfc_nrom, type="l",col=3)
    abline(h=0,col=2,lty=5)
  }
}
dev.off()



