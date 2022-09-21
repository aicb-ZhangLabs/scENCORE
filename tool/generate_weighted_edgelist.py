import argparse
import networkx as nx
import numpy as np

parser = argparse.ArgumentParser(description='VERSE GraphEmbedding')
parser.add_argument('-d', '--data', type=str, default="hfc", help='dataset')
parser.add_argument('-t', '--threshold', type=int, default=50, help='threshold of filtering low coverage bins')
parser.add_argument('-g', '--graph', type=str, default="corr", help='graph construction method: corr, corr_exp or corr_kNN')
parser.add_argument('-sc', '--scale', type=str, default="none", help='how to scale the sparse corr')
parser.add_argument('-sa', '--sample', type=str, default="none", help='how to sample cells for the sparse corr')
parser.add_argument('-m', '--model', type=str, default="verse", help='which graph embedding method is used')
parser.add_argument('-k', '--kNN_graph', type=int, default=100, help='dimension of the embedding size')
parser.add_argument('-es', '--embed_size', type=int, default=32, help='dimension of the embedding size')
args = parser.parse_args()

############################################################################################################################
############################################################################################################################
############################################################################################################################
if args.data == "1000K_bulk_hfc":
	path = "/auto/grad_space/zihend1/scENCORE/Bulk-ATAC-seq/1000K/hfc/"
elif args.data == "1000K_bulk_brg":
	path = "/auto/grad_space/zihend1/scENCORE/Bulk-ATAC-seq/1000K/brg/"
