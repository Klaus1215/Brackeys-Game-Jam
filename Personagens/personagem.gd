extends Node
class_name Personagem

@export var vida: int
@export var ataque_base : int

# Ataque básico que inimigos e companheiros podem fazer
func ataque_básico(Alvo : Personagem) -> void:
	Alvo.vida -=  ataque_base
	
