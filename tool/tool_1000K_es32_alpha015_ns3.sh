#!/bin/bash
#SBATCH --job-name=VERSE       # Job name
#SBATCH --nodes=1                 # Number of nodes
#SBATCH --cpus-per-task=32       # CPU cores/threads
#SBATCH --gres=gpu:1              # Number of GPUs (per node)
#SBATCH --mem=400000M               # memory (per node)
#SBATCH --time=0-30:00            # time (DD-HH:MM)
#SBATCH --partition=zhanglab.p    # use zhanglab partition
#SBATCH --output=./log/alpha015_ns3/verse_sbatch_1000K_es32.log       # Standard output

echo -e "Running VERSE 1000K_CON_all_cell_type on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_all_cell_type -g corr
echo -e "1000K_CON_all_cell_type: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_all_cell_type: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_all_cell_type: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_all_cell_type -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_all_cell_type: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Ast_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Ast_raw -g corr
echo -e "1000K_CON_Ast_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Ast_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Ast_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Ast_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Ast_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Ast_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Ast_20_metacell -g corr
echo -e "1000K_CON_Ast_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Ast_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Ast_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Ast_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Ast_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Ast_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Ast_50_metacell -g corr
echo -e "1000K_CON_Ast_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Ast_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Ast_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Ast_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Ast_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Ast_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Ast_100_metacell -g corr
echo -e "1000K_CON_Ast_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Ast_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Ast_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Ast_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Ast_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Ast_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Ast_150_metacell -g corr
echo -e "1000K_CON_Ast_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Ast_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Ast_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Ast_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Ast_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Ast_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Ast_200_metacell -g corr
echo -e "1000K_CON_Ast_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Ast_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Ast_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Ast_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Ast_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_CON_End_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_End_raw -g corr
echo -e "1000K_CON_End_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_End_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_End_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_End_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_End_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_End_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_End_20_metacell -g corr
echo -e "1000K_CON_End_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_End_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_End_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_End_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_End_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_End_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_End_50_metacell -g corr
echo -e "1000K_CON_End_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_End_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_End_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_End_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_End_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_End_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_End_100_metacell -g corr
echo -e "1000K_CON_End_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_End_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_End_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_End_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_End_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_End_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_End_150_metacell -g corr
echo -e "1000K_CON_End_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_End_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_End_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_End_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_End_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_End_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_End_200_metacell -g corr
echo -e "1000K_CON_End_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_End_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_End_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_End_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_End_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"


