from matplotlib import pyplot as plt
import pandas as pd

def plot_x(array1,array2,title):

    # Please change c and c2, to appropriate colors to match A/B colors in your figure
    
    fig = plt.figure(figsize=(4, 5),dpi=200)
    c = "#FF6347"
    box1 = plt.boxplot(array1, positions=[1], patch_artist=True,
                boxprops=dict(facecolor=c, color=c),
                capprops=dict(color=c),
                whiskerprops=dict(color=c),
                flierprops=dict(color=c, markeredgecolor=c),
                medianprops=dict(color=c))
    plt.setp(box1["medians"], color="black")

    c2 = "#228B22"
    box1 = plt.boxplot(array2, 
                       positions=[2],
                       patch_artist=True)

    for item in ['boxes', 'whiskers', 'fliers', 'medians', 'caps']:
            plt.setp(box1[item], color=c2)
    plt.setp(box1["boxes"], facecolor=c2)
    plt.setp(box1["medians"], color="black")
    plt.setp(box1["fliers"], markeredgecolor=c2)
    plt.xticks([1,2], [1,2])
    #plt.ylim(-0.1,1.7)
    plt.ylabel('Signal Distribution', fontsize=16)
    fig.suptitle(title, fontsize=20)
    plt.xticks([1, 2], ['A', 'B'],fontsize=16)
    plt.show()



#### main sample ####
HFC_A = pd.read_csv(path+'hg19_hfc_A.HSB126.tab',sep='\t', header=None) 
HFC_B = pd.read_csv(path+'hg19_hfc_B.HSB126.tab',sep='\t', header=None)
plot_x(HFC_A[5].values,HFC_B[5].values, 'HFC - H3K27AC/HSB126')