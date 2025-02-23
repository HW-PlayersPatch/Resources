-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
obj_prim_planetkiller = "$47000"
obj_prim_planetkiller_id = 0
obj_prim_destroyvaygr = "$47001"
obj_prim_destroyvaygr_id = 0
obj_prim_protecthiigara = "$47002"
obj_prim_protecthiigara_id = 0
ping_planet_killer = "$47340"
ping_planet_killer_id = 0
ping_pkiller_missile = "$47341"
ping_pkiller_missile_id = 0
ping_vaygr_forces = "$47342"
ping_vaygr_forces_id = 0
g_planet_killer_timer_interval = 180
g_timetofirstmissilelaunch = 60
g_missilerateoffire = 20
g_maxnumberofmissiles = 10
g_whentosaymissilefired = 5
g_first_launch = 0
g_lastmissilelaunchedfrom = 0
g_missile_count = 0
g_missiles_hit_hiigara = 0
g_hiigara_count = 0
g_hiigara_population = 180
g_sobgroups_in_volume = ""
g_sobgroups_in_accelerate_volume = ""
g_launchspeechid = 47220
g_pointer_default_1 = 0
g_pointer_default_2 = 0
g_pointer_default_3 = 0
g_pkillersdestroyed = 0
g_beginentry = 0
g_save_id = 0
missilesAccelerated = {0, 0, 0, 0, 0, 0}

function testit()
	playBgLightAnim("super_beam_background_ring")
end

function OnInit()
	Rule_Add("Rule_Init")
	Preload_Ship("Vgr_PlanetKiller")
	Preload_Ship("Kpr_Sajuuk")
	Camera_UseCameraPoint("camera_openingShot")
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function Rule_Init()
	for i = 1, getn(missilesAccelerated) do
	missilesAccelerated[i] = "missilesAccelerated_"..i
	SobGroup_Create(missilesAccelerated[i])
	end
	SobGroup_Create("missilesInitialized")
	SobGroup_Create("tempSobGroup")
	Rule_AddInterval("Rule_DisableBuilderInterval", 20)
	HW2_SetResearchLevel(15)
	DisableHigFleet();
	Sound_SpeechSubtitlePath("speech:missions/m_15/")
	Sound_MusicPlayType("data:sound/music/battle/battle_01", MUS_Ambient)
	SetupPlayer_1();
	SetupPlayer_2();
	SetupPlayer_3();
	SetupPlayer_4();
	SetupPlayer_5();
	Rule_Add("Rule_PlayerDestroyedVaygr")
	Rule_Add("Rule_PlayerWins")
	Event_Start("intelevent_enemyfleetsdetected")
	Rule_Add("Rule_HyperspaceInFleet")
	Player_SetPlayerName(0, "$47006")
	SetAlliance(0, 5)
	SetAlliance(5, 0)
	Rule_Remove("Rule_Init")
	Sound_EnableAllSpeech(0)
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameMissionStart", 1)
end

function Rule_SaveTheGameMissionStart()
	Rule_Remove("Rule_SaveTheGameMissionStart")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6460")
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_HyperspaceInFleet()
	if (g_beginentry == 1) then
	SobGroup_LoadPersistantData("Kpr_Sajuuk")
	Sajuuk = "Sajuuk"
	SobGroup_Create(Sajuuk)
	SobGroup_FillShipsByType(Sajuuk, "Player_Ships0", "Kpr_Sajuuk")
	ShipToParadeRoundTypeName = "Kpr_Sajuuk"
	Rule_AddInterval("Rule_PlayNIS", g_planet_killer_timer_interval)
	Rule_Add("Rule_PlayerLoses")
	Rule_Remove("Rule_HyperspaceInFleet")
	end
end

function DisableHigFleet()
	SobGroup_TakeDamage("Hiigaran_Debris", 0.8)
	SobGroup_FillBattleScar("Hiigaran_Debris", "Plasma_Bomb/Plasma_Bomb")
	SobGroup_AbilityActivate("Hiigaran_Debris", AB_Attack, 0)
	SobGroup_AbilityActivate("Hiigaran_Debris", AB_Stop, 0)
	SobGroup_AbilityActivate("Hiigaran_Debris", AB_Steering, 0)
	SobGroup_AbilityActivate("Hiigaran_Debris", AB_Lights, 0)
