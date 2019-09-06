#!/bin/bash

# Replace with your custom Vivado installation folder if needed
if source /opt/Xilinx/Vivado/2017.4/settings64.sh; then
	./bin/MSHR_configurator
else
	echo "Update the Vivado installation folder in MSHR_configurator.sh"
fi
