extends Personagem

class_name Jogador

func _on_timer_do_ataque_timeout() -> bool:
	var continuar = super()
	
	if(!continuar):
		return false
		
	controlador_combate.alguem_atacando = false
	return true

func morrer() -> void:
	super()
	EstadoDoJogo.resetar_jogo()
	TransistorDeCena.game_over()
