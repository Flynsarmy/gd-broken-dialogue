# gd-dialogue-delay-example

An example of Godot Dialogue Manager dialogue not appearing under certain conditions


## Steps to replicate crash:

* Play the game
* Everything should work as expected - main dialogue appears at the bottom of the screen after 1 second. NPC conversation at the top completes fine.
* Edit *dialogue_main* changing `delay(1)` to `delay(5)`
* The main dialogue at the bottom will never show.