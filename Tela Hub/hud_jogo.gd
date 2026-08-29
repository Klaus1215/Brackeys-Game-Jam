extends Control

func _on_summon_pressed() -> void:
	var companheiro = CharacterGenerator.criar_companheiro()
	
	Party.add_personagem(companheiro)
	Party.print_party()

func _on_lutar_pressed() -> void:
	TransistorDeCena.goto_scene("res://Tela de Combate/tela_de_combate.tscn")
