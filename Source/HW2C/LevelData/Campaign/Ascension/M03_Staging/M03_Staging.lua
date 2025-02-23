-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
obj_01_ShipyardStart = "$41000"
obj_01_ShipyardStart_id = 0
obj_01b_FRO = "$41001"
obj_01b_FRO_id = 0
obj_01b_BuiltTurrets = "$41002"
obj_01b_BuiltTurrets_id = 0
obj_01c_Repair = "$41003"
obj_01c_Repair_id = 0
obj_01d_Probes = "$41004"
obj_01d_Probes_id = 0
obj_01e_DefeatVaygrWave1 = "$41007"
obj_01e_DefeatVaygrWave1_id = 0
obj_01_Sec_Tier2 = "$41010"
obj_01_Sec_Tier2_id = 0
obj_03_DefendShipyard = "$41007"
obj_03_DefendShipyard_id = 0
obj_03a_ReCaptureShipyard = "$41006"
obj_03a_ReCaptureShipyard_id = 0
obj_04_DefeatAllVaygr = "$41008"
obj_04_DefeatAllVaygr_id = 0
ping_RU_01 = "$41400"
ping_RU_01_id = 0
ping_RU_02 = "$41400"
ping_RU_02_id = 0
ping_shipyard = "$41408"
ping_shipyard_id = 0
ping_VaygrCarrier = "$41410"
ping_VaygrCarrier_id = 0
ping_shipyardexit = "$41406"
ping_shipyardexit_id = 0
ping_HiigaranSurvivors = "$41414"
ping_HiigaranSurvivors_id = 0
ping_shipyardcapture = "$41412"
ping_shipyardcapture_id = 0
pointer_shipyardexit_id = 0
pointer_shipyardexit_MO1 = "$41407"
g_pointer_default = 0
pointer_resources_id = 0
pointer_Shipyard_id = 0
pointer_Vaygr_HS_id = 0
pointer_Vaygr_Infs_id = 0
pointer_Vaygr_Probes_1_id = 0
pointer_Vaygr_Probes_2_id = 0
pointer_Vaygr_Probes_3_id = 0
pointer_Vaygr_ShipyardInf_01 = 0
pointer_Vaygr_ShipyardInf_02 = 0
pointer_VaygrCarrier_id = 0
pointer_shipyardattackers_id = 0
pointer_VaygreCarrierInfs_id = 0
pointer_VaygreCarrierInfs_01_id = 0
pointer_VaygreCarrierInfs_02_id = 0
g_now_time = Universe_GameTime()
g_playerID = Universe_CurrentPlayer()
g_player_RU = 0
g_player_1000RU = 0
g_currentNISPlaying_id = 0
g_FRO_True = 0
g_VaygrWave_01 = 0
g_ShipyardRepaired = 0
g_FROAttackers = 0
EventPlaying = 0
g_ProbesDead = 0
g_save_id = 0
ShipToParadeRoundTypeName = "Hgn_MotherShip"
g_spawnhardgroup = 1
g_V_Carrier0_CanBuild = 1
g_V_Carrier1_CanBuild = 1
g_V_Carrier2_CanBuild = 1
g_time_30 = 30
g_time_60 = 60
g_time_120 = 120
g_time_180 = 180
g_time_210 = 210
g_time_240 = 240
VaygrShipList = {{"Vgr_InfiltratorFrigate", 24, 11}, {"Vgr_AssaultFrigate", 25, 11}, {"Vgr_HeavyMissileFrigate", 26, 10},}
g_vaygrShipLastBuilt = ""
g_maxVaygrShips = 100
g_vaygrPrimaryBuilder = "V_Inf_Carrier"
g_vaygrID = 1
g_vaygrCurrentOrder = "VO_AttackPlayer"
shipyard_speed = SobGroup_GetSpeed("Shipyard")

function OnInit()
	Rule_Add("Rule_Init")
	Camera_UseCameraPoint("Cam_Start")
end

function Rule_Init()
	Sound_SpeechSubtitlePath("speech:missions/m_03/")
	Sound_MusicPlayType("data:sound/music/ambient/AMB_03", MUS_Ambient)
	print("_________MUSIC AMB__________")
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	SobGroup_FillShipsByType(Players_Mothership, "Player_Ships0", "Hgn_MotherShip")
	Players_Carrier = "Players_Carrier"
	SobGroup_Create(Players_Carrier)
	SobGroup_FillShipsByType(Players_Carrier, "Player_Ships0", "Hgn_Carrier")
	SobGroup_Create("tempSobGroup")
	Camera_UsePanning(0)
	SetAlliance(0, 2)
	SetAlliance(2, 0)
	SetAlliance(1, 3)
	SetAlliance(3, 1)
	SobGroup_Create("shipsInVolume")
	SobGroup_Create("carrierInVolume")
	Player_SetPlayerName(0, "$41490")
	Player_SetPlayerName(1, "$41491")
	Player_SetPlayerName(2, "$41492")
	Player_SetPlayerName(3, "$41491")
	print(g_player_RU)
	g_player_RU = Player_GetRU(g_playerID)
	HW2_SetResearchLevel(3)
	Sound_EnableAllSpeech(0)
	Sound_SetMuteActor("Fleet")
	Player_SetDefaultShipTactic(1, AggressiveTactics)
	SobGroup_TakeDamage("Shipyard", 0.3)
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Production_Fighter")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Production_Corvette")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Production_Frigate")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Module_Research")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Module_ResearchAdvanced")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_MS_Module_PlatformControl")
	SobGroup_CreateSubSystem("Shipyard", "Hgn_SY_Production_CapShip")
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense1", 1)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense2", 0)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense3", 1)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense4", 1)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense5", 1)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense6", 0)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense7", 1)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense8", 0)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense9", 0)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense10", 0)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense11", 0)
	SobGroup_ChangePower("Shipyard", "Weapon_HullDefense12", 0)
	SobGroup_SetSwitchOwnerFlag("Shipyard", 0)
	Event_Start("IntelEvent_Staging")
	Player_GrantResearchOption(1, "VaygrCaptureHack")
	print("hack in")
	Rule_Add("Rule_IntelEvent_StagingComplete")
	Rule_Add("Rule_ShipyardDisableCommands")
	Rule_Add("Rule_PlayerLose")
	Rule_Add("Rule_ShipyardPlayerLose")
	Rule_Add("Rule_VaygrFirstWave")
	Rule_Add("Rule_AI_Control_Off")
	Rule_AddInterval("Rule_DisableBuilderWithInterval", 20)
	Rule_Remove("Rule_Init")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6408")
end

function Rule_DisableBuilderWithInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_Event0()
	if (EventPlaying == 0) then
	print("_____________EVENT AT 0___________")
	end
end

function Rule_Event1()
	if (EventPlaying == 1) then
	print("_____________EVENT AT 1___________")
	end
end

function Rule_ShipyardDisableCommands()
	local abilityList = {AB_Move, AB_Attack, AB_Guard, AB_Stop, AB_Hyperspace, AB_Retire, AB_Scuttle, AB_Builder, AB_Dock}
	for j = 1, 7 do
	SobGroup_AbilityActivate("Shipyard", abilityList[j], 0)
	end
	Rule_Remove("Rule_ShipyardDisableCommands")
end

function Rule_TestWin()
	SobGroup_ExitHyperSpace("Shipyard", "vol_Shipyard_Exit")
	obj_04_DefeatAllVaygr_id = Objective_Add(obj_04_DefeatAllVaygr, OT_Primary)
	Rule_AddInterval("Rule_Win", 2)
	Rule_Remove("Rule_TestWin")
end

function Rule_Win()
	obj_04_DefeatAllVaygr_id = Objective_Add(obj_04_DefeatAllVaygr, OT_Primary)
	Rule_AddInterval("Rule_Win_Now", 2)
	Rule_Remove("Rule_Win")
end

function Rule_Win_Now()
	Event_Start("IntelEvent_AllClear")
	print("NIS CHEAT")
	Rule_Add("Rule_IntelEvent_AllClear_Complete")
	Rule_Remove("Rule_Win_Now")
end

function Rule_AI_Control_Off()
	CPU_Enable(1, 0)
	CPU_Enable(2, 0)
	CPU_RemoveSobGroup(1, "V_Shipyard_Attackers")
	CPU_RemoveSobGroup(1, "V_Inf_01")
	CPU_RemoveSobGroup(1, "V_Inf_02")
	CPU_RemoveSobGroup(1, "V_Shipyard_Att_Bomb")
	CPU_RemoveSobGroup(1, "V_Shipyard_Att_AssF")
	CPU_RemoveSobGroup(1, "V_Inf_02_Main")
	CPU_RemoveSobGroup(1, "V_Inf_02_Guard")
	CPU_RemoveSobGroup(1, "V_Inf_01_R")
	CPU_RemoveSobGroup(1, "V_Inf_02_R")
	CPU_RemoveSobGroup(1, "V_Inf_02R_Main")
	CPU_RemoveSobGroup(1, "V_Inf_02R_Guard")
	CPU_RemoveSobGroup(1, "V_Inf_01_Attack")
	CPU_RemoveSobGroup(1, "V_Marine_Killas")
	CPU_RemoveSobGroup(1, "V_Inf_Carrier_Grp_01")
	CPU_RemoveSobGroup(1, "V_Inf_Carrier_Grp_02")
	CPU_RemoveSobGroup(1, "V_Inf_Carrier_Grp_03")
	CPU_RemoveSobGroup(3, "V_Carrier_Grp_1")
	SobGroup_CreateSubSystem("V_Carrier_Grp_1_Carrier", "Vgr_C_Production_Fighter")
	SobGroup_CreateSubSystem("V_Carrier_Grp_1_Carrier", "Vgr_C_Module_Research")
	SobGroup_DockSobGroupInstant("V_Carrier_Grp_1_Cor", "V_Carrier_Grp_1_Carrier")
	SobGroup_EnterHyperSpaceOffMap("V_Carrier_Grp_1")
	SobGroup_CreateSubSystem("V_Inf_Carrier", "Vgr_C_Production_Frigate")
	SobGroup_CreateSubSystem("V_Inf_Carrier", "Vgr_C_Module_Research")
	SobGroup_EnterHyperSpaceOffMap("V_Inf_Carrier")
	SobGroup_CreateSubSystem("V_Inf_Carrier_01", "Vgr_C_Production_Frigate")
	SobGroup_CreateSubSystem("V_Inf_Carrier_01", "Vgr_C_Module_Research")
	SobGroup_EnterHyperSpaceOffMap("V_Inf_Carrier_01")
	SobGroup_CreateSubSystem("V_Inf_Carrier_02", "Vgr_C_Production_Fighter")
	SobGroup_CreateSubSystem("V_Inf_Carrier_02", "Vgr_C_Module_Research")
	SobGroup_DockSobGroupInstant("V_Inf_Carrier_Grp_03_G", "V_Inf_Carrier_02")
	SobGroup_DockSobGroupInstant("V_Inf_Carrier_Grp_03_G2", "V_Inf_Carrier_02")
	SobGroup_EnterHyperSpaceOffMap("V_Inf_Carrier_02")
	Rule_Remove("Rule_AI_Control_Off")
	print("AI is OFF")
end