################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_CON_Exc_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Exc_raw -g corr
echo -e "1000K_CON_Exc_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Exc_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Exc_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Exc_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Exc_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Exc_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Exc_20_metacell -g corr
echo -e "1000K_CON_Exc_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Exc_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Exc_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Exc_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Exc_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Exc_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Exc_50_metacell -g corr
echo -e "1000K_CON_Exc_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Exc_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Exc_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Exc_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Exc_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Exc_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Exc_100_metacell -g corr
echo -e "1000K_CON_Exc_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Exc_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Exc_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Exc_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Exc_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Exc_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Exc_150_metacell -g corr
echo -e "1000K_CON_Exc_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Exc_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Exc_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Exc_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Exc_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Exc_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Exc_200_metacell -g corr
echo -e "1000K_CON_Exc_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Exc_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Exc_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Exc_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Exc_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_CON_Inh_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Inh_raw -g corr
echo -e "1000K_CON_Inh_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Inh_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Inh_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Inh_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Inh_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Inh_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Inh_20_metacell -g corr
echo -e "1000K_CON_Inh_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Inh_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Inh_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Inh_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Inh_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Inh_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Inh_50_metacell -g corr
echo -e "1000K_CON_Inh_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Inh_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Inh_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Inh_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Inh_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Inh_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Inh_100_metacell -g corr
echo -e "1000K_CON_Inh_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Inh_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Inh_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Inh_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Inh_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Inh_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Inh_150_metacell -g corr
echo -e "1000K_CON_Inh_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Inh_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Inh_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Inh_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Inh_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Inh_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Inh_200_metacell -g corr
echo -e "1000K_CON_Inh_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Inh_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Inh_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Inh_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Inh_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_CON_Mic_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Mic_raw -g corr
echo -e "1000K_CON_Mic_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Mic_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Mic_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Mic_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Mic_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Mic_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Mic_20_metacell -g corr
echo -e "1000K_CON_Mic_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Mic_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Mic_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Mic_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Mic_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Mic_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Mic_50_metacell -g corr
echo -e "1000K_CON_Mic_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Mic_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Mic_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Mic_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Mic_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Mic_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Mic_100_metacell -g corr
echo -e "1000K_CON_Mic_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Mic_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Mic_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Mic_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Mic_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Mic_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Mic_150_metacell -g corr
echo -e "1000K_CON_Mic_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Mic_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Mic_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Mic_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Mic_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Mic_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Mic_200_metacell -g corr
echo -e "1000K_CON_Mic_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Mic_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Mic_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Mic_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Mic_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_CON_Olig_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Olig_raw -g corr
echo -e "1000K_CON_Olig_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Olig_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Olig_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Olig_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Olig_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Olig_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Olig_20_metacell -g corr
echo -e "1000K_CON_Olig_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Olig_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Olig_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Olig_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Olig_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Olig_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Olig_50_metacell -g corr
echo -e "1000K_CON_Olig_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Olig_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Olig_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Olig_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Olig_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Olig_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Olig_100_metacell -g corr
echo -e "1000K_CON_Olig_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Olig_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Olig_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Olig_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Olig_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Olig_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Olig_150_metacell -g corr
echo -e "1000K_CON_Olig_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Olig_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Olig_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Olig_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Olig_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_Olig_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_Olig_200_metacell -g corr
echo -e "1000K_CON_Olig_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_Olig_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_Olig_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_Olig_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_Olig_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_CON_OPC_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_OPC_raw -g corr
echo -e "1000K_CON_OPC_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_OPC_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_OPC_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_OPC_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_OPC_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_OPC_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_OPC_20_metacell -g corr
echo -e "1000K_CON_OPC_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_OPC_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_OPC_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_OPC_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_OPC_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_OPC_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_OPC_50_metacell -g corr
echo -e "1000K_CON_OPC_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_OPC_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_OPC_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_OPC_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_OPC_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_OPC_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_OPC_100_metacell -g corr
echo -e "1000K_CON_OPC_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_OPC_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_OPC_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_OPC_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_OPC_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_OPC_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_OPC_150_metacell -g corr
echo -e "1000K_CON_OPC_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_OPC_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_OPC_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_OPC_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_OPC_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_CON_OPC_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_CON_OPC_200_metacell -g corr
echo -e "1000K_CON_OPC_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_CON_OPC_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_CON_OPC_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_CON_OPC_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_CON_OPC_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_MDD_all_cell_type on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_all_cell_type -g corr
echo -e "1000K_MDD_all_cell_type: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_all_cell_type: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_all_cell_type: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_all_cell_type -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_all_cell_type: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Ast_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Ast_raw -g corr
echo -e "1000K_MDD_Ast_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Ast_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Ast_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Ast_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Ast_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Ast_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Ast_20_metacell -g corr
echo -e "1000K_MDD_Ast_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Ast_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Ast_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Ast_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Ast_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Ast_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Ast_50_metacell -g corr
echo -e "1000K_MDD_Ast_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Ast_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Ast_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Ast_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Ast_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Ast_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Ast_100_metacell -g corr
echo -e "1000K_MDD_Ast_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Ast_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Ast_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Ast_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Ast_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Ast_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Ast_150_metacell -g corr
echo -e "1000K_MDD_Ast_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Ast_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Ast_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Ast_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Ast_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Ast_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Ast_200_metacell -g corr
echo -e "1000K_MDD_Ast_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Ast_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Ast_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Ast_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Ast_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_MDD_End_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_End_raw -g corr
echo -e "1000K_MDD_End_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_End_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_End_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_End_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_End_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_End_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_End_20_metacell -g corr
echo -e "1000K_MDD_End_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_End_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_End_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_End_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_End_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_End_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_End_50_metacell -g corr
echo -e "1000K_MDD_End_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_End_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_End_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_End_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_End_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_End_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_End_100_metacell -g corr
echo -e "1000K_MDD_End_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_End_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_End_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_End_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_End_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_End_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_End_150_metacell -g corr
echo -e "1000K_MDD_End_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_End_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_End_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_End_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_End_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_End_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_End_200_metacell -g corr
echo -e "1000K_MDD_End_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_End_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_End_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_End_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_End_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"