############################################################################################################################
############################################################################################################################
############################################################################################################################
elif args.data == "1000K_CON_all_cell_type":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/total/"
elif args.data == "1000K_CON_Ast_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Ast/raw/"
elif args.data == "1000K_CON_Ast_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Ast/20_metacell/"
elif args.data == "1000K_CON_Ast_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Ast/50_metacell/"
elif args.data == "1000K_CON_Ast_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Ast/100_metacell/"
elif args.data == "1000K_CON_Ast_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Ast/150_metacell/"
elif args.data == "1000K_CON_Ast_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Ast/200_metacell/"
elif args.data == "1000K_CON_End_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/End/raw/"
elif args.data == "1000K_CON_End_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/End/20_metacell/"
elif args.data == "1000K_CON_End_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/End/50_metacell/"
elif args.data == "1000K_CON_End_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/End/100_metacell/"
elif args.data == "1000K_CON_End_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/End/150_metacell/"
elif args.data == "1000K_CON_End_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/End/200_metacell/"
elif args.data == "1000K_CON_Exc_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Exc/raw/"
elif args.data == "1000K_CON_Exc_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Exc/20_metacell/"
elif args.data == "1000K_CON_Exc_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Exc/50_metacell/"
elif args.data == "1000K_CON_Exc_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Exc/100_metacell/"
elif args.data == "1000K_CON_Exc_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Exc/150_metacell/"
elif args.data == "1000K_CON_Exc_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Exc/200_metacell/"
elif args.data == "1000K_CON_Inh_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Inh/raw/"
elif args.data == "1000K_CON_Inh_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Inh/20_metacell/"
elif args.data == "1000K_CON_Inh_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Inh/50_metacell/"
elif args.data == "1000K_CON_Inh_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Inh/100_metacell/"
elif args.data == "1000K_CON_Inh_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Inh/150_metacell/"
elif args.data == "1000K_CON_Inh_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Inh/200_metacell/"
elif args.data == "1000K_CON_Mic_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Mic/raw/"
elif args.data == "1000K_CON_Mic_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Mic/20_metacell/"
elif args.data == "1000K_CON_Mic_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Mic/50_metacell/"
elif args.data == "1000K_CON_Mic_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Mic/100_metacell/"
elif args.data == "1000K_CON_Mic_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Mic/150_metacell/"
elif args.data == "1000K_CON_Mic_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Mic/200_metacell/"
elif args.data == "1000K_CON_Olig_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Olig/raw/"
elif args.data == "1000K_CON_Olig_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Olig/20_metacell/"
elif args.data == "1000K_CON_Olig_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Olig/50_metacell/"
elif args.data == "1000K_CON_Olig_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Olig/100_metacell/"
elif args.data == "1000K_CON_Olig_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Olig/150_metacell/"
elif args.data == "1000K_CON_Olig_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/Olig/200_metacell/"
elif args.data == "1000K_CON_OPC_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/OPC/raw/"
elif args.data == "1000K_CON_OPC_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/OPC/20_metacell/"
elif args.data == "1000K_CON_OPC_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/OPC/50_metacell/"
elif args.data == "1000K_CON_OPC_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/OPC/100_metacell/"
elif args.data == "1000K_CON_OPC_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/OPC/150_metacell/"
elif args.data == "1000K_CON_OPC_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/3_CON/cell_type/OPC/200_metacell/"
############################################################################################################################
elif args.data == "1000K_MDD_all_cell_type":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/total/"
elif args.data == "1000K_MDD_Ast_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Ast/raw/"
elif args.data == "1000K_MDD_Ast_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Ast/20_metacell/"
elif args.data == "1000K_MDD_Ast_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Ast/50_metacell/"
elif args.data == "1000K_MDD_Ast_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Ast/100_metacell/"
elif args.data == "1000K_MDD_Ast_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Ast/150_metacell/"
elif args.data == "1000K_MDD_Ast_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Ast/200_metacell/"
elif args.data == "1000K_MDD_End_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/End/raw/"
elif args.data == "1000K_MDD_End_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/End/20_metacell/"
elif args.data == "1000K_MDD_End_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/End/50_metacell/"
elif args.data == "1000K_MDD_End_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/End/100_metacell/"
elif args.data == "1000K_MDD_End_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/End/150_metacell/"
elif args.data == "1000K_MDD_End_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/End/200_metacell/"
elif args.data == "1000K_MDD_Exc_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Exc/raw/"
elif args.data == "1000K_MDD_Exc_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Exc/20_metacell/"
elif args.data == "1000K_MDD_Exc_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Exc/50_metacell/"
elif args.data == "1000K_MDD_Exc_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Exc/100_metacell/"
elif args.data == "1000K_MDD_Exc_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Exc/150_metacell/"
elif args.data == "1000K_MDD_Exc_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Exc/200_metacell/"
elif args.data == "1000K_MDD_Inh_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Inh/raw/"
elif args.data == "1000K_MDD_Inh_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Inh/20_metacell/"
elif args.data == "1000K_MDD_Inh_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Inh/50_metacell/"
elif args.data == "1000K_MDD_Inh_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Inh/100_metacell/"
elif args.data == "1000K_MDD_Inh_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Inh/150_metacell/"
elif args.data == "1000K_MDD_Inh_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Inh/200_metacell/"
elif args.data == "1000K_MDD_Mic_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Mic/raw/"
elif args.data == "1000K_MDD_Mic_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Mic/20_metacell/"
elif args.data == "1000K_MDD_Mic_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Mic/50_metacell/"
elif args.data == "1000K_MDD_Mic_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Mic/100_metacell/"
elif args.data == "1000K_MDD_Mic_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Mic/150_metacell/"
elif args.data == "1000K_MDD_Mic_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Mic/200_metacell/"
elif args.data == "1000K_MDD_Olig_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Olig/raw/"
elif args.data == "1000K_MDD_Olig_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Olig/20_metacell/"
elif args.data == "1000K_MDD_Olig_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Olig/50_metacell/"
elif args.data == "1000K_MDD_Olig_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Olig/100_metacell/"
elif args.data == "1000K_MDD_Olig_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Olig/150_metacell/"
elif args.data == "1000K_MDD_Olig_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/Olig/200_metacell/"
elif args.data == "1000K_MDD_OPC_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/OPC/raw/"
elif args.data == "1000K_MDD_OPC_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/OPC/20_metacell/"
elif args.data == "1000K_MDD_OPC_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/OPC/50_metacell/"
elif args.data == "1000K_MDD_OPC_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/OPC/100_metacell/"
elif args.data == "1000K_MDD_OPC_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/OPC/150_metacell/"
elif args.data == "1000K_MDD_OPC_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_MDD/cell_type/OPC/200_metacell/"
############################################################################################################################
elif args.data == "1000K_PTSD_all_cell_type":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/total/"
elif args.data == "1000K_PTSD_Ast_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Ast/raw/"
elif args.data == "1000K_PTSD_Ast_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Ast/20_metacell/"
elif args.data == "1000K_PTSD_Ast_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Ast/50_metacell/"
elif args.data == "1000K_PTSD_Ast_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Ast/100_metacell/"
elif args.data == "1000K_PTSD_Ast_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Ast/150_metacell/"
elif args.data == "1000K_PTSD_Ast_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Ast/200_metacell/"
elif args.data == "1000K_PTSD_End_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/End/raw/"
elif args.data == "1000K_PTSD_End_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/End/20_metacell/"
elif args.data == "1000K_PTSD_End_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/End/50_metacell/"
elif args.data == "1000K_PTSD_End_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/End/100_metacell/"
elif args.data == "1000K_PTSD_End_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/End/150_metacell/"
elif args.data == "1000K_PTSD_End_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/End/200_metacell/"
elif args.data == "1000K_PTSD_Exc_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Exc/raw/"
elif args.data == "1000K_PTSD_Exc_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Exc/20_metacell/"
elif args.data == "1000K_PTSD_Exc_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Exc/50_metacell/"
elif args.data == "1000K_PTSD_Exc_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Exc/100_metacell/"
elif args.data == "1000K_PTSD_Exc_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Exc/150_metacell/"
elif args.data == "1000K_PTSD_Exc_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Exc/200_metacell/"
elif args.data == "1000K_PTSD_Inh_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Inh/raw/"
elif args.data == "1000K_PTSD_Inh_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Inh/20_metacell/"
elif args.data == "1000K_PTSD_Inh_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Inh/50_metacell/"
elif args.data == "1000K_PTSD_Inh_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Inh/100_metacell/"
elif args.data == "1000K_PTSD_Inh_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Inh/150_metacell/"
elif args.data == "1000K_PTSD_Inh_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Inh/200_metacell/"
elif args.data == "1000K_PTSD_Mic_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Mic/raw/"
elif args.data == "1000K_PTSD_Mic_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Mic/20_metacell/"
elif args.data == "1000K_PTSD_Mic_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Mic/50_metacell/"
elif args.data == "1000K_PTSD_Mic_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Mic/100_metacell/"
elif args.data == "1000K_PTSD_Mic_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Mic/150_metacell/"
elif args.data == "1000K_PTSD_Mic_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Mic/200_metacell/"
elif args.data == "1000K_PTSD_Olig_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Olig/raw/"
elif args.data == "1000K_PTSD_Olig_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Olig/20_metacell/"
elif args.data == "1000K_PTSD_Olig_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Olig/50_metacell/"
elif args.data == "1000K_PTSD_Olig_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Olig/100_metacell/"
elif args.data == "1000K_PTSD_Olig_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Olig/150_metacell/"
elif args.data == "1000K_PTSD_Olig_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/Olig/200_metacell/"
elif args.data == "1000K_PTSD_OPC_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/OPC/raw/"
elif args.data == "1000K_PTSD_OPC_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/OPC/20_metacell/"
elif args.data == "1000K_PTSD_OPC_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/OPC/50_metacell/"
elif args.data == "1000K_PTSD_OPC_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/OPC/100_metacell/"
elif args.data == "1000K_PTSD_OPC_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/OPC/150_metacell/"
elif args.data == "1000K_PTSD_OPC_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/1000K/2_PTSD/cell_type/OPC/200_metacell/"
############################################################################################################################
############################################################################################################################
############################################################################################################################
elif args.data == "500K_CON_all_cell_type":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/total/"
elif args.data == "500K_CON_Ast_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Ast/raw/"
elif args.data == "500K_CON_Ast_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Ast/20_metacell/"
elif args.data == "500K_CON_Ast_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Ast/50_metacell/"
elif args.data == "500K_CON_Ast_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Ast/100_metacell/"
elif args.data == "500K_CON_Ast_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Ast/150_metacell/"
elif args.data == "500K_CON_Ast_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Ast/200_metacell/"
elif args.data == "500K_CON_End_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/End/raw/"
elif args.data == "500K_CON_End_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/End/20_metacell/"
elif args.data == "500K_CON_End_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/End/50_metacell/"
elif args.data == "500K_CON_End_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/End/100_metacell/"
elif args.data == "500K_CON_End_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/End/150_metacell/"
elif args.data == "500K_CON_End_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/End/200_metacell/"
elif args.data == "500K_CON_Exc_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Exc/raw/"
elif args.data == "500K_CON_Exc_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Exc/20_metacell/"
elif args.data == "500K_CON_Exc_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Exc/50_metacell/"
elif args.data == "500K_CON_Exc_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Exc/100_metacell/"
elif args.data == "500K_CON_Exc_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Exc/150_metacell/"
elif args.data == "500K_CON_Exc_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Exc/200_metacell/"
elif args.data == "500K_CON_Inh_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Inh/raw/"
elif args.data == "500K_CON_Inh_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Inh/20_metacell/"
elif args.data == "500K_CON_Inh_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Inh/50_metacell/"
elif args.data == "500K_CON_Inh_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Inh/100_metacell/"
elif args.data == "500K_CON_Inh_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Inh/150_metacell/"
elif args.data == "500K_CON_Inh_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Inh/200_metacell/"
elif args.data == "500K_CON_Mic_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Mic/raw/"
elif args.data == "500K_CON_Mic_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Mic/20_metacell/"
elif args.data == "500K_CON_Mic_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Mic/50_metacell/"
elif args.data == "500K_CON_Mic_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Mic/100_metacell/"
elif args.data == "500K_CON_Mic_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Mic/150_metacell/"
elif args.data == "500K_CON_Mic_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Mic/200_metacell/"
elif args.data == "500K_CON_Olig_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Olig/raw/"
elif args.data == "500K_CON_Olig_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Olig/20_metacell/"
elif args.data == "500K_CON_Olig_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Olig/50_metacell/"
elif args.data == "500K_CON_Olig_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Olig/100_metacell/"
elif args.data == "500K_CON_Olig_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Olig/150_metacell/"
elif args.data == "500K_CON_Olig_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/Olig/200_metacell/"
elif args.data == "500K_CON_OPC_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/OPC/raw/"
elif args.data == "500K_CON_OPC_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/OPC/20_metacell/"
elif args.data == "500K_CON_OPC_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/OPC/50_metacell/"
elif args.data == "500K_CON_OPC_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/OPC/100_metacell/"
elif args.data == "500K_CON_OPC_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/OPC/150_metacell/"
elif args.data == "500K_CON_OPC_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/3_CON/cell_type/OPC/200_metacell/"
############################################################################################################################
elif args.data == "500K_MDD_all_cell_type":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/total/"
elif args.data == "500K_MDD_Ast_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Ast/raw/"
elif args.data == "500K_MDD_Ast_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Ast/20_metacell/"
elif args.data == "500K_MDD_Ast_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Ast/50_metacell/"
elif args.data == "500K_MDD_Ast_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Ast/100_metacell/"
elif args.data == "500K_MDD_Ast_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Ast/150_metacell/"
elif args.data == "500K_MDD_Ast_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Ast/200_metacell/"
elif args.data == "500K_MDD_End_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/End/raw/"
elif args.data == "500K_MDD_End_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/End/20_metacell/"
elif args.data == "500K_MDD_End_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/End/50_metacell/"
elif args.data == "500K_MDD_End_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/End/100_metacell/"
elif args.data == "500K_MDD_End_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/End/150_metacell/"
elif args.data == "500K_MDD_End_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/End/200_metacell/"
elif args.data == "500K_MDD_Exc_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Exc/raw/"
elif args.data == "500K_MDD_Exc_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Exc/20_metacell/"
elif args.data == "500K_MDD_Exc_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Exc/50_metacell/"
elif args.data == "500K_MDD_Exc_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Exc/100_metacell/"
elif args.data == "500K_MDD_Exc_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Exc/150_metacell/"
elif args.data == "500K_MDD_Exc_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Exc/200_metacell/"
elif args.data == "500K_MDD_Inh_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Inh/raw/"
elif args.data == "500K_MDD_Inh_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Inh/20_metacell/"
elif args.data == "500K_MDD_Inh_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Inh/50_metacell/"
elif args.data == "500K_MDD_Inh_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Inh/100_metacell/"
elif args.data == "500K_MDD_Inh_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Inh/150_metacell/"
elif args.data == "500K_MDD_Inh_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Inh/200_metacell/"
elif args.data == "500K_MDD_Mic_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Mic/raw/"
elif args.data == "500K_MDD_Mic_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Mic/20_metacell/"
elif args.data == "500K_MDD_Mic_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Mic/50_metacell/"
elif args.data == "500K_MDD_Mic_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Mic/100_metacell/"
elif args.data == "500K_MDD_Mic_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Mic/150_metacell/"
elif args.data == "500K_MDD_Mic_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Mic/200_metacell/"
elif args.data == "500K_MDD_Olig_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Olig/raw/"
elif args.data == "500K_MDD_Olig_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Olig/20_metacell/"
elif args.data == "500K_MDD_Olig_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Olig/50_metacell/"
elif args.data == "500K_MDD_Olig_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Olig/100_metacell/"
elif args.data == "500K_MDD_Olig_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Olig/150_metacell/"
elif args.data == "500K_MDD_Olig_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/Olig/200_metacell/"
elif args.data == "500K_MDD_OPC_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/OPC/raw/"
elif args.data == "500K_MDD_OPC_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/OPC/20_metacell/"
elif args.data == "500K_MDD_OPC_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/OPC/50_metacell/"
elif args.data == "500K_MDD_OPC_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/OPC/100_metacell/"
elif args.data == "500K_MDD_OPC_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/OPC/150_metacell/"
elif args.data == "500K_MDD_OPC_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_MDD/cell_type/OPC/200_metacell/"
############################################################################################################################
elif args.data == "500K_PTSD_all_cell_type":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/total/"
elif args.data == "500K_PTSD_Ast_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Ast/raw/"
elif args.data == "500K_PTSD_Ast_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Ast/20_metacell/"
elif args.data == "500K_PTSD_Ast_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Ast/50_metacell/"
elif args.data == "500K_PTSD_Ast_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Ast/100_metacell/"
elif args.data == "500K_PTSD_Ast_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Ast/150_metacell/"
elif args.data == "500K_PTSD_Ast_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Ast/200_metacell/"
elif args.data == "500K_PTSD_End_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/End/raw/"
elif args.data == "500K_PTSD_End_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/End/20_metacell/"
elif args.data == "500K_PTSD_End_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/End/50_metacell/"
elif args.data == "500K_PTSD_End_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/End/100_metacell/"
elif args.data == "500K_PTSD_End_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/End/150_metacell/"
elif args.data == "500K_PTSD_End_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/End/200_metacell/"
elif args.data == "500K_PTSD_Exc_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Exc/raw/"
elif args.data == "500K_PTSD_Exc_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Exc/20_metacell/"
elif args.data == "500K_PTSD_Exc_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Exc/50_metacell/"
elif args.data == "500K_PTSD_Exc_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Exc/100_metacell/"
elif args.data == "500K_PTSD_Exc_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Exc/150_metacell/"
elif args.data == "500K_PTSD_Exc_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Exc/200_metacell/"
elif args.data == "500K_PTSD_Inh_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Inh/raw/"
elif args.data == "500K_PTSD_Inh_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Inh/20_metacell/"
elif args.data == "500K_PTSD_Inh_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Inh/50_metacell/"
elif args.data == "500K_PTSD_Inh_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Inh/100_metacell/"
elif args.data == "500K_PTSD_Inh_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Inh/150_metacell/"
elif args.data == "500K_PTSD_Inh_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Inh/200_metacell/"
elif args.data == "500K_PTSD_Mic_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Mic/raw/"
elif args.data == "500K_PTSD_Mic_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Mic/20_metacell/"
elif args.data == "500K_PTSD_Mic_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Mic/50_metacell/"
elif args.data == "500K_PTSD_Mic_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Mic/100_metacell/"
elif args.data == "500K_PTSD_Mic_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Mic/150_metacell/"
elif args.data == "500K_PTSD_Mic_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Mic/200_metacell/"
elif args.data == "500K_PTSD_Olig_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Olig/raw/"
elif args.data == "500K_PTSD_Olig_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Olig/20_metacell/"
elif args.data == "500K_PTSD_Olig_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Olig/50_metacell/"
elif args.data == "500K_PTSD_Olig_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Olig/100_metacell/"
elif args.data == "500K_PTSD_Olig_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Olig/150_metacell/"
elif args.data == "500K_PTSD_Olig_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/Olig/200_metacell/"
elif args.data == "500K_PTSD_OPC_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/OPC/raw/"
elif args.data == "500K_PTSD_OPC_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/OPC/20_metacell/"
elif args.data == "500K_PTSD_OPC_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/OPC/50_metacell/"
elif args.data == "500K_PTSD_OPC_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/OPC/100_metacell/"
elif args.data == "500K_PTSD_OPC_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/OPC/150_metacell/"
elif args.data == "500K_PTSD_OPC_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/500K/2_PTSD/cell_type/OPC/200_metacell/"
############################################################################################################################
############################################################################################################################
############################################################################################################################
elif args.data == "100K_CON_all_cell_type":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/total/"
elif args.data == "100K_CON_Ast_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Ast/raw/"
elif args.data == "100K_CON_Ast_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Ast/20_metacell/"
elif args.data == "100K_CON_Ast_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Ast/50_metacell/"
elif args.data == "100K_CON_Ast_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Ast/100_metacell/"
elif args.data == "100K_CON_Ast_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Ast/150_metacell/"
elif args.data == "100K_CON_Ast_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Ast/200_metacell/"
elif args.data == "100K_CON_End_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/End/raw/"
elif args.data == "100K_CON_End_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/End/20_metacell/"
elif args.data == "100K_CON_End_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/End/50_metacell/"
elif args.data == "100K_CON_End_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/End/100_metacell/"
elif args.data == "100K_CON_End_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/End/150_metacell/"
elif args.data == "100K_CON_End_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/End/200_metacell/"
elif args.data == "100K_CON_Exc_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Exc/raw/"
elif args.data == "100K_CON_Exc_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Exc/20_metacell/"
elif args.data == "100K_CON_Exc_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Exc/50_metacell/"
elif args.data == "100K_CON_Exc_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Exc/100_metacell/"
elif args.data == "100K_CON_Exc_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Exc/150_metacell/"
elif args.data == "100K_CON_Exc_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Exc/200_metacell/"
elif args.data == "100K_CON_Inh_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Inh/raw/"
elif args.data == "100K_CON_Inh_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Inh/20_metacell/"
elif args.data == "100K_CON_Inh_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Inh/50_metacell/"
elif args.data == "100K_CON_Inh_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Inh/100_metacell/"
elif args.data == "100K_CON_Inh_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Inh/150_metacell/"
elif args.data == "100K_CON_Inh_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Inh/200_metacell/"
elif args.data == "100K_CON_Mic_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Mic/raw/"
elif args.data == "100K_CON_Mic_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Mic/20_metacell/"
elif args.data == "100K_CON_Mic_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Mic/50_metacell/"
elif args.data == "100K_CON_Mic_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Mic/100_metacell/"
elif args.data == "100K_CON_Mic_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Mic/150_metacell/"
elif args.data == "100K_CON_Mic_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Mic/200_metacell/"
elif args.data == "100K_CON_Olig_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Olig/raw/"
elif args.data == "100K_CON_Olig_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Olig/20_metacell/"
elif args.data == "100K_CON_Olig_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Olig/50_metacell/"
elif args.data == "100K_CON_Olig_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Olig/100_metacell/"
elif args.data == "100K_CON_Olig_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Olig/150_metacell/"
elif args.data == "100K_CON_Olig_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/Olig/200_metacell/"
elif args.data == "100K_CON_OPC_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/OPC/raw/"
elif args.data == "100K_CON_OPC_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/OPC/20_metacell/"
elif args.data == "100K_CON_OPC_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/OPC/50_metacell/"
elif args.data == "100K_CON_OPC_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/OPC/100_metacell/"
elif args.data == "100K_CON_OPC_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/OPC/150_metacell/"
elif args.data == "100K_CON_OPC_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/3_CON/cell_type/OPC/200_metacell/"
############################################################################################################################
elif args.data == "100K_MDD_all_cell_type":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/total/"
elif args.data == "100K_MDD_Ast_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Ast/raw/"
elif args.data == "100K_MDD_Ast_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Ast/20_metacell/"
elif args.data == "100K_MDD_Ast_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Ast/50_metacell/"
elif args.data == "100K_MDD_Ast_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Ast/100_metacell/"
elif args.data == "100K_MDD_Ast_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Ast/150_metacell/"
elif args.data == "100K_MDD_Ast_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Ast/200_metacell/"
elif args.data == "100K_MDD_End_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/End/raw/"
elif args.data == "100K_MDD_End_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/End/20_metacell/"
elif args.data == "100K_MDD_End_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/End/50_metacell/"
elif args.data == "100K_MDD_End_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/End/100_metacell/"
elif args.data == "100K_MDD_End_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/End/150_metacell/"
elif args.data == "100K_MDD_End_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/End/200_metacell/"
elif args.data == "100K_MDD_Exc_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Exc/raw/"
elif args.data == "100K_MDD_Exc_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Exc/20_metacell/"
elif args.data == "100K_MDD_Exc_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Exc/50_metacell/"
elif args.data == "100K_MDD_Exc_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Exc/100_metacell/"
elif args.data == "100K_MDD_Exc_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Exc/150_metacell/"
elif args.data == "100K_MDD_Exc_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Exc/200_metacell/"
elif args.data == "100K_MDD_Inh_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Inh/raw/"
elif args.data == "100K_MDD_Inh_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Inh/20_metacell/"
elif args.data == "100K_MDD_Inh_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Inh/50_metacell/"
elif args.data == "100K_MDD_Inh_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Inh/100_metacell/"
elif args.data == "100K_MDD_Inh_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Inh/150_metacell/"
elif args.data == "100K_MDD_Inh_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Inh/200_metacell/"
elif args.data == "100K_MDD_Mic_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Mic/raw/"
elif args.data == "100K_MDD_Mic_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Mic/20_metacell/"
elif args.data == "100K_MDD_Mic_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Mic/50_metacell/"
elif args.data == "100K_MDD_Mic_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Mic/100_metacell/"
elif args.data == "100K_MDD_Mic_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Mic/150_metacell/"
elif args.data == "100K_MDD_Mic_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Mic/200_metacell/"
elif args.data == "100K_MDD_Olig_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Olig/raw/"
elif args.data == "100K_MDD_Olig_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Olig/20_metacell/"
elif args.data == "100K_MDD_Olig_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Olig/50_metacell/"
elif args.data == "100K_MDD_Olig_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Olig/100_metacell/"
elif args.data == "100K_MDD_Olig_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Olig/150_metacell/"
elif args.data == "100K_MDD_Olig_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/Olig/200_metacell/"
elif args.data == "100K_MDD_OPC_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/OPC/raw/"
elif args.data == "100K_MDD_OPC_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/OPC/20_metacell/"
elif args.data == "100K_MDD_OPC_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/OPC/50_metacell/"
elif args.data == "100K_MDD_OPC_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/OPC/100_metacell/"
elif args.data == "100K_MDD_OPC_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/OPC/150_metacell/"
elif args.data == "100K_MDD_OPC_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_MDD/cell_type/OPC/200_metacell/"
############################################################################################################################
elif args.data == "100K_PTSD_all_cell_type":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/total/"
elif args.data == "100K_PTSD_Ast_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Ast/raw/"
elif args.data == "100K_PTSD_Ast_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Ast/20_metacell/"
elif args.data == "100K_PTSD_Ast_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Ast/50_metacell/"
elif args.data == "100K_PTSD_Ast_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Ast/100_metacell/"
elif args.data == "100K_PTSD_Ast_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Ast/150_metacell/"
elif args.data == "100K_PTSD_Ast_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Ast/200_metacell/"
elif args.data == "100K_PTSD_End_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/End/raw/"
elif args.data == "100K_PTSD_End_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/End/20_metacell/"
elif args.data == "100K_PTSD_End_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/End/50_metacell/"
elif args.data == "100K_PTSD_End_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/End/100_metacell/"
elif args.data == "100K_PTSD_End_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/End/150_metacell/"
elif args.data == "100K_PTSD_End_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/End/200_metacell/"
elif args.data == "100K_PTSD_Exc_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Exc/raw/"
elif args.data == "100K_PTSD_Exc_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Exc/20_metacell/"
elif args.data == "100K_PTSD_Exc_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Exc/50_metacell/"
elif args.data == "100K_PTSD_Exc_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Exc/100_metacell/"
elif args.data == "100K_PTSD_Exc_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Exc/150_metacell/"
elif args.data == "100K_PTSD_Exc_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Exc/200_metacell/"
elif args.data == "100K_PTSD_Inh_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Inh/raw/"
elif args.data == "100K_PTSD_Inh_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Inh/20_metacell/"
elif args.data == "100K_PTSD_Inh_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Inh/50_metacell/"
elif args.data == "100K_PTSD_Inh_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Inh/100_metacell/"
elif args.data == "100K_PTSD_Inh_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Inh/150_metacell/"
elif args.data == "100K_PTSD_Inh_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Inh/200_metacell/"
elif args.data == "100K_PTSD_Mic_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Mic/raw/"
elif args.data == "100K_PTSD_Mic_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Mic/20_metacell/"
elif args.data == "100K_PTSD_Mic_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Mic/50_metacell/"
elif args.data == "100K_PTSD_Mic_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Mic/100_metacell/"
elif args.data == "100K_PTSD_Mic_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Mic/150_metacell/"
elif args.data == "100K_PTSD_Mic_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Mic/200_metacell/"
elif args.data == "100K_PTSD_Olig_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Olig/raw/"
elif args.data == "100K_PTSD_Olig_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Olig/20_metacell/"
elif args.data == "100K_PTSD_Olig_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Olig/50_metacell/"
elif args.data == "100K_PTSD_Olig_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Olig/100_metacell/"
elif args.data == "100K_PTSD_Olig_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Olig/150_metacell/"
elif args.data == "100K_PTSD_Olig_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/Olig/200_metacell/"
elif args.data == "100K_PTSD_OPC_raw":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/OPC/raw/"
elif args.data == "100K_PTSD_OPC_20_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/OPC/20_metacell/"
elif args.data == "100K_PTSD_OPC_50_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/OPC/50_metacell/"
elif args.data == "100K_PTSD_OPC_100_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/OPC/100_metacell/"
elif args.data == "100K_PTSD_OPC_150_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/OPC/150_metacell/"
elif args.data == "100K_PTSD_OPC_200_metacell":
	path = "/auto/grad_space/zihend1/scENCORE/Change_Resolution/100K/2_PTSD/cell_type/OPC/200_metacell/"