function Rule_ShipyardSetHealth()
	if (SobGroup_HealthPercentage("Shipyard") <= 0.1) then
	SobGroup_SetHealth("Shipyard", 0.2)
	end
end

function Rule_ShipyardSwitchSides()
	SobGroup_SwitchOwner("Shipyard", 1)
	Rule_Add("Rule_HaveVaygrBoardShipyard")
	Rule_Remove("Rule_ShipyardSwitchSides")
end

function Rule_ShipyardSwitchSides_Me()
	SobGroup_SwitchOwner("Shipyard", 0)
	Rule_Add("Rule_HaveVaygrBoardShipyard")
	Rule_Remove("Rule_ShipyardSwitchSides")
end

function Rule_TitlecardComplete()
	if (Event_IsDone("Rule_Titlecard") == 1) then
	Event_Start("IntelEvent_Staging")
	Rule_Add("Rule_IntelEvent_StagingComplete")
	Rule_Remove("Rule_TitlecardComplete")
	end
end

function Rule_SpawnInfs()
	Rule_Add("Rule_Infiltrator_Reinforcements")
	Rule_Remove("Rule_SpawnInfs")
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

function Rule_VaygrFirstWave()
	CPU_RemoveSobGroup(1, "V_FirstWave_All")
	SobGroup_Attack(1, "V_FirstWave_Main", "Shipyard")
	SobGroup_GuardSobGroup("V_FirstWave_Guards", "V_FirstWave_All")
	Rule_Remove("Rule_VaygrFirstWave")
end

function Rule_IntelEvent_StagingComplete()
	if (Event_IsDone("IntelEvent_Staging") == 1) then
	obj_01_ShipyardStart_id = Objective_Add(obj_01_ShipyardStart, OT_Primary)
	Objective_AddDescription(obj_01_ShipyardStart_id, "$41380")
	Objective_AddDescription(obj_01_ShipyardStart_id, "$41381")
	obj_01b_FRO_id = Objective_Add(obj_01b_FRO, OT_Secondary)
	Objective_AddDescription(obj_01b_FRO_id, "$41382")
	Objective_AddDescription(obj_01b_FRO_id, "$41383")
	Player_UnrestrictBuildOption(0, "Hgn_ResourceController")
--	Player_UnrestrictResearchOption(0, "ResourceCollectorHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "ResourceControllerHealthUpgrade1")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Sound_SetMuteActor("")
	Rule_Add("Rule_FirstWaveDead")
	Rule_Add("Rule_MobileRef_In_Position")
	Rule_Remove("Rule_IntelEvent_StagingComplete")
	end
end

function Rule_FirstWaveDead()
	if (SobGroup_Empty("V_FirstWave_All") == 1) then
	Objective_SetState(obj_01_ShipyardStart_id, OS_Complete)
	Rule_Add("Rule_IntelEvent_ShipyardSafe_Complete")
	Rule_Add("Rule_EventPlay_IntelEvent_ShipyardSafe")
	Rule_Remove("Rule_FirstWaveDead")
	Rule_Remove("Rule_PlayBattle")
	end
end

function Rule_EventPlay_IntelEvent_ShipyardSafe()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_ShipyardSafe")
	EventPlaying = 1
	Sound_MusicPlayType("data:sound/music/ambient/AMB_03", MUS_Ambient)
	print("_________MUSIC AMB__________")
	Sound_SetMuteActor("Fleet")
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_ShipyardSafe")
	end
end

function Rule_MobileRef_In_Position()
	Player_FillSobGroupInVolume("shipsInVolume", 0, "Vol_InPosition")
	SobGroup_FillShipsByType("carrierInVolume", "shipsInVolume", "Hgn_ResourceController")
	if (SobGroup_Empty("carrierInVolume") == 0) then
	Ping_Remove(ping_RU_01_id)
	Objective_SetState(obj_01b_FRO_id, OS_Complete)
	Rule_Add("Rule_EventPlay_IntelEvent_MobileRef_In_Position")
	Rule_Add("Rule_IntelEvent_MobileRef_In_PositionComplete")
	Rule_Remove("Rule_MobileRef_In_Position")
	end
end

function Rule_EventPlay_IntelEvent_MobileRef_In_Position()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_MobileRef_In_Position")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_MobileRef_In_Position")
	end
end

function Rule_IntelEvent_MobileRef_In_PositionComplete()
	if (Event_IsDone("IntelEvent_MobileRef_In_Position") == 1) then
	obj_01b_BuiltTurrets_id = Objective_Add(obj_01b_BuiltTurrets, OT_Secondary)
	Objective_AddDescription(obj_01b_BuiltTurrets_id, "$41384")
	Player_UnrestrictBuildOption(0, "PlatformProduction")
	Player_UnrestrictBuildOption(0, "Hgn_GunTurret")
	Player_UnrestrictResearchOption(0, "GunTurretHealthUpgrade1")
	Sound_SetMuteActor("")
	g_FRO_True = 1
	Rule_Add("Rule_TurretsReady")
	Rule_Remove("Rule_IntelEvent_MobileRef_In_PositionComplete")
	end
end

function Rule_TurretsReady()
	if (Stats_ShipsCreated(g_playerID, GetShipId("Hgn_GunTurret")) >= 1) then
	Objective_SetState(obj_01b_BuiltTurrets_id, OS_Complete)
	Rule_Remove("Rule_TurretsReady")
	end
end

function Rule_IntelEvent_ShipyardSafe_Complete()
	if (Event_IsDone("IntelEvent_ShipyardSafe") == 1) then
	obj_01c_Repair_id = Objective_Add(obj_01c_Repair, OT_Primary)
	print("Repair OBJ is called")
	Sound_SetMuteActor("")
	Objective_AddDescription(obj_01c_Repair_id, "$41385")
	Objective_AddDescription(obj_01c_Repair_id, "$41392")
	Objective_AddDescription(obj_01c_Repair_id, "$41393")
	Player_UnrestrictResearchOption(0, "RepairAbility")
	Rule_AddInterval("Rule_Probes_Arrive", 90)
	print("Probes should arrive in 4.5 minutes")
	Rule_Add("Rule_JumpStartShipyardEvents")
	Rule_Add("Rule_RepairsResearchDone")
	Rule_Add("Rule_ShipyardRepairedObjComplete")
	Rule_Remove("Rule_IntelEvent_ShipyardSafe_Complete")
	end
end

function Rule_RepairsResearchDone()
	if (Player_HasResearch(g_playerID, "RepairAbility") == 1) then
	Rule_Add("Rule_EventPlay_IntelEvent_RepairReady")
	Rule_Add("Rule_IntelEvent_RepairReady_Complete")
	Rule_Remove("Rule_RepairsResearchDone")
	end
end

function Rule_EventPlay_IntelEvent_RepairReady()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_RepairReady")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_RepairReady")
	end
end

function Rule_IntelEvent_RepairReady_Complete()
	if (Event_IsDone("IntelEvent_RepairReady") == 1) then
	Sound_SetMuteActor("")
	Rule_Remove("Rule_IntelEvent_RepairReady_Complete")
	end
end

function Rule_CheatShipyardFixed()
	SobGroup_SetHealth("Shipyard", 1)
	SobGroup_SetHealth("V_FirstWave_All", 1)
	Rule_Remove("Rule_CheatShipyardFixed")
end

function Rule_monitorBuildBtn()
	if (UI_IsScreenActive("NewResearchMenu") == 1) then
	UI_StopFlashButton("NewTaskbar", "btnResearch")
	Rule_Remove("Rule_monitorBuildBtn")
	end
end

function Rule_ShipyardRepairedObjComplete()
	if (SobGroup_HealthPercentage("Shipyard") >= 0.85) then
	Objective_SetState(obj_01c_Repair_id, OS_Complete)
	Ping_Remove(ping_shipyardexit_id)
	Rule_Add("Rule_EventPlay_IntelEvent_ShipyardRepaired")
	g_ShipyardRepaired = 1
	Rule_AddInterval("Rule_GiveUpgrades", 1)
	Rule_Remove("Rule_ShipyardRepairedObjComplete")
	end
end

