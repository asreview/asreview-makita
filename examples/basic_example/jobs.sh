

# version 0.0.0

# Create folder structure. By default, the folder 'output' is used to store output.
mkdir output
mkdir output/simulation
mkdir output/tables
mkdir output/tables/metrics
mkdir output/tables/time_to_discovery
mkdir output/figures


##################################
### DATASET: Smid_2020
##################################

# Create output folder
mkdir output/simulation/Smid_2020/
mkdir output/simulation/Smid_2020/metrics

# Collect descriptives about the dataset Smid_2020
mkdir output/simulation/Smid_2020/descriptives
asreview data describe data/Smid_2020.csv -o output/simulation/Smid_2020/descriptives/data_stats_Smid_2020.json

# Generate wordcloud visualizations of all datasets
asreview wordcloud data/Smid_2020.csv -o output/figures/wordcloud_Smid_2020.png --width 800 --height 500
asreview wordcloud data/Smid_2020.csv -o output/figures/wordcloud_relevant_Smid_2020.png --width 800 --height 500 --relevant
asreview wordcloud data/Smid_2020.csv -o output/figures/wordcloud_irrelevant_Smid_2020.png --width 800 --height 500 --irrelevant

# Simulate runs
mkdir output/simulation/Smid_2020/state_files
asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_0.asreview --init_seed 535 --seed 165
asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_0.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_0.json

# Generate plot and tables for dataset
python scripts/get_plot.py -s output/simulation/Smid_2020/state_files/ -o output/figures/plot_recall_sim_Smid_2020.png
python scripts/merge_metrics.py -s output/simulation/Smid_2020/metrics/ -o output/tables/metrics/metrics_sim_Smid_2020.csv
python scripts/merge_tds.py -s output/simulation/Smid_2020/metrics/ -o output/tables/time_to_discovery/tds_sim_Smid_2020.csv

##################################
### DATASET: van_de_Schoot_2018
##################################

# Create output folder
mkdir output/simulation/van_de_Schoot_2018/
mkdir output/simulation/van_de_Schoot_2018/metrics

# Collect descriptives about the dataset van_de_Schoot_2018
mkdir output/simulation/van_de_Schoot_2018/descriptives
asreview data describe data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/descriptives/data_stats_van_de_Schoot_2018.json

# Generate wordcloud visualizations of all datasets
asreview wordcloud data/van_de_Schoot_2018.csv -o output/figures/wordcloud_van_de_Schoot_2018.png --width 800 --height 500
asreview wordcloud data/van_de_Schoot_2018.csv -o output/figures/wordcloud_relevant_van_de_Schoot_2018.png --width 800 --height 500 --relevant
asreview wordcloud data/van_de_Schoot_2018.csv -o output/figures/wordcloud_irrelevant_van_de_Schoot_2018.png --width 800 --height 500 --irrelevant

# Simulate runs
mkdir output/simulation/van_de_Schoot_2018/state_files
asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_0.asreview --init_seed 535 --seed 166
asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_0.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_0.json

# Generate plot and tables for dataset
python scripts/get_plot.py -s output/simulation/van_de_Schoot_2018/state_files/ -o output/figures/plot_recall_sim_van_de_Schoot_2018.png
python scripts/merge_metrics.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/metrics/metrics_sim_van_de_Schoot_2018.csv
python scripts/merge_tds.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/time_to_discovery/tds_sim_van_de_Schoot_2018.csv

# Merge descriptives and metrics
python scripts/merge_descriptives.py -s output/simulation/*/descriptives/ -o output/tables/data_descriptives_all.csv
python scripts/merge_metrics.py -s output/simulation/*/metrics/ -o output/tables/metrics_sim_all.csv
