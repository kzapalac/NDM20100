# sub-cluster A information
nodes = 1000
cores_per_node = 128
memory_per_node = 256
sub_cluster_A_cores = nodes * cores_per_node
sub_cluster_A_memory = nodes * memory_per_node # in GB
print(f'There are {sub_cluster_A_cores} cores in sub-cluster A.')
print(f'There are {sub_cluster_A_memory} GB of memory available to sub-cluster A.')

import socket
print(socket.gethostname())

import pandas as pd
df = pd.read_csv('/anvil/projects/tdm/data/flights/subset/1991.csv')
df[df["Month"]==12].head() # get all flights in December

# load libraries
import pandas as pd
# creating python function
def colStats(df, colName):
    # colName should be a str
    
    # string to input the summary statistics in 
    output = ("MyDf Summary Statistics ---\n"
        "Shape: {}\n"
        "Mean: {}\n"
        "Median: {}\n"
        "Standard Deviation: {}\n"
        "--------------------------")
    # specifying the values within each {}
    output = output.format(df.shape, df[colName].mean().round(3), df[colName].median(), df[colName].std().round(3))
    print(output)
# read in data
df = pd.read_csv("/anvil/projects/tdm/data/flights/subset/1991.csv")
# testing python function
colStats(df=df, colName="DepDelay")