end

AvailableStrikeGroups = {"movers", "wall", "tortoise", "inverted leaping goose"}

function SetupPlayer_1()
	SetAlliance(1, 2)
	SetAlliance(1, 3)
	SetAlliance(1, 4)
	Player_SetPlayerName(1, "$47007")
	Player_SetRU(1, 10000)
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	CPU_RemoveSobGroup(1, "Debris_Attackers")
	SobGroup_CreateSubSystem("VF1_Carrier1", "FighterProduction")
	SobGroup_CreateSubSystem("VF1_Carrier2", "FighterProduction")
	SobGroup_FormStrikeGroup("VF1_Fighter_Attack_1", AvailableStrikeGroups[3])
	SobGroup_FormStrikeGroup("VF1_Fighter_Attack_2", AvailableStrikeGroups[3])
	CPU_RemoveSobGroup(1, "VF1_Fighter_Attack_1")
	CPU_RemoveSobGroup(1, "VF1_Fighter_Attack_1")
end

function SetupPlayer_2()
	SetAlliance(2, 1)
	SetAlliance(2, 3)
	SetAlliance(2, 4)
	Player_SetPlayerName(2, "$47007")
	Player_SetRU(2, 10000)
	Player_SetDefaultShipTactic(2, AggressiveTactics)
	SobGroup_FormStrikeGroup("VF2_Major_Attack_1", AvailableStrikeGroups[2])
	HW2_InitializeBuilder("VF2_Shipyard", "tempSobGroup")
	CPU_RemoveSobGroup(2, "VF2_Major_Attack_1")
end

function SetupPlayer_3()
	SetAlliance(3, 1)
	SetAlliance(3, 2)
	SetAlliance(3, 4)
	Player_SetPlayerName(3, "$47007")
	Player_SetRU(3, 10000)
	Player_SetDefaultShipTactic(3, AggressiveTactics)
	SobGroup_FormStrikeGroup("VF3_Major_Attack_1", AvailableStrikeGroups[2])
	HW2_InitializeBuilder("VF3_Shipyard", "tempSobGroup")
	CPU_RemoveSobGroup(3, "VF3_Major_Attack_1")
end

function SetupPlayer_4()
	print("setup player 4")
	SetAlliance(4, 1)
	SetAlliance(4, 2)
	SetAlliance(4, 3)
	Player_SetPlayerName(4, "$47007")
	Player_SetDefaultShipTactic(4, AggressiveTactics)
	CPU_Enable(4, 0)
end

function SetupPlayer_5()
	Player_SetPlayerName(5, "$47006")
	CPU_Enable(5, 0)
end

function Rule_PlayNIS()
	Event_Start("speechevent_incoming")
	Rule_Add("Rule_NowPlayNIS")
	Rule_Remove("Rule_PlayNIS")
end

function Rule_NowPlayNIS()
	if (Event_IsDone("speechevent_incoming") == 1) then
	SobGroup_SetInvulnerability("Player_Ships0", 1)
	SobGroup_SetInvulnerability("Player_Ships1", 1)
	SobGroup_SetInvulnerability("Player_Ships2", 1)
	SobGroup_SetInvulnerability("Player_Ships3", 1)
	SobGroup_SetInvulnerability("Player_Ships4", 1)
	SobGroup_SetInvulnerability("Player_Ships5", 1)
	NISLoad("nis/NIS15")
	Sensors_EnableCameraZoom(0)
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	g_currentNISPlaying_id = NISPlay("nis/NIS15")
	Rule_Add("Rule_NISCompleted")
	Rule_Remove("Rule_NowPlayNIS")
	end
end

