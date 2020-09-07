# GO_Gene_Map
Mapping Human genes corresponding to each GO:ID and creating table with unique genes corresponding to each GO:ID

## Step1 : Map genes and GO using 
This is achieved using the Bioconductor package "org.Hs.eg.db". (Script MAP_GO_Gene.R)

```
library(org.Hs.eg.db)
library(data.table)
keys <- keys(org.Hs.eg.db)
Gene_GO_Information<-AnnotationDbi::select(org.Hs.eg.db, keys=keys, column=c("SYMBOL","GOALL","ENSEMBL"), keytype="ENTREZID")
setDT(Gene_GO_Information, keep.rownames = "SI")
write.table(Gene_GO_Information,file="Gene_GO_Information_org.Hs.eg.db.txt",sep = "\t",row.names = F)
sessionInfo()

````

## Step2 : Make Simple table 
Using simple custom perl script parse and create Table with all the unique genes corresponding to each GOID
```
perl Make_GO_Table.pl

```
