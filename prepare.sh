#/bin/sh

cd ~/sdk
./scripts/feeds update
./scripts/feeds install libpcre libopenssl libmbedtls
wget -P package/feeds/base/mbedtls/patches https://github.com/techotaku/lede/raw/master/package/libs/mbedtls/patches/999-tweak-config-for-shadowsocksr.patch
git clone -b master --depth=1 https://github.com/techotaku/luci-app-shadowsocksr.git package/luci-app-shadowsocksr
git clone -b master --depth=1 https://github.com/techotaku/luci-app-chinadns.git package/luci-app-chinadns
git clone -b master --depth=1 https://github.com/techotaku/luci-app-transparent-proxy.git package/luci-app-transparent-proxy
cd ~
git clone https://github.com/techotaku/lede-packages.git
mkdir -p sdk/package/ChinaDNS
cp -r lede-packages/ChinaDNS/* sdk/package/ChinaDNS/
mkdir -p sdk/package/ShadowsocksR-libev
cp -r lede-packages/ShadowsocksR-libev/* sdk/package/ShadowsocksR-libev/
cd sdk
pushd package/luci-app-shadowsocksr/tools/po2lmo
make && make install
popd
#mv package/diffconfig.bcm53xx .config
make defconfig