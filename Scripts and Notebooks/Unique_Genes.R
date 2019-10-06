library(dplyr)

#Create a logical vector containing all genes which have no NAs across all species:
no_na <- complete.cases(genes_row)
#Index all genes by those which contain no NAs
no_na_genes <- genes_row[no_na,]

#First extract only the rice using a vector which contains only the names of rice species
rice_species <- genes_row[ricenames]
#Find genes which contain no NAs for just the rice
no_na_rice <- complete.cases(rice_species)
#Index all rice genes by those that are conserved across all rice species
no_na_rice <- rice_species[no_na_rice,]

#!!!This next section doesnt really work!!!

#Create a vector of the genes which are fully conserved across all rice species
rice_conserved_genes <- rownames(no_na_rice)
#Index the entire dataframe to include only the genes which are present in rice
rice_conserved_genes_all <- genes_row[rice_conserved_genes,]
#Remove genes which are fully conserved across ALL species
no_na_rice_uniqe  <- complete.cases(rice_conserved_genes_all)
rcga <- rice_conserved_genes_all[!no_na_rice_uniqe,]
#Remove the rice species from the list
rcga_norice <- select(rcga, names_no_rice)
#Create vectore of genes which do not have NAs
ricga_norice_no_na <- complete.cases(rcga_norice)
#Find only genes which there are NAs for all species




