extends Personagem

class_name Inimigo

# Método para quando for a vez do inimigo
func _on_timer_do_ataque_timeout() -> bool:
	
	var posso_atacar : bool = false
	if(pode_atacar()):
		var jogador = get_node_or_null("../../Jogador")
		
		if(jogador != null):
			await ataque_básico(jogador)
		else:
			print("Jogador não foi referenciado")
			return false
		
		controlador_combate.alguem_atacando = false
		# print(name + " já atacou")
		return true
	else:
		return false
