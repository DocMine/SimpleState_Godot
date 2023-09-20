@tool
extends EditorPlugin



func _enter_tree() -> void:
	AddTemplates()
	pass


func _exit_tree() -> void:
	pass


func AddTemplates():
	var TemplateSearchPath:String  = ProjectSettings.get_setting("editor/script/templates_search_path")
	var PluginTemplatesPath:String = "res://addons/SimpleStateMechine/templates"
	# 获得编辑器指定的模板文件目录
	# 创建模板目录，并复制模板到相应目录
	if not DirAccess.dir_exists_absolute(TemplateSearchPath):
		# 如果不存在编辑器指定的模板文件目录，则创建它
		DirAccess.make_dir_recursive_absolute(TemplateSearchPath)
	var NodeDirs = DirAccess.get_directories_at(PluginTemplatesPath)
	for NodeDir in NodeDirs:
		# 在编辑器搜索目录下新建文件夹
		if not DirAccess.dir_exists_absolute(TemplateSearchPath+"/"+NodeDir):
			DirAccess.make_dir_recursive_absolute(TemplateSearchPath+"/"+NodeDir)
		var ScriptNames = DirAccess.get_files_at(PluginTemplatesPath+"/"+NodeDir)
		for ScriptName in ScriptNames:
			DirAccess.copy_absolute(PluginTemplatesPath+"/"+NodeDir+"/"+ScriptName,
			TemplateSearchPath+"/"+NodeDir+"/"+ScriptName)
	
