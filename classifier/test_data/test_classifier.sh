#!/bin/bash

set -e     #needed to ignore errors below

s='sdg14'                        					#testing data directory
d='/Users/mlafleur/Projects/SDGclassy/classifier' 		#specify root path
p='test_data'           #specify subdirectory for test
cd "${d}" 

for c in cl_base_new cl_base ;  do 

rm "${d}"/"${s}"/.DS_Store || true   				#we ignore any errors here

mallet import-dir --input "${d}"/"${p}"/"${s}"  --output "${d}"/"${p}"/workshop/test_"${s}"-"${c}".mallet --keep-sequence --remove-stopwords --extra-stopwords "${d}"/"${p}"/workshop/extra-exclude-words_alt.txt --keep-sequence-bigrams --gram-sizes 1,2  --use-pipe-from "${d}"/results/"${c}".mallet   

mallet infer-topics --input "${d}"/"${p}"/workshop/test_"${s}"-"${c}".mallet --inferencer "${d}"/results/"${c}"-inferencer.mallet --output-doc-topics "${d}"/"${p}"/output/scores_"${s}"-"${c}".txt   

continue
echo ""${c}" command sequence finished successfully"

done

