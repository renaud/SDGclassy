#!/bin/bash
set -e     #needed to ignore errors?

d='~/Documents/GitHub/SDGclassy'   #root path
c='cl_base'                        #classifier training data subdirectory

cd "${d}" && \
rm "${d}"/classifier/sources/"${c}"/.DS_Store || true   #we ignore any errors here

mallet import-dir --input "${d}"/classifier/sources"${c}"/  --output "${d}"/classifier/"${c}".mallet --keep-sequence --remove-stopwords --extra-stopwords "${d}"/workshop/extra-exclude-words_alt.txt --keep-sequence-bigrams --gram-sizes 1,2 

mallet train-topics --input "${d}"/classifier/"${c}".mallet --output-state "${d}"/classifier/state/"${c}"-state.gz --output-doc-topics "${d}"/classifier/topics/"${c}"-topics.txt  --output-topic-keys "${d}"/classifier/topics/"${c}"-keys.txt   --optimize-interval 10 --num-topics 18 --output-model "${d}"/classifier/"${c}"-model 

mallet train-topics --input-model "${d}"/classifier/"${c}"-model --inferencer-filename "${d}"/classifier/"${c}"-inferencer.mallet --num-iterations 0  

echo ""${c}" classifier and inferencer created in "${d}"/classifier/"