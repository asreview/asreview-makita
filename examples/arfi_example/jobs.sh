

# version 0.9.2

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

# Collect descriptives about the dataset
mkdir output/simulation/Smid_2020/descriptives
python -m asreview data describe data/Smid_2020.csv -o output/simulation/Smid_2020/descriptives/data_stats_Smid_2020.json

# Generate wordcloud visualizations of all datasets
python -m asreview wordcloud data/Smid_2020.csv -o output/figures/wordcloud_Smid_2020.png --width 800 --height 500
python -m asreview wordcloud data/Smid_2020.csv -o output/figures/wordcloud_relevant_Smid_2020.png --width 800 --height 500 --relevant
python -m asreview wordcloud data/Smid_2020.csv -o output/figures/wordcloud_irrelevant_Smid_2020.png --width 800 --height 500 --irrelevant

# Simulate runs, collect metrics and create plots
mkdir output/simulation/Smid_2020/state_files
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_31.asreview --prior_record_id 31 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_31.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_31.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_121.asreview --prior_record_id 121 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_121.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_121.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_122.asreview --prior_record_id 122 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_122.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_122.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_216.asreview --prior_record_id 216 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_216.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_216.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_520.asreview --prior_record_id 520 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_520.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_520.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_526.asreview --prior_record_id 526 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_526.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_526.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_672.asreview --prior_record_id 672 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_672.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_672.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_763.asreview --prior_record_id 763 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_763.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_763.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_810.asreview --prior_record_id 810 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_810.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_810.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1000.asreview --prior_record_id 1000 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1000.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1000.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1063.asreview --prior_record_id 1063 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1063.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1063.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1195.asreview --prior_record_id 1195 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1195.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1195.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1203.asreview --prior_record_id 1203 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1203.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1203.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1257.asreview --prior_record_id 1257 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1257.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1257.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1429.asreview --prior_record_id 1429 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1429.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1429.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1534.asreview --prior_record_id 1534 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1534.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1534.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1809.asreview --prior_record_id 1809 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1809.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1809.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1820.asreview --prior_record_id 1820 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1820.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1820.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1876.asreview --prior_record_id 1876 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1876.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1876.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_1877.asreview --prior_record_id 1877 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_1877.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_1877.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_2067.asreview --prior_record_id 2067 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_2067.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_2067.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_2070.asreview --prior_record_id 2070 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_2070.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_2070.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_2241.asreview --prior_record_id 2241 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_2241.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_2241.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_2276.asreview --prior_record_id 2276 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_2276.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_2276.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_2279.asreview --prior_record_id 2279 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_2279.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_2279.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_2307.asreview --prior_record_id 2307 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_2307.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_2307.json
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_2452.asreview --prior_record_id 2452 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_2452.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_2452.json

# Generate plot and tables for dataset
python scripts/get_plot.py -s output/simulation/Smid_2020/state_files/ -o output/figures/plot_recall_sim_Smid_2020.png --show_legend model
python scripts/merge_metrics.py -s output/simulation/Smid_2020/metrics/ -o output/tables/metrics/metrics_sim_Smid_2020.csv
python scripts/merge_tds.py -s output/simulation/Smid_2020/metrics/ -o output/tables/time_to_discovery/tds_sim_Smid_2020.csv

##################################
### DATASET: van_de_Schoot_2018
##################################
# Create output folder
mkdir output/simulation/van_de_Schoot_2018/
mkdir output/simulation/van_de_Schoot_2018/metrics

# Collect descriptives about the dataset
mkdir output/simulation/van_de_Schoot_2018/descriptives
python -m asreview data describe data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/descriptives/data_stats_van_de_Schoot_2018.json

# Generate wordcloud visualizations of all datasets
python -m asreview wordcloud data/van_de_Schoot_2018.csv -o output/figures/wordcloud_van_de_Schoot_2018.png --width 800 --height 500
python -m asreview wordcloud data/van_de_Schoot_2018.csv -o output/figures/wordcloud_relevant_van_de_Schoot_2018.png --width 800 --height 500 --relevant
python -m asreview wordcloud data/van_de_Schoot_2018.csv -o output/figures/wordcloud_irrelevant_van_de_Schoot_2018.png --width 800 --height 500 --irrelevant

# Simulate runs, collect metrics and create plots
mkdir output/simulation/van_de_Schoot_2018/state_files
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_51.asreview --prior_record_id 51 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_51.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_51.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_116.asreview --prior_record_id 116 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_116.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_116.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_462.asreview --prior_record_id 462 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_462.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_462.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_730.asreview --prior_record_id 730 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_730.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_730.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_767.asreview --prior_record_id 767 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_767.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_767.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_831.asreview --prior_record_id 831 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_831.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_831.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_902.asreview --prior_record_id 902 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_902.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_902.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_953.asreview --prior_record_id 953 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_953.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_953.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1033.asreview --prior_record_id 1033 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1033.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1033.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1180.asreview --prior_record_id 1180 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1180.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1180.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1248.asreview --prior_record_id 1248 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1248.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1248.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1356.asreview --prior_record_id 1356 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1356.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1356.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1429.asreview --prior_record_id 1429 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1429.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1429.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1514.asreview --prior_record_id 1514 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1514.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1514.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1554.asreview --prior_record_id 1554 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1554.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1554.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1565.asreview --prior_record_id 1565 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1565.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1565.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1746.asreview --prior_record_id 1746 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1746.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1746.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1881.asreview --prior_record_id 1881 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1881.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1881.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1994.asreview --prior_record_id 1994 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_1994.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_1994.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2279.asreview --prior_record_id 2279 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2279.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_2279.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2496.asreview --prior_record_id 2496 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2496.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_2496.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2545.asreview --prior_record_id 2545 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2545.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_2545.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2624.asreview --prior_record_id 2624 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2624.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_2624.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2740.asreview --prior_record_id 2740 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2740.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_2740.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2803.asreview --prior_record_id 2803 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_2803.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_2803.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3076.asreview --prior_record_id 3076 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3076.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_3076.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3314.asreview --prior_record_id 3314 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3314.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_3314.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3442.asreview --prior_record_id 3442 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3442.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_3442.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3608.asreview --prior_record_id 3608 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3608.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_3608.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3680.asreview --prior_record_id 3680 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3680.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_3680.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3769.asreview --prior_record_id 3769 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3769.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_3769.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3842.asreview --prior_record_id 3842 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_3842.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_3842.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4154.asreview --prior_record_id 4154 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4154.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_4154.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4201.asreview --prior_record_id 4201 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4201.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_4201.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4269.asreview --prior_record_id 4269 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4269.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_4269.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4327.asreview --prior_record_id 4327 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4327.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_4327.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4377.asreview --prior_record_id 4377 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4377.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_4377.json
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4461.asreview --prior_record_id 4461 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 -m nb -e tfidf -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_4461.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_4461.json

# Generate plot and tables for dataset
python scripts/get_plot.py -s output/simulation/van_de_Schoot_2018/state_files/ -o output/figures/plot_recall_sim_van_de_Schoot_2018.png --show_legend model
python scripts/merge_metrics.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/metrics/metrics_sim_van_de_Schoot_2018.csv
python scripts/merge_tds.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/time_to_discovery/tds_sim_van_de_Schoot_2018.csv

# Merge descriptives and metrics
python scripts/merge_descriptives.py
python scripts/merge_metrics.py
