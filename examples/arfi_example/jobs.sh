

# version 0.1.1+88.g0103c56.dirty

# Create folder structure. By default, the folder 'output' is used to store output.
mkdir output
mkdir output/simulation

##################################
### DATASET: ptsd
##################################
# Create output folder
mkdir output/simulation/ptsd/

# Collect descriptives about the dataset
mkdir output/simulation/ptsd/descriptives
asreview data describe data/ptsd.csv -o output/simulation/ptsd/descriptives/data_stats_ptsd.json

# Generate wordcloud visualizations of all datasets
asreview wordcloud data/ptsd.csv -o output/simulation/ptsd/descriptives/wordcloud_ptsd.png --width 800 --height 500
asreview wordcloud data/ptsd.csv -o output/simulation/ptsd/descriptives/wordcloud_relevant_ptsd.png --width 800 --height 500 --relevant
asreview wordcloud data/ptsd.csv -o output/simulation/ptsd/descriptives/wordcloud_irrelevant_ptsd.png --width 800 --height 500 --irrelevant

# Simulate runs, collect metrics and create plots
mkdir output/simulation/ptsd/state_files
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_284.asreview --prior_record_id 284 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_284.asreview -o output/simulation/ptsd/metrics_sim_ptsd_284.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_335.asreview --prior_record_id 335 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_335.asreview -o output/simulation/ptsd/metrics_sim_ptsd_335.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_592.asreview --prior_record_id 592 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_592.asreview -o output/simulation/ptsd/metrics_sim_ptsd_592.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_675.asreview --prior_record_id 675 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_675.asreview -o output/simulation/ptsd/metrics_sim_ptsd_675.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_719.asreview --prior_record_id 719 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_719.asreview -o output/simulation/ptsd/metrics_sim_ptsd_719.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_720.asreview --prior_record_id 720 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_720.asreview -o output/simulation/ptsd/metrics_sim_ptsd_720.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_896.asreview --prior_record_id 896 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_896.asreview -o output/simulation/ptsd/metrics_sim_ptsd_896.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_897.asreview --prior_record_id 897 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_897.asreview -o output/simulation/ptsd/metrics_sim_ptsd_897.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_1425.asreview --prior_record_id 1425 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_1425.asreview -o output/simulation/ptsd/metrics_sim_ptsd_1425.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_1446.asreview --prior_record_id 1446 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_1446.asreview -o output/simulation/ptsd/metrics_sim_ptsd_1446.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_1568.asreview --prior_record_id 1568 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_1568.asreview -o output/simulation/ptsd/metrics_sim_ptsd_1568.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_1922.asreview --prior_record_id 1922 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_1922.asreview -o output/simulation/ptsd/metrics_sim_ptsd_1922.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_1933.asreview --prior_record_id 1933 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_1933.asreview -o output/simulation/ptsd/metrics_sim_ptsd_1933.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_2382.asreview --prior_record_id 2382 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_2382.asreview -o output/simulation/ptsd/metrics_sim_ptsd_2382.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_2408.asreview --prior_record_id 2408 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_2408.asreview -o output/simulation/ptsd/metrics_sim_ptsd_2408.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_2444.asreview --prior_record_id 2444 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_2444.asreview -o output/simulation/ptsd/metrics_sim_ptsd_2444.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_2445.asreview --prior_record_id 2445 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_2445.asreview -o output/simulation/ptsd/metrics_sim_ptsd_2445.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_2446.asreview --prior_record_id 2446 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_2446.asreview -o output/simulation/ptsd/metrics_sim_ptsd_2446.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_2455.asreview --prior_record_id 2455 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_2455.asreview -o output/simulation/ptsd/metrics_sim_ptsd_2455.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_2472.asreview --prior_record_id 2472 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_2472.asreview -o output/simulation/ptsd/metrics_sim_ptsd_2472.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_2616.asreview --prior_record_id 2616 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_2616.asreview -o output/simulation/ptsd/metrics_sim_ptsd_2616.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_3053.asreview --prior_record_id 3053 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_3053.asreview -o output/simulation/ptsd/metrics_sim_ptsd_3053.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_3141.asreview --prior_record_id 3141 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_3141.asreview -o output/simulation/ptsd/metrics_sim_ptsd_3141.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_3316.asreview --prior_record_id 3316 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_3316.asreview -o output/simulation/ptsd/metrics_sim_ptsd_3316.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_3483.asreview --prior_record_id 3483 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_3483.asreview -o output/simulation/ptsd/metrics_sim_ptsd_3483.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_3489.asreview --prior_record_id 3489 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_3489.asreview -o output/simulation/ptsd/metrics_sim_ptsd_3489.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_3898.asreview --prior_record_id 3898 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_3898.asreview -o output/simulation/ptsd/metrics_sim_ptsd_3898.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4011.asreview --prior_record_id 4011 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4011.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4011.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4104.asreview --prior_record_id 4104 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4104.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4104.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4106.asreview --prior_record_id 4106 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4106.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4106.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4250.asreview --prior_record_id 4250 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4250.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4250.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4313.asreview --prior_record_id 4313 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4313.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4313.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4334.asreview --prior_record_id 4334 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4334.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4334.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4434.asreview --prior_record_id 4434 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4434.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4434.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4435.asreview --prior_record_id 4435 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4435.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4435.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4768.asreview --prior_record_id 4768 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4768.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4768.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4938.asreview --prior_record_id 4938 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4938.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4938.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_4939.asreview --prior_record_id 4939 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_4939.asreview -o output/simulation/ptsd/metrics_sim_ptsd_4939.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_5054.asreview --prior_record_id 5054 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_5054.asreview -o output/simulation/ptsd/metrics_sim_ptsd_5054.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_5244.asreview --prior_record_id 5244 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_5244.asreview -o output/simulation/ptsd/metrics_sim_ptsd_5244.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_5284.asreview --prior_record_id 5284 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_5284.asreview -o output/simulation/ptsd/metrics_sim_ptsd_5284.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_5479.asreview --prior_record_id 5479 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_5479.asreview -o output/simulation/ptsd/metrics_sim_ptsd_5479.json
asreview simulate data/ptsd.csv -s output/simulation/ptsd/state_files/sim_ptsd_5655.asreview --prior_record_id 5655 229 5190 36 3062 4198 2187 5677 695 1939 786 --seed 165
asreview metrics output/simulation/ptsd/state_files/sim_ptsd_5655.asreview -o output/simulation/ptsd/metrics_sim_ptsd_5655.json

