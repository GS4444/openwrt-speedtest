App runs betterspeedtest.sh every 5 min & store output in /tmp/bandwidth

### Building

checkout the repo in BUILD_ROOT/package directory. 

	make package/openwrt-speedtest/compile V=99 

from root of your BUILD_ROOT . 

ipk is generated inside bin/ directory. Copy in your openwrt & you are good to go

You would also need to build [netperf](http://github.com/griggi/openwrt-netperf) separately, copy the ipk to Openwrt & install it. It installs `netperf` which is used by `betterspeedtest` to measure the bandwidth

### Version 2.0

Current implementation uses netperf binary & connects to netperf server located in the US. There are better implementation available in python. 

1. [speedtest-cli](https://github.com/sivel/speedtest-cli) uses speedtest.net servers (you could see a list of available servers at [http://www.speedtest.net/speedtest-servers.php](http://www.speedtest.net/speedtest-servers.php) ). The result are lot more accurate. 

2. [tespeed](https://github.com/Janhouse/tespeed) is similar but probably lesser complex than speedtest-cli. It also uses nearest speedtest.net server.

Aim is to re-write (or write from scratch) a daemon in C which selects one of the nearest speedtest.net server, does a speedcheck & show output. **It is impossible to run a python script on Openwrt** as there is less than 1M space on router to install an Openwrt package. 

### Test development

Check `src/main.c` . To run the file stand-alone, just compile & run it to see how it works. You do not need to setup Openwrt build environment on your PC. Just write the C code, compile & make it work on your PC. 

### How to contribute

Fork this repository, put your version of main.c & send a pull request. If your submission is right, we will add you as contributor to this organization (griggi) & you may contribute to other projects as well. 

If you have any issues, mail me at pocha.sharma at gmail. You may also create an issue & one of us will answer it. 
