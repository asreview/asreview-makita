

# version 1.generated.example

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
python scripts/data_describe.py data/Smid_2020.csv -o output/simulation/Smid_2020/descriptives/data_stats_Smid_2020.json

# Simulate runs, collect metrics and create plots
mkdir output/simulation/Smid_2020/state_files
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_31.asreview --prior-idx 31 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_31.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_31.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_121.asreview --prior-idx 121 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_121.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_121.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_122.asreview --prior-idx 122 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_122.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_122.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_216.asreview --prior-idx 216 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_216.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_216.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_520.asreview --prior-idx 520 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_520.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_520.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_526.asreview --prior-idx 526 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_526.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_526.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_672.asreview --prior-idx 672 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_672.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_672.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_763.asreview --prior-idx 763 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_763.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_763.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_810.asreview --prior-idx 810 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_810.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_810.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1000.asreview --prior-idx 1000 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1000.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1000.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1063.asreview --prior-idx 1063 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1063.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1063.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1195.asreview --prior-idx 1195 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1195.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1195.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1203.asreview --prior-idx 1203 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1203.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1203.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1257.asreview --prior-idx 1257 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1257.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1257.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1429.asreview --prior-idx 1429 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1429.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1429.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1534.asreview --prior-idx 1534 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1534.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1534.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1809.asreview --prior-idx 1809 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1809.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1809.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1820.asreview --prior-idx 1820 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1820.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1820.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1876.asreview --prior-idx 1876 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1876.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1876.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1877.asreview --prior-idx 1877 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_1877.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_1877.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2067.asreview --prior-idx 2067 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2067.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_2067.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2070.asreview --prior-idx 2070 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2070.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_2070.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2241.asreview --prior-idx 2241 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2241.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_2241.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2276.asreview --prior-idx 2276 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2276.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_2276.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2279.asreview --prior-idx 2279 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2279.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_2279.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2307.asreview --prior-idx 2307 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2307.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_2307.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2452.asreview --prior-idx 2452 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u3
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u3_2452.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u3_2452.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_31.asreview --prior-idx 31 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_31.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_31.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_121.asreview --prior-idx 121 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_121.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_121.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_122.asreview --prior-idx 122 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_122.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_122.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_216.asreview --prior-idx 216 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_216.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_216.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_520.asreview --prior-idx 520 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_520.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_520.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_526.asreview --prior-idx 526 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_526.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_526.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_672.asreview --prior-idx 672 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_672.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_672.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_763.asreview --prior-idx 763 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_763.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_763.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_810.asreview --prior-idx 810 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_810.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_810.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1000.asreview --prior-idx 1000 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1000.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1000.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1063.asreview --prior-idx 1063 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1063.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1063.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1195.asreview --prior-idx 1195 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1195.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1195.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1203.asreview --prior-idx 1203 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1203.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1203.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1257.asreview --prior-idx 1257 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1257.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1257.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1429.asreview --prior-idx 1429 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1429.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1429.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1534.asreview --prior-idx 1534 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1534.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1534.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1809.asreview --prior-idx 1809 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1809.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1809.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1820.asreview --prior-idx 1820 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1820.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1820.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1876.asreview --prior-idx 1876 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1876.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1876.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1877.asreview --prior-idx 1877 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_1877.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_1877.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2067.asreview --prior-idx 2067 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2067.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_2067.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2070.asreview --prior-idx 2070 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2070.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_2070.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2241.asreview --prior-idx 2241 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2241.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_2241.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2276.asreview --prior-idx 2276 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2276.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_2276.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2279.asreview --prior-idx 2279 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2279.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_2279.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2307.asreview --prior-idx 2307 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2307.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_2307.json --quiet
python -m asreview simulate data/Smid_2020.csv -o output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2452.asreview --prior-idx 2452 1225 1252 425 2568 1010 2053 1836 1716 1873 261 --seed 165 --ai elas_u4
python -m asreview metrics output/simulation/Smid_2020/state_files/sim_Smid_2020_elas_u4_2452.asreview -o output/simulation/Smid_2020/metrics/metrics_sim_Smid_2020_elas_u4_2452.json --quiet

# Generate plot and tables for dataset
python scripts/get_plot.py -s output/simulation/Smid_2020/state_files/ -o output/figures/plot_recall_sim_Smid_2020.png --show-legend model
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
python scripts/data_describe.py data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/descriptives/data_stats_van_de_Schoot_2018.json

