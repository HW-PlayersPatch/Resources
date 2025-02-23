-- ============================================================================= 
-- Homeworld 2 Clean Data Resource Project
-- By S110
-- Version 1.0
-- 02/06/2010
-- Tools used: EditPad Lite, LuaDC version 0.9.19, and Cold Fusion LUA Decompiler v1.0.0
-- =============================================================================

function AREA(width, height)
	return ((width / 1024) * (height / 768))
end

LOD0 = AREA(120, 200)
LOD1 = AREA(64, 128)
LOD2 = AREA(32, 64)
LOD3 = AREA(16, 32)
TINY = AREA(20, 20)

icons = {
	Idle = {LODs = {LOD0, "UI\\CommandIcons\\Idle.mres"}},
	Move = {LODs = {LOD0, "UI\\CommandIcons\\Move.mres"}},
	Attack = {LODs = {LOD0, "UI\\CommandIcons\\Attack.mres"}},
	Build = {LODs = {LOD0, "UI\\CommandIcons\\Build.mres"}},
	Dock = {LODs = {LOD0, "UI\\CommandIcons\\Dock.mres"}},
	Resource = {LODs = {LOD0, "UI\\CommandIcons\\Resource.mres"}},
	Launch = {LODs = {LOD0, "UI\\CommandIcons\\Launch.mres"}},
	WaypointMove = {LODs = {LOD0, "UI\\CommandIcons\\WaypointMove.mres"}},
	Parade = {LODs = {LOD0, "UI\\CommandIcons\\Parade.mres"}},
	Guard = {LODs = {LOD0, "UI\\CommandIcons\\Guard.mres"}},
	Capture = {LODs = {LOD0, "UI\\CommandIcons\\Capture.mres"}},
	Hyperspace = {LODs = {LOD0, "UI\\CommandIcons\\Launch.mres"}},
	MoveToSob = {LODs = {LOD0, "UI\\CommandIcons\\MoveToSob.mres"}},
	FormHyperspaceGate = {LODs = {LOD0, "UI\\CommandIcons\\Launch.mres"}},
	HyperspaceViaGate = {LODs = {LOD0, "UI\\CommandIcons\\Launch.mres"}},
	Repair = {LODs = {LOD0, "UI\\CommandIcons\\Repair.mres"}},
	Retire = {LODs = {LOD0, "UI\\CommandIcons\\Retire.mres"}},
	LayMines = {LODs = {LOD0, "UI\\CommandIcons\\LayMines.mres"}},
	Salvage = {LODs = {LOD0, "UI\\CommandIcons\\Salvage.mres"}},
	AttackMove = {LODs = {LOD0, "UI\\CommandIcons\\AttackMove.mres"}}}