################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_MDD_Exc_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Exc_raw -g corr
echo -e "1000K_MDD_Exc_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Exc_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Exc_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Exc_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Exc_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Exc_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Exc_20_metacell -g corr
echo -e "1000K_MDD_Exc_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Exc_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Exc_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Exc_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Exc_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Exc_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Exc_50_metacell -g corr
echo -e "1000K_MDD_Exc_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Exc_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Exc_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Exc_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Exc_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Exc_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Exc_100_metacell -g corr
echo -e "1000K_MDD_Exc_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Exc_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Exc_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Exc_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Exc_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Exc_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Exc_150_metacell -g corr
echo -e "1000K_MDD_Exc_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Exc_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Exc_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Exc_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Exc_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Exc_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Exc_200_metacell -g corr
echo -e "1000K_MDD_Exc_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Exc_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Exc_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Exc_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Exc_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_MDD_Inh_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Inh_raw -g corr
echo -e "1000K_MDD_Inh_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Inh_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Inh_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Inh_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Inh_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Inh_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Inh_20_metacell -g corr
echo -e "1000K_MDD_Inh_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Inh_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Inh_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Inh_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Inh_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Inh_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Inh_50_metacell -g corr
echo -e "1000K_MDD_Inh_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Inh_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Inh_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Inh_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Inh_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Inh_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Inh_100_metacell -g corr
echo -e "1000K_MDD_Inh_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Inh_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Inh_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Inh_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Inh_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Inh_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Inh_150_metacell -g corr
echo -e "1000K_MDD_Inh_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Inh_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Inh_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Inh_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Inh_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Inh_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Inh_200_metacell -g corr
echo -e "1000K_MDD_Inh_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Inh_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Inh_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Inh_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Inh_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_MDD_Mic_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Mic_raw -g corr
echo -e "1000K_MDD_Mic_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Mic_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Mic_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Mic_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Mic_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Mic_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Mic_20_metacell -g corr
echo -e "1000K_MDD_Mic_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Mic_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Mic_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Mic_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Mic_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Mic_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Mic_50_metacell -g corr
echo -e "1000K_MDD_Mic_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Mic_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Mic_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Mic_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Mic_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Mic_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Mic_100_metacell -g corr
echo -e "1000K_MDD_Mic_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Mic_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Mic_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Mic_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Mic_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Mic_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Mic_150_metacell -g corr
echo -e "1000K_MDD_Mic_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Mic_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Mic_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Mic_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Mic_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Mic_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Mic_200_metacell -g corr
echo -e "1000K_MDD_Mic_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Mic_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Mic_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Mic_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Mic_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_MDD_Olig_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Olig_raw -g corr
echo -e "1000K_MDD_Olig_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Olig_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Olig_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Olig_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Olig_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Olig_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Olig_20_metacell -g corr
echo -e "1000K_MDD_Olig_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Olig_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Olig_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Olig_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Olig_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Olig_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Olig_50_metacell -g corr
echo -e "1000K_MDD_Olig_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Olig_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Olig_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Olig_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Olig_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Olig_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Olig_100_metacell -g corr
echo -e "1000K_MDD_Olig_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Olig_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Olig_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Olig_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Olig_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Olig_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Olig_150_metacell -g corr
echo -e "1000K_MDD_Olig_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Olig_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Olig_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Olig_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Olig_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_Olig_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_Olig_200_metacell -g corr
echo -e "1000K_MDD_Olig_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_Olig_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_Olig_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_Olig_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_Olig_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_MDD_OPC_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_OPC_raw -g corr
echo -e "1000K_MDD_OPC_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_OPC_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_OPC_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_OPC_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_OPC_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_OPC_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_OPC_20_metacell -g corr
echo -e "1000K_MDD_OPC_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_OPC_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_OPC_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_OPC_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_OPC_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_OPC_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_OPC_50_metacell -g corr
echo -e "1000K_MDD_OPC_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_OPC_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_OPC_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_OPC_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_OPC_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_OPC_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_OPC_100_metacell -g corr
echo -e "1000K_MDD_OPC_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_OPC_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_OPC_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_OPC_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_OPC_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_OPC_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_OPC_150_metacell -g corr
echo -e "1000K_MDD_OPC_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_OPC_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_OPC_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_OPC_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_OPC_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_MDD_OPC_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_MDD_OPC_200_metacell -g corr
echo -e "1000K_MDD_OPC_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_MDD_OPC_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_MDD_OPC_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_MDD_OPC_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_MDD_OPC_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_PTSD_all_cell_type on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_all_cell_type -g corr
echo -e "1000K_PTSD_all_cell_type: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_all_cell_type: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_all_cell_type: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_all_cell_type -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_all_cell_type: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Ast_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Ast_raw -g corr
echo -e "1000K_PTSD_Ast_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Ast_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Ast_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Ast_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Ast_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Ast_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Ast_20_metacell -g corr
echo -e "1000K_PTSD_Ast_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Ast_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Ast_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Ast_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Ast_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Ast_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Ast_50_metacell -g corr
echo -e "1000K_PTSD_Ast_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Ast_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Ast_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Ast_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Ast_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Ast_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Ast_100_metacell -g corr
echo -e "1000K_PTSD_Ast_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Ast_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Ast_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Ast_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Ast_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Ast_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Ast_150_metacell -g corr
echo -e "1000K_PTSD_Ast_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Ast_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Ast_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Ast_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Ast_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Ast_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Ast_200_metacell -g corr
echo -e "1000K_PTSD_Ast_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Ast_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Ast_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Ast_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Ast_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_PTSD_End_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_End_raw -g corr
echo -e "1000K_PTSD_End_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_End_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_End_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_End_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_End_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_End_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_End_20_metacell -g corr
echo -e "1000K_PTSD_End_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_End_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_End_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_End_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_End_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_End_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_End_50_metacell -g corr
echo -e "1000K_PTSD_End_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_End_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_End_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_End_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_End_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_End_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_End_100_metacell -g corr
echo -e "1000K_PTSD_End_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_End_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_End_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_End_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_End_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_End_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_End_150_metacell -g corr
echo -e "1000K_PTSD_End_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_End_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_End_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_End_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_End_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_End_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_End_200_metacell -g corr
echo -e "1000K_PTSD_End_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_End_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_End_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_End_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_End_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"


