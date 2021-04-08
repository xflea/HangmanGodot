extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# inserisci monitor, il cippe, david rubino
var nomi_da_estrarre = ['dario_moccia', 'simone_panetti', 'nannitwitch', 'davide_masella', 'dada', 'agnese_innocente',
'mangaka96', 'volpescu', 'sdrumox', 'marco_merrino', 'francesco_fossetti', 'sabaku_no_maiku', 'luna', 'ercolino',
'francesco_cilurzo', 'luis_sal', 'martin_sal', 'cerbero_podcast', 'simone_santoro', 'mr_flame', 'davide_marra', 'david_rubino',
'monitor_vanzina', 'il_cippe']
#var nomi_da_estrarre = ['dada', 'luna']

var lettere_da_indovinare = []
var lettere_indovinate = []

var errori = 5

var estratta = ""
var estratta_a_schermo = ""

var gioco_finito = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var estratta = estrai(nomi_da_estrarre)
	
	print(GameGlobals.difficulty)
	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(0, lettere_da_indovinare.size())
	var lettera_suggerimento = lettere_da_indovinare[my_random_number]
	lettere_da_indovinare.erase(lettera_suggerimento)
	lettere_indovinate.append(lettera_suggerimento)
	
	var btn_da_bloccare = "btn_" + String(lettera_suggerimento)
	get_node(btn_da_bloccare).disabled = true
	
	for letterina in estratta:
		if letterina == lettera_suggerimento:
			estratta_a_schermo += lettera_suggerimento + " "
		else:
			if letterina == "_":
				estratta_a_schermo += "    "
			else:
				estratta_a_schermo += "_ "
	
	get_node("label_errori").text = "x" + String(errori)
	get_node("label_da_indovinare").text = estratta_a_schermo
	if nomi_da_estrarre.size() == 1:
		get_node("label_pool").text = "Ultimo personaggio!"
	else:
		get_node("label_pool").text = "N° personaggi da indovinare: " + String(nomi_da_estrarre.size() - 1)

func estrai(array):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var my_random_number = rng.randf_range(0, array.size())
	estratta = array[my_random_number]
	
	for lettera in estratta:
		if !lettere_da_indovinare.has(String(lettera)) and lettera != "_":
			lettere_da_indovinare.append(lettera)
	
	return estratta

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func controlla_lettera(lettera):
	estratta_a_schermo = ""
	lettera = String(lettera)
	if lettere_da_indovinare.has(lettera):
		lettere_da_indovinare.erase(lettera)
		lettere_indovinate.append(lettera)
		
		for let in self.estratta:
			if lettere_indovinate.has(String(let)) and let != "_":
				estratta_a_schermo += let + " "
			else:
				if let == "_":
					estratta_a_schermo += "    "
				else:
					estratta_a_schermo += "_ "
		
		get_node("label_da_indovinare").text = estratta_a_schermo
		
		if lettere_da_indovinare.empty():
			$sound_correct.play()
			gioco_finito = true
			var nome_immagine = "res://images/sol/" + String(self.estratta) + ".png"
			var immagine_da_mettere = load(nome_immagine)
			get_node("img_da_indovinare").texture = immagine_da_mettere
			get_node("btn_next").visible = true
			nomi_da_estrarre.erase(estratta)

	else:
		errori -= 1
		if errori == 0:
#			errori = 0
#			gioco_finito = true
#			get_node("label_da_indovinare").text = "GAME OVER"
#			get_node("btn_reset").visible = true
#			get_node("img_impiccato").texture = load("res://images/game_over.png")
			get_tree().change_scene("res://GameOver.tscn")
		get_node("label_errori").text = "x" + String(errori)

# tutti bottoni da qui sotto

func _on_btn_reset_pressed():
	get_tree().reload_current_scene()

func _on_btn_next_pressed():
	if nomi_da_estrarre.size() == 0:
		get_tree().change_scene("res://Finito.tscn")
	else:
		var valori = "qwertyuiopasdfghjklzxcvbnm123456789"
		for lettera in valori:
			var stringa_btn = "btn_" + String(lettera)
			get_node(stringa_btn).disabled = false 
		
		get_node("img_da_indovinare").texture = load("res://images/dunno.png")
		lettere_da_indovinare = []
		lettere_indovinate = []
		estratta = ""
		estratta_a_schermo = ""
		gioco_finito = false
		get_node("btn_next").visible = false
		
		if GameGlobals.difficulty == "normal":
			errori = 5
		
		_ready()

func _on_btn_a_pressed():
	if !gioco_finito:
		get_node("btn_a").disabled = true
		controlla_lettera("a")

