#Script to extrac conserved genes from the data tables given
#!!!!Make sure to update the names of the different species depending on the new dataset given!!!!
#!!!!Make sure to set the PWD directory before begining to make sure that your input works and the output files go to the correct place!!!

library(dplyr)
library(data.table)

#!!!Update this path to grab the new file containing the phylogenetically sorted species!!!
genes <- readRDS("~/MB599_Project/Genes_proper_order.RDS")

#!!!!For the new data set, these will have to be updated!!!!!

monocots <- c("UniProtID","O. Sativa","Oryza rufipogon","Oryza indica","Oryza nivara","Oryza glaberrima","Oryza barthii","Oryza longistaminata", "Oryza glumaepatula", 
              "Oryza meridionalis","Oryza punctata","Oryza brachyantha", "Musa acuminata","Zea mays","Sorghum bicolor","Setaria italica","Leersia perrieri",
              "Brachypodium distachyon","Aegilops tauschii","Triticum dicoccoides","Triticum urartu","Triticum aestivum", "Hordeum vulgare")

dicots <- c("UniProtID","Beta vulgaris",
            "Nicotiana attenuata","Solanum lycopersicum","Solanum tuberosum", "Helianthus annuus","Daucus carota","Vitis vinifera","Lupinus angustifolius","Trifolium pratense",
            "Medicago truncatula","Vigna radiata","Vigna angularis","Phaseolus vulgaris","Glycine max","Prunus persica","Manihot esculenta",
            "Populus trichocarpa","Cucumis sativus","Brassica oleracea","Brassica rapa","Brassica napus","Arabidopsis halleri","Arabidopsis lyrata",
            "Arabidopsis thaliana","Corchorus capsularis","Gossypium raimondii","Theobroma cacao", "Amborella trichopoda", "Dioscorea rotundata")

lowerplants <- c("UniProtID",
                 "Selaginella moellendorffii","Physcomitrella patens","Ostreococcus lucimarinus","Chlamydomonas reinhardtii","Galdieria sulphuraria",
                 "Cyanidioschyzon merolae","Chondrus crispus")

#Create subsets of the entire gene table containing only each respect taxon
monospec <- genes[monocots]
dispec <- genes[dicots]
lpspec <- genes[lowerplants]

#Create a logical vector for if a specific row (a UniProtID) is complete (i.e. contains no NAs) or not
mono.na <- complete.cases(monospec)
di.na <- complete.cases(dispec)
lp.na <- complete.cases(lpspec)

#Create a new table that contains only conserved genes
monogen <- monospec[mono.na,]
digen <- dispec[di.na,]
lpgen <- lpspec[lp.na]

#Create a vector containing the names of the conserved genes
monogen.vec <- pull(monogen, UniProtID)
digen.vec <- pull(digen, UniProtID)
lpgen.vec <- pull(lpgen, UniProtID)

#Save CSV tables of the outputs generated above
write.csv(monospec, "monospec.csv")
write.csv(dispec, "dispec.csv")
write.csv(lpspec, "lpspec.csv")
write.csv(monogen, "monogen.csv")
write.csv(digen, "digen.csv")
write.csv(lpgen, "lpgen.csv")


