extends Node
class_name Personagem

@export var vida_total: int
@export var ataque_base : int
var e_jogador : bool = false

var vida_atual : int
var vida_anterior : int

signal vida_modificou

func _ready() -> void:
	vida_anterior = vida_atual
	
	if(e_jogador):
		var barra_vida = get_node("CanvasLayer")
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
	
