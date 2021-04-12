extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$victory_sound.play()
	
	$label_stats.text = "N° personaggi:\n" + String(GameGlobals.n_personaggi_da_mostrare) + "\n\n" + "Difficolta':\n" + String(GameGlobals.difficulty)


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_new_pressed():
	get_tree().change_scene("res://Menu.tscn")
