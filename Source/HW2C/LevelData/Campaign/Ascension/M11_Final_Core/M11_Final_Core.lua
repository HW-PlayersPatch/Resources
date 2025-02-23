-- =============================================================================
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

dofilepath("data:scripts/SCAR/SCAR_Util.lua")
obj_prim_investigatecore = "$45000"
obj_prim_investigatecore_id = 0
obj_prim_retrievefragments = "$45001"
obj_prim_retrievefragments_id = 0
obj_prim_destvaygr = "$45002"
obj_prim_destvaygr_id = 0
g_save_id = 0
ping_hyperspacedisturbance_1 = "$45300"
ping_hyperspacedisturbance_id = {0, 0, 0}
ping_hyperspacedisturbance_2 = "$45301"
ping_hyperspacedisturbance_2_id = 0
ping_hyperspacedisturbance_3 = "$45302"
ping_hyperspacedisturbance_3_id = 0
ping_hyperspacecore_1 = "$45303"
ping_hyperspacecore_id = {0, 0, 0}
ping_hyperspacecore_2 = "$45304"
ping_hyperspacecore_2_id = 0
ping_hyperspacecore_3 = "$45305"
ping_hyperspacecore_3_id = 0
ping_vaygr = "$45306"
ping_vaygr_id = 0
temp_group = ""
collector_hgn_carrying_core_1 = ""
collector_hgn_carrying_core_2 = ""
collector_hgn_carrying_core_3 = ""
collector_vgr_carrying_core_1 = ""
collector_vgr_carrying_core_2 = ""
collector_vgr_carrying_core_3 = ""
g_status_core_1 = 0
g_status_core_2 = 0
g_status_core_3 = 0
g_core_1_salvaged = 0
g_core_2_salvaged = 0
g_core_3_salvaged = 0
g_speedofcollectorsalvagingcore = 0.6
g_now_time = Universe_GameTime()
g_pointer_default_1 = 0
g_pointer_default_2 = 0
g_pointer_default_3 = 0

for i = 1, 3 do
	SobGroup_Create("Collector_Salvaging_Core_"..i)
end 

g_cores_retrieved = 0
g_vaygr_carrier_with_core = 1
g_vaygr_wave_one_time = 80
g_vaygr_wave_two_time = 300
g_group_one_steal_core_time = 30
g_group_two_steal_core_time = 60
g_time_for_vagryr_to_leave_with_core = 360

function OnInit()
	Rule_Add("Rule_Init")
	SobGroup_TakeDamage("Bentus_Ruined", 0.7)
	Camera_UseCameraPoint("cmr_introposition")
end

function cheat()
	Event_Start("intelevent_hsout")
end

function Enable_ResearchOptions()
	Player_UnrestrictBuildOption(0, "Hgn_Battlecruiser")
	Player_UnrestrictResearchOption(0, "BattlecruiserIonWeapons")
	Player_UnrestrictResearchOption(0, "BattlecruiserHealthUpgrade1")
	Player_UnrestrictResearchOption(0, "BattlecruiserMAXSPEEDUpgrade1")
	Player_UnrestrictResearchOption(0, "ShipyardHealthUpgrade2")
	Player_UnrestrictResearchOption(0, "ShipyardMAXSPEEDUpgrade2")
	Player_UnrestrictResearchOption(0, "ShipyardBUILDSPEEDUpgrade1")
end

function Rule_DisableBuilderInterval()
	HW2_DisableBuilderOnCapture("tempSobGroup")
end

