extends Node

@export var spawn_jogador = Vector2(292, 311)

func _ready() -> void:
	# Por meio do estado do jogador, renderizará ele
	var jogador_instanciado = EstadoDoJogo.instanciar_jogador()
	
	# Por meio dos dados de Party do global, renderizará os companheiros no combate
	var party_instanciada = Party.instanciar_party()
	var spawn_companheiro = Vector2(100, 100)
	
	for personagem in party_instanciada:
		personagem.position = spawn_companheiro
		add_child(personagem)
		spawn_companheiro.y += 110
		
	
	
