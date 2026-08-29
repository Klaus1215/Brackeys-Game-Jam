extends Personagem

class_name Jogador

func morrer() -> void:
	super()
	EstadoDoJogo.resetar_jogo()
	TransistorDeCena.game_over()
	print("Jogador morreu")
