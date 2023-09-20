@icon("res://addons/SimpleStateMechine/icons/StateManager.svg")
class_name StateManager
extends Node


signal state_changed(new_state: SimpleState)


@export var CurrentState: SimpleState:
	set(NewState):
		if is_inside_tree() and is_instance_valid(CurrentState):
			CurrentState.on_exit()
		CurrentState = NewState
		if is_instance_valid(CurrentState):
			CurrentState.state_manager = self
			if is_inside_tree():
				state_changed.emit(CurrentState)
				CurrentState.on_enter()

func change_state(node_path: NodePath) -> void:
	var NewState := get_node(node_path)
	if NewState is SimpleState:
		CurrentState = NewState
	else:
		printerr(NewState, ":", node_path, " is not StateNode")


func _enter_tree() -> void:
	if is_node_ready() and is_instance_valid(CurrentState):
		CurrentState.on_enter()


func _ready() -> void:
	if is_instance_valid(CurrentState):
		CurrentState.on_enter()


func _process(delta: float) -> void:
	if is_instance_valid(CurrentState):
		CurrentState.on_process(delta)



func _physics_process(delta: float) -> void:
	if is_instance_valid(CurrentState):
		CurrentState.on_physics_process(delta)



func _exit_tree() -> void:
	if is_instance_valid(CurrentState):
		CurrentState.on_exit()



