extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var nomi_da_estrarre = ['dario_moccia', 'panetty']
var lettere_da_indovinare = []
var lettere_indovinate = []

var errori = 0
var max_errori = 5

var estratta_a_schermo = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	var estratta = estrai(nomi_da_estrarre)
	
	for lettera in estratta:
		if lettera == "_":
			estratta_a_schermo += " "
		estratta_a_schermo += "_ "
	
	var nome_immagine = "res://images/sol/" + String(estratta) + ".png"
	var immagine_da_mettere = load(nome_immagine)
	get_node("img_da_indovinare").texture = immagine_da_mettere


func estrai(array):
	var rng = RandomNumberGenerator.new()
	var estratta = ""
	rng.randomize()
	var my_random_number = rng.randf_range(0, array.size())
	estratta = array[my_random_number]
	
	for lettera in estratta:
		if !lettere_da_indovinare.has(String(lettera)) and lettera != "_":
			lettere_da_indovinare.append(lettera)
	
	return estratta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("label_da_indovinare").text = estratta_a_schermo

func controlla_lettera(lettera):
	lettera = String(lettera)
	if lettere_da_indovinare.has(lettera):
		lettere_da_indovinare.erase(lettera)
		lettere_indovinate.append(lettera)
	else:
		errori += 1


# tutti bottoni da qui sotto

func _on_btn_reset_pressed():
	get_tree().reload_current_scene()

func _on_btn_a_pressed():
	get_node("btn_a").disabled = true
	controlla_lettera("a")
