extends SkinBase

func _init():
	id = "TestSkin"

func getName():
	return "Test"

func getPatternTexture():
	return load("res://Modules/ATest/skins/testSkin.png")

func getFittingSkinTypes():
	return {
		SkinType.Fur: 1.0,
		SkinType.Scales: 1.0,
	}


func isPickableByNPC():
	return false
