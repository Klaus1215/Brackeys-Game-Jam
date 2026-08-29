extends Control

func _on_summon_pressed() -> void:
	var Joaquina: Dictionary = {
		"id_personagem": ResourceUID.id_to_text(ResourceUID.create_id()),
		"vida": 100,
		"ataque_base": 200,
		"timer_ataque": 1,
		"afeto": 20,
		"tipo" : preload("res://Personagens/Companheiros/companheiro.tscn")
	}
	
	Party.add_personagem(Joaquina)
	Party.print_party()

func _on_lutar_pressed() -> void:
	TransistorDeCena.goto_scene("res://Tela de Combate/tela_de_combate.tscn")
