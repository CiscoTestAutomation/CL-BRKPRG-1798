# Basic Example

## Summary

This example is a perfect starting point.

1) The Blitz datafile create 1 testcase which has 1 section with 1 execute action.

Just send a show command to the device, thats it.

## Real life scenario

1) Collect multiple show commands output before a network migration
2) Collect multiple show commands from different devices in parallel - Quick
   way to collect network state (See next demos to see how to do this)

## Future possibilites

1) Collect more than 1 show command
2) Run on multiple device in parallel
3) Verify if there are certain string in the output (See 2_blitz_parser.yaml)

## How to execute it

pyats run genie --trigger-datafile 1_blitz_basic.yaml --trigger-uids Basic --testbed-file ../testbed.yaml --liveview --liveview-keepalive
