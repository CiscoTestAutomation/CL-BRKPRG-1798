*** Settings ***
Library     Telnet

*** Test Cases ***
Telnet To NXOS
    Open Connection  host=172.25.192.90  port=17016  prompt=nx-osv-1#
    Write  admin
    Write  admin
    Read Until Prompt
    Write  terminal length 0
    Read Until  terminal length 0
    Read Until Prompt
    Write  show interface brief
    Read Until  show interface brief
    ${output}=  Read Until Prompt
    Write  exit
    Close All Connections
