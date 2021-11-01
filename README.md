## Table of contents
* [General info](#general-info)
* [Technologies](#technologies)
* [Setup](#setup)
* [Controls](#controls)

## General info
This project is a game that imitates Flappy Bird by programming the FPGA on a DE1SoC development board with System Verilog. The game is displayed to an LED peripheral board.
	
## Technologies
Project is created with:
* System Verilog
* Quartus Prime Lite Version 17.0
* DE1SoC development board
* 16x16 Bi-Color LED Array Board
	
## Setup
To run this project, open a the project folder with Quartus. Then, add all the sv files in the directory sv_files to the project. Set DE1SoC.sv to "top". Do so by selecting "Files" in the Project Navigator, and right clicking DE1SoC 
before clicking "Set as Top-Level Entity." Finally, click the green arrow to "Start Compilation." 

## Controls
(All buttons names are printed on the DE1SoC board.)
Reset the game by depressing the KEY[3] button. Flipping the SW[0] to the forward position will pause the game and flipping switch SW[2] will enable "god mode" 
where the player becomes invincible. To fly the bird, press or press and hold the KEY[0] button. 
