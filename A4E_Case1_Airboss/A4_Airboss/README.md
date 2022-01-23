# A-4E Case 1 Carrier Landing with MOOSE Airboss 

This mission contains a self-contained DCS mission file that uses the [MOOSE AIRBOSS](https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Ops.Airboss.html)
script to provide graded carrier recoveries and various LSO voice and radio commands.  AIRBOSS also does useful things like
turn the carrier into the wind, and control recovery tankers, etc.

There are two versions of this mission:

** A4_carrier_landing_training_v1.miz** This is the standalone mission that most people will want to use.

** A4_carrier_landing_training_v1_dev.miz **   This is a version for scriptors or developers that load the scripts externally,
they are assumed to be in C:\HypeMan\A4_Airboss

## Mission Details and instructions

The mission has you hot start in the air 10 nautical miles behind the carrier.  First set your TACAN to 59X, and your ILS to Channel 9.
Fly towards the initial point and wait for AIRBOSS to start recovering aircraft.  This should take around 30 seconds from when you enter the aircraft.


Set your RADIO to radio pre-set 1 (button 1, 264Mhz) to call to the CV-59 Approach Controller.

Using the COMM1 keyboard shortcut (Default is LALT + \), press the F10 button to get to the AIRBOSS MENU, then choose "REQUEST COMMENCE"

Change your RADIO to preset 3 (button 3, 256Mhz) for the LSO, and enter the standard CASE 1 recovery by flying to the Initial Position:
3NM behind the carrier, at 800 feet, at 300 knots, and proceed to perform a standard CASE 1 overhead break and recovery.

## AIRBOSS MENU
You will use the F10 menu to interact with the AIRBOSS Script.  The main menu items you will use:

* Request Marshall - request to enter into the Marshall Holding Pattern
* Request Commence - request to proceed to the initial point for a Case 1 recovery
* Kneeboard -> Carrier Info - provides information about the Carrier
* Kneeboard -> Skipper -> Start CASE I - ask AIRBOSS to start Case 1 recovery, turning the boat into the wind

