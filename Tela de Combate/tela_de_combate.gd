extends Node

@export var spawn_jogador = Vector2(292, 311)

var espaco_party : Node2D
var espaco_inimigos : Node2D

func _ready() -> void:
	# Por meio do estado do jogador, renderizará ele
	var jogador_instanciado = EstadoDoJogo.instanciar_jogador()
	
	jogador_instanciado.position = Vector2(292, 311)
	add_child(jogador_instanciado)
	
	# Por meio dos dados de Party do global, renderizará os companheiros no combate
	espaco_party = get_node_or_null("Party")
	
	if(espaco_party):
		espaco_party.spawn_party()
		
	# Spawna os inimigos por meio do nó Inimigos
	espaco_inimigos = get_node_or_null("Inimigos")
	
	if(espaco_inimigos):
		espaco_inimigos.spawn_teste()