'''
if args.data == "NetworkHierarchy":
	path = "/auto/grad_space/zihend1/NetworkHierarchy/"

elif args.data == "CON_MDD_PTSD_meta_20_VIP":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_VIP/20_metacell/"
elif args.data == "CON_MDD_PTSD_meta_50_VIP":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_VIP/50_metacell/"
elif args.data == "CON_MDD_PTSD_meta_100_VIP":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_VIP/100_metacell/"
elif args.data == "CON_MDD_PTSD_meta_150_VIP":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_VIP/150_metacell/"
elif args.data == "CON_MDD_PTSD_meta_200_VIP":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_VIP/200_metacell/"

elif args.data == "CON_MDD_PTSD_meta_20_SST":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_SST/20_metacell/"
elif args.data == "CON_MDD_PTSD_meta_50_SST":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_SST/50_metacell/"
elif args.data == "CON_MDD_PTSD_meta_100_SST":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_SST/100_metacell/"
elif args.data == "CON_MDD_PTSD_meta_150_SST":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_SST/150_metacell/"
elif args.data == "CON_MDD_PTSD_meta_200_SST":
    path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON_MDD_PTSD_SST/200_metacell/"

elif args.data == "CON_Ast_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/20_metacell/Ast/"
elif args.data == "CON_Ast_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/50_metacell/Ast/"
elif args.data == "CON_Ast_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/100_metacell/Ast/"
elif args.data == "CON_Ast_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/150_metacell/Ast/"
elif args.data == "CON_Ast_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/200_metacell/Ast/"

elif args.data == "CON_End_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/20_metacell/End/"
elif args.data == "CON_End_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/50_metacell/End/"
elif args.data == "CON_End_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/100_metacell/End/"
elif args.data == "CON_End_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/150_metacell/End/"
elif args.data == "CON_End_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/200_metacell/End/"

elif args.data == "CON_Exc_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/20_metacell/Exc/"
elif args.data == "CON_Exc_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/50_metacell/Exc/"
elif args.data == "CON_Exc_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/100_metacell/Exc/"
elif args.data == "CON_Exc_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/150_metacell/Exc/"
elif args.data == "CON_Exc_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/200_metacell/Exc/"

elif args.data == "CON_Inh_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/20_metacell/Inh/"
elif args.data == "CON_Inh_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/50_metacell/Inh/"
elif args.data == "CON_Inh_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/100_metacell/Inh/"
elif args.data == "CON_Inh_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/150_metacell/Inh/"
elif args.data == "CON_Inh_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/200_metacell/Inh/"

elif args.data == "CON_Mic_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/20_metacell/Mic/"
elif args.data == "CON_Mic_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/50_metacell/Mic/"
elif args.data == "CON_Mic_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/100_metacell/Mic/"
elif args.data == "CON_Mic_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/150_metacell/Mic/"
elif args.data == "CON_Mic_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/200_metacell/Mic/"

elif args.data == "CON_Olig_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/20_metacell/Olig/"
elif args.data == "CON_Olig_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/50_metacell/Olig/"
elif args.data == "CON_Olig_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/100_metacell/Olig/"
elif args.data == "CON_Olig_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/150_metacell/Olig/"
elif args.data == "CON_Olig_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/200_metacell/Olig/"

elif args.data == "CON_OPC_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/20_metacell/OPC/"
elif args.data == "CON_OPC_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/50_metacell/OPC/"
elif args.data == "CON_OPC_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/100_metacell/OPC/"
elif args.data == "CON_OPC_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/150_metacell/OPC/"
elif args.data == "CON_OPC_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/CON/200_metacell/OPC/"

################################################################################################
################################################################################################
################################################################################################

elif args.data == "MDD_Ast_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/20_metacell/Ast/"
elif args.data == "MDD_Ast_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/50_metacell/Ast/"
elif args.data == "MDD_Ast_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/100_metacell/Ast/"
elif args.data == "MDD_Ast_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/150_metacell/Ast/"
elif args.data == "MDD_Ast_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/200_metacell/Ast/"

elif args.data == "MDD_End_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/20_metacell/End/"
elif args.data == "MDD_End_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/50_metacell/End/"
elif args.data == "MDD_End_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/100_metacell/End/"
elif args.data == "MDD_End_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/150_metacell/End/"
elif args.data == "MDD_End_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/200_metacell/End/"

elif args.data == "MDD_Exc_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/20_metacell/Exc/"
elif args.data == "MDD_Exc_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/50_metacell/Exc/"
elif args.data == "MDD_Exc_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/100_metacell/Exc/"
elif args.data == "MDD_Exc_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/150_metacell/Exc/"
elif args.data == "MDD_Exc_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/200_metacell/Exc/"

elif args.data == "MDD_Inh_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/20_metacell/Inh/"
elif args.data == "MDD_Inh_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/50_metacell/Inh/"
elif args.data == "MDD_Inh_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/100_metacell/Inh/"
elif args.data == "MDD_Inh_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/150_metacell/Inh/"
elif args.data == "MDD_Inh_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/200_metacell/Inh/"

elif args.data == "MDD_Mic_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/20_metacell/Mic/"
elif args.data == "MDD_Mic_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/50_metacell/Mic/"
elif args.data == "MDD_Mic_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/100_metacell/Mic/"
elif args.data == "MDD_Mic_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/150_metacell/Mic/"
elif args.data == "MDD_Mic_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/200_metacell/Mic/"

elif args.data == "MDD_Olig_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/20_metacell/Olig/"
elif args.data == "MDD_Olig_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/50_metacell/Olig/"
elif args.data == "MDD_Olig_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/100_metacell/Olig/"
elif args.data == "MDD_Olig_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/150_metacell/Olig/"
elif args.data == "MDD_Olig_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/200_metacell/Olig/"

elif args.data == "MDD_OPC_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/20_metacell/OPC/"
elif args.data == "MDD_OPC_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/50_metacell/OPC/"
elif args.data == "MDD_OPC_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/100_metacell/OPC/"
elif args.data == "MDD_OPC_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/150_metacell/OPC/"
elif args.data == "MDD_OPC_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/MDD/200_metacell/OPC/"

################################################################################################
################################################################################################
################################################################################################

elif args.data == "PTSD_Ast_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/20_metacell/Ast/"
elif args.data == "PTSD_Ast_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/50_metacell/Ast/"
elif args.data == "PTSD_Ast_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/100_metacell/Ast/"
elif args.data == "PTSD_Ast_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/150_metacell/Ast/"
elif args.data == "PTSD_Ast_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/200_metacell/Ast/"

elif args.data == "PTSD_End_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/20_metacell/End/"
elif args.data == "PTSD_End_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/50_metacell/End/"
elif args.data == "PTSD_End_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/100_metacell/End/"
elif args.data == "PTSD_End_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/150_metacell/End/"
elif args.data == "PTSD_End_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/200_metacell/End/"

elif args.data == "PTSD_Exc_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/20_metacell/Exc/"
elif args.data == "PTSD_Exc_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/50_metacell/Exc/"
elif args.data == "PTSD_Exc_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/100_metacell/Exc/"
elif args.data == "PTSD_Exc_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/150_metacell/Exc/"
elif args.data == "PTSD_Exc_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/200_metacell/Exc/"

elif args.data == "PTSD_Inh_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/20_metacell/Inh/"
elif args.data == "PTSD_Inh_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/50_metacell/Inh/"
elif args.data == "PTSD_Inh_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/100_metacell/Inh/"
elif args.data == "PTSD_Inh_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/150_metacell/Inh/"
elif args.data == "PTSD_Inh_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/200_metacell/Inh/"

elif args.data == "PTSD_Mic_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/20_metacell/Mic/"
elif args.data == "PTSD_Mic_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/50_metacell/Mic/"
elif args.data == "PTSD_Mic_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/100_metacell/Mic/"
elif args.data == "PTSD_Mic_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/150_metacell/Mic/"
elif args.data == "PTSD_Mic_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/200_metacell/Mic/"

elif args.data == "PTSD_Olig_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/20_metacell/Olig/"
elif args.data == "PTSD_Olig_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/50_metacell/Olig/"
elif args.data == "PTSD_Olig_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/100_metacell/Olig/"
elif args.data == "PTSD_Olig_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/150_metacell/Olig/"
elif args.data == "PTSD_Olig_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/200_metacell/Olig/"

elif args.data == "PTSD_OPC_20_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/20_metacell/OPC/"
elif args.data == "PTSD_OPC_50_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/50_metacell/OPC/"
elif args.data == "PTSD_OPC_100_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/100_metacell/OPC/"
elif args.data == "PTSD_OPC_150_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/150_metacell/OPC/"
elif args.data == "PTSD_OPC_200_meta":
	path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_n_metacell/PTSD/200_metacell/OPC/"

################################################################################################
################################################################################################
################################################################################################

elif "CON_MS0002II" in args.data:
	if args.data == "CON_MS0002II_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0002II/meta/"
	elif args.data == "CON_MS0002II_Ast_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0002II/cell_type/Ast/meta/"
	elif args.data == "CON_MS0002II_End_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0002II/cell_type/End/meta/"
	elif args.data == "CON_MS0002II_Exc_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0002II/cell_type/Exc/meta/"
	elif args.data == "CON_MS0002II_Inh_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0002II/cell_type/Inh/meta/"
	elif args.data == "CON_MS0002II_Mic_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0002II/cell_type/Mic/meta/"
	elif args.data == "CON_MS0002II_Olig_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0002II/cell_type/Olig/meta/"
	elif args.data == "CON_MS0002II_OPC_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0002II/cell_type/OPC/meta/"
elif "CON_MS0183KK" in args.data:
	if args.data == "CON_MS0183KK_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0183KK/meta/"
	elif args.data == "CON_MS0183KK_Ast_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0183KK/cell_type/Ast/meta/"
	elif args.data == "CON_MS0183KK_End_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0183KK/cell_type/End/meta/"
	elif args.data == "CON_MS0183KK_Exc_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0183KK/cell_type/Exc/meta/"
	elif args.data == "CON_MS0183KK_Inh_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0183KK/cell_type/Inh/meta/"
	elif args.data == "CON_MS0183KK_Mic_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0183KK/cell_type/Mic/meta/"
	elif args.data == "CON_MS0183KK_Olig_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0183KK/cell_type/Olig/meta/"
	elif args.data == "CON_MS0183KK_OPC_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0183KK/cell_type/OPC/meta/"
elif "CON_MS0197YY" in args.data:
	if args.data == "CON_MS0197YY_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0197YY/meta/"
	elif args.data == "CON_MS0197YY_Ast_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0197YY/cell_type/Ast/meta/"
	elif args.data == "CON_MS0197YY_End_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0197YY/cell_type/End/meta/"
	elif args.data == "CON_MS0197YY_Exc_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0197YY/cell_type/Exc/meta/"
	elif args.data == "CON_MS0197YY_Inh_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0197YY/cell_type/Inh/meta/"
	elif args.data == "CON_MS0197YY_Mic_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0197YY/cell_type/Mic/meta/"
	elif args.data == "CON_MS0197YY_Olig_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0197YY/cell_type/Olig/meta/"
	elif args.data == "CON_MS0197YY_OPC_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/CON_MS0197YY/cell_type/OPC/meta/"
elif "MDD_MS0095YY" in args.data:
	if args.data == "MDD_MS0095YY_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0095YY/meta/"
	elif args.data == "MDD_MS0095YY_Ast_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0095YY/cell_type/Ast/meta/"
	elif args.data == "MDD_MS0095YY_End_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0095YY/cell_type/End/meta/"
	elif args.data == "MDD_MS0095YY_Exc_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0095YY/cell_type/Exc/meta/"
	elif args.data == "MDD_MS0095YY_Inh_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0095YY/cell_type/Inh/meta/"
	elif args.data == "MDD_MS0095YY_Mic_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0095YY/cell_type/Mic/meta/"
	elif args.data == "MDD_MS0095YY_Olig_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0095YY/cell_type/Olig/meta/"
	elif args.data == "MDD_MS0095YY_OPC_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0095YY/cell_type/OPC/meta/"
elif "MDD_MS0204LL" in args.data:
	if args.data == "MDD_MS0204LL_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0204LL/meta/"
	elif args.data == "MDD_MS0204LL_Ast_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0204LL/cell_type/Ast/meta/"
	elif args.data == "MDD_MS0204LL_End_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0204LL/cell_type/End/meta/"
	elif args.data == "MDD_MS0204LL_Exc_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0204LL/cell_type/Exc/meta/"
	elif args.data == "MDD_MS0204LL_Inh_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0204LL/cell_type/Inh/meta/"
	elif args.data == "MDD_MS0204LL_Mic_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0204LL/cell_type/Mic/meta/"
	elif args.data == "MDD_MS0204LL_Olig_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0204LL/cell_type/Olig/meta/"
	elif args.data == "MDD_MS0204LL_OPC_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/MDD_MS0204LL/cell_type/OPC/meta/"
elif "PTSD_MS0097BB" in args.data:
	if args.data == "PTSD_MS0097BB_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0097BB/meta/"
	elif args.data == "PTSD_MS0097BB_Ast_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0097BB/cell_type/Ast/meta/"
	elif args.data == "PTSD_MS0097BB_End_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0097BB/cell_type/End/meta/"
	elif args.data == "PTSD_MS0097BB_Exc_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0097BB/cell_type/Exc/meta/"
	elif args.data == "PTSD_MS0097BB_Inh_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0097BB/cell_type/Inh/meta/"
	elif args.data == "PTSD_MS0097BB_Mic_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0097BB/cell_type/Mic/meta/"
	elif args.data == "PTSD_MS0097BB_Olig_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0097BB/cell_type/Olig/meta/"
	elif args.data == "PTSD_MS0097BB_OPC_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0097BB/cell_type/OPC/meta/"
elif "PTSD_MS0145YY" in args.data:
	if args.data == "PTSD_MS0145YY_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0145YY/meta/"
	elif args.data == "PTSD_MS0145YY_Ast_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0145YY/cell_type/Ast/meta/"
	elif args.data == "PTSD_MS0145YY_End_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0145YY/cell_type/End/meta/"
	elif args.data == "PTSD_MS0145YY_Exc_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0145YY/cell_type/Exc/meta/"
	elif args.data == "PTSD_MS0145YY_Inh_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0145YY/cell_type/Inh/meta/"
	elif args.data == "PTSD_MS0145YY_Mic_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0145YY/cell_type/Mic/meta/"
	elif args.data == "PTSD_MS0145YY_Olig_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0145YY/cell_type/Olig/meta/"
	elif args.data == "PTSD_MS0145YY_OPC_meta":
		path = "/auto/grad_space/zihend1/3_CON_2_MDD_2_PTSD_per_sample_metacell/PTSD_MS0145YY/cell_type/OPC/meta/"

'''

