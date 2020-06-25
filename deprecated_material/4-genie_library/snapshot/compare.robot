# Demo Script to verify sanity of network

*** Settings ***
# Importing test libraries, resource files and variable files.
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot


*** Variables ***
# Defining variables that can be used elsewhere in the test data. 
# Can also be driven as dash argument at runtime

# Define the pyATS testbed file to use for this run
${testbed}     ../../tb.yaml
${snapshot1}
${snapshot2}
${devices}

*** Test Cases ***
# Creating test cases from available keywords.

Compare 2 snapshots
    Compare profile "${snapshot1}" with "${snapshot2}" on devices "${devices}"
