# Examples

Examples are generated with the following code (from the root of the repo):

```
mkdir examples
mkdir examples/arfi_example
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o examples/arfi_example/data -l
cd examples/arfi_example
asreview makita template arfi --overwrite --platform linux
cd ../..
mkdir examples/basic_example
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o examples/basic_example/data -l
cd examples/basic_example
asreview makita template basic --overwrite --platform linux
cd ../..
mkdir examples/multimodel_example
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o examples/multimodel_example/data -l
cd examples/multimodel_example
asreview makita template multimodel --overwrite --platform linux
cd ../..
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o examples/prior_example/data -l
ren ./examples/prior_example/data/Smid_2020.csv prior_Smid_2020.csv
cd examples/prior_example
asreview makita template prior --overwrite --platform linux
cd ../..
```