function Rule_Init()
	HW2_SetResearchLevel(11)
	SobGroup_Create("tempSobGroup")
	Rule_AddInterval("Rule_DisableBuilderInterval", 5)
	Player_SetPlayerName(0, "$45292")
	Player_SetPlayerName(1, "$45290")
	Player_SetPlayerName(2, "$45291")
	Player_SetPlayerName(3, "$45291")
	SobGroup_LoadPersistantData("Hgn_Mothership")
	Players_Mothership = "Players_Mothership"
	SobGroup_Create(Players_Mothership)
	SobGroup_FillShipsByType(Players_Mothership, "Player_Ships0", "Hgn_MotherShip")
	ShipToParadeRoundTypeName = "Players_Mothership"
	Players_Dreadnaught = "Players_Dreadnaught"
	SobGroup_Create(Players_Dreadnaught)
	SobGroup_FillShipsByType(Players_Dreadnaught, "Player_Ships0", "Hgn_Dreadnaught")
	Vaygr_Carrier_With_Core = "Vaygr_Carrier_With_Core"
	SobGroup_Create(Vaygr_Carrier_With_Core)
	SobGroup_SetDisplayedRestrictedHardpoint("Players_Mothership", 0)
	Sound_SpeechSubtitlePath("speech:missions/m_11/")
	Sound_MusicPlayType("data:sound/music/staging/Staging_11", MUS_Staging)
	Event_Start("intelevent_scoutdebris")
	Rule_Add("Rule_AfterOpeningInteleventEnableResearch")
	SobGroup_SetSwitchOwnerFlag("Core_Piece_1", 0)
	SobGroup_SetSwitchOwnerFlag("Core_Piece_2", 0)
	SobGroup_SetSwitchOwnerFlag("Core_Piece_3", 0)
	HW2_ReactiveInfo()
	SobGroup_Create("Group_Currently_Salvaging_Core_1")
	SobGroup_SetSwitchOwnerFlag("Vaygr_Time_Attack_1_Resource", 0)
	Rule_AddInterval("Rule_Vaygr_Attack_2_Arrive", g_vaygr_wave_two_time)
	all_carriers = "all_carriers"
	SobGroup_Create(all_carriers)
	SobGroup_SobGroupAdd("all_carriers", "Vaygr_Time_Attack_1_Carrier")
	SobGroup_SobGroupAdd("all_carriers", "Vaygr_Time_Attack_2_Carrier")
	Rule_Add("Rule_Test_Core")
	Rule_Add("Rule_Setup_AI")
	Rule_Add("Rule_PlayerLose")
	Rule_Add("Rule_PlayerHasScoutedACore")
	Rule_Add("Rule_SlowDownCollector")
	Rule_Remove("Rule_Init")
end

function Rule_AfterOpeningInteleventEnableResearch()
	if (Event_IsDone("intelevent_scoutdebris") == 1) then
	Enable_ResearchOptions();
	Rule_Remove("Rule_AfterOpeningInteleventEnableResearch")
	end
end

function Rule_SlowDownCollector()
	SobGroup_GetSobGroupSalvagingGroup("Core_Piece_1", "Collector_Salvaging_Core_1")
	SobGroup_GetSobGroupSalvagingGroup("Core_Piece_2", "Collector_Salvaging_Core_2")
	SobGroup_GetSobGroupSalvagingGroup("Core_Piece_3", "Collector_Salvaging_Core_3")
	if (SobGroup_Empty("Collector_Salvaging_Core_1") == 0) then
	if (g_core_1_salvaged == 0) then
	SobGroup_SetSpeed("Collector_Salvaging_Core_1", g_speedofcollectorsalvagingcore)
	else
	SobGroup_SetSpeed("Collector_Salvaging_Core_1", 1)
	SobGroup_Clear("Collector_Salvaging_Core_1")
	end
	end
	if (SobGroup_Empty("Collector_Salvaging_Core_2") == 0) then
	if (g_core_2_salvaged == 0) then
	SobGroup_SetSpeed("Collector_Salvaging_Core_2", g_speedofcollectorsalvagingcore)
	else
	SobGroup_SetSpeed("Collector_Salvaging_Core_2", 1)
	SobGroup_Clear("Collector_Salvaging_Core_2")
	end
	end
	if (SobGroup_Empty("Collector_Salvaging_Core_3") == 0) then
	if (g_core_3_salvaged == 0) then
	SobGroup_SetSpeed("Collector_Salvaging_Core_3", g_speedofcollectorsalvagingcore)
	else
	SobGroup_SetSpeed("Collector_Salvaging_Core_3", 1)
	SobGroup_Clear("Collector_Salvaging_Core_3")
	end
	end
end

