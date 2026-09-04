class_name PersonagemStats

extends Resource

# Atributos gerais
@export var id_personagem : String
@export var vida_total : int
@export var vida_atual : int
@export var ataque_base : int
@export var timer_ataque: float

# Atributos únicos dos companheiros
@export var afeto : float

func _init(id: String, vida_total_: int = 100, ataque_base_: float = 10.0, timer_ataque_: float = 1.0, 
		  afeto_: int = -100) -> void:
	id_personagem = id
	vida_total = vida_total_
	vida_atual = vida_total_
	ataque_base = ataque_base_
	timer_ataque = timer_ataque_
	afeto = afeto_
	
	
