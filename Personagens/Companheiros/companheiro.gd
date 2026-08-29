extends Personagem

class_name Companheiro

var chance_ataque_inimigo : float
var chance_nao_ataque : float
var chance_ataque_jogador : float


func _on_timer_do_ataque_timeout() -> void:
	var inimigos_no_combate = get_node_or_null("../../Inimigos").get_children()
	var jogador = get_node_or_null("../../Jogador")
	
	if(inimigos_no_combate.is_empty()):
		print("Parou")
		get_tree().paused = true
	
	if(stats.afeto > 0):
		chance_ataque_inimigo = stats.afeto * 0.1
		chance_nao_ataque = stats.afeto * 0.15
		chance_ataque_jogador = 1.0
	else:
		chance_ataque_inimigo = 1.0
		chance_nao_ataque = -(stats.afeto) * 0.25
		chance_ataque_jogador = -(stats.afeto) * 0.1
	
	var total_chance = chance_ataque_inimigo + chance_ataque_jogador + chance_nao_ataque
	
	var acao_tomada = randi() % int(total_chance)
	
	if(acao_tomada < chance_ataque_inimigo):
		ataque_básico(inimigos_no_combate.pick_random())
	elif(acao_tomada < chance_ataque_jogador):
		ataque_básico(jogador)	
	else:
		print(self.name + "está muito ocupada vendo as borboletas")

func morrer() -> void:
	super()
	Party.remove_personagem(stats.id_personagem)
