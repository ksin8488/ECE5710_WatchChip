# ECE5710_WatchChip
Final Project repository for Verilog files and other components for making a wristwatch chip for VLSI.
<br><br>
Project 2 is the directory containing the modfiied "sealring_merged" (our layout including the cirucit, polyfill, metalfill, and sealring) to pass the DRC/LVS checks. The DRC run file is nested within the project2/virtuoso/calibre directory as the fullchip runset. The LVS likewise can be found within the project2/virtuoso/calibre directory as the full LVS runset. You must ensure that on the inputs tab of the LVS run the "sealring_merged.sp" is your netlist/spice file. Additionally the corresponding .gds file can be found within the project2/virtuoso directory as "Ella_Kashish_Nick_.gds". When importing the .gds file ensure that the top cell is "sealring_merged".
<br><br>
Some documents of note include the "final.rpt" (contains information about cell area and timing) from genus as well as the "soc_top_power.rpt" (provides dynamic, leakage, and total power values) nested within project2/genus/SCRIPTS. Within project2/innovus/RPT you can find the "area_final.rpt" showing an area of 1.34mm <sup>2</sup> meeting the required dimension specifications.