# Simulate runs, collect metrics and create plots
mkdir output/simulation/van_de_Schoot_2018/state_files
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_51.asreview --prior-idx 51 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_51.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_51.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_116.asreview --prior-idx 116 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_116.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_116.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_462.asreview --prior-idx 462 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_462.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_462.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_730.asreview --prior-idx 730 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_730.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_730.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_767.asreview --prior-idx 767 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_767.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_767.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_831.asreview --prior-idx 831 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_831.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_831.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_902.asreview --prior-idx 902 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_902.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_902.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_953.asreview --prior-idx 953 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_953.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_953.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1033.asreview --prior-idx 1033 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1033.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1033.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1180.asreview --prior-idx 1180 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1180.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1180.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1248.asreview --prior-idx 1248 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1248.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1248.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1356.asreview --prior-idx 1356 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1356.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1356.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1429.asreview --prior-idx 1429 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1429.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1429.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1514.asreview --prior-idx 1514 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1514.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1514.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1554.asreview --prior-idx 1554 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1554.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1554.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1565.asreview --prior-idx 1565 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1565.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1565.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1746.asreview --prior-idx 1746 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1746.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1746.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1881.asreview --prior-idx 1881 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1881.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1881.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1994.asreview --prior-idx 1994 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_1994.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_1994.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2279.asreview --prior-idx 2279 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2279.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_2279.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2496.asreview --prior-idx 2496 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2496.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_2496.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2545.asreview --prior-idx 2545 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2545.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_2545.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2624.asreview --prior-idx 2624 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2624.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_2624.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2740.asreview --prior-idx 2740 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2740.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_2740.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2803.asreview --prior-idx 2803 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_2803.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_2803.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3076.asreview --prior-idx 3076 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3076.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_3076.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3314.asreview --prior-idx 3314 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3314.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_3314.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3442.asreview --prior-idx 3442 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3442.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_3442.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3608.asreview --prior-idx 3608 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3608.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_3608.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3680.asreview --prior-idx 3680 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3680.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_3680.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3769.asreview --prior-idx 3769 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3769.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_3769.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3842.asreview --prior-idx 3842 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_3842.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_3842.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4154.asreview --prior-idx 4154 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4154.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_4154.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4201.asreview --prior-idx 4201 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4201.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_4201.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4269.asreview --prior-idx 4269 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4269.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_4269.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4327.asreview --prior-idx 4327 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4327.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_4327.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4377.asreview --prior-idx 4377 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4377.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_4377.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4461.asreview --prior-idx 4461 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u3
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u3_4461.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u3_4461.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_51.asreview --prior-idx 51 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_51.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_51.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_116.asreview --prior-idx 116 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_116.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_116.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_462.asreview --prior-idx 462 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_462.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_462.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_730.asreview --prior-idx 730 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_730.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_730.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_767.asreview --prior-idx 767 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_767.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_767.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_831.asreview --prior-idx 831 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_831.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_831.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_902.asreview --prior-idx 902 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_902.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_902.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_953.asreview --prior-idx 953 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_953.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_953.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1033.asreview --prior-idx 1033 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1033.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1033.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1180.asreview --prior-idx 1180 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1180.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1180.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1248.asreview --prior-idx 1248 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1248.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1248.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1356.asreview --prior-idx 1356 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1356.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1356.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1429.asreview --prior-idx 1429 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1429.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1429.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1514.asreview --prior-idx 1514 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1514.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1514.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1554.asreview --prior-idx 1554 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1554.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1554.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1565.asreview --prior-idx 1565 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1565.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1565.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1746.asreview --prior-idx 1746 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1746.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1746.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1881.asreview --prior-idx 1881 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1881.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1881.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1994.asreview --prior-idx 1994 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_1994.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_1994.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2279.asreview --prior-idx 2279 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2279.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_2279.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2496.asreview --prior-idx 2496 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2496.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_2496.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2545.asreview --prior-idx 2545 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2545.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_2545.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2624.asreview --prior-idx 2624 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2624.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_2624.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2740.asreview --prior-idx 2740 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2740.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_2740.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2803.asreview --prior-idx 2803 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_2803.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_2803.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3076.asreview --prior-idx 3076 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3076.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_3076.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3314.asreview --prior-idx 3314 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3314.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_3314.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3442.asreview --prior-idx 3442 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3442.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_3442.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3608.asreview --prior-idx 3608 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3608.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_3608.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3680.asreview --prior-idx 3680 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3680.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_3680.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3769.asreview --prior-idx 3769 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3769.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_3769.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3842.asreview --prior-idx 3842 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_3842.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_3842.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4154.asreview --prior-idx 4154 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4154.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_4154.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4201.asreview --prior-idx 4201 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4201.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_4201.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4269.asreview --prior-idx 4269 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4269.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_4269.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4327.asreview --prior-idx 4327 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4327.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_4327.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4377.asreview --prior-idx 4377 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4377.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_4377.json --quiet
python -m asreview simulate data/van_de_Schoot_2018.csv -o output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4461.asreview --prior-idx 4461 4382 1972 3329 4088 1416 696 1820 2971 2875 2976 --seed 166 --ai elas_u4
python -m asreview metrics output/simulation/van_de_Schoot_2018/state_files/sim_van_de_Schoot_2018_elas_u4_4461.asreview -o output/simulation/van_de_Schoot_2018/metrics/metrics_sim_van_de_Schoot_2018_elas_u4_4461.json --quiet

# Generate plot and tables for dataset
python scripts/get_plot.py -s output/simulation/van_de_Schoot_2018/state_files/ -o output/figures/plot_recall_sim_van_de_Schoot_2018.png --show-legend model
python scripts/merge_metrics.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/metrics/metrics_sim_van_de_Schoot_2018.csv
python scripts/merge_tds.py -s output/simulation/van_de_Schoot_2018/metrics/ -o output/tables/time_to_discovery/tds_sim_van_de_Schoot_2018.csv

# Merge descriptives and metrics
python scripts/merge_descriptives.py
python scripts/merge_metrics.py