function Rule_NISCompleted()
	if (NISComplete(g_currentNISPlaying_id) == 1) then
	Sound_MusicPlayType("data:sound/MUSIC/BATTLE/BATTLE_01", MUS_Battle)
	Sensors_EnableToggle(1)
	Sensors_EnableCameraZoom(1)
	SobGroup_SetInvulnerability("Player_Ships0", 0)
	SobGroup_SetInvulnerability("Player_Ships1", 0)
	SobGroup_SetInvulnerability("Player_Ships2", 0)
	SobGroup_SetInvulnerability("Player_Ships3", 0)
	SobGroup_SetInvulnerability("Player_Ships4", 0)
	SobGroup_SetInvulnerability("Player_Ships5", 0)
	Event_Start("intelevent_planetkillers")
	Rule_Add("Rule_SaveAfterPlanetkillersArrive")
	Rule_AddInterval("Rule_Pkiller_Missile_Build", g_timetofirstmissilelaunch)
	SobGroup_Create("All_PkillerMissiles")
	FOW_RevealGroup("Planet_Killer_1", 1)
	FOW_RevealGroup("Planet_Killer_2", 1)
	FOW_RevealGroup("Planet_Killer_3", 1)
	obj_prim_planetkiller_id = Objective_Add(obj_prim_planetkiller, OT_Primary)
	Objective_AddDescription(obj_prim_planetkiller_id, "$47350")
	Objective_AddDescription(obj_prim_planetkiller_id, "$47354")
	Rule_Add("Rule_PKDestroyedNoMoreMissiles")
	Rule_Add("Rule_PkillerDestroyed")
	Rule_Remove("Rule_NISCompleted")
	end
end

function Rule_SaveAfterPlanetkillersArrive()
	if (Event_IsDone("intelevent_planetkillers") == 1) then
	Rule_Remove("Rule_SaveAfterPlanetkillersArrive")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGamePlanetKillersArrive", 1)
	end
end

function Rule_SaveTheGamePlanetKillersArrive()
	Rule_Remove("Rule_SaveTheGamePlanetKillersArrive")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6461")
end

g_pkillerstate = {1, 1, 1}

function Rule_PkillerDestroyed()
	for i = 1, 3 do
	if (SobGroup_Empty("Planet_Killer_"..i) == 1 and g_pkillerstate[i] == 1) then
	print("SCAR: Planet Killer"..i.." destroyed")
	g_pkillerstate[i] = 0
	g_pkillersdestroyed = (g_pkillersdestroyed + 1)
	if (g_pkillersdestroyed == 1) then
	Event_Start("speechevent_firstplanetkillerdestroyed")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameFirstPlatformDestroyed", 1)
	g_missilerateoffire = g_missilerateoffire / 2
	g_whentosaymissilefired = 10
	Rule_Remove("Fire_Missile")
	Rule_AddInterval("Fire_Missile", g_missilerateoffire)
	elseif (g_pkillersdestroyed == 2) then
	Event_Start("speechevent_secondplanetkillerdestroyed")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_AddInterval("Rule_SaveTheGameSecondPlatformDestroyed", 1)
	g_missilerateoffire = g_missilerateoffire / 2
	g_whentosaymissilefired = 20
	Rule_Remove("Fire_Missile")
	Rule_AddInterval("Fire_Missile", g_missilerateoffire)
	elseif (g_pkillersdestroyed == 3) then
	Objective_SetState(obj_prim_planetkiller_id, OS_Complete)
	Rule_Remove("Rule_Missile_Impact")
	Rule_Remove("Rule_PkillerDestroyed")
	end
	end
	end
end

function Rule_SaveTheGameFirstPlatformDestroyed()
	Rule_Remove("Rule_SaveTheGameFirstPlatformDestroyed")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6462")
end

function Rule_SaveTheGameSecondPlatformDestroyed()
	Rule_Remove("Rule_SaveTheGameSecondPlatformDestroyed")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6463")
end

