extends SimpleState

# Called when the state machine enters this state.
func on_enter() -> void:
	pass


# Called every frame when this state is active.
func on_process(_delta: float) -> void:
	manageStateShift()
	pass


# Called every physics frame when this state is active.
func on_physics_process(_delta: float) -> void:
	pass


# Called when the state machine exits this state.
func on_exit() -> void:
	pass


func manageStateShift():
	# 状态之间互相转换的相关功能可以在这个函数中实现
	pass
