extends Node

const DIA_INICIAL := 0
const VIDA_INICIAL := 100

enum Horarios {Manhã, Tarde, Noite}

var dia : int = DIA_INICIAL
var momento_dia: Horarios = Horarios.Manhã

# Dicionario que guardará o estado do jogo
var Jogador: Dictionary = {
	"id_jogador" : ResourceUID.id_to_text(ResourceUID.create_id()),
	"vida": VIDA_INICIAL,
	"ataque_base": 500,
	"tipo" : preload("res://Personagens/Jogador/jogador.tscn")
}

func resetar_jogo() -> void:
	dia = DIA_INICIAL
	momento_dia = Horarios.Manhã
	Jogador["vida"] = VIDA_INICIAL

func instanciar_jogador() -> Personagem:
	var personagem_instan = Jogador["tipo"].instantiate()
	personagem_instan.name = "Jogador"
	personagem_instan.stats = PersonagemStats.new(Jogador["id_jogador"], Jogador["vida"], Jogador["ataque_base"], 
	1.0, 0)

	return personagem_instan
	
func _process(delta: float) -> void:
	if(Input.is_action_pressed("Pausar")):
		get_tree().paused = true
	