function Rule_GiveUpgrades()
	Player_GrantResearchOption(0, "InstaAdvancedFrigateTech")
	Player_UnrestrictBuildOption(0, "FrigateProduction")
	Player_UnrestrictBuildOption(0, "Hgn_AssaultFrigate")
	Player_UnrestrictBuildOption(0, "Hgn_Carrier")
	Player_UnrestrictBuildOption(0, "CapShipProduction")
	Player_UnrestrictBuildOption(0, "Hgn_C_Module_ResearchAdvanced")
	Player_UnrestrictBuildOption(0, "Hgn_MS_Module_ResearchAdvanced")
	Player_UnrestrictResearchOption(0, "AttackBomberImprovedBombs")
	Player_UnrestrictResearchOption(0, "CarrierHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "CarrierMAXSPEEDUpgrade1")
--	Player_UnrestrictResearchOption(0, "InterceptorMAXSPEEDUpgrade2")
--	Player_UnrestrictResearchOption(0, "AttackBomberMAXSPEEDUpgrade2")
	Player_UnrestrictResearchOption(0, "AssaultFrigateHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "AssaultFrigateMAXSPEEDUpgrade1")
	print("Unlock Flak Frigates and Upgrades")
	Rule_Remove("Rule_GiveUpgrades")
end

function Rule_EventPlay_IntelEvent_ShipyardRepaired()
	if (EventPlaying == 0) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	Event_Start("IntelEvent_ShipyardRepaired")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_Add("Rule_UnMuteFC")
	print("CALL OFF EVENT")
	Rule_Remove("Rule_EventPlay_IntelEvent_ShipyardRepaired")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6409")
	end
end

function Rule_UnMuteFC()
	if (Event_IsDone("IntelEvent_ShipyardRepaired") == 1) then
	Sound_SetMuteActor("")
	Rule_Remove("Rule_UnMuteFC")
	end
end

function Rule_CreateCarrier()
	Hgn_Carrier_Free = SobGroup_CreateShip("Shipyard", "Hgn_Carrier")
	SobGroup_CreateSubSystem(Hgn_Carrier_Free, "Hgn_C_Production_Frigate")
	SobGroup_CreateSubSystem(Hgn_Carrier_Free, "Hgn_C_Module_ResearchAdvanced")
	SobGroup_SwitchOwner(Hgn_Carrier_Free, 0)
	print("Transfer should happen now")
	Rule_Remove("Rule_CreateCarrier")
end

function Rule_Handoff_Carrier()
	SobGroup_CreateSubSystem(Hgn_Carrier_Free, "Hgn_C_Production_Frigate")
	SobGroup_SwitchOwner(Hgn_Carrier_Free, 0)
	Rule_Remove("Rule_Handoff_Carrier")
end

function Rule_Probes_Arrive()
	CPU_RemoveSobGroup(1, "V_Probes")
	SobGroup_ExitHyperSpace("V_Probe_1", "Vol_V_Probe_01")
	SobGroup_ExitHyperSpace("V_Probe_2", "Vol_V_Probe_02")
	SobGroup_ExitHyperSpace("V_Probe_3", "Vol_V_Probe_03")
	SobGroup_Move(1, "V_Probe_1", "Vol_V_Probe_01_Pos")
	SobGroup_Move(1, "V_Probe_2", "Vol_V_Probe_02_Pos")
	SobGroup_Move(1, "V_Probe_3", "Vol_V_Probe_03_Pos")
	print("Here come the Probes")
	Rule_Add("Rule_Probes_Detected")
	Rule_Remove("Rule_Probes_Arrive")
end

function Rule_Probes_Detected()
	if (SobGroup_PlayerIsInSensorRange("V_Probes", 0) ~= 1) then
	if (SobGroup_PlayerIsInSensorRange("V_Probes", 2) == 1) then
	end
	Sound_MusicPlayType("data:sound/music/staging/STAGING_11", MUS_Staging)
	print("_________MUSIC Stage__________")
	Rule_Add("Rule_EventPlay_IntelEvent_ProbesDetected")
	Rule_Add("Rule_IntelEvent_ProbesDetected_Complete")
	Rule_Add("Rule_Pointer_Probe01")
	Rule_Add("Rule_Pointer_Probe02")
	Rule_Add("Rule_Pointer_Probe03")
	Rule_Remove("Rule_Probes_Detected")
	end
end

function Rule_EventPlay_IntelEvent_ProbesDetected()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_ProbesDetected")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_ProbesDetected")
	end
end

function Rule_Pointer_Probe01()
	if (SobGroup_PlayerIsInSensorRange("V_Probe_1", 0) ~= 1) then
	if (SobGroup_PlayerIsInSensorRange("V_Probe_1", 2) == 1) then
	end
	pointer_Vaygr_Probes_1_id = HW2_CreateEventPointerSobGroup("V_Probe_1")
	Rule_Remove("Rule_Pointer_Probe01")
	end
end

function Rule_Pointer_Probe02()
	if (SobGroup_PlayerIsInSensorRange("V_Probe_2", 0) ~= 1) then
	if (SobGroup_PlayerIsInSensorRange("V_Probe_2", 2) == 1) then
	end
	pointer_Vaygr_Probes_2_id = HW2_CreateEventPointerSobGroup("V_Probe_2")
	Rule_Remove("Rule_Pointer_Probe02")
	end
end

function Rule_Pointer_Probe03()
	if (SobGroup_PlayerIsInSensorRange("V_Probe_3", 0) ~= 1) then
	if (SobGroup_PlayerIsInSensorRange("V_Probe_3", 2) == 1) then
	end
	pointer_Vaygr_Probes_3_id = HW2_CreateEventPointerSobGroup("V_Probe_3")
	Rule_Remove("Rule_Pointer_Probe03")
	end
end

function Rule_IntelEvent_ProbesDetected_Complete()
	if (Event_IsDone("IntelEvent_ProbesDetected") == 1) then
	obj_01d_Probes_id = Objective_Add(obj_01d_Probes, OT_Primary)
	EventPointer_Remove(pointer_Vaygr_Probes_1_id)
	EventPointer_Remove(pointer_Vaygr_Probes_2_id)
	EventPointer_Remove(pointer_Vaygr_Probes_3_id)
	Objective_AddDescription(obj_01d_Probes_id, "$41386")
	Sound_SetMuteActor("")
	Rule_Add("Rule_ProbesAreDead")
	Rule_AddInterval("Rule_VaygrAttack_Wave_01", 90)
	Rule_Remove("Rule_IntelEvent_ProbesDetected_Complete")
	Rule_Remove("Rule_Pointer_Probe01")
	Rule_Remove("Rule_Pointer_Probe02")
	Rule_Remove("Rule_Pointer_Probe03")
	end
end

function Rule_ProbesAreDead()
	if (SobGroup_Empty("V_Probes") == 1 and g_VaygrWave_01 == 0) then
	print("____________Vaygr Attack Delayed BY 135_____________")
	Objective_SetState(obj_01d_Probes_id, OS_Complete)
	g_ProbesDead = 1
	Rule_Add("Rule_EventPlay_IntelEvent_ProbesDestroyed")
	Rule_Remove("Rule_VaygrAttack_Wave_01")
	Rule_Remove("Rule_ProbesAreDead")
	Rule_AddInterval("Rule_VaygrAttack_Wave_01", 135)
	end
end

function Rule_EventPlay_IntelEvent_ProbesDestroyed()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_ProbesDestroyed")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_ProbesDestroyed")
	end
end

function Rule_IntelEvent_ProbesDestroyed_Complete()
	if (Event_IsDone("IntelEvent_ProbesDestroyed") == 1) then
	Sound_SetMuteActor("")
	Rule_Remove("Rule_IntelEvent_ProbesDestroyed_Complete")
	Rule_Remove("Rule_ProbesAreDead")
	end
end

function Rule_VaygrAttack_Wave_01()
	CPU_AddSobGroup(3, "V_Carrier_Grp_1")
	SobGroup_ExitHyperSpace("V_Carrier_Grp_1_Carrier", "vol_V_Carrier_Exit")
	g_VaygrWave_01 = 1
	if (g_FRO_True == 1) then
	Rule_Add("Rule_EventPlay_IntelEvent_VaygrWave01")
	Rule_AddInterval("Rule_LauchVaygrFromCarrier", 13)
	print("_________Playing normal Event___________")
	else
	Rule_Add("Rule_EventPlay_IntelEvent_VaygrWave01_NonFRO")
	Rule_AddInterval("Rule_LauchVaygrFromCarrier_NonFRO", 13)
	print("____________Playing Non_FRO Event____________")
	end
	print("Vaygr Carrier Prod")
	FOW_RevealGroup("V_Carrier_Grp_1", 3)
	Sound_MusicPlayType("data:sound/music/battle/battle_04", MUS_Battle)
	print("_________MUSIC Battle__________")
	Rule_Add("Rule_IntelEvent_VaygrWave01_Complete")
	Rule_Add("Rule_VaygrWave01Dead")
	Rule_Remove("Rule_VaygrAttack_Wave_01")
end

function Rule_EventPlay_IntelEvent_VaygrWave01()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_VaygrWave01")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_VaygrWave01")
	end
end

function Rule_EventPlay_IntelEvent_VaygrWave01_NonFRO()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_VaygrWave01_NonFRO")
	EventPlaying = 1
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_VaygrWave01_NonFRO")
	end
end

function Rule_LauchVaygrFromCarrier()
	SobGroup_Launch("V_Carrier_Grp_1_Cor", "V_Carrier_Grp_1_Carrier")
	CPU_AddDefendTarget(3, "Vol_InPosition", 500)
	CPU_DoString(3, "AI_Carrier_Grp_1_Attack()")
	print("Launch from Carrier")
	Rule_Remove("Rule_LauchVaygrFromCarrier")
end

function Rule_LauchVaygrFromCarrier_NonFRO()
	SobGroup_Launch("V_Carrier_Grp_1_Cor", "V_Carrier_Grp_1_Carrier")
	CPU_DoString(3, "AI_Carrier_Grp_1_Attack()")
	print("Launch from Carrier")
	Rule_Add("Rule_PlayerATFRO")
	Rule_Remove("Rule_LauchVaygrFromCarrier_NonFRO")
end

function Rule_PlayerATFRO()
	if (g_FRO_True == 1) then
	CPU_AddDefendTarget(3, "Vol_InPosition", 500)
	print(" going after FRO")
	Rule_Remove("Rule_PlayerATFRO")
	end
end

function Rule_V_Carrier_Grp_1_Launch()
	SobGroup_Launch("V_Carrier_Grp_1_Cor", "V_Carrier_Grp_1_Carrier")
	Rule_Remove("Rule_V_Carrier_Grp_1_Launch()")
end

function Rule_IntelEvent_VaygrWave01_Complete()
	if (Event_IsDone("IntelEvent_VaygrWave01") ~= 1) then
	if (Event_IsDone("IntelEvent_VaygrWave01_NonFRO") == 1) then
	end
	Objective_SetState(obj_01d_Probes_id, OS_Complete)
	Sound_SetMuteActor("")
	g_FROAttackers = 1
	obj_03_DefendShipyard_id = Objective_Add(obj_03_DefendShipyard, OT_Primary)
	Objective_AddDescription(obj_03_DefendShipyard_id, "$41388")
	Rule_Remove("Rule_IntelEvent_VaygrWave01_Complete")
	end
end

function Rule_VaygrWave01Dead()
	if (SobGroup_Empty("V_Carrier_Grp_1_Carrier") == 1) then
	Rule_Add("Rule_EventPlay_IntelEvent_VaygrCarrierDead")
	Sound_MusicPlayType("data:sound/music/staging/STAGING_11", MUS_Staging)
	Rule_Remove("Rule_VaygrWave01Dead")
	end
end

function Rule_EventPlay_IntelEvent_VaygrCarrierDead()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_VaygrCarrierDead")
	Objective_SetState(obj_01b_BuiltTurrets_id, OS_Complete)
	EventPlaying = 1
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_VaygrCarrierDead")
	end
end

function Rule_JumpStartShipyardEvents()
	if (g_FROAttackers == 1 and g_ShipyardRepaired == 1 and g_ProbesDead == 1) then
	Rule_AddInterval("Rule_Re_Start_Shidyardevents", 180)
	print("_________________RE-START SHIPYARD EVENTS in 180__________")
	Rule_Remove("Rule_JumpStartShipyardEvents")
	elseif (g_FROAttackers == 1 and g_ShipyardRepaired == 1 and g_ProbesDead == 0) then
	Rule_AddInterval("Rule_Re_Start_Shidyardevents", 60)
	print("_________________RE-START SHIPYARD EVENTS in 60__________")
	Rule_Remove("Rule_JumpStartShipyardEvents")
	end
end

function Rule_Re_Start_Shidyardevents()
	Rule_AddInterval("Rule_Start_Shidyardevents", 10)
	print("_________________RE-START SHIPYARD EVENTS in 10__________")
	Rule_Remove("Rule_Re_Start_Shidyardevents")
end

function Rule_Start_Shidyardevents()
	Rule_Add("Rule_VaygrShipyard_Attackers_Detected")
	Rule_Add("Rule_ShipyardAttackers")
	print("___________Start of Shipyard Events NORMAL____________")
	Rule_Remove("Rule_Start_Shidyardevents")
	Rule_Remove("Rule_JumpStartShipyardEvents")
end

function Rule_ShipyardAttackers()
	SobGroup_ExitHyperSpace("V_Inf_01", "vol_V_Inf_01_Exit")
	SobGroup_ExitHyperSpace("V_Inf_02", "vol_V_Inf_02_Exit")
	SobGroup_CaptureSobGroup("V_Inf_01_Main", "Shipyard")
	SobGroup_CaptureSobGroup("V_Inf_02_Main", "Shipyard")
	SobGroup_Attack(1, "V_Inf_01_Attack", "Shipyard")
	SobGroup_GuardSobGroup("V_Inf_01_Guard", "V_Inf_01_Main")
	SobGroup_GuardSobGroup("V_Inf_02_Guard", "V_Inf_02_Main")
	Rule_Remove("Rule_ShipyardAttackers")
end

function Rule_VaygrShipyard_Attackers_Detected()
	if (SobGroup_PlayerIsInSensorRange("V_Inf_01", 0) ~= 1) then
	if (SobGroup_PlayerIsInSensorRange("V_Inf_02", 0) ~= 1) then
	if (SobGroup_PlayerIsInSensorRange("V_Inf_01", 2) ~= 1) then
	if (SobGroup_PlayerIsInSensorRange("V_Inf_02", 2) == 1) then
	end
	end
	end
	Sound_MusicPlayType("data:sound/music/battle/battle_04", MUS_Battle)
	print("_________MUSIC BATTLE__________")
	Rule_Add("Rule_EventPlay_IntelEvent_DefendShipyard")
	Rule_Add("Rule_IntelEvent_DefendShipyardComplete")
	Rule_Remove("Rule_VaygrShipyard_Attackers_Detected")
	end
