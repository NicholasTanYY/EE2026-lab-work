## This file is a general .xdc for the Basys3 rev B board
## To use it in a project:
## - uncomment the lines corresponding to used pins
## - rename the used ports (in each line, after get_ports) according to the top level signal names in the project
 
## Switches
set_property PACKAGE_PIN V17 [get_ports {A[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {A[0]}]
set_property PACKAGE_PIN V16 [get_ports {A[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {A[1]}]
set_property PACKAGE_PIN W16 [get_ports {A[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {A[2]}]
set_property PACKAGE_PIN W17 [get_ports {A[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {A[3]}]
set_property PACKAGE_PIN W15 [get_ports {A[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {A[4]}]
set_property PACKAGE_PIN V15 [get_ports {A[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {A[5]}]
set_property PACKAGE_PIN W14 [get_ports {A[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {A[6]}]
set_property PACKAGE_PIN V2 [get_ports {B[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {B[0]}]
set_property PACKAGE_PIN T3 [get_ports {B[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {B[1]}]
set_property PACKAGE_PIN T2 [get_ports {B[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {B[2]}]
set_property PACKAGE_PIN R3 [get_ports {B[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {B[3]}]
set_property PACKAGE_PIN W2 [get_ports {B[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {B[4]}]
set_property PACKAGE_PIN U1 [get_ports {B[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {B[5]}]
set_property PACKAGE_PIN T1 [get_ports {B[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {B[6]}]
 

## LEDs
set_property PACKAGE_PIN U16 [get_ports {S[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[0]}]
set_property PACKAGE_PIN E19 [get_ports {S[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[1]}]
set_property PACKAGE_PIN U19 [get_ports {S[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[2]}]
set_property PACKAGE_PIN V19 [get_ports {S[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[3]}]
set_property PACKAGE_PIN W18 [get_ports {S[4]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[4]}]
set_property PACKAGE_PIN U15 [get_ports {S[5]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[5]}]
set_property PACKAGE_PIN U14 [get_ports {S[6]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {S[6]}]
set_property PACKAGE_PIN P3 [get_ports {T[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {T[0]}]
set_property PACKAGE_PIN N3 [get_ports {T[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {T[1]}]
set_property PACKAGE_PIN P1 [get_ports {T[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {T[2]}]
set_property PACKAGE_PIN L1 [get_ports {T[3]}]					
    set_property IOSTANDARD LVCMOS33 [get_ports {T[3]}]
	
	
##7 segment display
set_property PACKAGE_PIN W7 [get_ports {SEG[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[0]}]
#set_property PACKAGE_PIN W6 [get_ports {SEG[1]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[1]}]
set_property PACKAGE_PIN U8 [get_ports {SEG[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[1]}]
#set_property PACKAGE_PIN V8 [get_ports {SEG[3]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[3]}]
set_property PACKAGE_PIN U5 [get_ports {SEG[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[2]}]
#set_property PACKAGE_PIN V5 [get_ports {SEG[5]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[5]}]
#set_property PACKAGE_PIN U7 [get_ports {SEG[6]}]					
#	set_property IOSTANDARD LVCMOS33 [get_ports {SEG[6]}]

#set_property PACKAGE_PIN V7 [get_ports DP]							
#	set_property IOSTANDARD LVCMOS33 [get_ports DP]

set_property PACKAGE_PIN U2 [get_ports {AN[0]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {AN[0]}]
set_property PACKAGE_PIN U4 [get_ports {AN[1]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {AN[1]}]
set_property PACKAGE_PIN V4 [get_ports {AN[2]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {AN[2]}]
set_property PACKAGE_PIN W4 [get_ports {AN[3]}]					
	set_property IOSTANDARD LVCMOS33 [get_ports {AN[3]}]


##Buttons
set_property PACKAGE_PIN W19 [get_ports BTNL]						
	set_property IOSTANDARD LVCMOS33 [get_ports BTNL]

