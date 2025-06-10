
# version 1.0b1.dev11+g9257235

# Create folder structure. By default, the folder 'output' is used to store output.
mkdir output
mkdir output/simulation
mkdir output/tables
mkdir output/tables/metrics
mkdir output/tables/time_to_discovery
mkdir output/figures

##################################
### DATASET: prior_Smid_2020
##################################

# Create output folder
mkdir output/simulation/prior_Smid_2020/
mkdir output/simulation/prior_Smid_2020/metrics

# Collect descriptives about the dataset prior_Smid_2020
mkdir output/simulation/prior_Smid_2020/descriptives
python -m asreview data describe data/prior_Smid_2020.csv -o output/simulation/prior_Smid_2020/descriptives/data_stats_prior_Smid_2020.json

# Simulate runs
mkdir output/simulation/prior_Smid_2020/state_files

# Classifier = nb, Feature extractor = onehot, Query strategy = max, Balance strategy = balanced
python -m asreview simulate data/prior_Smid_2020.csv -o output/simulation/prior_Smid_2020/state_files/sim_prior_Smid_2020_nb_onehot_max_balanced.asreview --classifier nb --query_strategy max --feature_extraction onehot --prior-seed 535 --seed 165 -q max -b balanced --n-query 1 --n-stop min
python -m asreview metrics output/simulation/prior_Smid_2020/state_files/sim_prior_Smid_2020_nb_onehot_max_balanced.asreview -o output/simulation/prior_Smid_2020/metrics/metrics_sim_prior_Smid_2020_nb_onehot_max_balanced.json --quiet

# Classifier = nb, Feature extractor = tfidf, Query strategy = max, Balance strategy = balanced
python -m asreview simulate data/prior_Smid_2020.csv -o output/simulation/prior_Smid_2020/state_files/sim_prior_Smid_2020_nb_tfidf_max_balanced.asreview --classifier nb --query_strategy max --feature_extraction tfidf --prior-seed 535 --seed 165 -q max -b balanced --n-query 1 --n-stop min
python -m asreview metrics output/simulation/prior_Smid_2020/state_files/sim_prior_Smid_2020_nb_tfidf_max_balanced.asreview -o output/simulation/prior_Smid_2020/metrics/metrics_sim_prior_Smid_2020_nb_tfidf_max_balanced.json --quiet

# Classifier = svm, Feature extractor = onehot, Query strategy = max, Balance strategy = balanced
python -m asreview simulate data/prior_Smid_2020.csv -o output/simulation/prior_Smid_2020/state_files/sim_prior_Smid_2020_svm_onehot_max_balanced.asreview --classifier svm --query_strategy max --feature_extraction onehot --prior-seed 535 --seed 165 -q max -b balanced --n-query 1 --n-stop min
python -m asreview metrics output/simulation/prior_Smid_2020/state_files/sim_prior_Smid_2020_svm_onehot_max_balanced.asreview -o output/simulation/prior_Smid_2020/metrics/metrics_sim_prior_Smid_2020_svm_onehot_max_balanced.json --quiet

# Classifier = svm, Feature extractor = tfidf, Query strategy = max, Balance strategy = balanced
python -m asreview simulate data/prior_Smid_2020.csv -o output/simulation/prior_Smid_2020/state_files/sim_prior_Smid_2020_svm_tfidf_max_balanced.asreview --classifier svm --query_strategy max --feature_extraction tfidf --prior-seed 535 --seed 165 -q max -b balanced --n-query 1 --n-stop min
python -m asreview metrics output/simulation/prior_Smid_2020/state_files/sim_prior_Smid_2020_svm_tfidf_max_balanced.asreview -o output/simulation/prior_Smid_2020/metrics/metrics_sim_prior_Smid_2020_svm_tfidf_max_balanced.json --quiet

# Generate plot and tables for dataset
python scripts/get_plot.py -s output/simulation/prior_Smid_2020/state_files/ -o output/figures/plot_recall_sim_prior_Smid_2020.png --show_legend model
python scripts/merge_metrics.py -s output/simulation/prior_Smid_2020/metrics/ -o output/tables/metrics/metrics_sim_prior_Smid_2020.csv
python scripts/merge_tds.py -s output/simulation/prior_Smid_2020/metrics/ -o output/tables/time_to_discovery/tds_sim_prior_Smid_2020.csv

##################################
### DATASET: van_de_Schoot_2018
##################################

# Create output folder
mkdir output/simulation/van_de_Schoot_2018/
mkdir output/simulation/van_de_Schoot_2018/metrics

# Collect descriptives about the dataset van_de_Schoot_2018
mkdir output/simulation/van_de_Schoot_2018/descriptives
python -m asreview data describe data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/descriptives/data_stats_van_de_Schoot_2018.json

# Simulate runs
mkdir output/simulation/van_de_Schoot_2018/state_files

# Classifier = nb, Feature extractor = onehot, Query strategy = max, Balance strategy = balanced
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_nb_onehot_max_balanced.asreview --classifier nb --query_strategy max --feature_extraction onehot --prior-seed 535 --seed 166 -q max -b balanced --n-query 1 --n-stop min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_nb_onehot_max_balanced.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_nb_onehot_max_balanced.json --quiet

# Classifier = nb, Feature extractor = tfidf, Query strategy = max, Balance strategy = balanced
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_nb_tfidf_max_balanced.asreview --classifier nb --query_strategy max --feature_extraction tfidf --prior-seed 535 --seed 166 -q max -b balanced --n-query 1 --n-stop min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_nb_tfidf_max_balanced.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_nb_tfidf_max_balanced.json --quiet

# Classifier = svm, Feature extractor = onehot, Query strategy = max, Balance strategy = balanced
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_svm_onehot_max_balanced.asreview --classifier svm --query_strategy max --feature_extraction onehot --prior-seed 535 --seed 166 -q max -b balanced --n-query 1 --n-stop min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_svm_onehot_max_balanced.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_svm_onehot_max_balanced.json --quiet

# Classifier = svm, Feature extractor = tfidf, Query strategy = max, Balance strategy = balanced
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_svm_tfidf_max_balanced.asreview --classifier svm --query_strategy max --feature_extraction tfidf --prior-seed 535 --seed 166 -q max -b balanced --n-query 1 --n-stop min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_svm_tfidf_max_balanced.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_svm_tfidf_max_balanced.json --quiet

# Generate plot and tables for dataset
python scripts/get_plot.py -s output/simulation/van_de_Schoot_2018/state_files/ -o output/figures/plot_recall_sim_van_de_Schoot_2018.png --show_legend model
python scripts/merge_metrics.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/metrics/metrics_sim_van_de_Schoot_2018.csv
python scripts/merge_tds.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/time_to_discovery/tds_sim_van_de_Schoot_2018.csv

# Merge descriptives and metrics
python scripts/merge_descriptives.py
python scripts/merge_metrics.py
