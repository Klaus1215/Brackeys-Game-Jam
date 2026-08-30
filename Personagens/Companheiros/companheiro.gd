extends Personagem

class_name Companheiro

var chance_ataque_inimigo : float
var chance_nao_ataque : float
var chance_ataque_jogador : float

func calcular_chance_ataque() -> void:
	return

# Método para quando for a vez do companheiro
func _on_timer_do_ataque_timeout() -> bool:
	var continuar = super()
	
	if(continuar == false):
		return false
	
	var inimigos_no_combate = get_node_or_null("../../Inimigos").get_children()
	var jogador = get_node_or_null("../../Jogador")
	
	if(stats.afeto > 0):
		chance_ataque_inimigo = stats.afeto * 0.1
		chance_nao_ataque = stats.afeto/2 * 0.2
		chance_ataque_jogador = 1.0
	else:
		chance_ataque_inimigo = 1.0
		chance_nao_ataque = -(stats.afeto) * 0.25
		chance_ataque_jogador = -(stats.afeto) * 0.1
	
	var total_chance = chance_ataque_inimigo + chance_ataque_jogador + chance_nao_ataque
	
	var acao_tomada = randi() % int(total_chance)
	
	if(inimigos_no_combate.is_empty()):
		timer.timeout.disconnect(_on_timer_do_ataque_timeout)
		return false
		
	if(acao_tomada < chance_ataque_inimigo):
		await ataque_básico(inimigos_no_combate.pick_random())
	elif(acao_tomada < chance_ataque_jogador):
		await ataque_básico(jogador)	
	else:
		print(name + " está muito ocupada vendo as borboletas")
		
	controlador_combate.alguem_atacando = false
	# print(name + " já atacou")
	return true

func morrer() -> void:
	super()
	Party.remove_personagem(stats.id_personagem)
