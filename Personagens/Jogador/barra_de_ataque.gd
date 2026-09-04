extends Node2D

enum EstadosAlvo {FRENTE, TRAS, EM_ATAQUE}

var estado_alvo_anterior : EstadosAlvo = EstadosAlvo.FRENTE

var caminho_alvo : PathFollow2D
var estado_alvo : EstadosAlvo

signal mirou_na_barra(potencia : float)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	caminho_alvo = get_node("Rota do Alvo/Caminho do Alvo")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Sempre que o jogador apertar enter a barra para e desfere o ataque
	if(Input.is_action_just_pressed("ui_accept") && estado_alvo != EstadosAlvo.EM_ATAQUE):
		estado_alvo_anterior = estado_alvo
		estado_alvo = EstadosAlvo.EM_ATAQUE
		mirou_na_barra.emit(abs(0.5 - caminho_alvo.progress_ratio))
	
	# Caso não aperte a barra seguirá indo para frente e trás
	var ratio_barra = caminho_alvo.progress_ratio
	
	match estado_alvo:
		EstadosAlvo.TRAS:
			caminho_alvo.progress_ratio -= 0.02
		EstadosAlvo.FRENTE:
			caminho_alvo.progress_ratio += 0.02
		EstadosAlvo.EM_ATAQUE:
			return
			
	if(ratio_barra == 0):
		estado_alvo = EstadosAlvo.FRENTE
	elif(ratio_barra == 1):
		estado_alvo = EstadosAlvo.TRAS

func _on_jogador_finalizou_vez() -> void:
	print("Enviou o sinal")
	if(estado_alvo == EstadosAlvo.EM_ATAQUE):
		estado_alvo = estado_alvo_anterior
		