function Rule_Pkiller_Missile_Build()
	Timer_Start(0, g_hiigara_population * 60)
	Timer_Pause(0)
	Subtitle_TimeCounter(0, 47003)
	obj_prim_protecthiigara_id = Objective_Add(obj_prim_protecthiigara, OT_Primary)
	Objective_AddDescription(obj_prim_protecthiigara_id, "$47352")
	Objective_AddDescription(obj_prim_protecthiigara_id, "$47353")
	Event_Start("intelevent_missilelaunched")
	Rule_Add("Rule_Missile_Impact")
	Rule_AddInterval("Rule_AccelerateMissiles", 2)
	Rule_AddInterval("Fire_Missile", g_missilerateoffire)
	Rule_AddInterval("Move_Missile", 10)
	Rule_Remove("Rule_Pkiller_Missile_Build")
end

function setLaunchSpeech()
	if (g_launchspeechid < 47225) then
	g_launchspeechid = (g_launchspeechid + 1)
	else
	g_launchspeechid = 47220
	end
end

g_insert_missile = {0, 0, 0}
g_missilesfired = g_whentosaymissilefired

function Fire_Missile()
	for i = 1, 3 do
	if (g_pkillerstate[i] == 1 and SobGroup_Count("All_PkillerMissiles") <= g_maxnumberofmissiles) then
	if (g_missilesfired == g_whentosaymissilefired) then
	Subtitle_Add(Actor_FleetIntel, "$"..g_launchspeechid, 5)
	setLaunchSpeech();
	g_missilesfired = (g_missilesfired + 1)
	elseif (g_missilesfired > g_whentosaymissilefired) then
	g_missilesfired = 0
	end
	g_missile_count = (g_missile_count + 1)
	g_insert_missile[i] = SobGroup_CreateShip("Planet_Killer_"..i, "Vgr_PlanetKillerMissile")
	SobGroup_SobGroupAdd("All_PkillerMissiles", g_insert_missile[i])
	CPU_RemoveSobGroup(4, g_insert_missile[i])
	g_lastmissilelaunchedfrom = i
	end
	end
end

function Move_Missile()
	for i = 1, 3 do
	if (g_pkillerstate[i] == 1) then
	Player_FillProximitySobGroup("tempSobGroup", 4, "Planet_Killer_"..i, 5000)
	SobGroup_FillShipsByType("missilesInitialized", "tempSobGroup", "Vgr_PlanetKillerMissile")
	if (SobGroup_Empty("missilesInitialized") == 0) then
	SobGroup_Move(4, "missilesInitialized", "Accel_Missile_Destination_"..i)
	end
	end
	end
end

function Rule_AccelerateMissiles()
	for i = 1, 3 do
	while (Player_IsShipInVolume(4, "Accel_Missile_Destination_"..i) == 1) do
	for j = 1, getn(missilesAccelerated) do
	if (SobGroup_Empty(missilesAccelerated[j]) == 1) then
	SobGroup_FillSobGroupInVolume(missilesAccelerated[j], "All_PkillerMissiles", "Accel_Missile_Destination_"..i)
	if (SobGroup_Empty(missilesAccelerated[j]) == 0) then
	print("accelerating missile to "..j)
	SobGroup_SetInvulnerability(missilesAccelerated[j], 1)
	SobGroup_Move(4, missilesAccelerated[j], "Missile_Destination_"..j)
	SobGroup_SetMaxSpeedMultiplier(missilesAccelerated[j], 10)
	Rule_AddInterval("Rule_PlayBurnEffectMissile_"..j, 3)
	end
	end
	end
	end
	end
end

function Rule_PlayBurnEffectMissile_1()
	FX_StartEvent(missilesAccelerated[1], "Burn")
	FX_StartEvent(missilesAccelerated[1], "Burn_Loop")
	Rule_Remove("Rule_PlayBurnEffectMissile_1")
end

function Rule_PlayBurnEffectMissile_2()
	FX_StartEvent(missilesAccelerated[2], "Burn")
	FX_StartEvent(missilesAccelerated[2], "Burn_Loop")
	Rule_Remove("Rule_PlayBurnEffectMissile_2")
end

function Rule_PlayBurnEffectMissile_3()
	FX_StartEvent(missilesAccelerated[3], "Burn")
	FX_StartEvent(missilesAccelerated[3], "Burn_Loop")
	Rule_Remove("Rule_PlayBurnEffectMissile_3")