end

function Rule_EventPlay_IntelEvent_DefendShipyard()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_DefendShipyard")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	print("_________EVENT TO 1__________")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_Remove("Rule_EventPlay_IntelEvent_DefendShipyard")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6410")
	end
end

function Rule_IntelEvent_DefendShipyardComplete()
	if (Event_IsDone("IntelEvent_DefendShipyard") == 1) then
	Objective_AddDescription(obj_03_DefendShipyard_id, "$41387")
	Sound_SetMuteActor("")
	Player_GrantResearchOption(0, "InstaAdvancedFrigateTech")
	Player_UnrestrictBuildOption(0, "FrigateProduction")
	Player_UnrestrictBuildOption(0, "Hgn_AssaultFrigate")
	Player_UnrestrictBuildOption(0, "Hgn_MarineFrigate")
	print("MARINE GRANTED")
	Rule_Add("Rule_RecapturedShipyard")
	Rule_Add("Rule_VaygrInflitratorsArrive")
	Rule_Remove("Rule_IntelEvent_DefendShipyardComplete")
	end
end

function Rule_NormalVaygrInfArrive()
	if (SobGroup_Empty("V_Shipyard_Attackers") == 1) then
	Rule_Remove("Rule_ForceVaygrInfArrive")
	Rule_Remove("Rule_NormalVaygrInfArrive")
	end
end

function Rule_ForceVaygrInfArrive()
	if (SobGroup_HealthPercentage("Shipyard") <= 0.8 or SobGroup_Empty("V_Shipyard_Attackers") == 1) then
	Objective_AddDescription(obj_03_DefendShipyard_id, "$41389")
	Rule_Remove("Rule_ForceVaygrInfArrive")
	end
end

function Rule_VaygrInflitratorsArrive()
	if (Player_IsShipInVolume(1, "Vol_Shipyard_Prox") == 1) then
	Rule_Add("Rule_EventPlay_Auto_Inflitrators")
	print("INFs Arrive")
	SobGroup_Create("V_Inf_01_Spawn")
	SobGroup_Create("V_Inf_01_Spawn_Def")
	SobGroup_Create("V_Inf_01_Spawn_Bomber")
	SobGroup_Create("V_Inf_02_Spawn")
	SobGroup_Create("V_Inf_02_Spawn_Def")
	SobGroup_Create("V_Inf_02_Spawn_Bomber")
	Sound_MusicPlayType("data:sound/music/battle/battle_04", MUS_Battle)
	Rule_Add("Rule_Auto_InflitratorsComplete")
	Rule_Add("Rule_VaygrInf_1_Reinforced")
	Rule_Remove("Rule_VaygrInflitratorsArrive")
	end
end

function Rule_EventPlay_Auto_Inflitrators()
	if (EventPlaying == 0) then
	Event_Start("Auto_Inflitrators")
	EventPlaying = 1
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_Auto_Inflitrators")
	end
end

function Rule_Auto_InflitratorsComplete()
	if (Event_IsDone("Auto_Inflitrators") == 1) then
	Player_GrantResearchOption(0, "InstaAdvancedFrigateTech")
	Player_UnrestrictBuildOption(0, "FrigateProduction")
	Player_UnrestrictBuildOption(0, "Hgn_AssaultFrigate")
	Player_UnrestrictBuildOption(0, "Hgn_MarineFrigate")
	print("MARINE GRANTED")
	Rule_Add("Rule_HaveVaygrBoardShipyard")
	Rule_Add("Rule_MarineKillas")
	Rule_Remove("Rule_Auto_InflitratorsComplete")
	end
end

function Rule_MarineKillas()
	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships0", "Hgn_MarineFrigate")
	if (SobGroup_Count("tempSobGroup") >= 1) then
	SobGroup_ExitHyperSpace("V_Marine_Killas", "vol_V_Inf_02R_Exit")
	SobGroup_AttackPlayer("V_Marine_Killas", 0)
	Rule_Remove("Rule_MarineKillas")
	print("MARINES KILLAS")
	end
end

function Rule_VaygrInf_1_Reinforced()
	if (SobGroup_HealthPercentage("V_Inf_01_Main") <= 0.8) then
	SobGroup_ExitHyperSpace("V_Inf_01_R", "vol_V_Inf_01R_Exit")
	print("REINFORCEMENTS ONE EXIT HS")
	SobGroup_CaptureSobGroup("V_Inf_01R_Main", "Shipyard")
	SobGroup_GuardSobGroup("V_Inf_01R_Guard", "V_Inf_01R_Main")
	Rule_Add("Rule_InfCarrier_Grps_Arrive")
	Rule_AddInterval("Rule_Start_IntelEvent_VaygrReinforcements", 5)
	Rule_Remove("Rule_VaygrInf_1_Reinforced")
	end
end

function Rule_Start_IntelEvent_VaygrReinforcements()
	Rule_Add("Rule_EventPlay_IntelEvent_VaygrReinforcements")
	Rule_Add("Rule_Start_IntelEvent_VaygrReinforcements_Complete")
	Rule_Remove("Rule_Start_IntelEvent_VaygrReinforcements")
end

function Rule_EventPlay_IntelEvent_VaygrReinforcements()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_VaygrReinforcements")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_VaygrReinforcements")
	end
end

function Rule_Start_IntelEvent_VaygrReinforcements_Complete()
	if (Event_IsDone("IntelEvent_VaygrReinforcements") == 1) then
	Objective_AddDescription(obj_03_DefendShipyard_id, "$41391")
	Sound_SetMuteActor("")
	Rule_Remove("Rule_Start_IntelEvent_VaygrReinforcements_Complete")
	end
end

function Rule_VaygrInf_2_Reinforced()
	if (SobGroup_HealthPercentage("V_Inf_02_Main") <= 0.8) then
	SobGroup_ExitHyperSpace("V_Inf_02_R", "vol_V_Inf_02R_Exit")
	print("REINFORCEMENTS TWO EXIT HS")
	SobGroup_CaptureSobGroup("V_Inf_02R_Main", "Shipyard")
	SobGroup_GuardSobGroup("V_Inf_02R_Guard", "V_Inf_02R_Main")
	Rule_Remove("Rule_VaygrInf_2_Reinforced")
	end
end

function Rule_InfCarrier_Grps_Arrive()
	SobGroup_ExitHyperSpace("V_Inf_Carrier_Grp_01", "vol_V_Grp_01_Exit")
	SobGroup_ExitHyperSpace("V_Inf_Carrier_Grp_02", "vol_V_Grp_02_Exit")
	SobGroup_ExitHyperSpace("V_Inf_Carrier_02", "vol_V_Grp_03_Exit")
	print("______INF CARRIERS ON THEIR WAY____________")
	FOW_RevealGroup("V_Inf_Carrier_Grp_01", 1)
	FOW_RevealGroup("V_Inf_Carrier_Grp_02", 1)
	FOW_RevealGroup("V_Inf_Carrier_Grp_03", 1)
	SobGroup_Move(1, "V_Inf_Carrier", "vol_V_Carrier_MoveTo1")
	SobGroup_Move(1, "V_Inf_Carrier_01", "vol_V_Carrier_MoveTo2")
	SobGroup_Move(1, "V_Inf_Carrier_02", "vol_V_Carrier_MoveTo3")
	Rule_AddInterval("Rule_Infiltrator_ReinforcementsFromCarrier", 30)
	Rule_AddInterval("Rule_LauchVaygrFrom_Inf_Carrier_02", 13)
	Rule_Add("Rule_V_Inf_Carrier0_Production_Check")
	Rule_Add("Rule_V_Inf_Carrier1_Production_Check")
	Rule_Add("Rule_V_Inf_Carrier2_Production_Check")
	Rule_Add("Rule_V_Inf_Carrier_All_Are_Dead")
	Rule_Add("Rule_Obj_03_Done")
	Rule_Remove("Rule_InfCarrier_Grps_Arrive")
end

function Rule_LauchVaygrFrom_Inf_Carrier_02()
	SobGroup_Launch("V_Inf_Carrier_Grp_03_G", "V_Inf_Carrier_02")
	SobGroup_Launch("V_Inf_Carrier_Grp_03_G2", "V_Inf_Carrier_02")
	SobGroup_GuardSobGroup("V_Inf_Carrier_Grp_03_G", "V_Inf_Carrier")
	SobGroup_GuardSobGroup("V_Inf_Carrier_Grp_03_G2", "V_Inf_Carrier_01")
	print("Launch from Inf Carrier")
	Rule_Remove("Rule_LauchVaygrFrom_Inf_Carrier_02")
end

function Rule_Infiltrator_ReinforcementsFromCarrier()
	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships1", "Vgr_InfiltratorFrigate")
	if (SobGroup_Count("tempSobGroup") <= 2) then
	if (g_spawnhardgroup == 1) then
	Rule_Add("Rule_V_Inf_01_Spawn1")
	Rule_AddInterval("Rule_V_Inf_01_Spawn2", 10)
	Rule_AddInterval("Rule_V_Inf_01_Spawn_Def1", 15)
	Rule_AddInterval("Rule_V_Inf_01_Spawn_Def2", 20)
	Rule_AddInterval("Rule_V_Inf_01_Spawn_Def3", 25)
	Rule_AddInterval("Rule_V_Inf_01_Spawn_Bomber1", 30)
	print("Spawn1")
	g_spawnhardgroup = 0
	elseif (g_spawnhardgroup == 0) then
	Rule_Add("Rule_V_Inf_02_Spawn1")
	Rule_AddInterval("Rule_V_Inf_02_Spawn2", 10)
	Rule_AddInterval("Rule_V_Inf_02_Spawn_Def1", 15)
	Rule_AddInterval("Rule_V_Inf_02_Spawn_Def2", 20)
	Rule_AddInterval("Rule_V_Inf_02_Spawn_Def3", 25)
	print("Spawn2")
	g_spawnhardgroup = 1
	end
	end
end

function Rule_V_Inf_Carrier_All_Are_Dead()
	if (SobGroup_Empty("V_Inf_Carrier_All") == 1) then
	Rule_Remove("Rule_Infiltrator_ReinforcementsFromCarrier")
	Rule_Remove("Rule_V_Inf_Carrier_All_Are_Dead")
	end
end

function Rule_V_Inf_Carrier0_Production_Check()
	if (SobGroup_GetHardPointHealth("V_Inf_Carrier", "Production 1") == 0 and SobGroup_Empty("V_Inf_Carrier") == 0) then
	print("_______________ g_V_Carrier0_CanBuild = 0 ________________")
	Rule_AddInterval("Rule_CreateSubSystem0", 65)
	Rule_Remove("Rule_V_Inf_Carrier0_Production_Check")
	g_V_Carrier0_CanBuild = 0
	end
end

