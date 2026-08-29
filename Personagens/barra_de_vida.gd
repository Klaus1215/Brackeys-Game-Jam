extends TextureProgressBar

var personagem_com_vida : Personagem

func _ready() -> void:
	personagem_com_vida = get_parent()

func _on_personagem_vida_modificou() -> void:
	var vida_porc = personagem_com_vida.stats.vida_atual * 100
	value = vida_porc / personagem_com_vida.stats.vida_total
