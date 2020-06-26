# Name of the testcase
TestBgpShutdown:
    # Field containing all the Testcase sections
    test_sections:

        # Section name
        - apply_configuration:
            # List of actions
            - configure:
                device: R3_nx
                command: |
                  router bgp 65000
                  shutdown
            - sleep:
                sleep_time: 5
                #sleep_time: '%{variables.sleep_time}'

        # Second section name
        - verify_configuration:
            - execute:
                device: R3_nx
                command: show bgp process vrf all
                include:
                    # Verify Shutdown is within the show run output
                  - 'Shutdown'
                exclude:
                    # Verify Running is not within the show run output
                  - 'Running'

            # Action #2
            # Send show command and use our available parsers to make sure
            # the bgp protocol state is shutdown
            - parse:
                device: R3_nx
                # All action supports banner field to add to the log
                banner: Verify bgp process is shutdown
                command: show bgp process vrf all
                include:
                    - "contains_key_value('bgp_protocol_state', 'shutdown')"
                save:
                    - variable_name: parsed_show_bgp_process
            - print:
                print_parsed_output:
                    value: "%VARIABLES{parsed_show_bgp_process}"

        - Revert_configuration:
            # Configure action, which accepts command as an argument
            - configure:
                device: R3_nx
                banner: Un-Shutting down bgp 65000
                command: |
                  router bgp 65000
                  no shutdown

        - verify_revert:
            # Run these actions in parallel
            - parallel:
              - execute:
                  device: R3_nx
                  command: show bgp process vrf all
                  include:
                      # Verify Running is within the show run output
                      - 'Running'
              # Send show command and use our available parsers to make sure
              # it is the bgp protocol state which is running
              - parse:
                  device: R3_nx
                  command: show bgp process vrf all
                  include:
                      - "contains_key_value('bgp_protocol_state', 'running')"

    # Location of the blitz trigger
    source:
      pkg: genie.libs.sdk
      class: triggers.blitz.blitz.Blitz
