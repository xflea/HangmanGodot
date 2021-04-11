extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$btn_all_pers.text = String(GameGlobals.pool_nomi.size()) + " personaggi (MAX)"
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_10_pers_pressed():
	GameGlobals.n_personaggi = 10
	get_tree().change_scene("res://Mode.tscn")

func _on_btn_20_pers_pressed():
	GameGlobals.n_personaggi = 20
	get_tree().change_scene("res://Mode.tscn")

func _on_btn_all_pers_pressed():
	GameGlobals.n_personaggi = null
	get_tree().change_scene("res://Mode.tscn")
