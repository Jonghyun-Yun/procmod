#!/usr/bin/env bash
# out_dir="party_invitations-1/"
# out_dir="cd_tally/"
# out_dir="sprained_ankle-1/"
# prename="R/party_invitations-1-preprocess.R"
# initname="R/party_invitations-1-init.R"

# first argument = output dir
out_dir=$1
n_chain=2
figlet "running MCMC"

echo "================================"
echo "output dir:" $out_dir
echo "preprocessing:" $prename
echo "initializing:" $initname
echo "n_chain:" $n_chain
echo "================================"

export STAN_NUM_THREADS=2
mkdir -p output
rm output/*
# rm input/*

# Rscript $prename
cp -r input output/
cp run.sh output/
# cp $prename output/
# cp $initname output/

for ((v = 1; v <= $n_chain; v++))
do
    # Rscript $initname
    ./main $v 10000 10000 10 parallel
done
## main function argument
 # chain #, iteration, burn-in, thin
 # parallel serial -> parallel computation?

mkdir -p $out_dir
mv output/* $out_dir
# Rscript R/run-analysis.R $out_dir $n_chain
echo "Outputs are moved to" $out_dir"."
echo "================================"
