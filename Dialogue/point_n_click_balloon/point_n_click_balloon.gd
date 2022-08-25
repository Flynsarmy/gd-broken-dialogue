extends CanvasLayer

signal actioned(next_id)

const DialogueLine := preload("res://addons/dialogue_manager/dialogue_line.gd")

onready var dialogue_label := $DialogueLabel

var dialogue: DialogueLine

func _ready() -> void:
	if not dialogue:
		queue_free()
		return

	# Center the dialogue
	dialogue.dialogue = "[center]%s" % dialogue.dialogue

	dialogue_label.hide()
	dialogue_label.dialogue = dialogue
	yield(dialogue_label.reset_height(), "completed")

	# Set the colour and attach the dialogue to the character
	var target: Node2D = get_tree().current_scene.find_node(dialogue.character)
	dialogue_label.rect_global_position = target.global_position - dialogue_label.rect_size * Vector2(0.5, 1)

	dialogue_label.show()
	dialogue_label.type_out()

	# Progress dialogue after 2 seconds
	var timer = get_tree().create_timer(2.0)
	yield(timer, "timeout")

	dialogue_label.hide()

	# Wait 1 second for a reply
	timer = get_tree().create_timer(1.0)
	yield(timer, "timeout")

	next(dialogue.next_id)

func next(next_id: String) -> void:
	emit_signal("actioned", next_id)
	queue_free()
