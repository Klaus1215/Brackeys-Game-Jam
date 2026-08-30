extends Node2D

var inimigo_basico

func _ready() -> void:
	inimigo_basico = preload("res://Personagens/Inimigos/inimigo.tscn")

func spawn_teste() -> void:
	var y_inimigo = -200
	for i in range(3):
		var inimigo_instanc = inimigo_basico.instantiate()
		inimigo_instanc.stats = PersonagemStats.new(ResourceUID.id_to_text(ResourceUID.create_id()), 
		20, 10, 10)
		
		inimigo_instanc.position.y = y_inimigo
		print(inimigo_instanc.position)
		y_inimigo += 110
		add_child(inimigo_instanc)

func alvejar_inimigo() -> Personagem:
	return get_child(0) as Personagem
