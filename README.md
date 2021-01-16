# Hierarchy Analysis
  * Data files and code used for hierarchical organization analysis in Ma et al (2021) "Hierarchy in sensory processing reflected by innervation balance on cortical interneurons"
  * Add the folder path into pathlist with all these files inside
  * Adapted from Harris et al (2019) "Hierarchical organization of cortical and thalamic connectivity", GitHub https://github.com/AllenInstitute/MouseBrainHierarchy 
## hierarchy_scores_compute_shuffle.m
  Script used to compute hierarchy scores and global hierarchy scores with original or shuffled connectivity data
## figs_plot.m
  Script used to generate figures of iteration results, ranked hierarchy scores, and distributions of global hierarchy scores
  Run after hierarchy_scores_compute_shuffle.m
## IterationFunc.m
  Main function used to iterate hierarchy scores, including shuffling connectivity data if needed
  
# Reference

Ma, G., Liu, Y., Wang, L., Xiao, Z., Song, K., Wang, Y., Peng, W., Liu, X., Wang, Z., Jin, S., Tao, Z., Li, C., Xu, T., Xu, F., Xu, M., Zhang, S. (2021). Hierarchy in sensory processing reflected by innervation balance on cortical interneurons. (Submitted)

Harris, J. A., Mihalas, S., Hirokawa, K. E., Whitesell, J. D., Choi, H., Bernard, A., Bohn, P., Caldejon, S., Casal, L., Cho, A., Feiner, A., Feng, D., Gaudreault, N., Gerfen, C. R., Graddis, N., Groblewski, P. A., Henry, A. M., Ho, A., Howard, R., … Zeng, H. (2019). Hierarchical organization of cortical and thalamic connectivity. Nature, 575(7781), 195–202. https://doi.org/10/ggcd9n (The original paper; When you use the model in this paper)