# Generate plot for dataset
python scripts/get_plot.py -s output/simulation/ptsd/state_files/ -o output/simulation/ptsd/plot_recall_sim_ptsd.png

##################################
### DATASET: ptsd_again
##################################
# Create output folder
mkdir output/simulation/ptsd_again/

# Collect descriptives about the dataset
mkdir output/simulation/ptsd_again/descriptives
asreview data describe data/ptsd_again.csv -o output/simulation/ptsd_again/descriptives/data_stats_ptsd_again.json

# Generate wordcloud visualizations of all datasets
asreview wordcloud data/ptsd_again.csv -o output/simulation/ptsd_again/descriptives/wordcloud_ptsd_again.png --width 800 --height 500
asreview wordcloud data/ptsd_again.csv -o output/simulation/ptsd_again/descriptives/wordcloud_relevant_ptsd_again.png --width 800 --height 500 --relevant
asreview wordcloud data/ptsd_again.csv -o output/simulation/ptsd_again/descriptives/wordcloud_irrelevant_ptsd_again.png --width 800 --height 500 --irrelevant

# Simulate runs, collect metrics and create plots
mkdir output/simulation/ptsd_again/state_files
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_284.asreview --prior_record_id 284 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_284.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_284.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_335.asreview --prior_record_id 335 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_335.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_335.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_592.asreview --prior_record_id 592 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_592.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_592.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_675.asreview --prior_record_id 675 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_675.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_675.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_719.asreview --prior_record_id 719 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_719.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_719.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_720.asreview --prior_record_id 720 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_720.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_720.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_896.asreview --prior_record_id 896 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_896.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_896.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_897.asreview --prior_record_id 897 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_897.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_897.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_1425.asreview --prior_record_id 1425 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_1425.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_1425.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_1446.asreview --prior_record_id 1446 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_1446.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_1446.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_1568.asreview --prior_record_id 1568 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_1568.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_1568.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_1922.asreview --prior_record_id 1922 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_1922.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_1922.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_1933.asreview --prior_record_id 1933 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_1933.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_1933.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_2382.asreview --prior_record_id 2382 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_2382.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_2382.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_2408.asreview --prior_record_id 2408 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_2408.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_2408.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_2444.asreview --prior_record_id 2444 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_2444.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_2444.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_2445.asreview --prior_record_id 2445 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_2445.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_2445.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_2446.asreview --prior_record_id 2446 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_2446.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_2446.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_2455.asreview --prior_record_id 2455 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_2455.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_2455.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_2472.asreview --prior_record_id 2472 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_2472.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_2472.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_2616.asreview --prior_record_id 2616 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_2616.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_2616.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_3053.asreview --prior_record_id 3053 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_3053.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_3053.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_3141.asreview --prior_record_id 3141 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_3141.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_3141.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_3316.asreview --prior_record_id 3316 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_3316.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_3316.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_3483.asreview --prior_record_id 3483 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_3483.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_3483.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_3489.asreview --prior_record_id 3489 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_3489.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_3489.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_3898.asreview --prior_record_id 3898 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_3898.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_3898.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4011.asreview --prior_record_id 4011 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4011.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4011.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4104.asreview --prior_record_id 4104 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4104.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4104.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4106.asreview --prior_record_id 4106 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4106.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4106.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4250.asreview --prior_record_id 4250 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4250.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4250.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4313.asreview --prior_record_id 4313 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4313.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4313.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4334.asreview --prior_record_id 4334 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4334.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4334.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4434.asreview --prior_record_id 4434 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4434.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4434.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4435.asreview --prior_record_id 4435 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4435.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4435.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4768.asreview --prior_record_id 4768 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4768.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4768.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4938.asreview --prior_record_id 4938 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4938.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4938.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_4939.asreview --prior_record_id 4939 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_4939.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_4939.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_5054.asreview --prior_record_id 5054 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_5054.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_5054.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_5244.asreview --prior_record_id 5244 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_5244.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_5244.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_5284.asreview --prior_record_id 5284 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_5284.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_5284.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_5479.asreview --prior_record_id 5479 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_5479.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_5479.json
asreview simulate data/ptsd_again.csv -s output/simulation/ptsd_again/state_files/sim_ptsd_again_5655.asreview --prior_record_id 5655 542 5077 2666 4160 2216 3394 1085 3140 1273 5770 --seed 166
asreview metrics output/simulation/ptsd_again/state_files/sim_ptsd_again_5655.asreview -o output/simulation/ptsd_again/metrics_sim_ptsd_again_5655.json

# Generate plot for dataset
python scripts/get_plot.py -s output/simulation/ptsd_again/state_files/ -o output/simulation/ptsd_again/plot_recall_sim_ptsd_again.png

# Merge descriptives and metrics
python scripts/merge_descriptives.py
python scripts/merge_metrics.py