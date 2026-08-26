extends Control

func _on_summon_pressed() -> void:
	var Joaquina: Dictionary = {
	"vida": 100,
	"ataque_base": 200,
	"tipo" : preload("res://Personagens/personagem.tscn")
	}
	
	Party.add_personagem(Joaquina)
	Party.print_party()

func _on_lutar_pressed() -> void:
	TransistorDeCena.goto_scene("res://Tela de Combate/tela_de_combate.tscn")
