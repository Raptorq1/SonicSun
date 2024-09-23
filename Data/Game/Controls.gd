@tool
extends Control

@onready var action_icon = $ActionIcon # Reference to your TextureRect node

# Export variable to set the action name in the editor
@export var action_name: String = "ui_accept"  # Default action is "ui_accept"


# Dictionaries to map input events to icons for controllers and keyboards
# Dictionaries to map input events to icons
var keyboard_icons: Dictionary = {
	KEY_ESCAPE: preload("res://Data/Sprites/UI/assets/key/esc.png"),
	KEY_TAB: preload("res://Data/Sprites/UI/assets/key/tab.png"),
	KEY_BACKSPACE: preload("res://Data/Sprites/UI/assets/key/backspace.png"),
	KEY_ENTER: preload("res://Data/Sprites/UI/assets/key/enter.png"),
	KEY_INSERT: preload("res://Data/Sprites/UI/assets/key/insert.png"),
	KEY_DELETE: preload("res://Data/Sprites/UI/assets/key/del.png"),
	KEY_PRINT: preload("res://Data/Sprites/UI/assets/key/print_screen.png"),
	KEY_HOME: preload("res://Data/Sprites/UI/assets/key/home.png"),
	KEY_END: preload("res://Data/Sprites/UI/assets/key/end.png"),
	KEY_LEFT: preload("res://Data/Sprites/UI/assets/key/arrow_left.png"),
	KEY_UP: preload("res://Data/Sprites/UI/assets/key/arrow_up.png"),
	KEY_RIGHT: preload("res://Data/Sprites/UI/assets/key/arrow_right.png"),
	KEY_DOWN: preload("res://Data/Sprites/UI/assets/key/arrow_down.png"),
	KEY_PAGEUP: preload("res://Data/Sprites/UI/assets/key/page_up.png"),
	KEY_PAGEDOWN: preload("res://Data/Sprites/UI/assets/key/page_down.png"),
	KEY_SHIFT: preload("res://Data/Sprites/UI/assets/key/shift.png"),
	KEY_CTRL: preload("res://Data/Sprites/UI/assets/key/ctrl.png"),
	KEY_ALT: preload("res://Data/Sprites/UI/assets/key/alt.png"),
	KEY_CAPSLOCK: preload("res://Data/Sprites/UI/assets/key/caps_lock.png"),
	KEY_NUMLOCK: preload("res://Data/Sprites/UI/assets/key/num_lock.png"),
	KEY_F1: preload("res://Data/Sprites/UI/assets/key/f1.png"),
	KEY_F2: preload("res://Data/Sprites/UI/assets/key/f2.png"),
	KEY_F3: preload("res://Data/Sprites/UI/assets/key/f3.png"),
	KEY_F4: preload("res://Data/Sprites/UI/assets/key/f4.png"),
	KEY_F5: preload("res://Data/Sprites/UI/assets/key/f5.png"),
	KEY_F6: preload("res://Data/Sprites/UI/assets/key/f6.png"),
	KEY_F7: preload("res://Data/Sprites/UI/assets/key/f7.png"),
	KEY_F8: preload("res://Data/Sprites/UI/assets/key/f8.png"),
	KEY_F9: preload("res://Data/Sprites/UI/assets/key/f9.png"),
	KEY_F10: preload("res://Data/Sprites/UI/assets/key/f10.png"),
	KEY_F11: preload("res://Data/Sprites/UI/assets/key/f11.png"),
	KEY_F12: preload("res://Data/Sprites/UI/assets/key/f12.png"),
	KEY_KP_MULTIPLY: preload("res://Data/Sprites/UI/assets/key/asterisk.png"),
	KEY_ASTERISK: preload("res://Data/Sprites/UI/assets/key/asterisk.png"),
	KEY_KP_SUBTRACT: preload("res://Data/Sprites/UI/assets/key/minus.png"),
	KEY_MINUS: preload("res://Data/Sprites/UI/assets/key/minus.png"),
	KEY_KP_ADD: preload("res://Data/Sprites/UI/assets/key/plus.png"),
	KEY_KP_0: preload("res://Data/Sprites/UI/assets/key/0.png"),
	KEY_KP_1: preload("res://Data/Sprites/UI/assets/key/1.png"),
	KEY_KP_2: preload("res://Data/Sprites/UI/assets/key/2.png"),
	KEY_KP_3: preload("res://Data/Sprites/UI/assets/key/2.png"),
	KEY_KP_4: preload("res://Data/Sprites/UI/assets/key/2.png"),
	KEY_KP_5: preload("res://Data/Sprites/UI/assets/key/2.png"),
	KEY_KP_6: preload("res://Data/Sprites/UI/assets/key/2.png"),
	KEY_KP_7: preload("res://Data/Sprites/UI/assets/key/2.png"),
	KEY_KP_8: preload("res://Data/Sprites/UI/assets/key/2.png"),
	KEY_KP_9: preload("res://Data/Sprites/UI/assets/key/2.png"),
	KEY_SPACE: preload("res://Data/Sprites/UI/assets/key/space.png"),
	KEY_QUOTEDBL: preload("res://Data/Sprites/UI/assets/key/quote.png"),
	KEY_PLUS: preload("res://Data/Sprites/UI/assets/key/plus.png"),
	KEY_0: preload("res://Data/Sprites/UI/assets/key/0.png"),
	KEY_1: preload("res://Data/Sprites/UI/assets/key/1.png"),
	KEY_2: preload("res://Data/Sprites/UI/assets/key/2.png"),
	KEY_3: preload("res://Data/Sprites/UI/assets/key/3.png"),
	KEY_4: preload("res://Data/Sprites/UI/assets/key/4.png"),
	KEY_5: preload("res://Data/Sprites/UI/assets/key/5.png"),
	KEY_6: preload("res://Data/Sprites/UI/assets/key/6.png"),
	KEY_7: preload("res://Data/Sprites/UI/assets/key/7.png"),
	KEY_8: preload("res://Data/Sprites/UI/assets/key/8.png"),
	KEY_9: preload("res://Data/Sprites/UI/assets/key/9.png"),
	KEY_SEMICOLON: preload("res://Data/Sprites/UI/assets/key/semicolon.png"),
	KEY_LESS: preload("res://Data/Sprites/UI/assets/key/mark_left.png"),
	KEY_GREATER: preload("res://Data/Sprites/UI/assets/key/mark_right.png"),
	KEY_QUESTION: preload("res://Data/Sprites/UI/assets/key/question.png"),
	KEY_A: preload("res://Data/Sprites/UI/assets/key/a.png"),
	KEY_B: preload("res://Data/Sprites/UI/assets/key/b.png"),
	KEY_C: preload("res://Data/Sprites/UI/assets/key/c.png"),
}

