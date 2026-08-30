extends Control

func _on_voltar_hub_button_up() -> void:
	if(get_tree().paused):
		get_tree().paused = false
	
	print("Apertou para voltar")
	TransistorDeCena.goto_scene("res://Tela Hub/hud_jogo.tscn")
