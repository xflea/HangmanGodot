extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_inizia_pressed():
	get_tree().change_scene("res://Mode_N_Pers.tscn")


func _on_btn_credits_pressed():
	get_tree().change_scene("res://Credits.tscn")