# elif args.data in ["MS0192TT_R2","MS0196XX_R2","MS0198ZZ_R2"]:
# 	path = "/auto/grad_space/zihend1/3_good_PTSD/"+args.data+"/"
# elif args.data in ["MS0008OO","MS0184LL","MS0198ZZ"]:
# 	path = "/auto/grad_space/zihend1/3_good_samples/CON/"+args.data+"/ATAC/"
# # elif args.data in ["MDD","PTSD"]:
# # 	path = "/auto/grad_space/zihend1/3_good_samples/"+args.data+"/ATAC/"

# elif args.data == "CON":
# 	path = "/auto/grad_space/zihend1/3_CON_brain/"
# elif args.data == "MDD":
# 	path = "/auto/grad_space/zihend1/2_MDD_brain/"
# elif args.data == "PTSD":
# 	path = "/auto/grad_space/zihend1/2_PTSD_brain/"

# elif args.data in ["CON_Ast","CON_End","CON_Exc","CON_Inh","CON_Mic","CON_Olig","CON_OPC"]:
# 	path = "/auto/grad_space/zihend1/3_good_samples_brain/cell_type/cell_type_"+args.data[4:]+"/"
# elif args.data in ["CON_meta_Ast","CON_meta_End","CON_meta_Exc","CON_meta_Inh","CON_meta_Mic","CON_meta_Olig","CON_meta_OPC"]:
# 	path = "/auto/grad_space/zihend1/3_good_samples_brain/cell_type/"+args.data[4:]+"/"

