#
# This software is licensed under the Public Domain.
#


include $(TOPDIR)/rules.mk

PKG_NAME:=bandwidth
PKG_VERSION:=0.1
PKG_RELEASE:=1

NETPERF_NAME:=netperf
NETPERF_VERSION:=2.7.0


include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/bandwidth
  SECTION:=net
  CATEGORY:=Network
  TITLE:=Uplink bandwidth measurement & storing for routers
  URL:=http://www.netperf.org/
  MAINTAINER:=Ashish Sharma <pocha.sharma@gmail.com>
endef


define Package/bandwidth/description
	This package measures uplink bandwidth regularly & writes into /proc/bandiwdth file
endef


define Build/Prepare
#!/bin/sh
	make $(TOPDIR)/$(SOURCE)/netperf/compile 
	mkdir -p $(PKG_BUILD_DIR)
	cp ./src/* $(PKG_BUILD_DIR)/
endef


define Package/bandwidth/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/bandwidth $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/betterspeedtest $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/etc/init.d/
	$(INSTALL_BIN) files/bandwidth.init $(1)/etc/init.d/bandwidth
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) files/bandwidth.config $(1)/etc/config/bandwidth
endef

$(eval $(call BuildPackage,bandwidth))
