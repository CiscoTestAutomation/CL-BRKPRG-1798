# Parser Example

## Summary

Improvement of the previous example

1) The Blitz datafile create 1 testcase which has 2 section with each 1 execute action.
2) Verify 10.1.1.1, remote AS 65000 and Established is in the output
3) Verify 10.3.3.3 is not in the output
4) Verify with Parser similar information

## Real life scenario

1) Collect multiple show commands output before a network migration
2) Collect multiple show commands from different devices in parallel - Quick
   way to collect network state (See next demos to see how to do this)

## Future possibilites

1) Collect more than 1 show command
2) Run on multiple device in parallel

## How to execute it

pyats run genie --trigger-datafile 2_blitz_parser.yaml --trigger-uids Parser --testbed-file testbed_light.yaml --liveview --liveview-keepalive
