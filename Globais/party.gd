extends Node

# Exemplo de dicionario que aramazena os status de um companheiro
var CompanheiroExemplo: Dictionary = {
	"id_personagem": ResourceUID.id_to_text(ResourceUID.create_id()),
	"vida": 100,
	"ataque_base": 100,
	"tipo" : preload("res://Personagens/personagem.tscn")
	}

# Array que guardará a lista com a party do jogador
var party: Array[Dictionary] = []

# Métodos para manipular a party
func add_personagem(companheiro : Dictionary) -> void:
	party.append(companheiro)

func remove_personagem(id_para_remover : String) -> void:
	party = party.filter(func(item): return item["id_personagem"] != id_para_remover)

func get_personagem(index : int) -> Dictionary:
	return party[index]

func get_party() -> Array:
	return party
	
# Debug da Party
func print_party() -> void:
	print(party)

func resetar_party() -> void:
	party.clear()

# Método para renderizar a party
func instanciar_party() -> Array:
	var partyInstanciada : Array[Personagem]
	
	for personagem in party:
		var personagem_instan = personagem["tipo"].instantiate()
		personagem_instan.stats = PersonagemStats.new(personagem["id_personagem"], personagem["vida"],
		personagem["ataque_base"], personagem["timer_ataque"], personagem["afeto"])
		
		partyInstanciada.append(personagem_instan)
	
	return partyInstanciada
		
