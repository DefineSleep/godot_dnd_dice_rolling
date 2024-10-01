extends Control



@onready var instance_grid = $VBoxContainer/current_roll/HBoxContainer/ScrollContainer/grid1


# dice scenes to instatiate
const dice6_scene = preload("res://scenes/dice6_scene.tscn")
const dice4_scene = preload("res://scenes/dice4_scene.tscn")
const dice8_scene = preload("res://scenes/dice8_scene.tscn")
const dice10_scene = preload("res://scenes/dice10_scene.tscn")
const dice12_scene = preload("res://scenes/dice12_scene.tscn")
const dice20_scene = preload("res://scenes/dice20_scene.tscn")



# ALL RESULT LABELS
@onready var d_4_label = $VBoxContainer/current_roll/HBoxContainer/PanelContainer/VBoxContainer/d4_label
@onready var d_6_label = $VBoxContainer/current_roll/HBoxContainer/PanelContainer/VBoxContainer/d6_label
@onready var d_8_label = $VBoxContainer/current_roll/HBoxContainer/PanelContainer/VBoxContainer/d8_label
@onready var d_10_label = $VBoxContainer/current_roll/HBoxContainer/PanelContainer/VBoxContainer/d10_label
@onready var d_12_label = $VBoxContainer/current_roll/HBoxContainer/PanelContainer/VBoxContainer/d12_label
@onready var d_20_label = $VBoxContainer/current_roll/HBoxContainer/PanelContainer/VBoxContainer/d20_label
@onready var total_label = $VBoxContainer/current_roll/HBoxContainer/PanelContainer/VBoxContainer/total_label



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_clear_pressed():
	# Loop through the children of the container and queue them for deletion
	for child in instance_grid.get_children():
		child.queue_free()  # Remove the child node safely
	Global.selected_dice[0] = 0
	Global.selected_dice[1] = 0
	Global.selected_dice[2] = 0
	Global.selected_dice[3] = 0
	Global.selected_dice[4] = 0
	Global.selected_dice[5] = 0

func _on_roll_dice_button_pressed():
	totals_label_update()
	#print("--------------------------------------------------------")
	#print("dice4 rolls : "+str(roll_dice_4d(Global.selected_dice[0])))
	#print("dice6 rolls : "+str(roll_dice_6d(Global.selected_dice[1])))
	#print("dice8 rolls : "+str(roll_dice_8d(Global.selected_dice[2])))
	#print("dice10 rolls : "+str(roll_dice_10d(Global.selected_dice[3])))
	#print("dice12 rolls : "+str(roll_dice_12d(Global.selected_dice[4])))
	#print("dice20 rolls : "+str(roll_dice_20d(Global.selected_dice[5])))
	
	
# DICE NUMBER 4
func _on_dice_4_button_pressed():
	var instance = dice4_scene.instantiate()
	instance_grid.add_child(instance)
	Global.selected_dice[0] += 1
	
func roll_dice_4d(_times_to_roll : int) -> int : 
	randomize()
	var total_rolls = 0
	for i in _times_to_roll:
		var roll = randi_range(1,4)
		total_rolls += roll
	return total_rolls

# DICE NUMBER 6
func _on_dice_6_button_pressed()->void:
	var instance = dice6_scene.instantiate()
	instance_grid.add_child(instance)
	Global.selected_dice[1] += 1
	
func roll_dice_6d(_times_to_roll : int) -> int :
	randomize()
	var total_rolls = 0
	for i in _times_to_roll:
		var roll = randi_range(1,6)
		total_rolls += roll
	return total_rolls


# DICE NUMBER 8 
func _on_dice_8_button_pressed():
	var instance = dice8_scene.instantiate()
	instance_grid.add_child(instance)
	Global.selected_dice[2] += 1

func roll_dice_8d(_times_to_roll : int) -> int : 
	randomize()
	var total_rolls = 0 
	for i in _times_to_roll:
		var roll = randi_range(1,8)
		total_rolls += roll
	return total_rolls

# DICE NUMBER 10
func _on_dice_10_button_pressed():
	var instance = dice10_scene.instantiate()
	instance_grid.add_child(instance)
	Global.selected_dice[3] += 1

func roll_dice_10d(_times_to_roll : int) -> int : 
	randomize()
	var total_rolls = 0 
	for i in _times_to_roll:
		var roll = randi_range(0,9)
		total_rolls += roll
	return total_rolls

# DICE NUMBER 12
func _on_dice_12_button_pressed():
	var instance = dice12_scene.instantiate()
	instance_grid.add_child(instance)
	Global.selected_dice[4] += 1

func roll_dice_12d(_times_to_roll : int ) -> int :
	randomize()
	var total_rolls = 0
	for i in _times_to_roll:
		var roll = randi_range(1,12)
		total_rolls += roll
	return total_rolls

# DICE NUMBER 20 
func _on_dice_20_button_pressed():
	var instance = dice20_scene.instantiate()
	instance_grid.add_child(instance)
	Global.selected_dice[5] += 1 
	
func roll_dice_20d(_times_to_roll : int) -> int :
	var total_rolls = 0 
	for i in _times_to_roll:
		var roll = randi_range(1,20)
		total_rolls += roll
	return total_rolls
	

# UPDATE LABELS AND SHOW THE DICE ROLLS
func totals_label_update():
	# total of all
	var total_of_all : int = 0
	
	
	#setup variables for the totals of the dice rolls 
	var d4_total : int = roll_dice_4d(Global.selected_dice[0])
	var d6_total : int = roll_dice_6d(Global.selected_dice[1])	
	var d8_total : int = roll_dice_8d(Global.selected_dice[2])
	var d10_total : int = roll_dice_10d(Global.selected_dice[3])
	var d12_total : int = roll_dice_12d(Global.selected_dice[4])
	var d20_total : int = roll_dice_20d(Global.selected_dice[5])
	
	var all_die_totals : int = d4_total + d6_total + d8_total + d10_total + d12_total + d20_total
	
	#setup text printing 
	d_4_label.text = str(Global.selected_dice[0]) + " * D4 = "+str(d4_total)
	d_6_label.text = str(Global.selected_dice[1]) + " * D6 = "+str(d6_total)
	d_8_label.text = str(Global.selected_dice[2]) + " * D8 = "+str(d8_total)
	d_10_label.text = str(Global.selected_dice[3]) + " * D10 = "+str(d10_total)
	d_12_label.text = str(Global.selected_dice[4]) + " * D12 = "+str(d12_total)
	d_20_label.text = str(Global.selected_dice[5]) + " * D20 = "+str(d20_total)
	total_label.text = "Grand Total = " + str(all_die_totals)










