extends Node

# Exemplo de dicionario que aramazena os status de um companheiro
var CompanheiroExemplo: Dictionary = {
	"vida": 100,
	"ataque_base": 100,
	"tipo" : preload("res://Personagens/personagem.tscn")
	}

# Array que guardará a lista com a party do jogador
var party: Array[Dictionary] = []

# Métodos para manipular a party
func add_personagem(companheiro : Dictionary) -> void:
	party.append(companheiro)

func get_personagem(index : int) -> Dictionary:
	return party[index]

func get_party() -> Array:
	return party
	
# Debug da Party
func print_party() -> void:
	print(party)

# Método para renderizar a party
func instanciar_party() -> Array:
	var partyInstanciada : Array[Personagem]
	
	for personagem in party:
		var personagem_instan = personagem["tipo"].instantiate()
		personagem_instan.vida = personagem["vida"]
		personagem_instan.ataque_base = personagem["ataque_base"]
		partyInstanciada.append(personagem_instan)
	
	return partyInstanciada
		
	
