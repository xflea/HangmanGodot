extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_btn_normal_pressed():
	GameGlobals.difficulty = "Normale"
	get_tree().change_scene("res://Main.tscn")

func _on_btn_hardcore_pressed():
	GameGlobals.difficulty = "Hardcore"
	get_tree().change_scene("res://Main.tscn")

func _on_btn_incubo_pressed():
	GameGlobals.difficulty = "Incubo"
	get_tree().change_scene("res://Main.tscn")