function Rule_Setup_AI()
	SetAlliance(1, 2)
	SetAlliance(2, 1)
	SetAlliance(1, 3)
	SetAlliance(3, 1)
	SetAlliance(2, 3)
	SetAlliance(3, 2)
	CPU_Enable(1, 0)
	CPU_Enable(2, 1)
	CPU_Enable(3, 1)
	CPU_RemoveSobGroup(3, "Vaygr_AI_Carrier")
	CPU_RemoveSobGroup(3, "Vaygr_AI_Carrier_Group")
	CPU_RemoveSobGroup(3, "Vaygr_AI_Dockers")
	CPU_RemoveSobGroup(2, "Vaygr_Time_Attack_1")
	CPU_RemoveSobGroup(2, "Vaygr_Time_Attack_1_Carrier")
	CPU_RemoveSobGroup(2, "Vaygr_Time_Attack_1_Resource")
	CPU_RemoveSobGroup(2, "Vaygr_Time_Attack_1_Dockers")
	CPU_RemoveSobGroup(2, "Vaygr_Time_Attack_2")
	CPU_RemoveSobGroup(2, "Vaygr_Time_Attack_2_Carrier")
	CPU_RemoveSobGroup(2, "Vaygr_Time_Attack_2_Resource")
	CPU_RemoveSobGroup(2, "Vaygr_Time_Attack_2_Dockers")
	Player_GrantResearchOption(2, "VaygrRadiationImmunityHack")
	Player_GrantResearchOption(3, "VaygrRadiationImmunityHack")
	SobGroup_AbilityActivate("Vaygr_Time_Attack_1_Carrier", AB_Move, 0)
	SobGroup_AbilityActivate("Vaygr_Time_Attack_2_Carrier", AB_Move, 0)
	SobGroup_CreateSubSystem("Vaygr_AI_Carrier", "FighterProduction")
	SobGroup_CreateSubSystem("Vaygr_AI_Carrier", "CorvetteProduction")
	SobGroup_CreateSubSystem("Vaygr_AI_Carrier", "FrigateProduction")
	SobGroup_CreateSubSystem("Vaygr_AI_Carrier", "CapShipProduction")
	SobGroup_CreateSubSystem("Vaygr_AI_Carrier", "PlatformProduction")
	SobGroup_CreateSubSystem("Vaygr_AI_Carrier", "Research")
	SobGroup_CreateSubSystem("Vaygr_AI_Carrier", "Hyperspace")
	SobGroup_CreateSubSystem("Vaygr_AI_Carrier", "AdvancedArray")
	SobGroup_CreateSubSystem("Vaygr_Time_Attack_1_Carrier", "CorvetteProduction")
	SobGroup_CreateSubSystem("Vaygr_Time_Attack_2_Carrier", "FrigateProduction")
	Player_GrantResearchOption(3, "CorvetteTech")
	Player_GrantResearchOption(3, "CorvetteCommand")
	Player_GrantResearchOption(3, "PlatformHeavyMissiles")
	Player_GrantResearchOption(3, "FrigateInfiltrationTech")
	Player_GrantResearchOption(3, "HyperspaceGateTech")
	Player_GrantResearchOption(3, "RepairAbility")
	Player_GrantResearchOption(3, "FrigateTech")
	Player_GrantResearchOption(3, "LanceBeams")
	Player_GrantResearchOption(3, "PlasmaBombs")
	Player_GrantResearchOption(3, "CorvetteLaser")
	Player_GrantResearchOption(3, "FrigateAssault")
	Player_GrantResearchOption(3, "DestroyerGuns")
	SobGroup_DockSobGroupInstant("Vaygr_Time_Attack_1_Resource", "Vaygr_Time_Attack_1_Carrier")
	SobGroup_DockSobGroupInstant("Vaygr_Time_Attack_1_Dockers", "Vaygr_Time_Attack_1_Carrier")
	SobGroup_DockSobGroupInstant("Vaygr_Time_Attack_2_Dockers", "Vaygr_Time_Attack_2_Carrier")
	SobGroup_DockSobGroupInstant("Vaygr_Time_Attack_2_Resource", "Vaygr_Time_Attack_2_Carrier")
	SobGroup_DockSobGroupInstant("Vaygr_AI_Dockers", "Vaygr_AI_Carrier")
	Player_SetRU(3, 10000)
	Player_SetDefaultShipTactic(2, AggressiveTactics)
	Player_SetDefaultShipTactic(3, AggressiveTactics)
	SobGroup_SetSpeed("Vaygr_Time_Attack_1_Resource", 0.3)
	Rule_AddInterval("Rule_AI_Hyperspace_Out", 2)
	Rule_Remove("Rule_Setup_AI")
end

function Rule_AI_Hyperspace_Out()
	SobGroup_EnterHyperSpaceOffMap("Vaygr_Time_Attack_1")
	SobGroup_EnterHyperSpaceOffMap("Vaygr_Time_Attack_2")
	SobGroup_EnterHyperSpaceOffMap("Vaygr_AI_Carrier")
	SobGroup_EnterHyperSpaceOffMap("Vaygr_AI_Carrier_Group")
	Rule_Remove("Rule_AI_Hyperspace_Out")
end

function Rule_PlayerHasScoutedACore()
	if (Player_FillProximitySobGroup("tempSobGroup", 0, "Core_Piece_1", 8000) == 1) or (Player_FillProximitySobGroup("tempSobGroup", 0, "Core_Piece_2", 8000) == 1) or (Player_FillProximitySobGroup("tempSobGroup", 0, "Core_Piece_3", 8000) == 1) then
	Player_UnrestrictResearchOption(0, "RadiationDefenseField")
	Objective_SetState(obj_prim_investigatecore_id, OS_Complete)
	Event_Start("intelevent_foundcorepieces")
	Rule_AddInterval("Rule_VaygrArriveInSystem", g_vaygr_wave_one_time)
	Rule_Add("Rule_PlayerSalvagedCorePiece")
	Rule_Add("Rule_CorePieceSalvaged_1")
	Rule_Add("Rule_PlayerHasAllCorePieces")
	Rule_Remove("Rule_PlayerHasScoutedACore")
	end
