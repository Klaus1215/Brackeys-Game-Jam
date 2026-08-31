extends Personagem

class_name Jogador

var inimigos_no_combate : Array

var multi_guardado : int = 0

func _ready() -> void:
	super._ready()
	controlador_combate = get_parent()

func morrer() -> void:
	super()
	EstadoDoJogo.resetar_jogo()
	TransistorDeCena.game_over()	

# Quando a barra for pressionada o ataque vai ocorrer...
func _on_barra_de_ataque_mirou_na_barra(potencia: float) -> void:
	var multi_barra = potencia * 10
	
	if(pode_atacar()): # No momento
		multi_guardado = int(multi_barra)
	else: # Ou depois
		inimigos_no_combate = get_node_or_null("../Inimigos").get_children()
		await ataque_básico(inimigos_no_combate[0], multi_barra)
		controlador_combate.alguem_atacando = false

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
	
	if(pode_atacar() && multi_guardado != 0):
		controlador_combate.alguem_atacando = true
		
		inimigos_no_combate = get_node_or_null("../Inimigos").get_children()
		await ataque_básico(inimigos_no_combate[0], multi_guardado)
		
		emit_signal("finalizou_vez")
		multi_guardado = 0
		controlador_combate.alguem_atacando = false
	
