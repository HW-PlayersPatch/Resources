base_research = nil 
base_research = {

	{
		Name =			"SensorsDowngrade1",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"Sensors Downgrade1",
		DisplayPriority =	1210,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Hgn_MotherShip",
	        UpgradeName =		"PrimarySensorsRange",
	        UpgradeValue =		0.3,
	},

	{
		Name =			"SensorsDowngrade2",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"Sensors Downgrade2",
		DisplayPriority =	1211,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Hgn_MotherShip",
	        UpgradeName =		"SecondarySensorsRange",
	        UpgradeValue =		0.3,
	},

	{
		Name =			"SensorsDowngrade3",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"Sensors Downgrade3",
		DisplayPriority =	1212,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Hgn_MotherShip",
	        UpgradeName =		"VisualRange",
	        UpgradeValue =		0.3,
	},

	{
		Name =			"SensorsBackToNormal1",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"SensorsBackToNormal1",
		DisplayPriority =	1213,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Hgn_MotherShip",
	        UpgradeName =		"PrimarySensorsRange",
	        UpgradeValue =		1.0,
	},

	{
		Name =			"SensorsBackToNormal2",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"SensorsBackToNormal2",
		DisplayPriority =	1214,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Hgn_MotherShip",
	        UpgradeName =		"SecondarySensorsRange",
	        UpgradeValue =		1.0,
	},

	{
		Name =			"SensorsBackToNormal3",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"SensorsBackToNormal3",
		DisplayPriority =	1215,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Hgn_MotherShip",
	        UpgradeName =		"VisualRange",
	        UpgradeValue =		1.0,
	},

	{
		Name =			"AssaultCorvetteEliteWeaponUpgrade",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"Elite Assault Corvette Weapon Upgrade",
		DisplayPriority =	1204,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Hgn_AssaultCorvetteElite",
	        UpgradeName =		"WeaponDamage",
	        UpgradeValue =		2.0,
	},

	{
		Name =			"AttackBomberEliteWeaponUpgrade",
		RequiredResearch =	"RESEARCH HACK",                        
		RequiredSubSystems =	"",                              
		Cost = 			0,
		Time = 			0,
		DisplayedName =		"Elite Attack Bomber Weapon Upgrade",
		DisplayPriority =	1205,                                                   
		Description =		"",
		UpgradeType =		Modifier,
		TargetType =		Ship,
		TargetName =		"Hgn_AttackBomberElite",
	        UpgradeName =		"WeaponDamage",
	        UpgradeValue =		1.8,
	},
	{
		Name =				"MoverHealthUpgrade",
		RequiredResearch =		"RESEARCH HACK",
		RequiredSubSystems =		"",
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"Mover health upgrade",
		DisplayPriority =			41,
		Description =			"Upgrades Mover health",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_Mover",
		UpgradeName =			"MAXHEALTH",
		UpgradeValue =			5,			-- or whatever value suits the mission
	},
	{
		Name =				"MoverHealthDowngrade",
		RequiredResearch =		"RESEARCH HACK",
		RequiredSubSystems =		"",
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"Mover health downgrade",
		DisplayPriority =			41,
		Description =			"Downgrades Mover health",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_Mover",
		UpgradeName =			"MAXHEALTH",
		UpgradeValue =			1,			-- or whatever value suits the mission
	},

	{
		Name =				"FrigateHealthUpgradeSPGAME",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				800,
		Time = 				60,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Family,
		TargetName =			"Frigate",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			2.5,
	},

	{
		Name =				"KeeperHealthUpgradeSPGAME_LOW",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_Destroyer",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			2.5,
	},

	{
		Name =				"KeeperHealthUpgradeSPGAME_MED",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_Destroyer",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			3.5,
	},


	{
		Name =				"KeeperHealthUpgradeSPGAME_HIGH",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_Destroyer",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			4.5,
	},

	{
		Name =				"KeeperWeaponUpgradeSPGAME_M10_LVL_1",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_DestroyerM10",
	        UpgradeName =			"WeaponDamage",
	        UpgradeValue =			0.1,
	},
	
	{
		Name =				"KeeperWeaponUpgradeSPGAME_M10_LVL_2",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_DestroyerM10",
	        UpgradeName =			"WeaponDamage",
	        UpgradeValue =			0.2,
	},
	
	{
		Name =				"KeeperWeaponUpgradeSPGAME_M10_LVL_3",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_DestroyerM10",
	        UpgradeName =			"WeaponDamage",
	        UpgradeValue =			0.3,
	},
	
	{
		Name =				"KeeperWeaponUpgradeSPGAME_M10_LVL_4",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_DestroyerM10",
	        UpgradeName =			"WeaponDamage",
	        UpgradeValue =			0.4,
	},
	
	{
		Name =				"KeeperWeaponUpgradeSPGAME_M10_LVL_5",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_DestroyerM10",
	        UpgradeName =			"WeaponDamage",
	        UpgradeValue =			0.5,
	},
	
	{
		Name =				"KeeperWeaponUpgradeSPGAME_M10_LVL_6",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_DestroyerM10",
	        UpgradeName =			"WeaponDamage",
	        UpgradeValue =			0.6,
	},
	
	{
		Name =				"KeeperHealthUpgradeSPGAME_M10_LVL_1",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_DestroyerM10",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			2,
	},
	{
		Name =				"KeeperHealthUpgradeSPGAME_M10_LVL_2",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_DestroyerM10",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			3,
	},
	{
		Name =				"KeeperHealthUpgradeSPGAME_M10_LVL_3",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_DestroyerM10",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			4,
	},

	{
		Name =				"AttackDroidHealthUpgradeSPGAME_LOW",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_AttackDroid",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			2.0,
	},

	{
		Name =				"AttackDroidHealthUpgradeSPGAME_MED",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_AttackDroid",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			3.0,
	},

	{
		Name =				"AttackDroidHealthUpgradeSPGAME_HIGH",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_AttackDroid",
	        UpgradeName =			"MAXHEALTH",
	        UpgradeValue =			4.0,
	},

	{
		Name =				"AttackDroidWeaponUpgradeSPGAME_LOW",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_AttackDroid",
	        UpgradeName =			"WeaponDamage",
	        UpgradeValue =			1.3,
	},

	{
		Name =				"AttackDroidWeaponUpgradeSPGAME_MED",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_AttackDroid",
	        UpgradeName =			"WeaponDamage",
	        UpgradeValue =			1.6,
	},

	{
		Name =				"AttackDroidWeaponUpgradeSPGAME_HIGH",
		RequiredResearch =		"RESEARCH HACK",                                          
		RequiredSubSystems =		"",    
		Cost = 				0,
		Time = 				0,
		DisplayedName =			"$7571",
		DisplayPriority =		300,                                                    
		Description =			"$7572",
		UpgradeType =			Modifier,
		TargetType =			Ship,
		TargetName =			"Kpr_AttackDroid",
	        UpgradeName =			"WeaponDamage",
	        UpgradeValue =			2.0,
	},
	
	{
		Name =					"DamageMoverTech",
		RequiredResearch =		"",
		RequiredSubSystems =	"Research | AdvancedResearch",
		Cost = 					500,
		Time = 					60,
		DisplayedName =			"$7900",
		DisplayPriority =		29,
		Description =			"$7901",
		TargetName = 		"Hgn_Mothership",
		Icon = Icon_Tech,
		ShortDisplayedName = "$7902",
	},
	
	{
		Name =					"RadiationDefenseField",
		RequiredResearch =		"",
		RequiredSubSystems =	"Research | AdvancedResearch",
		Cost = 					500,
		Time = 					60,
		DisplayedName =			"$7905",
		DisplayPriority =		30,
		Description =			"$7906",
		UpgradeType =			Ability,
		TargetType =			Ship,
		UpgradeName =			"DefenseFieldShield",
		TargetName = 		"Hgn_DefenseFieldFrigate",
		Icon = Icon_Tech,
		ShortDisplayedName =	"$7907",
	},

}

-- Add these items to the research tree!
for i,e in base_research do
	research[res_index] = e
	res_index = res_index+1
end

base_research = nil 