function Rule_CreateSubSystem0()
	if (SobGroup_Empty("V_Inf_Carrier") == 0) then
	print("_______________Crrate on V_Inf_Carrier________________")
	SobGroup_CreateSubSystem("V_Inf_Carrier", "Vgr_C_Production_Frigate")
	Rule_Add("Rule_V_Inf_Carrier0_Production_Check")
	Rule_Remove("Rule_CreateSubSystem0")
	g_V_Carrier0_CanBuild = 1
	end
end

function Rule_V_Inf_Carrier1_Production_Check()
	if (SobGroup_GetHardPointHealth("V_Inf_Carrier_01", "Production 1") == 0 and SobGroup_Empty("V_Inf_Carrier_01") == 0) then
	Rule_AddInterval("Rule_CreateSubSystem1", 65)
	Rule_Remove("Rule_V_Inf_Carrier1_Production_Check")
	g_V_Carrier1_CanBuild = 0
	end
end

function Rule_CreateSubSystem1()
	if (SobGroup_Empty("V_Inf_Carrier_01") == 0) then
	SobGroup_CreateSubSystem("V_Inf_Carrier_01", "Vgr_C_Production_Frigate")
	Rule_Add("Rule_V_Inf_Carrier1_Production_Check")
	Rule_Remove("Rule_CreateSubSystem1")
	g_V_Carrier1_CanBuild = 1
	end
end

function Rule_V_Inf_Carrier2_Production_Check()
	if (SobGroup_GetHardPointHealth("V_Inf_Carrier_02", "Production 1") == 0 and SobGroup_Empty("V_Inf_Carrier_02") == 0) then
	g_V_Carrier2_CanBuild = 0
	Rule_AddInterval("Rule_CreateSubSystem2", 65)
	Rule_Remove("Rule_V_Inf_Carrier2_Production_Check")
	end
end

function Rule_CreateSubSystem2()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 0) then
	SobGroup_CreateSubSystem("V_Inf_Carrier_02", "Vgr_C_Production_Fighter")
	Rule_Add("Rule_V_Inf_Carrier2_Production_Check")
	Rule_Remove("Rule_CreateSubSystem2")
	g_V_Carrier2_CanBuild = 1
	end
end

