@icon("res://addons/SimpleStateMechine/icons/SimpleState.svg")
class_name SimpleState
extends Node

# ！！！注意： 使用时请手动分离此脚本，创建继承于SimpleState类的新脚本

# 这个节点是每种状态的根脚本，所有的状态都继承于这个脚本，并通过重构4个关键函数实现功能
# 在模板中，推荐首先引入"Master"，即状态管理器的拥有者，用于调用Master的各项其他组件(节点)

# 注意： 在状态中，也可以使用change_state(Nodepath:string)完成状态间的切换
# 同时也可以使用 state_manager 变量访问自身的管理器

# 4个关键函数分别是 :
# on_enter()  在进入到当前状态时运行一次，类似_ready()
# on_process(_delta: float), 和on_physics_process(_delta: float) 分别对应帧和物理帧函数
# on_exit() 在离开当前调用一次

var state_manager: StateManager = null


func on_enter() -> void:
	pass


func on_process(_delta: float) -> void:
	pass


func on_physics_process(_delta: float) -> void:
	pass


func on_exit() -> void:
	pass



func change_state(StatePath: String) -> void:
	if is_instance_valid(state_manager):
		state_manager.change_state(StatePath)


func is_CurrentState() -> bool:
	if is_instance_valid(state_manager) and state_manager.CurrentState == self:
		return true
	else:
		return false