################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_PTSD_Exc_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Exc_raw -g corr
echo -e "1000K_PTSD_Exc_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Exc_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Exc_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Exc_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Exc_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Exc_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Exc_20_metacell -g corr
echo -e "1000K_PTSD_Exc_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Exc_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Exc_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Exc_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Exc_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Exc_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Exc_50_metacell -g corr
echo -e "1000K_PTSD_Exc_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Exc_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Exc_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Exc_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Exc_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Exc_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Exc_100_metacell -g corr
echo -e "1000K_PTSD_Exc_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Exc_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Exc_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Exc_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Exc_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Exc_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Exc_150_metacell -g corr
echo -e "1000K_PTSD_Exc_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Exc_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Exc_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Exc_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Exc_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Exc_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Exc_200_metacell -g corr
echo -e "1000K_PTSD_Exc_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Exc_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Exc_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Exc_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Exc_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_PTSD_Inh_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Inh_raw -g corr
echo -e "1000K_PTSD_Inh_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Inh_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Inh_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Inh_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Inh_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Inh_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Inh_20_metacell -g corr
echo -e "1000K_PTSD_Inh_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Inh_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Inh_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Inh_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Inh_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Inh_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Inh_50_metacell -g corr
echo -e "1000K_PTSD_Inh_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Inh_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Inh_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Inh_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Inh_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Inh_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Inh_100_metacell -g corr
echo -e "1000K_PTSD_Inh_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Inh_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Inh_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Inh_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Inh_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Inh_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Inh_150_metacell -g corr
echo -e "1000K_PTSD_Inh_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Inh_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Inh_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Inh_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Inh_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Inh_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Inh_200_metacell -g corr
echo -e "1000K_PTSD_Inh_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Inh_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Inh_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Inh_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Inh_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_PTSD_Mic_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Mic_raw -g corr
echo -e "1000K_PTSD_Mic_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Mic_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Mic_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Mic_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Mic_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Mic_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Mic_20_metacell -g corr
echo -e "1000K_PTSD_Mic_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Mic_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Mic_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Mic_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Mic_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Mic_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Mic_50_metacell -g corr
echo -e "1000K_PTSD_Mic_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Mic_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Mic_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Mic_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Mic_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Mic_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Mic_100_metacell -g corr
echo -e "1000K_PTSD_Mic_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Mic_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Mic_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Mic_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Mic_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Mic_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Mic_150_metacell -g corr
echo -e "1000K_PTSD_Mic_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Mic_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Mic_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Mic_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Mic_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Mic_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Mic_200_metacell -g corr
echo -e "1000K_PTSD_Mic_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Mic_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Mic_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Mic_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Mic_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_PTSD_Olig_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Olig_raw -g corr
echo -e "1000K_PTSD_Olig_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Olig_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Olig_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Olig_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Olig_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Olig_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Olig_20_metacell -g corr
echo -e "1000K_PTSD_Olig_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Olig_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Olig_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Olig_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Olig_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Olig_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Olig_50_metacell -g corr
echo -e "1000K_PTSD_Olig_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Olig_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Olig_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Olig_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Olig_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Olig_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Olig_100_metacell -g corr
echo -e "1000K_PTSD_Olig_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Olig_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Olig_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Olig_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Olig_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Olig_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Olig_150_metacell -g corr
echo -e "1000K_PTSD_Olig_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Olig_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Olig_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Olig_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Olig_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_Olig_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_Olig_200_metacell -g corr
echo -e "1000K_PTSD_Olig_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_Olig_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_Olig_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_Olig_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_Olig_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"