var xbox_icons: Dictionary = {
	# Xbox controller icons mapping
	#"button_a": preload("res://Data/Sprites/UI/assets/xbox/a.png"),
	#"button_b": preload("res://Data/Sprites/UI/assets/xbox/b.png"),
	#"button_x": preload("res://Data/Sprites/UI/assets/xbox/x.png"),
	#"button_y": preload("res://Data/Sprites/UI/assets/xbox/y.png"),
	# Add more buttons here as needed
}

var ps_icons: Dictionary = {
	# PlayStation controller icons mapping
	#"button_cross": preload("res://Data/Sprites/UI/assets/ps/cross.png"),
	#"button_circle": preload("res://Data/Sprites/UI/assets/ps/circle.png"),
	#"button_square": preload("res://Data/Sprites/UI/assets/ps/square.png"),
	#"button_triangle": preload("res://Data/Sprites/UI/assets/ps/triangle.png"),
	# Add more buttons here as needed
}

var current_input_type = "keyboard" # Set a default input type

# Function to detect input type based on input events
func detect_input_type() -> void:
	for device_id in range(Input.DEVICE_JOY_BUTTON_0, Input.DEVICE_JOY_BUTTON_MAX + 1):
		if Input.is_joy_button_pressed(device_id):
			current_input_type = "controller"
			return
	current_input_type = "keyboard"

# Function to get the controller type (Xbox, PlayStation, Generic)
func get_controller_type() -> String:
	var joy_name = Input.get_joy_name(0).to_lower()
	if joy_name.find("xbox") != -1:
		return "xbox"
	elif joy_name.find("ps") != -1 or joy_name.find("playstation") != -1:
		return "playstation"
	else:
		return "generic"

# Function to get the icon path based on the input action and device type
func get_icon_path(action_name: String) -> String:
	if current_input_type == "controller":
		var controller_type = get_controller_type()
		if controller_type == "xbox":
			return xbox_icons.get(action_name, "")
		elif controller_type == "playstation":
			return playstation_icons.get(action_name, "")
		else:
			return generic_icons.get(action_name, "")
	else:
		return keyboard_icons.get(action_name, "")

# Function to update the icon dynamically based on the input action
func update_icon() -> void:
	detect_input_type()  # Detect whether it's keyboard or controller input
	var icon_path = get_icon_path(action_name)  # Get the correct icon path
	if icon_path != "":
		action_icon.texture = load(icon_path)  # Update the TextureRect with the icon

# Automatically update the icon on ready based on the exported action_name
func _ready() -> void:
	update_icon()  # This will automatically update the icon based on the action_name
