extends CharacterBody2D
class_name Personagem

enum EstadoPersonagem{PARADO, ANDANDO, ATACANDO}
const VELOCIDADE : float = 800

var stats : PersonagemStats
var estado : EstadoPersonagem

var ponto_parado : Vector2
var ponto_alvo : Vector2
var vida_anterior : int

var controlador_combate : Node
var timer : Timer

signal vida_modificou
signal colidiu_com
signal voltou_origem

func _ready() -> void:
	ponto_parado = global_position
	
	vida_anterior = stats.vida_atual
	
	timer = get_node("Timer do Ataque")
	timer.wait_time = stats.timer_ataque
	
	if (self is Companheiro || self is Inimigo):
		controlador_combate = get_parent().get_parent()
	else:
		controlador_combate = get_parent()
	
	if (self is Jogador || self is Inimigo):
		var barra_vida = get_node("Barra de Vida")
		barra_vida.visible = true
	
func ativar_colisao(personagem_alvo : Personagem = null) -> void:
	print("Ativou colisão")
	var colisao_personagem = get_node("Colisão Personagem")
	colisao_personagem.disabled = !colisao_personagem.disabled
	
	if personagem_alvo != null:
		personagem_alvo.ativar_colisao()

# Metodo irá ativar o modo andar e vai disparar quando parar de andar
func mover(ponto_de_ida: Vector2 = ponto_alvo) -> void:
	
	if(estado != EstadoPersonagem.ANDANDO):
		estado = EstadoPersonagem.ANDANDO
		ponto_alvo = ponto_de_ida
	
	var vetor_distancia = global_position.direction_to(ponto_de_ida)
	var objeto_colidiu = move_and_collide(vetor_distancia * VELOCIDADE * get_physics_process_delta_time())
	
	if(objeto_colidiu != null):
		estado = EstadoPersonagem.PARADO
		emit_signal("colidiu_com") 
		return
	
	if(global_position.distance_to(ponto_parado) < VELOCIDADE * get_physics_process_delta_time()):
		emit_signal("voltou_origem")

# Ataque básico que inimigos e companheiros podem fazer
func ataque_básico(Alvo : Personagem) -> void:
	if(Alvo != null):
		ativar_colisao(Alvo)
		mover(Alvo.global_position)
		await colidiu_com
		
		Alvo.tomar_dano(stats.ataque_base)
		mover(ponto_parado)
		await voltou_origem
		global_position = ponto_parado
		estado = EstadoPersonagem.PARADO
		
		if(is_instance_valid(Alvo)):
			ativar_colisao(Alvo)
		else:
			ativar_colisao()
	
func tomar_dano(dano : int) -> void:
	stats.vida_atual -= dano
	
func morrer() -> void:
	queue_free()
		
func _physics_process(delta: float) -> void:
	if(estado == EstadoPersonagem.ANDANDO):
		mover()
			
	if(vida_anterior != stats.vida_atual):
		vida_anterior = stats.vida_atual
		vida_modificou.emit()
	
	if(stats.vida_atual <= 0):
		morrer()

func _on_timer_do_ataque_timeout() -> bool:
	
	if(controlador_combate.alguem_atacando):
		# print(name + " não pode atacar")
		print(controlador_combate.alguem_atacando)
		return false
	
	controlador_combate.alguem_atacando = true
	# print(name + " está atacando")
	return true