end

function Rule_VaygrArriveInSystem()
	Event_Start("intelevent_vaygrarrived")
	CPU_AddSobGroup(3, "Vaygr_AI_Carrier")
	CPU_AddSobGroup(3, "Vaygr_AI_Carrier_Group")
	CPU_AddSobGroup(3, "Vaygr_AI_Dockers")
	Rule_AddInterval("Rule_Vaygr_Wave_2", g_vaygr_wave_two_time)
	Rule_AddInterval("Rule_Vaygr_1_Launch", 20)
	Rule_Remove("Rule_VaygrArriveInSystem")
end

function Rule_Vaygr_1_Launch()
	if (SobGroup_AreAllInRealSpace("Vaygr_Time_Attack_1_Carrier") == 1) then
	SobGroup_SetAutoLaunch("Vaygr_AI_Carrier", ShipHoldLaunch)
	SobGroup_SetAutoLaunch("Vaygr_Time_Attack_1_Carrier", ShipHoldLaunch)
	SobGroup_Launch("Vaygr_Time_Attack_1_Dockers", "Vaygr_Time_Attack_1_Carrier")
	SobGroup_Launch("Vaygr_Time_Attack_1_Resource", "Vaygr_Time_Attack_1_Carrier")
	SobGroup_Launch("Vaygr_AI_Dockers", "Vaygr_AI_Carrier")
	another_temp_group = "another_temp_group"
	SobGroup_Create(another_temp_group)
	SobGroup_FillSubstract("another_temp_group", "Vaygr_Time_Attack_1", "Vaygr_Time_Attack_1_Carrier")
	SobGroup_FillSubstract("another_temp_group", "another_temp_group", "Vaygr_Time_Attack_1_Resource")
	SobGroup_SwitchOwner("Vaygr_Time_Attack_1_Resource", 2)
	CPU_RemoveSobGroup(2, "Vaygr_Time_Attack_1_Resource")
	Rule_AddInterval("Rule_Vaygr_1_Go_For_Core", g_group_one_steal_core_time)
	Rule_Add("Rule_Vaygr_1_Go_Independant")
	Rule_Remove("Rule_Vaygr_1_Launch")
	end
end

function Rule_Vaygr_1_Go_For_Core()
	SobGroup_SalvageSobGroup("Vaygr_Time_Attack_1_Resource", "Core_Piece_1")
	print("Resource_Collector_Given_Order")
	SobGroup_GuardSobGroup("Vaygr_Time_Attack_1_Dockers", "Vaygr_Time_Attack_1_Resource")
	print("Guard Order")
	Rule_AddInterval("Rule_Vaygr_1_Have_Core", 3)
	print("Add rule")
	Rule_Add("Rule_Vaygr_1_Keep_Making_RC")
	print("Add rule")
	Rule_Add("Rule_Vaygr_1_Have_Salvaged")
	print("Add rule")
	Rule_Remove("Rule_Vaygr_1_Go_For_Core")
	print("Rule removed")
end

function Rule_Vaygr_1_Have_Core()
	print("checking who has the core")
	SobGroup_GetSobGroupSalvagingGroup("Core_Piece_1", "Group_Currently_Salvaging_Core_1")
	if (SobGroup_Empty("Group_Currently_Salvaging_Core_1") == 0) then
	if (SobGroup_OwnedBy("Group_Currently_Salvaging_Core_1") == 0) then
	print("Player has core")
	else
	print("Core number 1 in the hands of the vaygr")
	Event_Start("speechevent_vaygrgotcore")
	Rule_Remove("Rule_Vaygr_1_Have_Core")
	end
	end
end

function Rule_Vaygr_1_Go_Independant()
	if (SobGroup_OwnedBy("Core_Piece_1") == 0) then
	SobGroup_SwitchOwner("Vaygr_Time_Attack_1", 3)
	SobGroup_SwitchOwner("Vaygr_Time_Attack_1_Carrier", 3)
	SobGroup_SwitchOwner("Vaygr_Time_Attack_1_Resource", 3)
	SobGroup_SwitchOwner("Vaygr_Time_Attack_1_Dockers", 3)
	CPU_AddSobGroup(3, "Vaygr_Time_Attack_1")
	CPU_AddSobGroup(3, "Vaygr_Time_Attack_1_Carrier")
	CPU_AddSobGroup(3, "Vaygr_Time_Attack_1_Resource")
	CPU_AddSobGroup(3, "Vaygr_Time_Attack_1_Dockers")
	Rule_Remove("Rule_Vaygr_1_Go_For_Core")
	Rule_Remove("Rule_Vaygr_1_Have_Salvaged")
	Rule_Remove("Rule_Carrier_Destroyed")
	Rule_Remove("Rule_Vaygr_Leave_With_Core")
	Rule_Remove("Rule_Vaygr_1_Keep_Making_RC")
	Rule_Remove("Rule_Vaygr_1_Go_Independant")
	end
