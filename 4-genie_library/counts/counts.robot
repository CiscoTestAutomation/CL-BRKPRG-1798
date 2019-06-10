
*** Settings ***
# Sourcing RobotFramework Keywords
Library        ats.robot.pyATSRobot
Library        genie.libs.robot.GenieRobot

*** Variables ***
# Define the pyATS testbed file to use for this run
${testbed}     ../../tb.yaml



*** Test Cases ***
# Creating test cases from available keywords.

Initialize
    # Initializes the pyATS/Genie Testbed
    # pyATS Testbed can be used within pyATS/Genie
    use genie testbed "${testbed}"

    # Connect to both device
    connect to device "nx-osv-1"
    connect to device "csr1000v-1"
    
# Verify Bgp Neighbors
Verify the counts of Bgp 'established' neighbors for nx-osv-1&csr1000v-1
    verify count "1" "bgp neighbors" on device "nx-osv-1"
    verify count "1" "bgp neighbors" on device "csr1000v-1"

# Verify Bgp Routes
Verify the counts of Bgp routes for nx-osv-1&csr1000v-1
    verify count "2" "bgp routes" on device "nx-osv-1"
    verify count "2" "bgp routes" on device "csr1000v-1"

# Verify OSPF neighbor counts
Verify the counts of Ospf 'full' neighbors for nx-osv-1&csr1000v-1
    verify count "2" "ospf neighbors" on device "nx-osv-1"
    verify count "2" "ospf neighbors" on device "csr1000v-1"

# Verify Interfaces
Verify the counts of 'up' Interace for nx-osv-1&csr1000v-1
    verify count "5" "interface up" on device "nx-osv-1"
    verify count "5" "interface up" on device "csr1000v-1"
