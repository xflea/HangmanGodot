extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var scena_main = preload("res://Main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
#	var n_pool = scena_main.get_node("Main").nomi_da_estrarre
#	$btn_all_pers.text = String(n_pool)
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
