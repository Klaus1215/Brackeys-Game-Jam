extends Node

const DIA_INICIAL := 0
const VIDA_INICIAL := 100

enum Horarios {Morning, Afternoon, Night}

var dia : int = DIA_INICIAL
var momento_dia: Horarios = Horarios.Morning

# Dicionario que guardará o estado do jogo
var JogadorStats: Dictionary = {
	"id_Jogador" : ResourceUID.id_to_text(ResourceUID.create_id()),
	"vida": VIDA_INICIAL,
	"ataque_base": 500,
	"tipo" : preload("res://Personagens/Jogador/jogador.tscn")
}

func get_tempo():
	return [dia,  Horarios.keys()[momento_dia]] 

func passar_um_tempo():
	if (momento_dia == 3):
		dia += 1
		momento_dia = 1
	else:
		momento_dia += 1

func resetar_jogo() -> void:
	dia = DIA_INICIAL
	momento_dia = Horarios.Morning
	JogadorStats["vida"] = VIDA_INICIAL

func instanciar_jogador() -> Personagem:
	var personagem_instan = JogadorStats["tipo"].instantiate()
	personagem_instan.name = "Jogador"
	personagem_instan.stats = PersonagemStats.new(JogadorStats["id_Jogador"], JogadorStats["vida"], JogadorStats["ataque_base"], 
	1.0, 0)

	return personagem_instan
	
func _process(delta: float) -> void:
	if(Input.is_action_pressed("Pausar")):
		get_tree().paused = true
	
