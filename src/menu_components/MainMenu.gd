extends Spatial
onready var enter_player_button = $CanvasLayer/Fader/Control/VBoxContainer/CenterContainer/VBoxContainer/CreateButton
onready var join_game_button = $CanvasLayer/Fader/Control/VBoxContainer/CenterContainer/VBoxContainer/JoinButton
onready var start_button = $CanvasLayer/Fader/Control/VBoxContainer/CenterContainer/VBoxContainer/StartButton
onready var quit_button = $CanvasLayer/Fader/Control/VBoxContainer/CenterContainer/VBoxContainer/QuitButton
onready var fader = $CanvasLayer/Fader
onready var animation_player = $AnimationPlayer

export (PackedScene) var game_scene = null

func _ready():
	enter_player_button.connect("pressed", self, "on_start_server_pressed")
	join_game_button.connect("pressed", self, "on_join_game_pressed")
	start_button.connect("pressed", self, "on_start_pressed")
	quit_button.connect("pressed", self, "on_quit_pressed")
	fader.connect("fade_finished", self, "on_fade_finished")
	
func on_start_server_pressed():
	fader.fade_out()
	animation_player.play("fade_out")
	get_tree().change_scene_to(game_scene)

func on_join_game_pressed():
	var ip = "127.0.0.1"  # Replace with input from player
	fader.fade_out()
	animation_player.play("fade_out")
	get_tree().change_scene_to(game_scene)
	var client = get_tree().root.get_node("Client")
	client.connect_to_server(ip)
func on_start_pressed():
	fader.fade_out()
	animation_player.play("fade_out")

func on_quit_pressed():
	get_tree().quit()

func on_fade_finished():
	get_tree().change_scene_to(game_scene)