end

function Rule_PlayBurnEffectMissile_4()
	FX_StartEvent(missilesAccelerated[4], "Burn")
	FX_StartEvent(missilesAccelerated[4], "Burn_Loop")
	Rule_Remove("Rule_PlayBurnEffectMissile_4")
end

function Rule_PlayBurnEffectMissile_5()
	FX_StartEvent(missilesAccelerated[5], "Burn")
	FX_StartEvent(missilesAccelerated[5], "Burn_Loop")
	Rule_Remove("Rule_PlayBurnEffectMissile_5")
end

function Rule_PlayBurnEffectMissile_6()
	FX_StartEvent(missilesAccelerated[6], "Burn")
	FX_StartEvent(missilesAccelerated[6], "Burn_Loop")
	Rule_Remove("Rule_PlayBurnEffectMissile_6")
end

function Rule_Missile_Impact()
	for i = 1, getn(missilesAccelerated) do
	if (SobGroup_Empty(missilesAccelerated[i]) == 0) then
	if (SobGroup_IsSelectable(missilesAccelerated[i]) == 1 and SobGroup_InWorldBound(missilesAccelerated[i], 1) == 0) then
	SobGroup_MakeSelectable(missilesAccelerated[i], 0)
	SobGroup_MakeUntargeted(missilesAccelerated[i])
	end
	end
	if (SobGroup_IsInVolume(missilesAccelerated[i], "Missile_Destination_"..i) == 1) then
	SobGroup_Stop(4, missilesAccelerated[i])
	SobGroup_SetSpeed(missilesAccelerated[i], 0)
	SobGroup_Despawn(missilesAccelerated[i])
	SobGroup_Clear(missilesAccelerated[i])
	g_missiles_hit_hiigara = (g_missiles_hit_hiigara + 1)
	if (g_missiles_hit_hiigara == 1) then
	g_hiigara_population = 102
	Event_Start("speechevent_firstimpact")
	FX_PlayEffectOnBackgroundVolume("dmg_capital_explosion_combo_planet_killer", "fx_missile_explosion_1", 500)
	Sound_SFXPlay3D("data:sound/sfx/etg/sp_elements/sp_elements_planet_killer_missle_hit", "Missile_Destination_"..i)
	elseif (g_missiles_hit_hiigara == 2) then
	g_hiigara_population = 70
	Event_Start("speechevent_secondimpact")
	FX_PlayEffectOnBackgroundVolume("dmg_capital_explosion_combo_planet_killer", "fx_missile_explosion_2", 500)
	Sound_SFXPlay3D("data:sound/sfx/etg/sp_elements/sp_elements_planet_killer_missle_hit", "Missile_Destination_"..i)
	elseif (g_missiles_hit_hiigara == 3) then
	g_hiigara_population = 21
	Event_Start("speechevent_thirdimpactdetected")
	FX_PlayEffectOnBackgroundVolume("dmg_capital_explosion_combo_planet_killer", "fx_missile_explosion_3", 500)
	Sound_SFXPlay3D("data:sound/sfx/etg/sp_elements/sp_elements_planet_killer_missle_hit", "Missile_Destination_"..i)
	elseif (g_missiles_hit_hiigara == 4) then
	g_hiigara_population = 15000
	Event_Start("speechevent_fourthimpact")
	FX_PlayEffectOnBackgroundVolume("dmg_capital_explosion_combo_planet_killer", "fx_missile_explosion_4", 500)
	Sound_SFXPlay3D("data:sound/sfx/etg/sp_elements/sp_elements_planet_killer_missle_hit", "Missile_Destination_"..i)
	elseif (g_missiles_hit_hiigara == 5) then
	g_hiigara_population = 5333
	Event_Start("speechevent_fifthimpact")
	FX_PlayEffectOnBackgroundVolume("dmg_capital_explosion_combo_planet_killer", "fx_missile_explosion_5", 500)
	Sound_SFXPlay3D("data:sound/sfx/etg/sp_elements/sp_elements_planet_killer_missle_hit", "Missile_Destination_"..i)
	elseif (g_missiles_hit_hiigara == 6) then
	g_hiigara_population = 0
	Event_Start("speechevent_hiigaradestroyed")
	FX_PlayEffectOnBackgroundVolume("dmg_capital_explosion_combo_planet_killer", "fx_missile_explosion_6", 500)
	Sound_SFXPlay3D("data:sound/sfx/etg/sp_elements/sp_elements_planet_killer_missle_hit", "Missile_Destination_"..i)
	Rule_Remove("Rule_Missile_Impact")
	Rule_Add("Rule_PlayerLoses")
	end
	if (g_missiles_hit_hiigara <= 3) then
	Subtitle_TimeCounterEnd()
	Timer_End(0)
	Timer_Start(0, g_hiigara_population * 60)
	Timer_Pause(0)
	Subtitle_TimeCounter(0, 47003)
	else
	Subtitle_TimeCounterEnd()
	Timer_End(0)
	Timer_Start(0, g_hiigara_population * 60)
	Timer_Pause(0)
	Subtitle_TimeCounter(0, 47009)
	end
	end
	end