################################################################################################################################################################################################
################################################################################################################################################################################################
################################################################################################################################################################################################

echo -e "Running VERSE 1000K_PTSD_OPC_raw on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_OPC_raw -g corr
echo -e "1000K_PTSD_OPC_raw: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_OPC_raw: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_OPC_raw: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_OPC_raw -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_OPC_raw: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_OPC_20_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_OPC_20_metacell -g corr
echo -e "1000K_PTSD_OPC_20_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_OPC_20_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_OPC_20_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_OPC_20_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_OPC_20_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_OPC_50_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_OPC_50_metacell -g corr
echo -e "1000K_PTSD_OPC_50_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_OPC_50_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_OPC_50_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_OPC_50_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_OPC_50_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_OPC_100_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_OPC_100_metacell -g corr
echo -e "1000K_PTSD_OPC_100_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_OPC_100_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_OPC_100_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_OPC_100_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_OPC_100_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_OPC_150_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_OPC_150_metacell -g corr
echo -e "1000K_PTSD_OPC_150_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_OPC_150_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_OPC_150_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_OPC_150_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_OPC_150_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n"

echo -e "Running VERSE 1000K_PTSD_OPC_200_metacell on galaxy"
python ./generate_weighted_edgelist.py -d 1000K_PTSD_OPC_200_metacell -g corr
echo -e "1000K_PTSD_OPC_200_metacell: generate_weighted_edgelist finiehed"
python ./generate_bcsr.py --format weighted_edgelist --undirected --sep " "  /auto/grad_space/zihend1/tmp/tmp.weighted.edgelist /auto/grad_space/zihend1/tmp/tmp.bcsr
echo -e "1000K_PTSD_OPC_200_metacell: generate_bcsr finished"
/home/zihend1/GraphEmbedding/FVERSE/verse/src/verse -input /auto/grad_space/zihend1/tmp/tmp.bcsr -output /auto/grad_space/zihend1/tmp/tmp.bin -dim 32 -alpha 0.15 -threads 4 -nsamples 3
echo -e "1000K_PTSD_OPC_200_metacell: generate_embeddings finished"
python ./generate_embeddings.py -d 1000K_PTSD_OPC_200_metacell -g corr -es 32 -alpha 0.15 -nsamples 3
echo -e "1000K_PTSD_OPC_200_metacell: save_embeddings finished"
echo -e "----------------------------------------------------\n\n\n"