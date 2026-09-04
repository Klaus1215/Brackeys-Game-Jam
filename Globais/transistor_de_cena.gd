extends Node

# Global para cuidar da trasnição entre cenas
var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = root.get_child(-1)

# Faz a função de troca de cena ocorrer no último frame
func goto_scene(path):
	_deferred_goto_scene.call_deferred(path)

# Troca a cena
func _deferred_goto_scene(path):
	current_scene.free()

	var s = ResourceLoader.load(path)

	current_scene = s.instantiate()

	get_tree().root.add_child(current_scene)

	get_tree().current_scene = current_scene
	
	print("Transicionou de cena")

# Mata o jogador
func game_over():
	goto_scene("res://Tela Game Over/game_over.tscn")
	Party.resetar_party()
	
