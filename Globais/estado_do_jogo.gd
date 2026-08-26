extends Node

enum Horarios {Manhã, Tarde, Noite}

# Dicionario que guardará o estado do jogo
var JogadorStats: Dictionary = {
	"vida": 100,
	"dia": 0,
	"momento_dia": Horarios.Manhã,
	"tipo" : preload("res://Personagens/personagem.tscn")
}

func instanciar_jogador() -> Personagem:
	var personagem_instan = JogadorStats["tipo"].instantiate()
	personagem_instan.vida = JogadorStats["vida"]
	
	return personagem_instan
