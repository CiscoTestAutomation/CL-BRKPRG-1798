# Configure Example

## Summary

Configure your device and verify the configuration has been done correctly. Larger configuration - Add 2 Bgp neighbors for each device.

1) The Blitz datafile create 2 testcase which has 2 section with each 2 execute action.
2) Take a snapshot of BGP feature for each device - Will be compared after configuration to print the changes
3) Configure 1 interface on each device in parallel
4) Verify the configuration has been done as expected in parallel
5) Take a snapshot of BGP feature for each device post configuration
6) Compare both snapshot (2) with (5) and print what has changed. Easy way to visually see the operational change of the whole BGP

A second testcase is then ran to remove the configuration - So we can re-run the testcase multiple time.

## Real life scenario

How do we verify our configuration is operation has expected? 

Ping? show run?

Using this techique we can verify if it is behaving exactly as expected. 

On top of this, now we can see how the operational state has changed.

## Future possibilites

1) Larger configuration with more verification

## How to execute it

pyats run genie --trigger-datafile 5_configure_bgp.yaml --trigger-uids "Configure Unconfigure" --testbed-file testbed_light.yaml --liveview --liveview-keepalive