end

function Rule_Vaygr_1_Keep_Making_RC()
	if (SobGroup_Empty("Vaygr_Time_Attack_1_Resource") == 1) then
	if (SobGroup_Empty("Vaygr_Time_Attack_1_Carrier") == 0) then
	local createdcollector = SobGroup_CreateShip("Vaygr_Time_Attack_1_Carrier", "Vgr_ResourceCollector")
	SobGroup_SetSwitchOwnerFlag(createdcollector, 0)
	SobGroup_SwitchOwner(createdcollector, 2)
	SobGroup_SobGroupAdd("Vaygr_Time_Attack_1_Resource", createdcollector)
	SobGroup_SalvageSobGroup("Vaygr_Time_Attack_1_Resource", "Core_Piece_1")
	SobGroup_SetSpeed("Vaygr_Time_Attack_1_Resource", 0.3)
	if (SobGroup_Empty("Vaygr_Time_Attack_1_Dockers") == 0) then
	SobGroup_GuardSobGroup("Vaygr_Time_Attack_1_Dockers", "Vaygr_Time_Attack_1_Resource")
	end
	elseif (SobGroup_Empty("Vaygr_Time_Attack_2_Carrier") == 0) then
	local createdcollector = SobGroup_CreateShip("Vaygr_Time_Attack_2_Carrier", "Vgr_ResourceCollector")
	SobGroup_SetSwitchOwnerFlag(createdcollector, 0)
	SobGroup_SwitchOwner(createdcollector, 2)
	SobGroup_SobGroupAdd("Vaygr_Time_Attack_1_Resource", createdcollector)
	SobGroup_SalvageSobGroup("Vaygr_Time_Attack_1_Resource", "Core_Piece_1")
	SobGroup_SetSpeed("Vaygr_Time_Attack_1_Resource", 0.3)
	if (SobGroup_Empty("Vaygr_Time_Attack_1_Dockers") == 0) then
	SobGroup_GuardSobGroup("Vaygr_Time_Attack_1_Dockers", "Vaygr_Time_Attack_1_Resource")
	end
	end
	end
end

function Rule_Vaygr_1_Have_Salvaged()
	if (SobGroup_OwnedBy("Core_Piece_1") == 2 or SobGroup_OwnedBy("Core_Piece_1") == 2) then
	carrier_with_core = "carrier_with_core"
	temp_group = "temp_group"
	SobGroup_Create(carrier_with_core)
	SobGroup_Create(temp_group)
	SobGroup_FillProximitySobGroup("temp_group", "all_carriers", "Core_Piece_1", 100)
	SobGroup_FillShipsByType("carrier_with_core", "temp_group", "Vgr_Carrier")
	if (SobGroup_GroupInGroup("carrier_with_core", "Vaygr_Time_Attack_1_Carrier") == 1) then
	g_vaygr_carrier_with_core = 1
	end
	if (SobGroup_GroupInGroup("carrier_with_core", "Vaygr_Time_Attack_2_Carrier") == 1) then
	g_vaygr_carrier_with_core = 2
	end
	print("core is in carrier number "..g_vaygr_carrier_with_core)
	Timer_Start(0, g_time_for_vagryr_to_leave_with_core)
	Timer_Display(0)
	Subtitle_TimeCounter(0, 45405)
	Rule_Add("Rule_Carrier_Destroyed")
	Rule_Add("Rule_Vaygr_Leave_With_Core")
	Event_Start("speechevent_coreoncarrier")
	Rule_Remove("Rule_Vaygr_1_Have_Salvaged")
	end
end

function Rule_Carrier_Destroyed()
	if (SobGroup_Empty("Vaygr_Time_Attack_"..g_vaygr_carrier_with_core.."_Carrier") == 1) then
	Ping_Remove(ping_hyperspacedisturbance_id[1])
	SobGroup_Clear("Core_Piece_1")
	SobGroup_Spawn("Core_Piece_1_Backup", "Vaygr_Time_Attack_"..g_vaygr_carrier_with_core.."_Entry")
	SobGroup_SobGroupAdd("Core_Piece_1", "Core_Piece_1_Backup")
	ping_hyperspacedisturbance_id[1] = HW2_PingCreateWithLabel(ping_hyperspacedisturbance_1, "Core_Piece_1")
	Ping_AddDescription(ping_hyperspacedisturbance_id[1], 0, "$45400")
	Timer_Pause(0)
	Subtitle_TimeCounterEnd()
	Rule_Remove("Rule_Vaygr_Leave_With_Core")
	Rule_Remove("Rule_Carrier_Destroyed")
	Rule_Remove("Rule_Vaygr_1_Keep_Making_RC")
	end
