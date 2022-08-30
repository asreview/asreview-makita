

# version 0+unknown

# Create folder structure. By default, the folder 'output' is used to store output.
mkdir output
mkdir output/simulation

##################################
### DATASET: ptsd
##################################

# Create output folder
mkdir output/simulation/ptsd/

# Collect descriptives about the dataset ptsd
mkdir output/simulation/ptsd/descriptives
asreview data describe data/ptsd.csv -o output/simulation/ptsd/descriptives/data_stats_ptsd.json

# Generate wordcloud visualizations of all datasets
asreview wordcloud data/ptsd.csv -o output/simulation/ptsd/descriptives/wordcloud_ptsd.png --width 800 --height 500
asreview wordcloud data/ptsd.csv -o output/simulation/ptsd/descriptives/wordcloud_relevant_ptsd.png --width 800 --height 500 --relevant
asreview wordcloud data/ptsd.csv -o output/simulation/ptsd/descriptives/wordcloud_irrelevant_ptsd.png --width 800 --height 500 --irrelevant

# Simulate runs
mkdir output/simulation/ptsd/state_files
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_0.asreview --init_seed 535 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_0.asreview -o output/simulation/ptsd/metrics_sim_ptsd_0.json

# Generate plot for dataset
python scripts/get_plot.py -s output/simulation/ptsd/state_files/ -o output/simulation/ptsd/plot_recall_sim_ptsd.png

##################################
### DATASET: ptsd_copy
##################################

# Create output folder
mkdir output/simulation/ptsd_copy/

# Collect descriptives about the dataset ptsd_copy
mkdir output/simulation/ptsd_copy/descriptives
asreview data describe data/ptsd_copy.csv -o output/simulation/ptsd_copy/descriptives/data_stats_ptsd_copy.json

# Generate wordcloud visualizations of all datasets
asreview wordcloud data/ptsd_copy.csv -o output/simulation/ptsd_copy/descriptives/wordcloud_ptsd_copy.png --width 800 --height 500
asreview wordcloud data/ptsd_copy.csv -o output/simulation/ptsd_copy/descriptives/wordcloud_relevant_ptsd_copy.png --width 800 --height 500 --relevant
asreview wordcloud data/ptsd_copy.csv -o output/simulation/ptsd_copy/descriptives/wordcloud_irrelevant_ptsd_copy.png --width 800 --height 500 --irrelevant

# Simulate runs
mkdir output/simulation/ptsd_copy/state_files
asreview simulate data/ptsd_copy.csv -s output/simulation/ptsd_copy/state_files/sim_ptsd_copy_0.asreview --init_seed 535 --seed 166
asreview metrics output/simulation/ptsd_copy/state_files/sim_ptsd_copy_0.asreview -o output/simulation/ptsd_copy/metrics_sim_ptsd_copy_0.json

# Generate plot for dataset
python scripts/get_plot.py -s output/simulation/ptsd_copy/state_files/ -o output/simulation/ptsd_copy/plot_recall_sim_ptsd_copy.png

# Merge descriptives and metrics
python scripts/merge_descriptives.py
python scripts/merge_metrics.py