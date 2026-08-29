extends Node

func _ready() -> void:
	randomize()


var characters: Array[Dictionary] = []

func criar_companheiro() -> Dictionary:
		var companheiro : Dictionary = {
			"id_personagem": ResourceUID.id_to_text(ResourceUID.create_id()),
			"vida" :  99999,
			"ataque_base": randi_range(50, 250),
			"timer_ataque": randi_range(1, 20),
			"afeto": 0,
			"tipo" : preload("res://Personagens/Companheiros/companheiro.tscn")	
		}
		return companheiro
