extends Personagem

class_name Inimigo

# Método para quando for a vez do inimigo
func _on_timer_do_ataque_timeout() -> void:
	print("Inimigo atacando...")
	var jogador = get_node_or_null("../../Jogador")
	
	if(jogador != null):
		ataque_básico(jogador)
		print("Vida do Jogador: %d" % [jogador.stats.vida_atual])
	else:
		print("Jogador não foi referenciado")	
