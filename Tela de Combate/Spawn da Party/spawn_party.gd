class_name SpawnParty

extends Node2D

func get_party():
	return get_children()
	
func spawn_party():
	var party_instanciada = Party.instanciar_party()
	var y_companheiros = -200
	
	for personagem in party_instanciada:
		personagem.position.y = y_companheiros
		add_child(personagem)
		y_companheiros += 110
