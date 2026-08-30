extends Node2D

enum EstadosAlvo {FRENTE, TRAS, EM_ATAQUE}

var caminho_alvo : PathFollow2D
var estado_alvo : EstadosAlvo

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	caminho_alvo = get_node("Rota do Alvo/Caminho do Alvo")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if(Input.is_action_just_released("ui_accept")):
		estado_alvo = EstadosAlvo.EM_ATAQUE
	
	var ratio_barra = caminho_alvo.progress_ratio
	
	match estado_alvo:
		EstadosAlvo.TRAS:
			caminho_alvo.progress_ratio -= 0.009
		
		EstadosAlvo.FRENTE:
			caminho_alvo.progress_ratio += 0.009
			
		EstadosAlvo.EM_ATAQUE:
			return
			
	if(ratio_barra == 0):
		estado_alvo = EstadosAlvo.FRENTE
	elif(ratio_barra == 1):
		estado_alvo = EstadosAlvo.TRAS
		
