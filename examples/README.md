# Examples

Examples are generated with the following code (from the root of the repo):

```
mkdir examples

synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o examples/data -l

asreview makita template arfi -s ./examples/data -p ./examples/arfi_example --overwrite --platform linux
asreview makita template basic -s ./examples/data -p ./examples/basic_example --overwrite --platform linux
asreview makita template multimodel -s ./examples/data -p ./examples/multimodel_example --overwrite --platform linux
ren ./examples/prior_example/data/Smid_2020.csv prior_Smid_2020.csv
asreview makita template prior -s ./examples/data -p ./examples/prior_example --overwrite --platform linux
```
