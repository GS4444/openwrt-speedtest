netperf isn't available standalone for compilation into Openwrt. Hence created this repo. 

Download Openwrt SDK, clone the repo inside package & run 

	make package/netperf

The ipk file is generated inside bin/ directory of the SDK