function Rule_V_Inf_01_Spawn1()
	if (SobGroup_Empty("V_Inf_Carrier") == 0 and g_V_Carrier0_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier", AB_Builder) == 1) then
	V_Inf_01_Spawn1 = SobGroup_CreateShip("V_Inf_Carrier", "Vgr_InfiltratorFrigate")
	SobGroup_SobGroupAdd("V_Inf_01_Spawn", V_Inf_01_Spawn1)
	SobGroup_Clear(V_Inf_01_Spawn1)
	Rule_Remove("Rule_V_Inf_01_Spawn1")
	Rule_AddInterval("Rule_Spawn_01_Capture", 3)
	else
	g_spawnhardgroup = 0
	Rule_Remove("Rule_V_Inf_01_Spawn1")
	end
end

function Rule_V_Inf_01_Spawn2()
	if (SobGroup_Empty("V_Inf_Carrier") == 0 and g_V_Carrier0_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier", AB_Builder) == 1) then
	V_Inf_01_Spawn2 = SobGroup_CreateShip("V_Inf_Carrier", "Vgr_InfiltratorFrigate")
	SobGroup_SobGroupAdd("V_Inf_01_Spawn", V_Inf_01_Spawn2)
	SobGroup_Clear(V_Inf_01_Spawn2)
	Rule_AddInterval("Rule_Spawn_01_Capture", 3)
	Rule_Remove("Rule_V_Inf_01_Spawn2")
	else
	g_spawnhardgroup = 0
	Rule_Remove("Rule_V_Inf_01_Spawn2")
	end
end

function Rule_V_Inf_01_Spawn_Def1()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 0 and g_V_Carrier2_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_02", AB_Builder) == 1) then
	V_Inf_01_Spawn_Def1 = SobGroup_CreateShip("V_Inf_Carrier_02", "Vgr_Interceptor")
	SobGroup_SobGroupAdd("V_Inf_01_Spawn_Def", V_Inf_01_Spawn_Def1)
	SobGroup_Clear(V_Inf_01_Spawn_Def1)
	Rule_Remove("Rule_V_Inf_01_Spawn_Def1")
	else
	g_spawnhardgroup = 0
	Rule_Remove("Rule_V_Inf_01_Spawn_Def1")
	end
end

function Rule_V_Inf_01_Spawn_Def2()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 0 and g_V_Carrier2_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_02", AB_Builder) == 1) then
	V_Inf_01_Spawn_Def2 = SobGroup_CreateShip("V_Inf_Carrier_02", "Vgr_Interceptor")
	SobGroup_SobGroupAdd("V_Inf_01_Spawn_Def", V_Inf_01_Spawn_Def2)
	SobGroup_Clear(V_Inf_01_Spawn_Def2)
	Rule_Remove("Rule_V_Inf_01_Spawn_Def2")
	else
	g_spawnhardgroup = 0
	Rule_Remove("Rule_V_Inf_01_Spawn_Def2")
	end
end

function Rule_V_Inf_01_Spawn_Def3()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 0 and g_V_Carrier2_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_02", AB_Builder) == 1) then
	V_Inf_01_Spawn_Def3 = SobGroup_CreateShip("V_Inf_Carrier_02", "Vgr_Interceptor")
	SobGroup_SobGroupAdd("V_Inf_01_Spawn_Def", V_Inf_01_Spawn_Def3)
	SobGroup_Clear(V_Inf_01_Spawn_Def3)
	Rule_AddInterval("Rule_Spawn_01_GuardSobGroup", 3)
	Rule_Remove("Rule_V_Inf_01_Spawn_Def3")
	else
	g_spawnhardgroup = 0
	Rule_Remove("Rule_V_Inf_01_Spawn_Def3")
	end
end

function Rule_V_Inf_01_Spawn_Bomber1()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 0 and g_V_Carrier2_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_02", AB_Builder) == 1) then
	V_Inf_01_Spawn_Bomb = SobGroup_CreateShip("V_Inf_Carrier_02", "Vgr_Bomber")
	SobGroup_SobGroupAdd("V_Inf_01_Spawn_Bomber", V_Inf_01_Spawn_Bomb)
	SobGroup_Clear(V_Inf_01_Spawn_Bomb)
	Rule_AddInterval("Rule_Spawn_01_BombSobGroup", 3)
	Rule_Remove("Rule_V_Inf_01_Spawn_Bomber1")
	else
	g_spawnhardgroup = 0
	Rule_Remove("Rule_V_Inf_01_Spawn_Bomber1")
	end
end

function Rule_Spawn_01_Capture()
	SobGroup_CaptureSobGroup("V_Inf_01_Spawn", "Shipyard")
	print("_____________SPAWN01 TO CAP_________________")
	Rule_Remove("Rule_Spawn_01_Capture")
end

function Rule_Spawn_01_GuardSobGroup()
	SobGroup_GuardSobGroup("V_Inf_01_Spawn_Def", "V_Inf_01_Spawn")
	print("_____________SPAWN01 TO GuardSobGroup_________________")
	Rule_AddInterval("Rule_Spawn1Dead", 15)
	Rule_Remove("Rule_Spawn_01_GuardSobGroup")
end

function Rule_Spawn_01_BombSobGroup()
	SobGroup_AttackPlayer("V_Inf_01_Spawn_Bomber", 0)
	print("_____________SPAWN01 TO BombSobGroup_________________")
	Rule_Remove("Rule_Spawn_01_BombSobGroup")
end

function Rule_Spawn1Dead()
	if (SobGroup_Empty("V_Inf_01_Spawn") == 0) then
	SobGroup_AttackPlayer("V_Inf_01_Spawn_Def", 0)
	Rule_Remove("Rule_Spawn1Dead")
	end
end

function Rule_V_Inf_02_Spawn1()
	if (SobGroup_Empty("V_Inf_Carrier_01") == 0 and g_V_Carrier1_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_01", AB_Builder) == 1) then
	V_Inf_02_Spawn1 = SobGroup_CreateShip("V_Inf_Carrier_01", "Vgr_InfiltratorFrigate")
	SobGroup_SobGroupAdd("V_Inf_02_Spawn", V_Inf_02_Spawn1)
	SobGroup_Clear(V_Inf_02_Spawn1)
	Rule_Remove("Rule_V_Inf_02_Spawn1")
	Rule_AddInterval("Rule_Spawn_02_Capture", 3)
	else
	g_spawnhardgroup = 1
	Rule_Remove("Rule_V_Inf_02_Spawn1")
	end
end

function Rule_V_Inf_02_Spawn2()
	if (SobGroup_Empty("V_Inf_Carrier_01") == 0 and g_V_Carrier1_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_01", AB_Builder) == 1) then
	V_Inf_02_Spawn2 = SobGroup_CreateShip("V_Inf_Carrier_01", "Vgr_InfiltratorFrigate")
	SobGroup_SobGroupAdd("V_Inf_02_Spawn", V_Inf_02_Spawn2)
	SobGroup_Clear(V_Inf_02_Spawn2)
	Rule_AddInterval("Rule_Spawn_02_Capture", 3)
	Rule_Remove("Rule_V_Inf_02_Spawn2")
	else
	g_spawnhardgroup = 1
	Rule_Remove("Rule_V_Inf_02_Spawn2")
	end
end

function Rule_V_Inf_02_Spawn_Def1()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 0 and g_V_Carrier2_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_02", AB_Builder) == 1) then
	V_Inf_02_Spawn_Def1 = SobGroup_CreateShip("V_Inf_Carrier_02", "Vgr_Interceptor")
	SobGroup_SobGroupAdd("V_Inf_02_Spawn_Def", V_Inf_02_Spawn_Def1)
	SobGroup_Clear(V_Inf_02_Spawn_Def1)
	Rule_Remove("Rule_V_Inf_02_Spawn_Def1")
	else
	g_spawnhardgroup = 1
	Rule_Remove("Rule_V_Inf_02_Spawn_Def1")
	end
end

function Rule_V_Inf_02_Spawn_Def2()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 0 and g_V_Carrier2_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_02", AB_Builder) == 1) then
	V_Inf_02_Spawn_Def2 = SobGroup_CreateShip("V_Inf_Carrier_02", "Vgr_Interceptor")
	SobGroup_SobGroupAdd("V_Inf_02_Spawn_Def", V_Inf_02_Spawn_Def2)
	SobGroup_Clear(V_Inf_02_Spawn_Def2)
	Rule_Remove("Rule_V_Inf_02_Spawn_Def2")
	else
	g_spawnhardgroup = 1
	Rule_Remove("Rule_V_Inf_02_Spawn_Def2")
	end
end

function Rule_V_Inf_02_Spawn_Def3()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 0 and g_V_Carrier2_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_02", AB_Builder) == 1) then
	V_Inf_02_Spawn_Def3 = SobGroup_CreateShip("V_Inf_Carrier_02", "Vgr_Interceptor")
	SobGroup_SobGroupAdd("V_Inf_02_Spawn_Def", V_Inf_02_Spawn_Def3)
	SobGroup_Clear(V_Inf_02_Spawn_Def3)
	Rule_AddInterval("Rule_Spawn_02_GuardSobGroup", 3)
	Rule_Remove("Rule_V_Inf_02_Spawn_Def3")
	else
	g_spawnhardgroup = 1
	Rule_Remove("Rule_V_Inf_02_Spawn_Def3")
	end
end

function Rule_V_Inf_02_Spawn_Bomber1()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 0 and g_V_Carrier2_CanBuild == 1 and SobGroup_CanDoAbility("V_Inf_Carrier_02", AB_Builder) == 1) then
	V_Inf_02_Spawn_Bomb = SobGroup_CreateShip("V_Inf_Carrier_02", "Vgr_Bomber")
	V_Inf_02_Spawn_Bomb1 = SobGroup_CreateShip("V_Inf_Carrier_02", "Vgr_Bomber")
	SobGroup_SobGroupAdd("V_Inf_02_Spawn_Bomber", V_Inf_02_Spawn_Bomb)
	SobGroup_SobGroupAdd("V_Inf_02_Spawn_Bomber", V_Inf_02_Spawn_Bomb1)
	SobGroup_Clear(V_Inf_02_Spawn_Bomb)
	SobGroup_Clear(V_Inf_02_Spawn_Bomb1)
	Rule_AddInterval("Rule_Spawn_02_BombSobGroup", 3)
	Rule_Remove("Rule_V_Inf_02_Spawn_Bomber1")
	else
	g_spawnhardgroup = 1
	Rule_Remove("Rule_V_Inf_02_Spawn_Bomber1")
	end
end

function Rule_Spawn_02_Capture()
	SobGroup_CaptureSobGroup("V_Inf_02_Spawn", "Shipyard")
	print("_____________SPAWN01 TO CAP_________________")
	Rule_Remove("Rule_Spawn_02_Capture")
end

function Rule_Spawn_02_GuardSobGroup()
	SobGroup_GuardSobGroup("V_Inf_02_Spawn_Def", "V_Inf_02_Spawn")
	print("_____________SPAWN01 TO GuardSobGroup_________________")
	Rule_AddInterval("Rule_Spawn2Dead", 15)
	Rule_Remove("Rule_Spawn_02_GuardSobGroup")
end

function Rule_Spawn_02_BombSobGroup()
	SobGroup_AttackPlayer("V_Inf_02_Spawn_Bomber", 0)
	print("_____________SPAWN02 TO BombSobGroup_________________")
	Rule_Remove("Rule_Spawn_02_BombSobGroup")
end

function Rule_Spawn2Dead()
	if (SobGroup_Empty("V_Inf_02_Spawn") == 0) then
	SobGroup_AttackPlayer("V_Inf_02_Spawn_Def", 0)
	Rule_Remove("Rule_Spawn2Dead")
	end
end

function Rule_SetSpawnTo_0()
	g_spawnhardgroup = 0
	print("_________________g_spawnhardgroup = 0______________")
	Rule_Remove("Rule_SetSpawnTo_0")
end

function Rule_SetSpawnTo_1()
	g_spawnhardgroup = 1
	print("_________________g_spawnhardgroup = 1______________")
	Rule_Remove("Rule_SetSpawnTo_1")
end

function Rule_StopAllCarrier0_Functions()
	if (SobGroup_Empty("V_Inf_Carrier") == 1) then
	Rule_Remove("Rule_CreateSubSystem0")
	Rule_Remove("Rule_V_Inf_Carrier0_Production_Check")
	Rule_Remove("Rule_StopAllCarrier0_Functions")
	end
end

function Rule_StopAllCarrier1_Functions()
	if (SobGroup_Empty("V_Inf_Carrier_01") == 1) then
	Rule_Remove("Rule_CreateSubSystem1")
	Rule_Remove("Rule_V_Inf_Carrier1_Production_Check")
	Rule_Remove("Rule_StopAllCarrier1_Functions")
	end
end

function Rule_StopAllCarrier2_Functions()
	if (SobGroup_Empty("V_Inf_Carrier_02") == 1) then
	Rule_Remove("Rule_CreateSubSystem2")
	Rule_Remove("Rule_V_Inf_Carrier2_Production_Check")
	Rule_Remove("Rule_StopAllCarrier2_Functions")
	end
end

function Rule_Obj_03_Done()
	SobGroup_FillShipsByType("tempSobGroup", "Player_Ships1", "Vgr_InfiltratorFrigate")
	if (SobGroup_Empty("tempSobGroup") == 1) then
	if (SobGroup_Empty("V_Inf_Carrier_All") == 1) then
	if (SobGroup_OwnedBy("Shipyard") == 2) then
	print("_________________OBJ3 = DONE! ALL INFS ARE DEAD___________________")
	Objective_SetState(obj_03_DefendShipyard_id, OS_Complete)
	Sound_MusicPlayType("data:sound/music/staging/STAGING_11", MUS_Staging)
	print("_________MUSIC Stage__________")
	Rule_Remove("Rule_V_Inf_Carrier0_Production_Check")
	Rule_Remove("Rule_V_Inf_Carrier1_Production_Check")
	Rule_Remove("Rule_V_Inf_Carrier2_Production_Check")
	Rule_Remove("Rule_Infiltrator_ReinforcementsFromCarrier")
	Rule_Remove("Rule_InfCarrier_Grps_Arrive")
	Rule_Remove("Rule_CreateSubSystem0")
	Rule_Remove("Rule_CreateSubSystem1")
	Rule_Remove("Rule_CreateSubSystem2")
	Rule_Remove("Rule_MarineKillas")
	Rule_Remove("Rule_Obj_03_Done")
	Rule_AddInterval("Rule_Start_FinalEvent", 5)
	end
	end
	end
end

function Rule_Start_FinalEvent()
	if (Objective_GetState(obj_03_DefendShipyard_id) == OS_Complete) then
	Rule_AddInterval("Rule_EventPlay_IntelEvent_InfsAreAllDead", 5)
	Rule_Add("Rule_IntelEvent_InfsAreAllDead_Complete")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	Rule_Remove("Rule_Start_FinalEvent")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6411")
	end
end

function Rule_EventPlay_IntelEvent_InfsAreAllDead()
	if (EventPlaying == 0 and SobGroup_Empty("Player_Ships1") == 1) then
	Event_Start("IntelEvent_VaygrAreAllDead")
	EventPlaying = 1
	print("_________PLAY IntelEvent_VaygrAreAllDead__________")
	Rule_AddInterval("Rule_EventPlay_IntelEvent_AllClear", 5)
	Rule_Remove("Rule_EventPlay_IntelEvent_InfsAreAllDead")
	Rule_Remove("Rule_IntelEvent_InfsAreAllDead_Complete")
	elseif (EventPlaying == 0) then
	Event_Start("IntelEvent_InfsAreAllDead")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	print("_________PLAY IntelEvent_InfsAreAllDead__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_InfsAreAllDead")
	end
end

function Rule_HaveVaygrBoardShipyard()
	if (SobGroup_OwnedBy("Shipyard") == 1) then
	Rule_Add("Rule_EventPlay_IntelEvent_ShipyardBoarded")
	FOW_RevealGroup("Shipyard", 1)
	Objective_SetState(obj_03_DefendShipyard_id, OS_Off)
	obj_03a_ReCaptureShipyard_id = Objective_Add(obj_03a_ReCaptureShipyard, OT_Primary)
	Objective_AddDescription(obj_03a_ReCaptureShipyard_id, "$41389")
	SobGroup_AttackPlayer("Player_Ships1", 0)
	Player_GrantResearchOption(1, "VaygrReduceCaptureHack")
	print("HACK OFF AND IN")
	Rule_Add("Rule_IntelEvent_ShipyardBoardedComplete")
	Rule_Add("Rule_CancelCapture")
	Rule_Remove("Rule_Infiltrator_ReinforcementsFromCarrier")
	Rule_Remove("Rule_Infiltrator_Reinforcements")
	Rule_Remove("Rule_VaygrInf_1_Reinforced")
	Rule_Remove("Rule_VaygrInf_2_Reinforced")
	Rule_Remove("Rule_HaveVaygrBoardShipyard")
	Rule_Remove("Rule_V_Inf_Carrier0_Production_Check")
	Rule_Remove("Rule_V_Inf_Carrier1_Production_Check")
	Rule_Remove("Rule_V_Inf_Carrier2_Production_Check")
	Rule_Remove("Rule_CreateSubSystem0")
	Rule_Remove("Rule_CreateSubSystem1")
	Rule_Remove("Rule_CreateSubSystem2")
	Rule_Remove("Rule_MarineKillas")
	end
end

function Rule_EventPlay_IntelEvent_ShipyardBoarded()
	if (EventPlaying == 0) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	Event_Start("IntelEvent_ShipyardBoarded")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	print("_________EVENT TO 1__________")
	print("_________IntelEvent_ShipyardBoarded__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_ShipyardBoarded")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6412")
	end
end

function Rule_CancelCapture()
	SobGroup_GuardSobGroup("V_Inf_01_R", "Shipyard")
	SobGroup_GuardSobGroup("V_Inf_02_R", "Shipyard")
	Rule_Remove("Rule_CancelCapture")
end

function Rule_IntelEvent_ShipyardBoardedComplete()
	if (Event_IsDone("IntelEvent_ShipyardBoarded") == 1) then
	Sound_SetMuteActor("")
	Event_Start("Five_Minutes")
	Timer_Start(2, 300)
	Timer_Display(2)
	Subtitle_TimeCounter(2, 41302)
	print("time start")
	Rule_Add("Rule_Timer_60")
	Rule_Add("Rule_Timer_120")
	Rule_Add("Rule_Timer_180")
	Rule_Add("Rule_Timer_240")
	Rule_Add("Rule_Timer_300")
	Rule_Remove("Rule_IntelEvent_ShipyardBoardedComplete")
	end
end

function Rule_Timer_60()
	if (Timer_GetRemaining(2) <= 243) then
	Event_Start("Four_Minutes")
	Rule_Remove("Rule_Timer_60")
	end
end

function Rule_Timer_120()
	if (Timer_GetRemaining(2) <= 183) then
	Event_Start("Three_Minutes")
	Rule_Remove("Rule_Timer_120")
	end
end

function Rule_Timer_180()
	if (Timer_GetRemaining(2) <= 123) then
	Event_Start("Two_Minutes")
	Rule_Remove("Rule_Timer_180")
	end
end

function Rule_Timer_240()
	if (Timer_GetRemaining(2) <= 63) then
	Event_Start("One_Minutes")
	Rule_Remove("Rule_Timer_240")
	end
end

function Rule_Timer_300()
	if (Timer_GetRemaining(2) <= 0) then
	Event_Start("Self_Destruct")
	SobGroup_SetHealth("Shipyard", 0)
	Subtitle_TimeCounterEnd()
	Rule_AddInterval("Rule_MissionFailed", 10)
	Rule_Remove("Rule_Timer_300")
	end
end

function Rule_RecapturedShipyard()
	if (SobGroup_OwnedBy("Shipyard") == 0) then
	print("Shipyard Saved")
	SobGroup_SwitchOwner("Shipyard", 2)
	Rule_Add("Rule_EventPlay_IntelEvent_Shipyard_Is_Ours")
	Ping_Remove(ping_shipyardcapture_id)
	Event_Stop("Counter30")
	Event_Stop("Counter60")
	Event_Stop("Counter120")
	Event_Stop("Counter180")
	Event_Stop("CounterEnd")
	Sound_MusicPlayType("data:sound/music/ambient/AMB_03", MUS_Ambient)
	print("_________MUSIC AMB__________")
	Rule_Add("Rule_IntelEvent_Shipyard_Is_Ours_Complete")
	Timer_Pause(2)
	Subtitle_TimeCounterEnd()
	Rule_Remove("Rule_Obj_03_Done")
	Rule_Remove("Rule_RecapturedShipyard")
	Rule_Remove("Rule_MissionFailed")
	Rule_Remove("Rule_Timer_60")
	Rule_Remove("Rule_Timer_120")
	Rule_Remove("Rule_Timer_180")
	Rule_Remove("Rule_Timer_240")
	end
end

function Rule_EventPlay_IntelEvent_Shipyard_Is_Ours()
	if (EventPlaying == 0) then
	Event_Start("IntelEvent_Shipyard_Is_Ours")
	EventPlaying = 1
	Sound_SetMuteActor("Fleet")
	Rule_Add("Rule_PlaySaveGameLocationCard")
	print("_________EVENT TO 1__________")
	Rule_Remove("Rule_EventPlay_IntelEvent_Shipyard_Is_Ours")
	g_save_id = (g_save_id + 1)
	Campaign_QuickSaveNb(g_save_id, "$6413")
	end
end

function Rule_IntelEvent_Shipyard_Is_Ours_Complete()
	if (Event_IsDone("IntelEvent_Shipyard_Is_Ours") == 1) then
	SobGroup_AttackPlayer("Player_Ships1", 0)
	Sound_SetMuteActor("")
	Objective_SetState(obj_03a_ReCaptureShipyard_id, OS_Complete)
	obj_04_DefeatAllVaygr_id = Objective_Add(obj_04_DefeatAllVaygr, OT_Primary)
	print("Adding OBJ 04_One_When_The_SHIPYARD_is_Ours")
	Objective_AddDescription(obj_04_DefeatAllVaygr_id, "$41390")
	Rule_Add("Rule_VaygrAreDefeated")
	Rule_Remove("Rule_IntelEvent_Shipyard_Is_Ours_Complete")
	Rule_Remove("Rule_IntelEvent_InfsAreAllDead_Complete")
	end
end

function Rule_IntelEvent_InfsAreAllDead_Complete()
	if (Event_IsDone("IntelEvent_InfsAreAllDead") == 1) then
	SobGroup_AttackPlayer("Player_Ships1", 0)
	Sound_SetMuteActor("")
	Objective_SetState(obj_03a_ReCaptureShipyard_id, OS_Complete)
	obj_04_DefeatAllVaygr_id = Objective_Add(obj_04_DefeatAllVaygr, OT_Primary)
	print("______________Adding OBJ 04-All INFS ARE DEAD____________")
	Objective_AddDescription(obj_04_DefeatAllVaygr_id, "$41390")
	Rule_Add("Rule_VaygrAreDefeated")
	Rule_Remove("Rule_IntelEvent_Shipyard_Is_Ours_Complete")
	Rule_Remove("Rule_IntelEvent_InfsAreAllDead_Complete")
	end
end

function Rule_VaygrAreDefeated()
	if (SobGroup_AreAnyFromTheseAttackFamilies("Player_Ships1", "Fighter, Corvette, Frigate, Capturer, SmallCapitalShip") == 0) then
	if (SobGroup_AreAnyFromTheseAttackFamilies("Player_Ships3", "Fighter, Corvette, Frigate, Capturer, SmallCapitalShip") == 0) then
	print("____________Final OBJ Done___________")
	Rule_Remove("Rule_EventPlay_IntelEvent_AllClear")
	Rule_AddInterval("Rule_EventPlay_IntelEvent_AllClear", 3)
	print("__________CALLING Rule_EventPlay_IntelEvent_AllClear____________")
	Rule_Remove("Rule_IntelEvent_InfsAreAllDead_Complete")
	Rule_Remove("Rule_IntelEvent_Shipyard_Is_Ours_Complete")
	Rule_Remove("Rule_EventPlay_IntelEvent_InfsAreAllDead")
	Rule_Remove("Rule_VaygrAreDefeated")
	Rule_Remove("Rule_RecapturedShipyard")
	end
	end
end

function Rule_EventPlay_IntelEvent_AllClear()
	if (EventPlaying == 0) then
	Sensors_Toggle(0)
	Sensors_EnableToggle(0)
	EventPlaying = 1
	Event_Start("IntelEvent_AllClear")
	Sound_MusicPlayType("data:sound/music/ambient/AMB_03", MUS_Ambient)
	print("_________MUSIC AMB__________")
	print("__________PLAYING IntelEvent_AllClear____________")
	Rule_Add("Rule_IntelEvent_AllClear_Complete")
	Rule_Remove("Rule_EventPlay_IntelEvent_AllClear")
	end
end

function Rule_IntelEvent_AllClear_Complete()
	if (Event_IsDone("IntelEvent_AllClear") == 1) then
	Objective_SetState(obj_04_DefeatAllVaygr_id, OS_Complete)
	print("_________TRIGGER PLAY NIS_________________")
	Sound_SetMuteActor("")
	Rule_Add("Rule_PlayNIS")
	Rule_Remove("Rule_IntelEvent_AllClear_Complete")
	end
end

function Rule_PlayNIS()
	if (Objective_GetState(obj_04_DefeatAllVaygr_id) == OS_Complete) then
	print("_________PLAY NIS NOW______________")
	NISLoad("nis/NIS03")
	g_currentNISPlaying_id = NISPlayFromGroup("nis/NIS03", Players_Mothership)
	Rule_Add("Rule_NISCompleted")
	Rule_Remove("Rule_IntelEvent_AllClear_Complete")
	Rule_Remove("Rule_PlayNIS")
	end
end

function Rule_NISCompleted()
	if (NISComplete(g_currentNISPlaying_id) == 1) then
	print("________________NIS OVER___________")
	Event_Start("MissionWon")
	Sound_MusicPlayType("data:sound/music/ambient/AMB_03", MUS_Ambient)
	Rule_Remove("Rule_NISCompleted")
	end
end

function Rule_PlayerLose()
	if (SobGroup_HealthPercentage(Players_Mothership) <= 0) then
	Event_Start("MSLost")
	Rule_Add("Rule_MSLost_Complete")
	Rule_Remove("Rule_PlayerLose")
	end
end

function Rule_MSLost_Complete()
	if (Event_IsDone("MSLost") == 1) then
	Event_Start("MissionFailedMSLost")
	Rule_Remove("Rule_MSLost_Complete")
	end
end

function Rule_ShipyardPlayerLose()
	if (SobGroup_Empty("Shipyard") == 1) then
	Event_Start("MissionFailed")
	Rule_Remove("Rule_ShipyardPlayerLose")
	end
end

function Rule_MissionFailed()
	Event_Start("MissionFailed")
	Objective_SetState(obj_03_DefendShipyard_id, OS_Failed)
	print("MissionFailed")
	Rule_Remove("Rule_MissionFailed")
end

Events = {}
Events["Titlecard"] = {{{"Camera_UseCameraPoint( 'Cam_Start' )", ""},}, {HW2_LocationCardEvent("$41020", 6)},}
Events["IntelEvent_Staging"] = {{{"Camera_UseCameraPoint( 'Cam_Start' )", ""},}, {HW2_LocationCardEvent("$41020", 8), {"Sound_EnableAllSpeech( 1 )", ""},}, {HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$41030", 4), {"Universe_EnableSkip(1)", ""}, {"Camera_UsePanning(1)", ""},}, {HW2_Wait(2)}, {HW2_Letterbox(1), HW2_Wait(3), {"Camera_FocusSave()", ""},}, {{"Sound_EnterIntelEvent()", ""}, {"Sensors_Toggle( 1 )", ""}, {"Camera_Interpolate( 'here', 'camera6', 2)", ""}, HW2_Wait(1)}, {{"pointer_shipyardexit_id = HW2_CreateEventPointerSobGroup( 'Shipyard')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$41031", 4), {"Sound_MusicPlayType ( 'data:sound/music/battle/battle_04' , MUS_Battle)", ""},}, {{"Camera_FocusSobGroupWithBuffer( 'Shipyard', 2, 1000, 1.5 )", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41033", 5)}, {HW2_Wait(1)}, {{"EventPointer_Remove(pointer_shipyardexit_id)", ""}, {"Sensors_Toggle( 0 )", ""},}, {HW2_SubTitleEvent(Actor_Shipyard, "$41034", 5)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41035", 5)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41036", 5)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41037", 5)}, {HW2_Wait(1), {"Universe_Pause(1, 1.5)", ""}, {"Sensors_Toggle( 1 )", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41045", 4), {"Camera_Interpolate( 'here', 'camera4', 3)", ""}, {"pointer_resources_id = HW2_CreateEventPointerVolume( 'Vol_RU_01' )", ""},}, {{"ping_RU_01_id = HW2_PingCreateWithLabelPoint( ping_RU_01,'Vol_RU_01')", ""}, {"Ping_AddDescription(ping_RU_01_id, 0, '$41413')", ""}, {"EventPointer_Remove(pointer_resources_id)", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41047", 4)}, {{"Camera_Interpolate( 'here', 'camera6', 2)", ""},}, {HW2_Wait(2)}, {HW2_Letterbox(0), {"Camera_FocusRestore()", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sensors_Toggle( 0 )", ""}, {"Universe_Pause(0, 1.5)", ""}, {"Universe_EnableSkip(0)", ""},},}
Events["IntelEvent_ShipyardSafe"] = {{{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1)}, {{"Sensors_Toggle( 0 )", ""}, {"Camera_FocusSave()", ""}, {"Sound_EnterIntelEvent()", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41040", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41041", 4), {"Camera_FocusSobGroupWithBuffer( 'Shipyard', 2, 1000, 2 )", ""},}, {HW2_SubTitleEvent(Actor_Shipyard, "$41042", 4)}, {HW2_Wait(0.5)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41043", 4)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41044", 4)}, {HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$41063", 4), {"UI_FlashButton('NewTaskbar', 'btnResearch', -1)", ""}, {"Rule_Add( 'Rule_monitorBuildBtn' )", ""}, {"Camera_FocusSobGroupWithBuffer( Players_Mothership, 1, 1000, 1 )", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41064", 4)}, {{"ping_shipyardexit_id = HW2_PingCreateWithLabel( ping_shipyardexit, 'Shipyard')", ""}, {"Ping_AddDescription(ping_shipyardexit_id, 0, '$41415')", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41065", 4)}, {{"EventPointer_Remove(pointer_shipyardexit_id)", ""}, {"Sound_ExitIntelEvent()", ""}, HW2_Letterbox(0), {"Camera_FocusRestore()", ""}, HW2_Wait(2), {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""},},}
Events["IntelEvent_MobileRef_In_Position"] = {{{"Sound_EnterIntelEvent()", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41051", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41052", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41053", 4)}, {{"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},},}
Events["IntelEvent_ShipyardRepaired"] = {{{"Universe_EnableSkip(1)", ""}, {"Camera_FocusSave()", ""}, {"Sound_EnterIntelEvent()", ""},}, {HW2_Letterbox(1)}, {HW2_Wait(1)}, {{"Camera_FocusSobGroupWithBuffer( 'Shipyard', 2, 1000, 1.5 )", ""}, HW2_SubTitleEvent(Actor_Shipyard, "$41070", 4)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41071", 4), {"Rule_Add( 'Rule_CreateCarrier' )", ""},}, {HW2_SubTitleEvent(Actor_Shipyard, "$41073", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41075", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41076", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41077", 4)}, {HW2_Letterbox(0), HW2_Wait(2), {"Sound_ExitIntelEvent()", ""}, {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""}, {"Sensors_EnableToggle(1)", ""}, {"print ('END OF EVENT')", ""},},}
Events["IntelEvent_RepairReady"] = {{{"Sound_EnterIntelEvent()", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$41055", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41056", 4)}, {{"EventPlaying = 0", ""},}, {{"Sound_ExitIntelEvent()", ""},},}
Events["IntelEvent_ProbesDetected"] = {{{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), {"Sound_EnterIntelEvent()", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41066", 4)}, {{"Sensors_Toggle( 1 )", ""}, {"Camera_FocusSave()", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41067", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41068", 4)}, {{"Sensors_Toggle( 0 )", ""},}, {HW2_Wait(1)}, {HW2_Letterbox(0), {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},},}
Events["IntelEvent_ProbesDestroyed"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41069", 4), {"EventPlaying = 0", ""},},}
Events["IntelEvent_VaygrWave01"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, HW2_Letterbox(1)}, {{"Sensors_Toggle( 1 )", ""}, {"Camera_FocusSave()", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41080", 4)}, {{"pointer_VaygrCarrier_id = HW2_CreateEventPointerVolume ('vol_V_Carrier_Exit')", ""}, {"Camera_Interpolate( 'here', 'camera5', 3)", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41081", 4)}, {{"Sensors_Toggle( 0 )", ""}, {"EventPointer_Remove(pointer_VaygrCarrier_id )", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41082", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41083", 4)}, {HW2_Letterbox(0), HW2_Wait(2), {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},},}
Events["IntelEvent_VaygrWave01_NonFRO"] = {{{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1)}, {{"Sensors_Toggle( 1 )", ""}, {"Camera_FocusSave()", ""}, {"Sound_EnterIntelEvent()", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41080", 4)}, {{"pointer_VaygrCarrier_id = HW2_CreateEventPointerVolume ('vol_V_Carrier_Exit')", ""}, {"Camera_Interpolate( 'here', 'camera5', 3)", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41081", 4)}, {{"Sensors_Toggle( 0 )", ""}, {"EventPointer_Remove(pointer_VaygrCarrier_id )", ""},}, {}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41083", 4)}, {HW2_Letterbox(0), HW2_Wait(2), {"Sound_ExitIntelEvent()", ""}, {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""},},}
Events["IntelEvent_VaygrCarrierDead"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41086", 4), {"EventPlaying = 0", ""},},}
Events["IntelEvent_DefendShipyard"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, HW2_Letterbox(1)}, {{"Camera_FocusSobGroupWithBuffer( 'Shipyard', 2, 1000, 2 )", ""}, HW2_SubTitleEvent(Actor_Shipyard, "$41091", 3)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41092", 3)}, {HW2_Wait(1), {"Universe_Pause(1, 1.5)", ""}, {"Sensors_Toggle( 1 )", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41094", 3), {"pointer_Vaygr_ShipyardInf_01_id = HW2_CreateEventPointerSobGroup ('V_Inf_01_Main')", ""}, {"pointer_Vaygr_ShipyardInf_02_id = HW2_CreateEventPointerSobGroup ('V_Inf_02_Main')", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41095", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41096", 3)}, {{"EventPointer_Remove(pointer_Vaygr_ShipyardInf_01_id)", ""}, {"EventPointer_Remove(pointer_Vaygr_ShipyardInf_02_id)", ""}, HW2_Wait(1)}, {{"Sensors_Toggle( 0 )", ""}, HW2_Letterbox(0), HW2_Wait(2), {"Universe_Pause(0, 1.5)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""},},}
Events["Auto_Inflitrators"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41100", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41101", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41102", 3)}, {{"ping_shipyardcapture_id = HW2_PingCreateWithLabel( ping_shipyardcapture, 'Shipyard')", ""}, {"Ping_AddDescription(ping_shipyardcapture_id, 1, '$41416')", ""},}, {HW2_Wait(2), {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["Speechevent_ShipyardBeingBoarded"] = {{{"Universe_EnableSkip(1)", ""}, {"Camera_FocusSobGroupWithBuffer( 'V_Inf_01_Main', 1, 1000, 3 )", ""}, {"Sound_EnterIntelEvent()", ""}, HW2_Letterbox(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41120", 2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41121", 4)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41122", 4)}, {HW2_Letterbox(0), HW2_Wait(2), {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["IntelEvent_VaygrReinforcements"] = {{{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), {"Sound_EnterIntelEvent()", ""},}, {HW2_Wait(1), {"Universe_Pause(1, 1.5)", ""}, {"Sensors_Toggle( 1 )", ""},}, {HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41113", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41114", 3), {"pointer_VaygreCarrierInfs_id = HW2_CreateEventPointerSobGroup ('V_Inf_Carrier')", ""}, {"pointer_VaygreCarrierInfs_01_id = HW2_CreateEventPointerSobGroup ('V_Inf_Carrier_01')", ""}, {"pointer_VaygreCarrierInfs_02_id = HW2_CreateEventPointerSobGroup ('V_Inf_Carrier_02')", ""},}, {{"Sensors_Toggle( 0 )", ""}, HW2_Wait(1)}, {HW2_Letterbox(0), {"EventPointer_Remove(pointer_VaygreCarrierInfs_id)", ""}, {"EventPointer_Remove(pointer_VaygreCarrierInfs_01_id)", ""}, {"EventPointer_Remove(pointer_VaygreCarrierInfs_02_id)", ""}, {"Universe_Pause(0, 1.5)", ""}, {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["IntelEvent_InfsAreAllDead"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, HW2_Letterbox(1)}, {HW2_Wait(2), {"Universe_Pause(1, 1.5)", ""}, {"Sensors_Toggle( 1 )", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41146", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41147", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41143", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41144", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41145", 3)}, {HW2_Wait(2)}, {{"Sensors_Toggle( 0 )", ""}, HW2_Letterbox(0), {"Universe_Pause(0, 1.5)", ""}, {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},},}
Events["IntelEvent_VaygrAreAllDead"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, HW2_Letterbox(1)}, {HW2_Wait(2), {"Universe_Pause(1, 1.5)", ""}, {"Sensors_Toggle( 1 )", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41146", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41147", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41143", 3)}, {HW2_Wait(2)}, {{"Sensors_Toggle( 0 )", ""}, HW2_Letterbox(0), {"Universe_Pause(0, 1.5)", ""}, {"Universe_EnableSkip(0)", ""}, {"Sound_ExitIntelEvent()", ""}, {"EventPlaying = 0", ""},},}
Events["IntelEvent_ShipyardBoarded"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, HW2_Letterbox(1)}, {{"Camera_FocusSobGroupWithBuffer( 'Shipyard', 2, 1000, 2 )", ""}, HW2_SubTitleEvent(Actor_Shipyard, "$41105", 3)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41106", 3)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41107", 3)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41108", 3)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41109", 3)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41110", 3)}, {HW2_Wait(1), {"Universe_Pause(1, 1.5)", ""}, {"Sensors_Toggle( 1 )", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41111", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41112", 3)}, {{"EventPointer_Remove(pointer_VaygreCarrierInfs_id)", ""}, {"EventPointer_Remove(pointer_VaygreCarrierInfs_01_id)", ""}, HW2_Wait(1)}, {HW2_Letterbox(0), {"Sensors_Toggle( 0 )", ""}, {"Universe_Pause(0, 1.5)", ""}, {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""}, {"Sensors_EnableToggle(1)", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["IntelEvent_Shipyard_Is_Ours"] = {{{"Universe_EnableSkip(1)", ""}, {"Camera_FocusSobGroupWithBuffer( 'Shipyard', 1, 1000, 1 )", ""}, {"Sound_EnterIntelEvent()", ""}, HW2_Letterbox(1)}, {{"Sensors_Toggle( 1 )", ""}, HW2_Wait(1), HW2_Pause(1)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41140", 3)}, {HW2_SubTitleEvent(Actor_Shipyard, "$41141", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41142", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41143", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41144", 3)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41145", 3)}, {HW2_Wait(2)}, {{"Sensors_Toggle( 0 )", ""}, HW2_Letterbox(0), HW2_Pause(0), {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""}, {"Sound_ExitIntelEvent()", ""},},}
Events["IntelEvent_AllClear"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, HW2_Letterbox(1)}, {HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41150", 3)}, {HW2_Wait(1), {"Camera_FocusSobGroupWithBuffer( Players_Mothership, 1, 1000, 1.5 )", ""},}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41151", 3)}, {{"Sensors_Toggle( 0 )", ""}, {"Universe_EnableSkip(0)", ""}, {"EventPlaying = 0", ""}, {"Sound_EnableAllSpeech( 0 )", ""},},}
Events["Five_Minutes"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41125", 3)},}
Events["Four_Minutes"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41126", 3)},}
Events["Three_Minutes"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41127", 3)},}
Events["Two_Minutes"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41128", 3)},}
Events["One_Minutes"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41129", 3)},}
Events["Self_Destruct"] = {{HW2_SubTitleEvent(Actor_FleetIntel, "$41130", 3), {"Camera_FocusSobGroupWithBuffer( 'Shipyard', 2, 1000, 1.5 )", ""},},}
Events["MissionFailed"] = {{HW2_Fade(1), HW2_Wait(2)}, {HW2_LocationCardEvent("$41320", 4)}, {{"setMissionComplete( 0 )", ""},},}
Events["MSLost"] = {{{"Camera_FocusSobGroupWithBuffer( Players_Mothership, 1, 1000, 1 )", ""}, HW2_Wait(8)},}
Events["MissionFailedMSLost"] = {{HW2_Letterbox(1)}, {HW2_Wait(2)}, {HW2_Fade(1)}, {HW2_LocationCardEvent("$41321", 4)}, {{"setMissionComplete( 0 )", ""},},}
Events["ObjectiveCompleat"] = {{HW2_LocationCardEvent("$41005", 2)},}
Events["MissionWon"] = {{{"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_EnableAllSpeech( 1 )", ""}, HW2_Letterbox(1)}, {{"Camera_FocusSobGroupWithBuffer( Players_Mothership, 1, 1000, 1 )", ""}, HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41160", 5)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$41161", 5)}, {{"Universe_AllowPlayerOrders( 0 )", ""}, HW2_Fade(1), HW2_Wait(1)}, {{"Player_InstantlyGatherAllResources( 0 )", ""}, {"Player_InstantDockAndParade( 0, Players_Mothership, 0 )", ""}, HW2_Wait(1)}, {{"Subtitle_Message( '$3652', 2 )", ""}, HW2_Wait(2)}, {HW2_Fade(0), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$41162", 5)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$41163", 5)}, {{"SobGroup_EnterHyperSpaceOffMap( 'Player_Ships0' )", ""}, HW2_Wait(6)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$41164", 5)}, {{"Universe_Fade( 1, 2 )", ""}, HW2_Wait(2)}, {HW2_LocationCardEvent("$41499", 4)}, {{"setMissionComplete( 1 )", ""}, {"Sound_ExitIntelEvent()", ""},},}
