*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot
Suite setup    Setup
Variables      BGP.yaml

*** Variables ***
${testbed}    ../tb.yaml

*** Test Cases ***

IPv4 iBGP Neighborship
    ${cmd}=    execute "show ip bgp summary" on device "nx-osv-1"
    should contain  ${cmd}  10.1.1.1
    ${cmd}=    execute "show ip bgp neighbor 10.1.1.1" on device "nx-osv-1"
    should contain  ${cmd}  BGP state = Established
    should contain  ${cmd}  Stale time for routes advertised by peer: 300 seconds

Verify keepalive/holtime can be set and modified
    ${cmd}=    execute "show ip bgp neighbor 10.1.1.1 | inc 'hold time'" on device "nx-osv-1"
    should contain  ${cmd}  hold time = 180, keepalive interval is 60 seconds
    configure "${hold_time}" on device "nx-osv-1"
    execute "clear bgp all 10.1.1.1" on device "nx-osv-1"
    sleep  30s
    ${cmd}=    execute "show ip bgp neighbor 10.1.1.1 | inc 'hold time'" on device "nx-osv-1"
    should contain  ${cmd}  hold time = 150, keepalive interval is 50 seconds

    configure "${no_hold_time}" on device "nx-osv-1"
    execute "clear bgp all 10.1.1.1" on device "nx-osv-1"
    sleep  30s
    ${cmd}=    execute "show ip bgp neighbor 10.1.1.1 | inc 'hold time'" on device "nx-osv-1"
    should contain  ${cmd}  hold time = 180, keepalive interval is 60 seconds


*** Keywords ***
Setup
    use testbed "../../tb.yaml"
    connect to all devices