# elif args.data in ["MDD_Ast","MDD_End","MDD_Exc","MDD_Inh","MDD_Mic","MDD_Olig","MDD_OPC"]:
# 	path = "/auto/grad_space/zihend1/2_MDD_brain/cell_type/cell_type_"+args.data[4:]+"/"
# elif args.data in ["MDD_meta_Ast","MDD_meta_End","MDD_meta_Exc","MDD_meta_Inh","MDD_meta_Mic","MDD_meta_Olig","MDD_meta_OPC"]:
# 	path = "/auto/grad_space/zihend1/2_MDD_brain/cell_type/"+args.data[4:]+"/"

# elif args.data in ["PTSD_Ast","PTSD_End","PTSD_Exc","PTSD_Inh","PTSD_Mic","PTSD_Olig","PTSD_OPC"]:
# 	path = "/auto/grad_space/zihend1/2_PTSD_brain/cell_type/cell_type_"+args.data[5:]+"/"
# elif args.data in ["PTSD_meta_Ast","PTSD_meta_End","PTSD_meta_Exc","PTSD_meta_Inh","PTSD_meta_Mic","PTSD_meta_Olig","PTSD_meta_OPC"]:
# 	path = "/auto/grad_space/zihend1/2_PTSD_brain/cell_type/"+args.data[5:]+"/"

