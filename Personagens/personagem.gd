extends Node
class_name Personagem

@export var vida_total: int
var vida_atual : int
@export var ataque_base : int
var e_jogador : bool = false

var vida_anterior : int

signal vida_modificou

func _ready() -> void:
	vida_anterior = vida_atual
	
	print(e_jogador)
	if(e_jogador):
		var barra_vida = get_node("Barra de Vida")
		barra_vida.visible = true

# Ataque básico que inimigos e companheiros podem fazer
func ataque_básico(Alvo : Personagem) -> void:
	Alvo.tomar_dano(ataque_base)
	
func tomar_dano(dano : int) -> void:
	vida_atual -= ataque_base
	

func _process(delta: float) -> void:
	if(vida_anterior != vida_atual):
		vida_anterior = vida_atual
		vida_modificou.emit()
	
	if(e_jogador && vida_atual <= 0):
		print("Jogador morreu")
		TransistorDeCena.game_over()
	
