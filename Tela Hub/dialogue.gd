extends PanelContainer
class_name Dialogue


@onready var content := get_node("NinePatchRect/MarginContainer/Content") as RichTextLabel
@onready var type_timer := get_node("TypeTimer") as Timer
@onready var pause_timer := get_node("PauseTimer") as Timer
@onready var voice_player := get_node("DialogueVoicePlayer") as AudioStreamPlayer
 
var _playing_voice := false
 
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	type_timer.timeout.connect(_on_TypeTimer_timeout)
	
	voice_player.finished.connect(_on_DialogueVoicePlayer_finished)
	
	await get_tree().create_timer(1.0).timeout
	update_message("Helloooooooooooo aaaaaaaaaaaahhh")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func update_message(message: String) -> void:
	content.text = message
	content.visible_characters = 0
	type_timer.start()
	

	_playing_voice = true
	voice_player.play(0)

func _on_TypeTimer_timeout() -> void:
	if content.visible_characters < content.text.length():

		content.visible_characters += 1
		
	else:
		type_timer.stop()
		_playing_voice = false
		voice_player.stop()
		

func _on_DialogueVoicePlayer_finished() -> void:
	if _playing_voice:
		voice_player.play(0)
 