end

function Rule_Vaygr_Leave_With_Core()
	if (Timer_GetRemaining(0) <= 0) then
	SobGroup_EnterHyperSpaceOffMap("Vaygr_Time_Attack_"..g_vaygr_carrier_with_core.."_Carrier")
	Event_Start("speechevent_coreescaped")
	Rule_Remove("Rule_Vaygr_Leave_With_Core")
	end
end

function Rule_Vaygr_Wave_2()
	SobGroup_ExitHyperSpace("Vaygr_Time_Attack_2", "Vaygr_Time_Attack_2_Entry")
	Rule_Add("Rule_Vaygr_2_Launch")
	Event_Start("speechevent_shieldedcarriers")
	Rule_Remove("Rule_Vaygr_Wave_2")
end

function Rule_Vaygr_2_Launch()
	if (SobGroup_AreAllInRealSpace("Vaygr_Time_Attack_2_Carrier") == 1) then
	SobGroup_SetAutoLaunch("Vaygr_Time_Attack_2_Carrier", ShipHoldLaunch)
	SobGroup_Launch("Vaygr_Time_Attack_2_Dockers", "Vaygr_Time_Attack_2_Carrier")
	SobGroup_Launch("Vaygr_Time_Attack_2_Resource", "Vaygr_Time_Attack_2_Carrier")
	SobGroup_SwitchOwner("Vaygr_Time_Attack_2_Dockers", 3)
	SobGroup_SwitchOwner("Vaygr_Time_Attack_2_Resource", 3)
	SobGroup_SwitchOwner("Vaygr_Time_Attack_2_Carrier", 3)
	SobGroup_SwitchOwner("Vaygr_Time_Attack_2", 3)
	Rule_Remove("Rule_Vaygr_2_Launch")
	end
end

g_CoreStates = {0, 0, 0}

function Rule_PlayerSalvagedCorePiece()
	for i = 1, getn(g_CoreStates) do
	if (SobGroup_OwnedBy("Core_Piece_"..i) == 0 and g_CoreStates[i] == 0) then
	print("Player has Core "..i)
	Ping_Remove(ping_hyperspacedisturbance_id[i])
	g_cores_retrieved = (g_cores_retrieved + 1)
	g_CoreStates[i] = 1
	end
	end
end

function Rule_CorePieceSalvaged_1()
	if (g_cores_retrieved == 1) then
	Event_Start("speechevent_firstpiecesalvaged")
	Rule_Add("Rule_CorePieceSalvaged_2")
	Rule_Remove("Rule_CorePieceSalvaged_1")
	end
end

function Rule_CorePieceSalvaged_2()
	if (g_cores_retrieved == 2) then
	Event_Start("speechevent_secondpiecesalvaged")
	Rule_Remove("Rule_CorePieceSalvaged_2")
	end
end

function Rule_PlayerHasAllCorePieces()
	if (g_cores_retrieved == 3) then
	Objective_SetState(obj_prim_retrievefragments_id, OS_Complete)
	if (HW2_PlayerHasMilitary(2) == 0 and HW2_PlayerHasMilitary(3) == 0) then
	Event_Start("intelevent_hsout")
	else
	obj_prim_destvaygr_id = Objective_Add(obj_prim_destvaygr, OT_Primary)
	Objective_AddDescription(obj_prim_destvaygr_id, "$45210")
	Event_Start("intelevent_eliminatevaygr")
	Rule_Add("Rule_GameEnd")
	end
	Rule_Remove("Rule_PlayerHasAllCorePieces")
	Rule_Remove("Rule_PlayerSalvagedCorePiece")
	end
end

function Rule_GameEnd()
	if (HW2_PlayerHasMilitary(2) == 0 and HW2_PlayerHasMilitary(3) == 0 and Objective_GetState(obj_prim_retrievefragments_id) == OS_Complete) then
	Objective_SetState(obj_prim_destvaygr_id, OS_Complete)
	Event_Start("intelevent_hsout")
	Rule_Remove("Rule_GameEnd")
	end
end

