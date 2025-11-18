# Celegans_premotor
Julia code for "A data-driven biology-based network model reproduces C. elegans premotor neural dynamics"

Kernel: Julia 1.11.2


### get_Atanas_data.ipynb
>
> - downloads whole-brain imaging data [Atanas et al. (2023)](https://wormwideweb.org/activity/dataset/)
> - saves data to folder data/Atanas_data

---

### simulations.ipynb
>
>
> Switching dynamics and higher order statistics
> - Figure 3
>
> Gap junctions versus synaptic connections
> - Figure 4
>
> Replicating the impact of heat shocks
> - Figure 8
>
> Behavior over long duractions: roaming vs dwelling
> - Figure 9
---



### Synaptic_weights_figures.ipynb
> Model dynamics and parameters
>  - Figure 2

---


### determine_cause_of_switches-8.ipynb
>
> Promoter and supporessor signal neurons
>- Figure 5


#### ablate_core_neurons.ipynb
> - Figure 6


#### compare_to_Leifer.ipynb
> - Figure 7

---


#### White_graph_process.ipynb
> Makes processed graph data from original connectome data from [White et al. (1986)](https://www.wormatlas.org/images/NeuronConnect.xls).


#### computer_avg_weights.ipynb
> Computes average synaptic weights using regression
> Saves average weights in folder data/model_weights