end 

function Rule_PKDestroyedNoMoreMissiles()
	if (g_pkillerstate[1] == 0) then
	if (g_pkillerstate[2] == 0) then
	if (g_pkillerstate[3] == 0) then
	if (SobGroup_Empty("All_PkillerMissiles") == 1) then
	Objective_SetState(obj_prim_protecthiigara_id, OS_Complete)
	Rule_Remove("Rule_PKDestroyedNoMoreMissiles")
	end
	end
	end
	end
end 

function Rule_PlayerDestroyedVaygr()
	if (SobGroup_AreAnyOfTheseTypes("Player_Ships1", "Vgr_ShipYard, Vgr_MissileCorvette, Vgr_LaserCorvette, Vgr_LanceFighter, Vgr_Interceptor, Vgr_InfiltratorFrigate, Vgr_HeavyMissileFrigate, Vgr_Carrier, Vgr_Bomber, Vgr_AssaultFrigate") == 0) then
	if (SobGroup_AreAnyOfTheseTypes("Player_Ships2", "Vgr_ShipYard, Vgr_MissileCorvette, Vgr_LaserCorvette, Vgr_LanceFighter, Vgr_Interceptor, Vgr_InfiltratorFrigate, Vgr_HeavyMissileFrigate, Vgr_Carrier, Vgr_Bomber, Vgr_AssaultFrigate") == 0) then
	if (SobGroup_AreAnyOfTheseTypes("Player_Ships3", "Vgr_ShipYard, Vgr_MissileCorvette, Vgr_LaserCorvette, Vgr_LanceFighter, Vgr_Interceptor, Vgr_InfiltratorFrigate, Vgr_HeavyMissileFrigate, Vgr_Carrier, Vgr_Bomber, Vgr_AssaultFrigate") == 0) then
	Objective_SetState(obj_prim_destroyvaygr_id, OS_Complete)
	Rule_Remove("Rule_PlayerDestroyedVaygr")
	end
	end
	end
end

function Rule_Vaygr_Carriers_Destroyed()
	if (SobGroup_AreAnyOfTheseTypes("Player_Ships2", "Vgr_ShipYard, Vgr_MissileCorvette, Vgr_LaserCorvette, Vgr_LanceFighter, Vgr_Interceptor, Vgr_InfiltratorFrigate, Vgr_HeavyMissileFrigate, Vgr_Carrier, Vgr_Bomber, Vgr_AssaultFrigate") == 0) then
	Objective_SetState(obj_prim_destroyvaygr_id, OS_Complete)
	Rule_Remove("Rule_Vaygr_Carriers_Destroyed")
	end
end

function Rule_PlayerLoses()
	if (SobGroup_Empty(Sajuuk) == 1) then
	Event_Start("speechevent_playerloses")
	Rule_Remove("Rule_PlayerLoses")
	end
end

