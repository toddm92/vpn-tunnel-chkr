### Checks AWS VPN Tunnel Health

This Ruby script checks the health of your VPC/VPN Tunnels.

**Requirements:**

* Tested with ruby 2.4.2p198
# Ruby AWS SDK
* A valid profile in `~/.aws/config` or `${AWS_CONFIG_FILE}` with the appropriate API keys

**Usage:**

```
./list_vpn_tunnels.rb
```  

**Sample Output:**

```
./list_vpn_tunnels.rb

WARNING: Tunnel 34.196.98.23 for VPN vpn-f94f5d98 in region us-east-1 is DOWN
Tunnel 34.202.244.1 for VPN vpn-f94f5d98 in region us-east-1 is UP
No VPN connections found in region us-west-2
No VPN connections found in region eu-west-1
No VPN connections found in region ap-northeast-1
```

