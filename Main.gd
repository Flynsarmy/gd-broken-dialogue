extends Node2D

const DIALOGUE_MAIN_BALLOON: PackedScene = preload("res://pixel_balloon/pixel_balloon.tscn")

export(Resource) var dialogue_resource: Resource
export(String) var dialogue_title: String

func _ready() -> void:
#	yield(get_tree(), "idle_frame")
#	Globals.start_dialogue(dialogue_title, dialogue_resource)

	var start_time: int = OS.get_ticks_msec()

	var dialogue: GDScriptFunctionState = start_dialogue(dialogue_title, dialogue_resource)
	yield(dialogue, "completed")

	var end_time: int = OS.get_ticks_msec()

	$CanvasLayer/Control/HBoxContainer/TimeLabel.text = str((end_time - start_time) / 1000.0)

func start_dialogue(title: String, local_resource: DialogueResource = null, extra_game_states: Array = []) -> GDScriptFunctionState:
	var dialogue = yield(DialogueManager.get_next_dialogue_line(title, local_resource, extra_game_states), "completed")
	if dialogue != null:
		dialogue.time = "auto"
		var balloon = DIALOGUE_MAIN_BALLOON.instance()
		balloon.dialogue = dialogue
		get_tree().current_scene.add_child(balloon)
		return start_dialogue(yield(balloon, "actioned"), local_resource, extra_game_states)

	return dialogue
