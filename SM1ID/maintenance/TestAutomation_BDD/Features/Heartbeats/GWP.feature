Feature: GWP

A short summary of the feature

@Heartbeat
Scenario: Ensure the GWP endpoint is available
	When A GET Request is sent to 'gwp/AvailabilityCheckEndpoint'
	Then The Response status should be 200


@HeartbeatLoop
Scenario: Ensure the GWP endpoint is available within time limit
	Given The looping timeout is set to 10 minutes
	When A GET Request is sent to 'gwp/AvailabilityCheckEndpoint'
	Then The Request should retry every 20 seconds until the status is 200