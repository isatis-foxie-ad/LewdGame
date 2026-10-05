extends BaseStageScene3D

func _init():
	id = StageScene.Nothing

func playAnimation(_animID, _args = {}):
	if OPTIONS.isMainLoggingEnabled():
		print("PLAYING NOTHING")

func getVarNpcs():
	return []

func getSupportedStates():
	return ["nothing"]
