# Examples

Examples are generated with the following code (from the root of the repo):

```
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o examples/arfi_example/data -l
cd examples/arfi_example
asreview makita template arfi
cd ../..
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o examples/basic_example/data -l
cd examples/basic_example
asreview makita template basic
cd ../..
synergy_dataset get -d van_de_Schoot_2018 Smid_2020 -o examples/multimodel_example/data -l
cd examples/multimodel_example
asreview makita template multimodel
cd ../..
```
