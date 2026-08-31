extends Node

var alguem_atacando : bool = false

@export var spawn_jogador = Vector2(292, 311)

var espaco_party : Node2D
var espaco_inimigos : Node2D
var hud_combate : CanvasLayer

var inimigos_no_combate : Array

func _ready() -> void:
	# Referencia ao HUD da tela de combate
	hud_combate = get_node("Interface do Combate")
	
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

# Método para quando o jogador vence
func jogador_venceu():
	get_tree().paused = true
	EstadoDoJogo.passar_um_tempo()
	var arq_tela_vitoria = preload("res://Tela de Combate/tela_vitoria.tscn")
	hud_combate.add_child(arq_tela_vitoria.instantiate())

func _process(delta: float) -> void:
	inimigos_no_combate = espaco_inimigos.get_children()
	
	if(inimigos_no_combate.is_empty()):
		jogador_venceu()
		
	# print("Alguem esta atacando? %s" % alguem_atacando)
		
