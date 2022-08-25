# gd-dialogue-speed-example

An example of Godot Dialogue Manager dialogue not typing out dialogue at the requested seconds_per_step.

Disabling V-Sync setting exacerbates the problem making it far easier to demonstrate.

## Steps to replicate crash:

* Play the game
* Take note of the time it took for the dialogue to type out and complete.
* Export the game as HTML with default settings.
* Run the exported game. The dialogue will be much slower.