# Certification testing example

## Summary

This example demonstrate how to do certification with Blitz.

Configure your device, verify it was configured and operation is good, remove,
verify it was removed and operation is good. In this case we will test shut no shut Bgp

## Real life scenario

Before accepting new image on the network, many tests must be run. Blitz is an easy way to automate these tests.

## Future possibilites

1) Create many testcases for all scenarios

## How to execute it

pyats run genie --trigger-datafile 6_certification_test.py --trigger-uids "TestBgpShutdown" --testbed-file testbed_light.yaml --liveview --liveview-keepalive
