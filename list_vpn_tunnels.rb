#!/usr/bin/env ruby
#
# Checks AWS VPN Tunnel health
#

require 'aws-sdk'

regions = ['us-east-1', 'us-west-2', 'eu-west-1', 'ap-northeast-1']
creds   = Aws::SharedCredentials.new(profile_name: '<YOUR_PROFILE>')

regions.each do |region|
  ec2   = Aws::EC2::Client.new(region: region, credentials: creds)
  resp  = ec2.describe_vpn_connections(filters:[{name: "state", values: ["available"]}]).vpn_connections

  if resp.empty?
    puts "No VPN connections found in region #{region}"
  else
    resp.each do |vpn|
      vpn_id = vpn.vpn_connection_id
      vpn.vgw_telemetry.each do |tunnel|
        tunnel_ip = tunnel.outside_ip_address
        tunnel_status = tunnel.status
        if tunnel_status == "DOWN"
          puts "WARNING: Tunnel #{tunnel_ip} for VPN #{vpn_id} in region #{region} is #{tunnel_status}"
        else
          puts "Tunnel #{tunnel_ip} for VPN #{vpn_id} in region #{region} is #{tunnel_status}"
        end
      end
    end
  end
end
