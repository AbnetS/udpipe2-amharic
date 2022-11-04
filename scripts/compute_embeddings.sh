#!/bin/sh

[ $# -ge 1 ] || { echo Usage: $0 data_directory embedding_args... >&2; exit 1; }
data="$1"; shift

#for d in $data/*1.0-[a-z]*/; do
for d in $data/*/; do
  case $d in
    */cs_*) model=robeczech-base-last4;;
    *) model=am-roberta;
  esac

  for f in $d*.conllu; do
    [ $f.npz -nt $f ] && continue
    wembedding_service/we_env/Scripts/python wembedding_service/compute_wembeddings.py --format=conllu $f $f.npz --model=$model "$@"
  done
done
