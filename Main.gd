extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var nomi_da_estrarre = ['dario_moccia', 'panetty']

# Called when the node enters the scene tree for the first time.
func _ready():
	var estratta = estrai(nomi_da_estrarre)
	var estratta_a_schermo = ""
	var i = 0
	
	for lettera in estratta:
		i += 1
		if lettera == "_":
			lettera.replace(lettera, " ")
		lettera.replace(lettera, "_ ")
		estratta_a_schermo = estratta
	
	get_node("label_da_indovinare").text = estratta_a_schermo
	print(estratta_a_schermo)

func estrai(array):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(0, array.size())
	return array[my_random_number]

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