function Rule_PlayerLose()
	if (SobGroup_Empty(Players_Mothership) == 1) then
	Event_Start("speechevent_playerloses")
	Camera_FocusSobGroupWithBuffer(Players_Mothership, 3000, 3000, 0)
	Rule_Remove("Rule_PlayerLose")
	elseif (SobGroup_Empty(Players_Dreadnaught) == 1) then
	Event_Start("speechevent_playerloses")
	Camera_FocusSobGroupWithBuffer(Players_Dreadnaught, 3000, 3000, 0)
	Rule_Remove("Rule_PlayerLose")
	end
end

function Rule_PlaySaveGameLocationCard()
	Subtitle_Message("$3651", 3)
	Rule_Remove("Rule_PlaySaveGameLocationCard")
end

Events = {}
Events["intelevent_scoutdebris"] = {{HW2_Wait(3), {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""},}, {{"Camera_FocusSave()", ""}, HW2_LocationCardEvent("$45020", 6)}, {HW2_Wait(4)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$45030", 10)}, {{"Universe_EnableSkip(1)", ""}, HW2_Letterbox(1), HW2_Wait(2)}, {{"Sensors_Toggle(1)", ""}, HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45031", 10)}, {HW2_Wait(1)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Camera_Interpolate('here', 'Camera_Containment', 3)", ""}, {"g_pointer_default_2 = HW2_CreateEventPointerSobGroup('Core_Piece_2')", ""}, {"g_pointer_default_3 = HW2_CreateEventPointerSobGroup('Core_Piece_3')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45032", 10)}, {HW2_Wait(1)}, {{"Camera_Interpolate('here', 'Camera_Core', 3)", ""}, {"g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Core_Piece_1')", ""}, {"EventPointer_Remove(g_pointer_default_2)", ""}, {"EventPointer_Remove(g_pointer_default_3)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45033", 10)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45034", 10), {"EventPointer_Remove(g_pointer_default_1)", ""}, {"ping_hyperspacedisturbance_id[3] = HW2_PingCreateWithLabel(ping_hyperspacedisturbance_3, 'Core_Piece_3')", ""}, {"ping_hyperspacedisturbance_id[2] = HW2_PingCreateWithLabel(ping_hyperspacedisturbance_2, 'Core_Piece_2')", ""}, {"Ping_AddDescription(ping_hyperspacedisturbance_id[3], 0, '$45400')", ""}, {"Ping_AddDescription(ping_hyperspacedisturbance_id[2], 0, '$45400')", ""}, {"ping_hyperspacedisturbance_id[1] = HW2_PingCreateWithLabel(ping_hyperspacedisturbance_1, 'Core_Piece_1')", ""}, {"Ping_AddDescription(ping_hyperspacedisturbance_id[3], 0, '$45400')", ""},}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45035", 10)}, {HW2_Wait(1)}, {{"Camera_Interpolate('here', 'cmr_introposition', 2)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45037", 10), {"obj_prim_investigatecore_id = Objective_Add(obj_prim_investigatecore, OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_investigatecore_id, '$45200')", ""},}, {{"Sensors_Toggle(0)", ""}, {"Sensors_EnableCameraZoom(1)", ""}, HW2_Wait(1)}, {HW2_Letterbox(0), HW2_Wait(2), {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Universe_EnableSkip(0)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1), {"g_save_id = g_save_id + 1", ""},}, {{"Campaign_QuickSaveNb(g_save_id, '$6443')", ""},},}
Events["intelevent_foundcorepieces"] = {{HW2_Pause(1), HW2_Letterbox(1), {"Universe_EnableSkip(1)", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Wait(2)}, {{"Sensors_Toggle(1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45040", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45041", 10), {"g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Core_Piece_1')", ""}, {"g_pointer_default_2 = HW2_CreateEventPointerSobGroup('Core_Piece_2')", ""}, {"g_pointer_default_3 = HW2_CreateEventPointerSobGroup('Core_Piece_3')", ""},}, {HW2_Wait(1)}, {{"EventPointer_Remove(g_pointer_default_1)", ""}, {"EventPointer_Remove(g_pointer_default_2)", ""}, {"EventPointer_Remove(g_pointer_default_3)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45042", 10)}, {HW2_Wait(1)}, {{"obj_prim_retrievefragments_id = Objective_Add(obj_prim_retrievefragments, OT_Primary)", ""}, {"Objective_AddDescription(obj_prim_retrievefragments_id, '$45205')", ""}, {"Objective_AddDescription(obj_prim_retrievefragments_id, '$45206')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45043", 10)}, {HW2_Wait(0.3), {"Sensors_Toggle(0)", ""},}, {HW2_Letterbox(0), {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, HW2_Pause(0), HW2_Wait(2), {"Universe_EnableSkip(0)", ""},},}
Events["speechevent_firstpiecesalvaged"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45075", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45076", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_secondpiecesalvaged"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45080", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45081", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["intelevent_vaygrarrived"] = {{{"Universe_EnableSkip(1)", ""}, {"Camera_FocusSave()", ""}, {"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_Letterbox(1), HW2_Wait(2)}, {{"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(1)", ""}, {"Camera_Interpolate('here', 'Camera_Vaygr_Enter_1', 2)", ""}, {"Sound_MusicPlayType('data:sound/music/battle/Battle_04_ALT', MUS_Battle)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45045", 10)}, {HW2_Wait(1), {"SobGroup_ExitHyperSpace('Vaygr_AI_Carrier_Group', 'Vaygr_AI_Carrier_Entry')", ""}, {"SobGroup_ExitHyperSpace('Vaygr_Time_Attack_1', 'Vaygr_Time_Attack_1_Entry')", ""},}, {{"g_pointer_default_1 = HW2_CreateEventPointerSobGroup('Vaygr_Time_Attack_1')", ""}, {"FOW_RevealGroup('Vaygr_Time_Attack_1', 1)", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45046", 10)}, {HW2_Wait(1), {"EventPointer_Remove(g_pointer_default_1)", ""},}, {{"Sensors_Toggle(0)", ""}, {"Sensors_EnableCameraZoom(1)", ""}, HW2_Letterbox(0), HW2_Wait(2), {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"Universe_EnableSkip(0)", ""},}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1), {"g_save_id = g_save_id + 1", ""},}, {{"FOW_RevealGroup('Vaygr_Time_Attack_1', 0)", ""}, {"Campaign_QuickSaveNb(g_save_id, '$6444')", ""},},}
Events["speechevent_shieldedcarriers"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45050", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["intelevent_eliminatevaygr"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetCommand, "$45085", 10)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$45086", 10)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45087", 10)}, {{"Rule_Add ('Rule_PlaySaveGameLocationCard')", ""}, HW2_Wait(1), {"g_save_id = g_save_id + 1", ""},}, {{"Campaign_QuickSaveNb(g_save_id, '$6445')", ""},},}
Events["speechevent_vaygrgotcore"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45055", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45056", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45057", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_salvagerdestroyed"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45060", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45061", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45062", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_coreoncarrier"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45065", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45066", 10)}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["speechevent_coreescaped"] = {{{"Sound_EnterIntelEvent()", ""}, {"Sound_SetMuteActor('Fleet')", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45070", 10)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45071", 10)}, {HW2_LocationCardEvent("$45021", 4)}, {{"setMissionComplete(0)", ""},}, {{"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""},},}
Events["intelevent_hsout"] = {{{"Sound_SetMuteActor('Fleet')", ""}, {"Sound_EnterIntelEvent()", ""}, HW2_SubTitleEvent(Actor_FleetIntel, "$45090", 10)}, {HW2_Letterbox(1), HW2_Wait(3), {"Sensors_EnableCameraZoom(0)", ""}, {"Sensors_Toggle(0)", ""}, {"Camera_FocusSobGroupWithBuffer(Players_Mothership, 3000, 3000, 0)", ""},}, {HW2_SubTitleEvent(Actor_FleetCommand, "$45092", 10)}, {{"Universe_AllowPlayerOrders(0)", ""}, HW2_Fade(1), HW2_Wait(1)}, {{"Player_InstantlyGatherAllResources(0)", ""}, {"Player_InstantDockAndParade(0, Players_Mothership, 0)", ""}, HW2_Wait(1)}, {{"Subtitle_Message('$3652', 2)", ""}, HW2_Wait(2)}, {HW2_Fade(0), HW2_Wait(2)}, {HW2_SubTitleEvent(Actor_FleetIntel, "$45091", 10)}, {HW2_Wait(1)}, {HW2_SubTitleEvent(Actor_FleetCommand, "$45093", 10)}, {{"SobGroup_EnterHyperSpaceOffMap('Player_Ships0')", ""}, HW2_Wait(12)}, {{"Universe_Fade(1, 2)", ""},}, {{"Universe_AllowPlayerOrders(1)", ""}, {"Sound_ExitIntelEvent()", ""}, {"Sound_SetMuteActor('')", ""}, {"setMissionComplete(1)", ""},},}
Events["speechevent_playerloses"] = {{HW2_Pause(1), HW2_Letterbox(1), HW2_Fade(1), HW2_Wait(2), {"Universe_AllowPlayerOrders(0)", ""},}, {HW2_LocationCardEvent("$45021", 4)}, {HW2_Wait(2)}, {{"Universe_AllowPlayerOrders(1)", ""}, {"setMissionComplete(0)", ""},},}
