*** Settings ***
Library     BuiltIn
Library     Process


*** Test Cases ***
Ping 127.0.0.1
    ${result} =     Run Process  ping 127.0.0.1 -c 1   shell=True  stdout=stdout.txt
    Log     all output: ${result.stdout}
    Should Contain  ${result.stdout}     , 0.0% packet loss

Ping localhost
    ${result} =     Run Process  ping localhost -c 1   shell=True  stdout=stdout.txt
    Log     all output: ${result.stdout}
    Should Contain  ${result.stdout}    , 0.0% packet loss

Ping InternetAccess
    ${result} =     Run Process  ping 8.8.8.8 -c 1   shell=True  stdout=stdout.txt
    Log     all output: ${result.stdout}
    Should Contain  ${result.stdout}    , 0.0% packet loss

Ping WrongAddress
    ${result} =     Run Process  ping 1.2.3.4 -c 1   shell=True  stdout=stdout.txt
    Log     all output: ${result.stdout}
    Should Contain  ${result.stdout}    , 0.0% packet loss
