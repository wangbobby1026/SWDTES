# SWDTES
we proposed a split-window-driven temperature-and-emissivity separation (SWDTES) algorithm for LST and LSE retrieval from SDGSAT-1 TIS data.

1. The thermal infrared radiative transfer simulation dataset customized for SDGSAT1 TIS sensor are generated using the atmospheric radiative transfer code MODTRAN 5.2.
2. As for atmospheric conditions, the TIGR dataset, encompassing 2311 representative atmospheric situations with w ranging from 0.06 g·cm-2 to 8.0 g·cm-2, is utilized (Chedin et al. 1985).
3. For observed geometry, considering that the TIS has a maximum VZA of 33.1°, 5 VZAs are employed in the simulation.
4. Regarding surface conditions, the ECOSTRESS Spectral Library, encompassing over 3400 spectra of natural and man-made materials, is utilized (Meerdink et al. 2019). To enhance the representativeness of emissivity samples, the samples with similar emissivity spectral characteristics are removed, resulting 83 emissivity samples.
5. For LST, 6 levels of TS according to Tb for each profile were considered in the simulation. 
