# Configure Example

## Summary

Configure your device and verify the configuration has been done correctly. Build on top of demo 3.

1) The Blitz datafile create 1 testcase which has 5 sections with each 2 execute actions.
2) Take a snapshot of show interfaces for each device - Will be compared after configuration to print the changes
3) Configure 1 interface on each device in parallel
4) Verify the configuration has been done as expected in parallel
5) Take a snapshot of show interfaces for each device post configuration
6) Compare both snapshot (2) with (5) and print what has changed. Easy way to visually see the operational change.

## Real life scenario

How do we verify our configuration is operation has expected? 

Ping? show run?

Using this technique we can verify if it is behaving exactly as expected. 

On top of this, now we can see how the operational state has changed.

## Future possibilites

1) Larger configuration with more verification

## How to execute it

pyats run genie --trigger-datafile 4_snapshot.yaml --trigger-uids Snapshot --testbed-file ../testbed.yaml --liveview --liveview-keepalive