function Rule_PlayerWins()
	if (Objective_GetState(obj_prim_planetkiller_id) == OS_Complete) then
	SobGroup_SetHealth("All_PkillerMissiles", 0)
	VaygrFlee();
	Event_Start("speechevent_victoryisours")
	Subtitle_TimeCounterEnd()
	Rule_Remove("Fire_Missile_1")
	Rule_Remove("Fire_Missile_2")
	Rule_Remove("Fire_Missile_3")
	Rule_Remove("Rule_Pkiller_Missile_Build")
	Rule_Remove("Rule_PlayerWins")
	end
end

function VaygrFlee()
	vaygrShipList = {{"Vgr_AssaultFrigate", 0}, {"Vgr_BattleCruiser", 1}, {"Vgr_Bomber", 2}, {"Vgr_Carrier", 1}, {"Vgr_CommandCorvette", 2}, {"Vgr_Destroyer", 1}, {"Vgr_HeavyMissileFrigate", 0}, {"Vgr_InfiltratorFrigate", 1}, {"Vgr_Interceptor", 2}, {"Vgr_LanceFighter", 2}, {"Vgr_LaserCorvette", 0}, {"Vgr_MinelayerCorvette", 2}, {"Vgr_MissileCorvette", 0}, {"Vgr_ResourceCollector", 0}, {"Vgr_ResourceController", 1}, {"Vgr_Scout", 2}, {"Vgr_ShipYard", 1},}
	for i = 1, getn(vaygrShipList) do
	for j = 1, 4 do
	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships"..j, vaygrShipList[i][1])
	if (SobGroup_Empty("tempSobGroup") == 0) then
	if (vaygrShipList[i][2] == 0) then
	SobGroup_TakeDamage("tempSobGroup", 1)
	elseif (vaygrShipList[i][2] == 1) then
	SobGroup_EnterHyperSpaceOffMap("tempSobGroup")
	elseif (vaygrShipList[i][2] == 2) then
	SobGroup_Kamikaze("tempSobGroup", "Player_Ships0")
	end
	end
	end
	end 
end

