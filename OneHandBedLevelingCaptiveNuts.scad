// One Hand Bed Leveling - MakerFarm i3 Prusa Captive Nuts 
//
//  My MakerFarm i3 8" kit came with the i3 Prusa Bed Leveling Kit
//  http://www.makerfarm.com/index.php/i3-prusa-bed-leveling-kit.html
//
//  The heat bed leveling was still a pain in the neck
//  as it required two hands to hold a wrench and allen 
//  for the adjustments.  I decided to print some corner
//  brackets to hold the nuts.  The MakerFarm i3 Prusa Bed 
//  Leveling Kit has m3 cap heads and m3 locking nuts.
//  The m3 locking nuts are a press fit into this part.
//  Press from the bottom up until flush.
//
//  I printed them in PLA .25
//
//  This script is a mash up of stuff I found on Thingiverse

// Round corners for Openscad - Tutorial
// by WilliamAAdams, published	 Jun 15, 2011
// https://www.thingiverse.com/thing:9347

use <MCAD/boxes.scad>;

module miniround(size, radius)
{
$fn=50;
x = size[0]-radius*2;
y = size[1]-radius*2;

minkowski()
{
cube(size=[x,y,size[2]]);
cylinder(r=radius);
// Using a sphere is possible, but will kill performance
//sphere(r=radius);
}
}

// File: 3d_print_screw_hole_test.scad
// Author: Mark Heywood alias Airtripper
// Airtripper Extruder Filament Force Sensor Bracket
// by Airtripper May 2013
// Copyright � 2013 Airtripper
// http://www.airtripper.com
// Licensed Attribution-NonCommercial-ShareAlike 3.0 Unported. 
// Last edit: 26/09/2013

/* [Global] */

//  - Select part to view/print from list
view_part = 0;	// [0:design, 1:head_up, 2:head_down, 3:horizontal]

//  - Screw head diameter - flat side to flat side on hex nut or bolt head
head = 6.5;		
//  - Screw head type - [6] for hex head and [50] or more for round head
type = 6;			
//  - Screw size diameter
size = 3;		
//  - Screw size diameter smoothness
smoothness = 50;	
//  - Screw size length - not including screw head
length = 4;			
//  - Screw head length
cap = 2;			
//  - Block border thickness between screw head and block edge
border = 1;			
//  - Print layer thickness - only required for head down print
layer = 0.25;			

translate([0,0,-4]) rotate([0,0,0]) screw_block();

//######################### Screw Block ##########################

// screw_block();

module screw_block() {
	difference() {
		translate([2,2,4])
		miniround([15,15,6],2);

		translate([2,2,6])
		cube([15,15,6]);

		translate([0,15,4])
		rotate(-45)
		cube([30,30,10]);

    	translate([border+(head/2),border+(head/2),-1-layer]) cylinder(length+1, r=size/2, $fn=smoothness);	// screw size
		translate([border+(head/2),border+(head/2),length]) cylinder(cap+1, r=head/2, $fn=type);	// screw head/cap
		translate([border+(head/2),border+(head/2),length+cap-4]) color("red") cylinder(2, r1=(head/2)/cos(180/type), r2=((head/2)+.5)/cos(180/type), $fn=type); // screw head/cap taper
	}

}














// end