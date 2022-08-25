extends Node

# The balloon used when NPCs are talking directly to the player
const DIALOGUE_MAIN_BALLOON: PackedScene = preload("res://pixel_balloon/pixel_balloon.tscn")
const DIALOGUE_BUBBLE_BALLOON: PackedScene = preload("res://Dialogue/point_n_click_balloon/point_n_click_balloon.tscn")

# Dialogue with the player
func start_dialogue(title: String, local_resource: DialogueResource = null, extra_game_states: Array = []) -> void:
	var dialogue = yield(DialogueManager.get_next_dialogue_line(title, local_resource, extra_game_states), "completed")
	if dialogue != null:
		var balloon = DIALOGUE_MAIN_BALLOON.instance()
		balloon.dialogue = dialogue
		get_tree().current_scene.add_child(balloon)
		start_dialogue(yield(balloon, "actioned"), local_resource, extra_game_states)

# Random dialogue between NPCs
func start_bubble_dialogue(title: String, local_resource: DialogueResource = null, extra_game_states: Array = []) -> void:
	var dialogue = yield(DialogueManager.get_next_dialogue_line(title, local_resource, extra_game_states), "completed")
	if dialogue != null:
		var balloon = DIALOGUE_BUBBLE_BALLOON.instance()
		balloon.dialogue = dialogue
		get_tree().current_scene.add_child(balloon)
		start_bubble_dialogue(yield(balloon, "actioned"), local_resource, extra_game_states)
