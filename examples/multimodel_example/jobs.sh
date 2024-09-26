
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

# Collect descriptives about the dataset Smid_2020
mkdir output/simulation/Smid_2020/descriptives
python -m asreview data describe data/Smid_2020.csv -o output/simulation/Smid_2020/descriptives/data_stats_Smid_2020.json

# Generate wordcloud visualizations of all datasets
python -m asreview wordcloud data/Smid_2020.csv -o output/figures/wordcloud_Smid_2020.png --width 800 --height 500
python -m asreview wordcloud data/Smid_2020.csv -o output/figures/wordcloud_relevant_Smid_2020.png --width 800 --height 500 --relevant
python -m asreview wordcloud data/Smid_2020.csv -o output/figures/wordcloud_irrelevant_Smid_2020.png --width 800 --height 500 --irrelevant

# Simulate runs
mkdir output/simulation/Smid_2020/state_files

# Classifier = logistic, Feature extractor = doc2vec, Query strategy = max, Balance strategy = double
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_logistic_doc2vec_max_double.asreview --model logistic --query_strategy max --feature_extraction doc2vec --init_seed 535 --seed 165 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_logistic_doc2vec_max_double.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_logistic_doc2vec_max_double.json

# Classifier = logistic, Feature extractor = sbert, Query strategy = max, Balance strategy = double
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_logistic_sbert_max_double.asreview --model logistic --query_strategy max --feature_extraction sbert --init_seed 535 --seed 165 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_logistic_sbert_max_double.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_logistic_sbert_max_double.json

# Classifier = logistic, Feature extractor = tfidf, Query strategy = max, Balance strategy = double
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_logistic_tfidf_max_double.asreview --model logistic --query_strategy max --feature_extraction tfidf --init_seed 535 --seed 165 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_logistic_tfidf_max_double.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_logistic_tfidf_max_double.json


# Skipped nb + doc2vec + max model


# Skipped nb + sbert + max model

# Classifier = nb, Feature extractor = tfidf, Query strategy = max, Balance strategy = double
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_nb_tfidf_max_double.asreview --model nb --query_strategy max --feature_extraction tfidf --init_seed 535 --seed 165 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_nb_tfidf_max_double.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_nb_tfidf_max_double.json

# Classifier = rf, Feature extractor = doc2vec, Query strategy = max, Balance strategy = double
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_rf_doc2vec_max_double.asreview --model rf --query_strategy max --feature_extraction doc2vec --init_seed 535 --seed 165 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_rf_doc2vec_max_double.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_rf_doc2vec_max_double.json

# Classifier = rf, Feature extractor = sbert, Query strategy = max, Balance strategy = double
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_rf_sbert_max_double.asreview --model rf --query_strategy max --feature_extraction sbert --init_seed 535 --seed 165 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_rf_sbert_max_double.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_rf_sbert_max_double.json

# Classifier = rf, Feature extractor = tfidf, Query strategy = max, Balance strategy = double
python -m asreview simulate data/Smid_2020.csv -s output/simulation/Smid_2020/state_files/sim_Smid_2020_rf_tfidf_max_double.asreview --model rf --query_strategy max --feature_extraction tfidf --init_seed 535 --seed 165 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_rf_tfidf_max_double.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_rf_tfidf_max_double.json

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

# Collect descriptives about the dataset van_de_Schoot_2018
mkdir output/simulation/van_de_Schoot_2018/descriptives
python -m asreview data describe data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/descriptives/data_stats_van_de_Schoot_2018.json

# Generate wordcloud visualizations of all datasets
python -m asreview wordcloud data/van_de_Schoot_2018.csv -o output/figures/wordcloud_van_de_Schoot_2018.png --width 800 --height 500
python -m asreview wordcloud data/van_de_Schoot_2018.csv -o output/figures/wordcloud_relevant_van_de_Schoot_2018.png --width 800 --height 500 --relevant
python -m asreview wordcloud data/van_de_Schoot_2018.csv -o output/figures/wordcloud_irrelevant_van_de_Schoot_2018.png --width 800 --height 500 --irrelevant

# Simulate runs
mkdir output/simulation/van_de_Schoot_2018/state_files

# Classifier = logistic, Feature extractor = doc2vec, Query strategy = max, Balance strategy = double
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_logistic_doc2vec_max_double.asreview --model logistic --query_strategy max --feature_extraction doc2vec --init_seed 535 --seed 166 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_logistic_doc2vec_max_double.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_logistic_doc2vec_max_double.json

# Classifier = logistic, Feature extractor = sbert, Query strategy = max, Balance strategy = double
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_logistic_sbert_max_double.asreview --model logistic --query_strategy max --feature_extraction sbert --init_seed 535 --seed 166 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_logistic_sbert_max_double.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_logistic_sbert_max_double.json

# Classifier = logistic, Feature extractor = tfidf, Query strategy = max, Balance strategy = double
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_logistic_tfidf_max_double.asreview --model logistic --query_strategy max --feature_extraction tfidf --init_seed 535 --seed 166 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_logistic_tfidf_max_double.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_logistic_tfidf_max_double.json


# Skipped nb + doc2vec + max model


# Skipped nb + sbert + max model

# Classifier = nb, Feature extractor = tfidf, Query strategy = max, Balance strategy = double
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_nb_tfidf_max_double.asreview --model nb --query_strategy max --feature_extraction tfidf --init_seed 535 --seed 166 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_nb_tfidf_max_double.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_nb_tfidf_max_double.json

# Classifier = rf, Feature extractor = doc2vec, Query strategy = max, Balance strategy = double
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_rf_doc2vec_max_double.asreview --model rf --query_strategy max --feature_extraction doc2vec --init_seed 535 --seed 166 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_rf_doc2vec_max_double.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_rf_doc2vec_max_double.json

# Classifier = rf, Feature extractor = sbert, Query strategy = max, Balance strategy = double
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_rf_sbert_max_double.asreview --model rf --query_strategy max --feature_extraction sbert --init_seed 535 --seed 166 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_rf_sbert_max_double.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_rf_sbert_max_double.json

# Classifier = rf, Feature extractor = tfidf, Query strategy = max, Balance strategy = double
python -m asreview simulate data/van_de_Schoot_2018.csv -s output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_rf_tfidf_max_double.asreview --model rf --query_strategy max --feature_extraction tfidf --init_seed 535 --seed 166 -q max -b double --n_instances 1 --stop_if min
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_rf_tfidf_max_double.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_rf_tfidf_max_double.json

# Generate plot and tables for dataset
python scripts/get_plot.py -s output/simulation/van_de_Schoot_2018/state_files/ -o output/figures/plot_recall_sim_van_de_Schoot_2018.png --show_legend model
python scripts/merge_metrics.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/metrics/metrics_sim_van_de_Schoot_2018.csv
python scripts/merge_tds.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/time_to_discovery/tds_sim_van_de_Schoot_2018.csv

# Merge descriptives and metrics
python scripts/merge_descriptives.py
python scripts/merge_metrics.py
