# LEDE Packages    

## Packages   
* ShadowsocksR-libev  
* ChinaDNS  
* luci-app-shadowsocksr  
* luci-app-chinadns  
* luci-app-transparent-proxy  

## Usage  

*P.S. If you don't want to use Docker, check out the [Dockerfile](https://github.com/techotaku/Docker-LEDE-SDK/blob/bcm53xx/Dockerfile) for environment.*    

1. [Install Docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/).    
2. `mkdir ~/lede`, then create LEDE SDK container: `sudo docker run --name lede-sdk -v ~/lede:/root/share -it tarot13/lede-sdk:bcm53xx`.    
3. Prepare: `wget https://github.com/techotaku/lede-packages/raw/master/prepare.sh -O /root/prepare.sh && chmod +x /root/prepare.sh && /root/prepare.sh`.    
4. `make menuconfig` or put your own `.config`.    

```
make package/ShadowsocksR-libev/compile -j2 V=s
make package/luci-app-shadowsocksr/compile -j2 V=s
make package/ChinaDNS/compile -j2 V=s
make package/luci-app-chinadns/compile -j2 V=s
make package/luci-app-transparent-proxy/compile -j2 V=s

cp bin/packages/arm_cortex-a9/base/*.ipk ~/share/
cp bin/packages/arm_cortex-a9/packages/*.ipk ~/share/
```