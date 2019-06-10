*** Settings ***
Library         Telnet
Suite setup     Setup

*** Test Cases ***
Verify Eth2/1 is up
    Write  show run interface Ethernet2/1
    Read Until  show run interface Ethernet2/1
    ${output}=  Read Until Prompt
    Should Contain  ${output}  ip router ospf 1 area 0.0.0.0
    Should Contain  ${output}  no shutdown

Verify show version
    Write  show version
    Read Until  show version
    ${output}=  Read Until Prompt
    Should Contain  ${output}    version 7.3(0)D1(1)

Verify show version fail
    Write  show version
    Read Until  show version
    ${output}=  Read Until Prompt
    Should Contain  ${output}    version 7.4(0)D1(1)

Verify 5 up interfaces
    Write  show interface brief
    Read Until  show interface brief
    ${output}=  Read Until Prompt
    Should Contain  ${output}    up    5

*** Keywords ***
Setup
    Open Connection  host=172.25.192.90  port=17016  prompt=nx-osv-1#
    Write  admin
    Write  admin
    Read Until Prompt
    Write  terminal length 0
    Read Until  terminal length 0
    Read Until Prompt
