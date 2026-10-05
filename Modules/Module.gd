extends Reference
class_name Module

var scenes = []
var characters = []
var items = []
var events = []
var quests = []

var attacks = []
var bodyparts = []
var species = []
var skills = []
var perks = []
var lustActions = []
var buffs = []
var statusEffects = []
var worldEdits = []
var gameExtenders = []
var computers = []
var skins = []
var partSkins = []
var stageScenes = []
var lootTables = []
var lootLists = []
var fetishes = []
var sexGoals = []
var sexActivities = []
var sexTypes = []
var fluids = []
var speechModifiers = []
var slaveBreakTasks = []
var slaveTypes = []
var slaveActions = []
var slaveEvents = []
var slaveActivities = []
var sexReactionHandlers = []

var id = "badmodule"
var author = "no author"
var flagsCache = null

func _res(string: String) -> String:
	if string.begins_with("res://"):
		return string
	return "res://"+string
	
	
func _init():
	flagsCache = getFlags()

func getRegisterName() -> String:
	if(str(author) != "Rahi"):
		return id+" module by "+str(author)
	return id+" module"

func getAuthorName() -> String:
	var theStrAuthor:String = str(author)
	if(theStrAuthor == "Rahi" || theStrAuthor == "no author"):
		return ""
	return theStrAuthor

func preInit(): # Called before anything gets registered
	pass

func postInit(): # Called after everything is registered
	pass

func register():
	var theAuthorName:String = getAuthorName()
	
	for scene in scenes:
		GlobalRegistry.registerScene(_res(scene), author)
	
	for character in characters:
		GlobalRegistry.registerCharacter(_res(character))
	
	for item in items:
		GlobalRegistry.registerItem(_res(item))
	
	for event in events:
		GlobalRegistry.registerEvent(_res(event))

	for quest in quests:
		GlobalRegistry.registerQuest(_res(quest))
		
	for attack in attacks:
		GlobalRegistry.registerAttack(_res(attack))
		
	for bodypart in bodyparts:
		GlobalRegistry.registerBodypart(_res(bodypart), theAuthorName)
	
	for specie in species:
		GlobalRegistry.registerSpecies(_res(specie))
		
	for skill in skills:
		GlobalRegistry.registerSkill(_res(skill))
		
	for perk in perks:
		GlobalRegistry.registerPerk(_res(perk))
	
	for lustAction in lustActions:
		GlobalRegistry.registerLustAction(_res(lustAction))
	
	for buff in buffs:
		GlobalRegistry.registerBuff(_res(buff))
		
	for statusEffect in statusEffects:
		GlobalRegistry.registerStatusEffect(_res(statusEffect))

	for worldEdit in worldEdits:
		GlobalRegistry.registerWorldEdit(_res(worldEdit))
	
	for gameExtender in gameExtenders:
		GlobalRegistry.registerGameExtender(_res(gameExtender))
	
	for computer in computers:
		GlobalRegistry.registerComputer(_res(computer))

	for skin in skins:
		GlobalRegistry.registerSkin(_res(skin), theAuthorName)
		
	for partSkin in partSkins:
		GlobalRegistry.registerPartSkin(_res(partSkin))
		
	for stageScene in stageScenes:
		GlobalRegistry.registerStageScene(_res(stageScene))
		
	for lootTable in lootTables:
		GlobalRegistry.registerLootTable(_res(lootTable))
		
	for lootList in lootLists:
		GlobalRegistry.registerLootList(_res(lootList))
		
	for fetish in fetishes:
		GlobalRegistry.registerFetish(_res(fetish))
		
	for sexGoal in sexGoals:
		GlobalRegistry.registerSexGoal(_res(sexGoal))
		
	for sexActivity in sexActivities:
		GlobalRegistry.registerSexActivity(_res(sexActivity))
		
	for sexType in sexTypes:
		GlobalRegistry.registerSexType(_res(sexType))
		
	for fluid in fluids:
		GlobalRegistry.registerFluid(_res(fluid))
		
	for speechModifier in speechModifiers:
		GlobalRegistry.registerSpeechModifier(_res(speechModifier))

	for slaveBreakTask in slaveBreakTasks:
		GlobalRegistry.registerSlaveBreakTask(_res(slaveBreakTask))
	
	for slaveType in slaveTypes:
		GlobalRegistry.registerSlaveType(_res(slaveType))
		
	for slaveAction in slaveActions:
		GlobalRegistry.registerSlaveAction(_res(slaveAction))
		
	for slaveEvent in slaveEvents:
		GlobalRegistry.registerSlaveEvent(_res(slaveEvent))
		
	for slaveActivity in slaveActivities:
		GlobalRegistry.registerSlaveActivity(_res(slaveActivity))

	for sexReactionHandler in sexReactionHandlers:
		GlobalRegistry.registerSexReactionHandler(_res(sexReactionHandler))

func registerEventTriggers():
	pass

func resetFlagsOnNewDay():
	pass

func setFlag(flagID, value):
	GM.main.setFlag(flagID, value)

func getFlag(flagID, defaultValue = null):
	return GM.main.getFlag(flagID, defaultValue)

func increaseFlag(flagID, addvalue = 1):
	GM.main.increaseFlag(flagID, addvalue)

func getRandomSceneFor(_sceneType):
	return []

func isScienceUpgradeVisible(_upgradeID:String) -> bool:
	return true

func getFlags():
	return {}
	
func getFlagsCache():
	return flagsCache

func flag(type):
	return {
		"type": type,
	}

func resetMainRoute():
	pass

func resetAllFlags():
	for theFlag in flagsCache:
		GM.main.clearModuleFlag(id, theFlag)

func resetAllFlagsWithExceptions(_ignore:Dictionary):
	for theFlag in flagsCache:
		if(_ignore.get(theFlag, false)):
			continue
		GM.main.clearModuleFlag(id, theFlag)

func menuButton(_id:String, _name:String, _desc:String) -> Array:
	return [_id, _name, _desc]

# Override this method in your Module to add new buttons to the main menu
func getMenuButtons() -> Array:
	## An example
	#return [menuButton("test", "Test!", "This is a test button")]
	return []

func onMenuButton(_buttonID:String, _menuScene):
	if OPTIONS.isMainLoggingEnabled():
		Log.print("Module:"+id+" Pressed menu button: "+_buttonID)

#	# An example of how to show some screen on top of the menu
#	var someGame = load("res://Game/Minigames/Struggling/StrugglingGame.tscn").instance()
#	someGame.connect("minigameCompleted", self, "onMinigameCompleted", [someGame])
#	_menuScene.setCustomScreen(someGame)
#
#func onMinigameCompleted(_res, someGame):
#	someGame.queue_free()
