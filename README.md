# Celegans_premotor
Julia code for "A data-driven biology-based network model reproduces C. elegans premotor neural dynamics"


> ### get_Atanas_data.ipynb
>
> - downloads whole-brain imaging data [Atanas et al. (2023)](https://wormwideweb.org/activity/dataset/)
> - saves data to folder data/Atanas_data


> ### simulations.ipynb
> Model simulations for the following figures
> - Figure 3
> - Figure 4
> - Figure 8
> - Figure 9


> ### Synaptic_weights_figures.ipynb
> - Figure 2


> ### determine_cause_of_switches-8.ipynb
> - Figure 5


> ### ablate_core_neurons.ipynb
> - Figure 6


> ### compare_to_Leifer.ipynb
> - Figure 7


> ### White_graph_process.ipynb
> Makes processed graph data from original connectome data from [White et al. (1986)](https://www.wormatlas.org/images/NeuronConnect.xls).


> ### computer_avg_weights.ipynb
> Computes average synaptic weights using regression

Processed White et al. (1986) connectome data : data/White_data_processed/df5.csv.

Average model weights : data/model_weights/avg_model_weights.jld2.


Whole brain imaging data : Atanas_data/???.json.



