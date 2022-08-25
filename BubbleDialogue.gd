extends Node

export(Resource) var dialogue_resource: Resource
export(String) var dialogue_title: String

func _ready() -> void:
	Globals.start_bubble_dialogue(dialogue_title, dialogue_resource)