func _on_btn_b_pressed():
	if !gioco_finito:
		get_node("btn_b").disabled = true
		controlla_lettera("b")

func _on_btn_q_pressed():
	if !gioco_finito:
		get_node("btn_q").disabled = true
		controlla_lettera("q")

func _on_btn_w_pressed():
	if !gioco_finito:
		get_node("btn_w").disabled = true
		controlla_lettera("w")

func _on_btn_e_pressed():
	if !gioco_finito:
		get_node("btn_e").disabled = true
		controlla_lettera("e")

func _on_btn_r_pressed():
	if !gioco_finito:
		get_node("btn_r").disabled = true
		controlla_lettera("r")

func _on_btn_t_pressed():
	if !gioco_finito:
		get_node("btn_t").disabled = true
		controlla_lettera("t")

func _on_btn_y_pressed():
	if !gioco_finito:
		get_node("btn_y").disabled = true
		controlla_lettera("y")

func _on_btn_u_pressed():
	if !gioco_finito:
		get_node("btn_u").disabled = true
		controlla_lettera("u")

func _on_btn_i_pressed():
	if !gioco_finito:
		get_node("btn_i").disabled = true
		controlla_lettera("i")

func _on_btn_o_pressed():
	if !gioco_finito:
		get_node("btn_o").disabled = true
		controlla_lettera("o")

func _on_btn_p_pressed():
	if !gioco_finito:
		get_node("btn_p").disabled = true
		controlla_lettera("p")

func _on_btn_s_pressed():
	if !gioco_finito:
		get_node("btn_s").disabled = true
		controlla_lettera("s")

func _on_btn_d_pressed():
	if !gioco_finito:
		get_node("btn_d").disabled = true
		controlla_lettera("d")

func _on_btn_f_pressed():
	if !gioco_finito:
		get_node("btn_f").disabled = true
		controlla_lettera("f")

func _on_btn_g_pressed():
	if !gioco_finito:
		get_node("btn_g").disabled = true
		controlla_lettera("g")

func _on_btn_j_pressed():
	if !gioco_finito:
		get_node("btn_j").disabled = true
		controlla_lettera("j")

func _on_btn_h_pressed():
	if !gioco_finito:
		get_node("btn_h").disabled = true
		controlla_lettera("h")

func _on_btn_k_pressed():
	if !gioco_finito:
		get_node("btn_k").disabled = true
		controlla_lettera("k")

func _on_btn_l_pressed():
	if !gioco_finito:
		get_node("btn_l").disabled = true
		controlla_lettera("l")

func _on_btn_z_pressed():
	if !gioco_finito:
		get_node("btn_z").disabled = true
		controlla_lettera("z")

func _on_btn_x_pressed():
	if !gioco_finito:
		get_node("btn_x").disabled = true
		controlla_lettera("x")

func _on_btn_c_pressed():
	if !gioco_finito:
		get_node("btn_c").disabled = true
		controlla_lettera("c")

func _on_btn_v_pressed():
	if !gioco_finito:
		get_node("btn_v").disabled = true
		controlla_lettera("v")

func _on_btn_n_pressed():
	if !gioco_finito:
		get_node("btn_n").disabled = true
		controlla_lettera("n")

func _on_btn_m_pressed():
	if !gioco_finito:
		get_node("btn_m").disabled = true
		controlla_lettera("m")

func _on_btn_1_pressed():
	if !gioco_finito:
		get_node("btn_1").disabled = true
		controlla_lettera("1")

func _on_btn_2_pressed():
	if !gioco_finito:
		get_node("btn_2").disabled = true
		controlla_lettera("2")

func _on_btn_3_pressed():
	if !gioco_finito:
		get_node("btn_3").disabled = true
		controlla_lettera("3")

func _on_btn_4_pressed():
	if !gioco_finito:
		get_node("btn_4").disabled = true
		controlla_lettera("4")

func _on_btn_5_pressed():
	if !gioco_finito:
		get_node("btn_5").disabled = true
		controlla_lettera("5")

func _on_btn_6_pressed():
	if !gioco_finito:
		get_node("btn_6").disabled = true
		controlla_lettera("6")

func _on_btn_7_pressed():
	if !gioco_finito:
		get_node("btn_7").disabled = true
		controlla_lettera("7")

func _on_btn_8_pressed():
	if !gioco_finito:
		get_node("btn_8").disabled = true
		controlla_lettera("8")

func _on_btn_9_pressed():
	if !gioco_finito:
		get_node("btn_9").disabled = true
		controlla_lettera("9")

func _on_btn_0_pressed():
	if !gioco_finito:
		get_node("btn_0").disabled = true
		controlla_lettera("0")
