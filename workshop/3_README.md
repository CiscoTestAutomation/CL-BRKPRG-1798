# Configure Example

## Summary

Configure your device and verify the configuration has been done correctly

1) The Blitz datafile create 1 testcase which has 2 sections with each 2 execute actions.
2) Configure 1 interface on each device in parallel
3) Verify the configuration has been done as expected in parallel

You will notice the common cleanup fails, it is expected, as it verify if the
configuration has changed in the run, you can turn it off if desired.

## Real life scenario

How do we verify our configuration is operation has expected? 

Ping? show run?

Using this technique we can verify if it is behaving exactly as expected. 

## Future possibilites

1) Larger configuration with more verification

## How to execute it

pyats run genie --trigger-datafile 3_configure.yaml --trigger-uids Configure --testbed-file ../testbed.yaml --liveview --liveview-keepalive
