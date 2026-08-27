extends Node2D

var inimigo_basico

func _ready() -> void:
	inimigo_basico = preload("res://Personagens/personagem.tscn")

func spawn_teste() -> void:
	var y_inimigo = -200
	for i in range(3):
		var inimigo_instanc = inimigo_basico.instantiate()
		inimigo_instanc.vida_total = 50
		inimigo_instanc.vida_atual = 50
		inimigo_instanc.ataque_base = 50
		
		inimigo_instanc.position.y = y_inimigo
		print(inimigo_instanc.position)
		y_inimigo += 110
		add_child(inimigo_instanc)
