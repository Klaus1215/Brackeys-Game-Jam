extends Node

@export var spawn_jogador = Vector2(292, 311)

var espaco_party : Node2D

func _ready() -> void:
	# Por meio do estado do jogador, renderizará ele
	
	var jogador_instanciado = EstadoDoJogo.instanciar_jogador()
	print("Vida da instancia:", jogador_instanciado.vida_atual)
	jogador_instanciado.position = Vector2(292, 311)
	add_child(jogador_instanciado)
	
	# Por meio dos dados de Party do global, renderizará os companheiros no combate
	espaco_party = get_node("Party")
	var party_instanciada = Party.instanciar_party()
	var spawn_companheiro = Vector2(100, 100)
	
	for personagem in party_instanciada:
		personagem.position = spawn_companheiro
		add_child(personagem)
		spawn_companheiro.y += 110
		
	
	
