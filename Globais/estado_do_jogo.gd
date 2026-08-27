extends Node

const DIA_INICIAL := 0
const VIDA_INICIAL := 100

enum Horarios {Manhã, Tarde, Noite}

var dia : int = DIA_INICIAL
var momento_dia: Horarios = Horarios.Manhã

# Dicionario que guardará o estado do jogo
var JogadorStats: Dictionary = {
	"vida": VIDA_INICIAL,
	"tipo" : preload("res://Personagens/personagem.tscn")
}

func resetar_jogo() -> void:
	dia = DIA_INICIAL
	JogadorStats["vida"] = VIDA_INICIAL

func instanciar_jogador() -> Personagem:
	var personagem_instan = JogadorStats["tipo"].instantiate()
	print("Vida antes:", personagem_instan.vida_total)
	
	personagem_instan.e_jogador = true
	personagem_instan.vida_total = JogadorStats["vida"]
	personagem_instan.vida_atual = JogadorStats["vida"]
	print("Vida depois:", personagem_instan.vida_total)
	
	return personagem_instan