Events = {}
Events["intelevent_enemyfleetsdetected"] = {{{"Sound_EnableAllSpeech(1)", ""}, {"Universe_EnableSkip(1)", ""}, {"Camera_UseCameraPoint('camera_openingShot')", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_LocationCardEvent("$47004", 5)}, {HW2_Letterbox(1), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_AllShips, "$47230", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_AllShips, "$47231", 5)}, {HW2_Wait(5)}, {{"g_beginentry = 1", ""}, HW2_Wait(2)}, {{"Camera_Interpolate('here', 'camera_focusOnStart', 0)", ""}, HW2_Wait(12)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$47134", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$47011", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$47012", 3)}, {{"Sensors_Toggle(1)", ""}, HW2_Wait(2)}, {{"Camera_Interpolate('here', 'camera_showVaygrInIntro', 3)", ""}, {"ping_vaygr_forces_id = HW2_PingCreateWithLabel(ping_vaygr_forces, 'Vaygr_Force_1')", ""}, {"Ping_AddDescription(ping_vaygr_forces_id, 0, '$47345')", ""}, {"ping_vaygr_forces_id = HW2_PingCreateWithLabel(ping_vaygr_forces, 'Vaygr_Force_2')", ""}, {"Ping_AddDescription(ping_vaygr_forces_id, 0, '$47345')", ""}, {"ping_vaygr_forces_id = HW2_PingCreateWithLabel(ping_vaygr_forces, 'Vaygr_Force_3')", ""}, {"Ping_AddDescription(ping_vaygr_forces_id, 0, '$47345')", ""}, {"g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Vaygr_Force_1')", ""}, {"g_pointer_default_2 = HW2_CreateEventPointerSobGroup('Vaygr_Force_2')", ""}, {"g_pointer_default_3 = HW2_CreateEventPointerSobGroup('Vaygr_Force_3')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$47013", 7)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47015", 3)}, {HW2_Wait(1)}, {{"obj_prim_destroyvaygr_id = Objective_Add(obj_prim_destroyvaygr , OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_destroyvaygr_id, '$47351')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$47014", 4)}, {{"EventPointer_Remove(g_pointer_default_1)", ""}, {"EventPointer_Remove(g_pointer_default_2)", ""}, {"EventPointer_Remove(g_pointer_default_3)", ""}, {"Camera_Interpolate('here', 'camera_returntoFleet', 2)", ""}, HW2_Wait(2)}, {{"Sensors_Toggle(0)", ""}, {"Timer_Resume(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Camera_SetLetterboxStateNoUI(0, 2)", ""}, HW2_Wait(2), {"Universe_EnableSkip(0)", ""},},}
Events["intelevent_planetkillers"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Pause(1), HW2_Letterbox(1), {"Sensors_Toggle(1)", ""}, HW2_Wait(2), {"Sound_MusicPlayType('data:sound/MUSIC/BATTLE/BATTLE_01', MUS_Battle)", ""},}, {{"ping_planet_killer_id = HW2_PingCreateWithLabel(ping_planet_killer, 'Planet_Killer_1')", ""}, {"ping_planet_killer_id = HW2_PingCreateWithLabel(ping_planet_killer, 'Planet_Killer_2')", ""}, {"ping_planet_killer_id = HW2_PingCreateWithLabel(ping_planet_killer, 'Planet_Killer_3')", ""}, {"Ping_AddDescription(ping_planet_killer_id, 0, '$47343')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$47020", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47201", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47202", 5)}, {{"Universe_EnableSkip(0)", ""}, {"Sensors_Toggle(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, HW2_Letterbox(0), HW2_Pause(0), HW2_Wait(4)},}
Events["intelevent_pkillerpoweringup"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$"..g_launchspeechid, 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_incoming"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47022", 5)},}
Events["intelevent_missilelaunched"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Pause(1), HW2_Letterbox(1), HW2_Wait(2)}, {{"Sensors_Toggle(1)", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47040", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47041", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47042", 5), {"g_pointer_default_1 = HW2_CreateEventPointerVolume('Accel_Missile_Destination_1')", ""}, {"g_pointer_default_2 = HW2_CreateEventPointerVolume('Accel_Missile_Destination_2')", ""}, {"g_pointer_default_3 = HW2_CreateEventPointerVolume('Accel_Missile_Destination_3')", ""},}, {{"EventPointer_Remove(g_pointer_default_1)", ""}, {"EventPointer_Remove(g_pointer_default_2)", ""}, {"EventPointer_Remove(g_pointer_default_3)", ""}, {"Sensors_Toggle(0)", ""}, HW2_Letterbox(0), HW2_Pause(0), HW2_Wait(4), {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Universe_EnableSkip(0)", ""},},}
Events["speechevent_firstimpact"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47050", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47051", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_secondimpact"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47060", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47061", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_thirdimpactdetected"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47070", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_fourthimpact"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47080", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47081", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_fifthimpact"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47090", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47091", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_hiigaradestroyed"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$47100", 5)}, {HW2_Fade(1), HW2_Wait(2), {"Subtitle_TimeCounterEnd()", ""},}, {HW2_LocationCardEvent("$47005", 4)}, {{"setMissionComplete(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_firstplanetkillerdestroyed"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47110", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_secondplanetkillerdestroyed"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47120", 5)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_victoryisours"] = {{HW2_Wait(7)}, {{"Universe_AllowPlayerOrders(0)", ""}, {"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"SobGroup_SetTactics('Player_Ships0', PassiveTactics)", ""}, HW2_Wait(1), HW2_Letterbox(1)}, {{"Camera_FocusSobGroupWithBuffer(Sajuuk, 1000, 1000, 3)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$47130", 5)}, {HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$47131", 5)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$47133", 5)}, {HW2_Wait(2)}, {{"Universe_Fade(1, 2)", ""}, HW2_Wait(3)}, {HW2_LocationCardEvent("$47360", 4)}, {HW2_Wait(2)}, {{"setMissionComplete(1)", ""},},}
Events["speechevent_playerloses"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, {"Subtitle_TimeCounterEnd()", ""}, HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$47005", 4)}, {{"setMissionComplete(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
