extends Control

var especificacoes_dia : Label

func _ready() -> void:
	especificacoes_dia = get_node("Container Dias/Label Dias") as Label
	var informacoes_dia = EstadoDoJogo.get_tempo()
	
	especificacoes_dia.text = "Day " + str(informacoes_dia[0]) + " - " + str(informacoes_dia[1])

func _on_summon_pressed() -> void:
	var Joaquina: Dictionary = {
		"id_personagem": ResourceUID.id_to_text(ResourceUID.create_id()),
		"vida": 100,
		"ataque_base": 10,
		"timer_ataque": 1,
		"afeto": 20,
		"tipo" : preload("res://Personagens/Companheiros/companheiro.tscn")
	}
	
	Party.add_personagem(Joaquina)
	Party.print_party()

func _on_lutar_pressed() -> void:
	TransistorDeCena.goto_scene("res://Tela de Combate/tela_de_combate.tscn")
