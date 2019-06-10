*** Settings ***
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot
Library        unicon.robot.UniconRobot
Library        Collections
Suite setup    Setup

*** Variables ***
${testbed}    ../tb.yaml

*** Test Cases ***
Check Interfaces errors
    ${output}=    parse "show interface" on device "nx-osv-1"
    ${items}=      Get Dictionary Items    ${output}    True
    :FOR    ${key}    ${value}    IN    @{items}
    \    Log     "Checking for CRC error"
    \    ${crc_value}=    evaluate    $value.get("counter", {}).get("in_crc_errors", 0)
    \    ${crc_value}=    Convert To String    ${crc_value}
    \    Run keyword And Continue On Failure    should be equal    ${crc_value}    0
    \    Log     "Checking for late collision error"
    \    ${late_value}=    evaluate    $value.get("counter", {}).get("late_collision", 0)
    \    ${late_value}=    Convert To String    ${late_value}
    \    Run keyword And Continue On Failure    should be equal    ${late_value}    0

*** Keywords ***
Setup
    use genie testbed "${testbed}"
    connect to devices "nx-osv-1"

