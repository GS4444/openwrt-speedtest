App runs betterspeedtest.sh every 5 min & store output in /tmp/bandwidth

### Building

checkout the repo in BUILD_ROOT/package directory. 

	make package/openwrt-bandwidth/compile V=99 

from root of your BUILD_ROOT . 

ipk is generated inside bin/ directory. Copy in your openwrt & you are good to go
