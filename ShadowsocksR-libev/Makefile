include $(TOPDIR)/rules.mk

PKG_NAME:=shadowsocksR-libev
PKG_VERSION:=v20170708
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION)-$(PKG_RELEASE).tar.gz
PKG_SOURCE_URL:=https://github.com/shadowsocksr/shadowsocksr-libev.git
PKG_SOURCE_PROTO:=git
PKG_SOURCE_VERSION:=bf324d848cffa0b5b567cfa6d31c0fb1ec096ec6
PKG_SOURCE_SUBDIR:=$(PKG_NAME)-$(PKG_VERSION)
PKG_MAINTAINER:=breakwa11

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)-$(BUILD_VARIANT)/$(PKG_NAME)-$(PKG_VERSION)

PKG_INSTALL:=1
PKG_FIXUP:=autoreconf
PKG_USE_MIPS16:=0
PKG_BUILD_PARALLEL:=1

include $(INCLUDE_DIR)/package.mk

define Package/shadowsocksr-libev/Default
	SECTION:=net
	CATEGORY:=Network
	TITLE:=Lightweight Secured Socks5 Proxy
	URL:=https://github.com/shadowsocksr/shadowsocksr
endef

# default packages
define Package/shadowsocksr-libev
	$(call Package/shadowsocksr-libev/Default)
	TITLE+= (OpenSSL)
	VARIANT:=openssl
	DEPENDS:=+libopenssl +libpthread +libpcre +zlib
endef

define Package/shadowsocksr-libev-mbedtls
	$(call Package/shadowsocksr-libev/Default)
	TITLE+= (mbedTLS)
	VARIANT:=mbedtls
	DEPENDS:=+libmbedtls +libpthread +libpcre
endef

define Package/shadowsocksr-libev/description
ShadowsocksR-libev is a lightweight secured socks5 proxy for embedded devices and low end boxes.
endef

Package/shadowsocksr-libev-mbedtls/description=$(Package/shadowsocksr-libev/description)

CONFIGURE_ARGS += --disable-ssp --disable-documentation --disable-assert

ifeq ($(BUILD_VARIANT),mbedtls)
	CONFIGURE_ARGS += --with-crypto-library=mbedtls
endif

define Package/shadowsocksr-libev/postinst
#!/bin/sh
if [ -f /usr/bin/ssr-redir -a ! -f /usr/bin/ss-redir ]; then
	ln -s /usr/bin/ssr-redir /usr/bin/ss-redir
fi
if [ -f /usr/bin/ssr-local -a ! -f /usr/bin/ss-local ]; then
	ln -s /usr/bin/ssr-local /usr/bin/ss-local
fi
exit 0
endef

Package/shadowsocksr-libev-mbedtls/postinst = $(Package/shadowsocksr-libev/postinst)

define Package/shadowsocksr-libev/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/ss-local $(1)/usr/bin/ssr-local
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/ss-redir $(1)/usr/bin/ssr-redir
endef

Package/shadowsocksr-libev-mbedtls/install=$(Package/shadowsocksr-libev/install)

$(eval $(call BuildPackage,shadowsocksr-libev))
$(eval $(call BuildPackage,shadowsocksr-libev-mbedtls))