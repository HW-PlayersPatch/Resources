base_research = nil 
base_research = {

	{
		Name =			"CorvetteDrive",
		RequiredResearch =	"",
		RequiredSubSystems =	"Research",
		Cost = 			800,
		Time = 			100,
		DisplayedName =		"$11516",
		ShortDisplayedName =	"$11516",
		DisplayPriority =		21,
		Description =		"$11517",
		Icon = 			Icon_Build,
		TargetName =		"Tai_LightCorvette",
	},	
	{
		Name =			"CorvetteChassis",
		RequiredResearch =	"CorvetteDrive",
		RequiredSubSystems =	"Research",
		Cost = 			900,
		Time = 			90,
		DisplayedName =		"$11522",
		ShortDisplayedName =	"$11522",
		DisplayPriority =		22,
		Description =		"$11523",
		Icon = 			Icon_Build,
		TargetName =		"Tai_SalvageCorvette",
	},	
	{
		Name =			"HeavyCorvetteUpgrade",
		RequiredResearch =	"CorvetteChassis",
		RequiredSubSystems =	"Research",
		Cost = 			600,
		Time = 			30,
		DisplayedName =		"$11518",
		ShortDisplayedName =	"$11518",
		DisplayPriority =		23,
		Description =		"$11519",
		Icon = 			Icon_Build,
		TargetName =		"Tai_HeavyCorvette",
	},	
	{
		Name =			"FastTrackingTurrets",
		RequiredResearch =	"CorvetteChassis",
		RequiredSubSystems =	"Research",
		Cost = 			700,
		Time = 			40,
		DisplayedName =		"$11510",
		ShortDisplayedName =	"$11510",
		DisplayPriority =		24,
		Description =		"$11511",
		Icon = 			Icon_Build,
		TargetName =		"Tai_MultiGunCorvette",
	},	
	{
		Name =			"MinelayingTech",
		RequiredResearch =	"CorvetteChassis",
		RequiredSubSystems =	"Research",
		Cost = 			700,
		Time = 			70,
		DisplayedName =		"$11520",
		ShortDisplayedName =	"$11520",
		DisplayPriority =		25,
		Description =		"$11521",
		Icon = 			Icon_Build,
		TargetName =		"Tai_MinelayerCorvette",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 