# elif args.data in ["GM12878_val","GM12878_ct"]:
# 	if "val" in args.data:
# 		path = "/auto/grad_space/zihend1/GM12878/val/"
# 	elif "ct" in args.data:
# 		path = "/auto/grad_space/zihend1/GM12878/ct/"
# elif args.data in ["GSM5589357","GSM5589358","GSM5589359","GSM5589360","GSM5589361"]:
# 	path = "/auto/grad_space/zihend1/GSM/"+args.data+"/"
# elif args.data in ["GSM5589357_metacell","3_samples_metacell"]:
# 	path = "/auto/grad_space/zihend1/metacell/"+args.data+"/"
# elif args.data in ["HyperGraph"]:
# 	path = "/auto/grad_space/zihend1/3_good_samples/HyperGraph/"	
# elif args.data in ["MS0169WW","MS0177EE","MS0181II"]:
# 	path = "/auto/grad_space/zihend1/ATAC/"+args.data+"/"
# elif args.data in ["RT00113N"]:
# 	# path = "/auto/grad_space/zihend1/RT00113N/"
# 	path = "/auto/grad_space/zihend1/RT00113N/RNA/"
# else:
# 	path = "/auto/grad_space/zihend1/"+args.data+"/"

if args.graph == "corr":

	if args.scale == "none":
		corr = np.load(path+"Matrix/corr_0_1.npy")
		# corr = np.load(path+"Matrix/corr_t.npy")
	# elif args.scale == "log_01":
	# 	corr = np.load(path+"Matrix/log_01_corr_0_1.npy")
	# elif args.scale == "log_001":
	# 	corr = np.load(path+"Matrix/log_001_corr_0_1.npy")
	# elif args.scale == "log_0001":
	# 	corr = np.load(path+"Matrix/log_0001_corr_0_1.npy")

	# # elif args.sa == "none":
	# # 	corr = np.load(path+"Matrix/corr_0_1.npy")
	# elif args.sample == "sample_50_200":
	# 	corr = np.load(path+"Matrix/sample_50_200_corr_0_1.npy")
	# elif args.sample == "sample_100_200":
	# 	corr = np.load(path+"Matrix/sample_100_200_corr_0_1.npy")
	# elif args.sample == "sample_500_200":
	# 	corr = np.load(path+"Matrix/sample_500_200_corr_0_1.npy")

	print("corr shape: ",corr.shape)
	dt = [("weight", float)]
	A = np.array(corr, dtype=dt)
	G = nx.from_numpy_matrix(A)
	# nx.write_weighted_edgelist(G, path+args.data+".weighted.edgelist")

	nx.write_weighted_edgelist(G, "/auto/grad_space/zihend1/tmp/tmp.weighted.edgelist")
	# if "CON_" in args.data or "MDD_" in args.data:
	# 	nx.write_weighted_edgelist(G, path+args.data[4:]+".weighted.edgelist")
	# elif "PTSD_" in args.data:
	# 	nx.write_weighted_edgelist(G, path+args.data[5:]+".weighted.edgelist")
	# else:
	# 	nx.write_weighted_edgelist(G, path+args.data+".weighted.edgelist")

# elif args.graph == "corr_exp":
# 	corr = np.load(path+"Matrix/corr_exp.npy")
# 	dt = [("weight", float)]
# 	A = np.array(corr, dtype=dt)
# 	G = nx.from_numpy_matrix(A)
# 	nx.write_weighted_edgelist(G, path+args.data+".weighted.edgelist")
	
# elif args.graph == "kNN":
# 	corr = np.load(path+"Matrix/corr_0_1.npy")
# 	dt = [("weight", float)]
# 	A = np.array(corr, dtype=dt)
# 	k = args.kNN_graph
# 	A_max_index = np.argpartition(A, kth=-k, axis=1)
# 	G = nx.Graph()
# 	for i in range(A.shape[0]):
# 	    for j in range(k):
# 	        G.add_edge(i,A_max_index[:,-k:][i][j])
# 	        G.edges[i,A_max_index[:,-k:][i][j]]['weight'] = A[i][A_max_index[:,-k:][i][j]][0]
# 	nx.write_weighted_edgelist(G, path+args.data+".weighted.edgelist")

# else:
# 	raise NotImplementedError


