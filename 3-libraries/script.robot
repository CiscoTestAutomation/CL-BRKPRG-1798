*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot
Variables      Config.yaml
Suite setup    Setup

*** Variables ***
${testbed}    ../tb.yaml

*** Test Cases ***
Send show version
    ${output}=    execute "show version" on device "uut"
    Should Contain  ${output}    version 7.3(0)D1(1)

Change interface description
    configure "interface e2/1\ndescription Hello" on device "uut"

Verify interface description
    ${output}=    execute "show running interface e2/1" on device "uut"
    Should Contain  ${output}    Hello

Change configuration from yaml file
    configure "${Interface_config}" on device "uut"

Count ospf neighbor
    ${output}=    execute "show ip ospf neighbor" on device "uut"
    Should Contain X Times  ${output}  FULL  2

Verify bgp all
    ${output}=    execute "show bgp all" on device "uut"
    Should match regexp  ${output}  \\*>i10.11.11.11/32\\s+10.1.1.1

*** Keywords ***
Setup
    use genie testbed "${testbed}"
    connect to devices "uut"

