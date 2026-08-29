extends Node
class_name Personagem

var stats : PersonagemStats
var vida_anterior : int

var timer : Timer

signal vida_modificou

func _ready() -> void:
	print("Vida de %s: %d" % [self.name, stats.vida_atual])
	vida_anterior = stats.vida_atual
	
	timer = get_node("Timer do Ataque")
	timer.wait_time = stats.timer_ataque
	print("Time de ataque de %s: %f" % [self.name, timer.wait_time])
	
	if (self is Jogador || self is Inimigo):
		var barra_vida = get_node("Barra de Vida")
		barra_vida.visible = true

# Ataque básico que inimigos e companheiros podem fazer
func ataque_básico(Alvo : Personagem) -> void:
	Alvo.tomar_dano(stats.ataque_base)
	
func tomar_dano(dano : int) -> void:
	stats.vida_atual -= dano
	
func morrer() -> void:
	queue_free()
		
func _process(delta: float) -> void:
	if(vida_anterior != stats.vida_atual):
		vida_anterior = stats.vida_atual
		vida_modificou.emit()
	
	if(stats.vida_atual <= 0):
		morrer()

func _on_timer_do_ataque_timeout() -> void:
	print("O Pai ouviu")
