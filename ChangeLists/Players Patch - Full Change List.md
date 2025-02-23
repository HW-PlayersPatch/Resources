# Homeworld Remastered Players Patch
# Build 1-14 Full Change List | March 7, 2020

## Summary
The community created Homeworld Remastered Players Patch resolves many bugs, exploits, and balance issues. It includes the changes from Gearbox’s 2.205 Patch Preview (which was released in the 2023 2.3 Patch), plus hundreds of additional improvements. It enhances singleplayer and multiplayer while respecting the look, sound, and feel of Relic's classics. All changes from the Players Patch are listed below. Links: [Subscribe on Steam](http://steamcommunity.com/sharedfiles/filedetails/?id=1190476337), or [Download for GOG](http://www.moddb.com/mods/homeworld-remastered-players-patch).

## Gameplay Options and Features
* Added a Mission Difficulty adjuster. At the start of each campaign mission, extra enemy AI reinforcement ships and RU are added based on your fleet size and RU. This dynamic scaling difficulty can now be adjusted.
* Added a Vast unit cap option to multiplayer and Player vs CPU. This is double the size of Huge, and only recommended for very fast machines.
* Added an AI Attack Damage adjuster to multiplayer and player vs cpu. This can be used to increase the AI's attack damage for a more challenging game.
* Added an Observer mode to spectate multiplayer matches. When prompted to continue watching, click yes to observe.
* Added a Dual Command mode to allow one player to control two fleets. Change your race to a Dual Command race, and then change a CPU ally to the same Dual Command race. You will start with two fleets, double the starting RUs, double the research costs, and will have double the unit caps.
* Added a Camera Pan Speed adjuster. This lets players increase the camera speed to move around maps faster with the arrow keys and edge of screen mouse pan.
* Added a Camera Rotation Speed adjuster. This lets players increase the camera speed to rotate faster with the right mouse button.
* Added a Camera Max Zoom adjuster. This lets players increase the maximum distance the camera can zoom out before having to use the sensors manager.
* Added an option to change the Stance Buttons Order. This changes the order of the stance buttons in the UI to match HWR (Aggressive/Evasive/Neutral) or hw1c (Aggressive/Neutral/Evasive).
* Added a Max Tactical Overlay level that keeps unit feedback lines and ability spheres on all the time if desired.
* Added an option set the Default Tactical Overlay. This adjusts the default level of detail for the tactical overlay around units.
* Added an option to Show Base Production Times. This displays the base production times for ships and research items in the production popup menus. The value of research modifiers are also shown.
* Added a Build/Research/Launch Panel adjuster. This lets players set and save the size of the Build/Research/Launch menus in the options. Previously these were adjustable, but their size was not saved across games.

## HWR Bugs Fixes and Improvements
#### Exploits
* Prevented attempting to hyperspace ships inside a hyperspace inhibitor. This resolves the exploit to reset marine/infiltrator frigate capture progress for free, which previously rendered them useless. This hyperspace in gravity well exploit has finally been fixed!
* When salvage corvettes latch on and return enemy frigate/capital ships to their mothership or carrier, an exploit allowed those ships to be scuttled right before they were captured. This prevented salvage corvettes from capturing frigate/capital ships, however the salvage scuttle exploit has now been fixed!
* Addressed kamikaze exploits that allowed cheap ships to kill expensive ships, and that allowed squadrons to kill targets and then dock-heal for free.
#### General Bugs
* Addressed the major Cross Race Docking Bug. Fighters and corvettes will now only dock with ships from their own race. Previously, regenerated Hiigaran/Vaygr ships would be unable to launch from Kushan/Taiidan Repair Corvettes, Support Frigates, and Resource Controllers leading to major game lag and multiple glitches.
* When a docking squadron is under attack, they sometimes glitch out and stop moving. Affected Squadrons are now automatically issued another dock order to dock with the closest ship.
* When salvage corvettes in a formation are given multiple different salvage targets, they often crash the game. To prevent this crash, salvage corvettes will no longer be able to join formations/strikegroups.
* The Kushan/Taiidan Gravity Well ability previously continued to lock down strikecraft in an area after it had moved away. The area of affect now stays with the Gravity Well.
* The Taiidan Defense Fighter no longer shoots down missiles from allies.
* Fixed an issue where Ion Frigates wouldn't always align verticaly with their target.
* Fixed the bug that allowed Kushan/Taiidan players to build two research ships at once on separate carriers.
* Expert Taiidan AI now harvests resources at the same rate as the other races. (it was 10% higher by mistake)
#### General Improvements
* Included all the changes from Gearbox’s 2.205 Patch Preview (which was released in the 2023 2.3 Patch) as described [here](https://github.com/HWRM/KarosGraveyard/wiki/Patch-Changes). In summary:
    * Fixed Hiigaran Mothership visual errors, including the badge being cut off.
    * Fixed the Turanic Carrier Engine missing icon.
    * Many balance improvements/fixes
    * Note that the Players Patch does not distribute the updated Exe, which enables two developer changes around ship patching and traceHODs that only affect modding.
* Ships have always held their formation in aggressive stance, but now they also hold their formation in neutral stance like hw1c.
* Improved parade formations for resource collectors, to reduce collisions with the motherships.
* Kushan and Taiidan Support Frigates now keep units docked in Passive tactics and launch units in Offensive tactics. They can also now carry docked units through hyperspace like hw1c.
* The retaliation range has been reduced significantly on many special ability units. This is to prevent them from moving towards a distant battle on their own, which often leads to them dying without utilizing their special ability. This affects Hiigaran/Vaygr Minelayer Corvettes, Hiigaran Marine Frigates, Hiigaran Defense Field Frigates, Vaygr Infiltrator Frigates, Kushan/Taiidan Repair Corvettes, Minelayer Corvettes, and Support Frigates.
* Hiigaran Marine Frigates, Vaygr Infiltrator Frigates, Kushan/Taiidan repair ships, and all Minelayer corvettes are no longer included in the military selection priority. This prevents accidentally de-latching capture frigates, messing up repair orders, or messing up mine walls.
* Other than cruisers, all captured units can now be retired immediately like hw1c.
* Increased the unit limits for the Capital Phalanx, Frigate Line, Fighter Screen, and Wall strike groups/formations. They can now hold a total of 66 units, which appears to be the max in the HWR engine.
* Reduced the amount of small low-RU debris for destroyers and cruisers. This improves the game's performance in long games.
* Improved the AI's judgement of ship effectiveness values, so it can better build the appropriate counter ships.
* The score screen now treats ru spent on subsystems the same as ru spent on research for the building and research score total.
#### Gametypes
* Fixed a bug that prevented the Crates gameplay option from granting ships.
* The 'No Cruisers' game option text now displays in your current locale language rather than always in English.
* In the carrier only gamemode, all races now start with the same number of carriers.
* In the Strikecraft & Support Only game mode, Kushan Drone Technology research is now disabled as intended.
* In the Strikecraft & Support Only game mode, Vaygr carrier health now matches the other races as intended.
#### User Interface
* Fixed the build/research/launch menu scaling problem, that primarily affects 4k resolutions.
* Fixed the build and research queue pause buttons, so that they no longer get disabled.
* Improved the spacing in the build/research queues for better readability.
* Fixed the race specific research tabs, so that they are hidden based on the race your playing
* Slightly changed the advanced research module icon to differentiate it more from the regular research module icon.
* Kushan/Taiidan accuracy reduction abilities are now painted orange in the tactical overlay
#### Graphics
* Fixed Vaygr Battlecruiser gun muzzle effects
* Kushan/Taiidan repair ships now have a continuous beam like hw1c
* Kushan/Taiidan Repair Corvette heal beams now originate from the correct locations (previously they were healing from their guns).
* Kushan Research Ship's with all six hubs, now spin like they did in hw1c.
* Fixed the player colors on the Kushan Destroyer ion turrets.
* Fixed the player colors on the Kushan Heavy Cruiser ion turrets.
* Reduced the Kushan probe death explosion to an appropriate size.
* Fixed Taiidan Resource Controller nlips clipping (docked collectors would appear inside the controller when zoomed out).
* The Kadeshi Fuel Pod tactical overlay icon now uses a frigate icon rather than a probe icon.
#### Sound
* When a private message is sent, everyone in the lobby hears the audio alert even when they are not the recipient. As a workaround the audio alert has been removed, as the chat window already visually flashes for the recipient.
* Fixed Hiigaran Pulsar Corvette weapon sound effects (they were missing).
* Fixed Hiigaran Gunship weapon sound effects (they were playing pulsar sounds).
* Vaygr Battlecruiser Trinity Cannon now has enhanced sound effects based on the original intended sound from hw2c.
* Fixed Vaygr Battlecruiser gun sound effects.
* ‘Platform Complete’ audio is now played for Vaygr Gun Platforms and Missile Platforms.
* Fixed Kushan and Taiidan Defenders gun sound effects.
* Fixed Kushan and Taiidan Repair Corvette sound effects (so they no longer play gun noises while repairing).
* The 'Research Ship Complete' audio is now played after each additional Kushan/Taiidan Research Ship Hub is built.
* Kushan Ion Cannon Frigates are now pronounced correctly as 'Cannon', previously they were being pronounced as 'Cannit'.
* Kushan Drone Frigate's drones no longer produce fighter pilot combat audio.
* Kushan Drone Frigates no longer make such a loud explosion when all their drones die.
* Fixed Kushan Destroyer ion cannon sound effects.
* Fixed Taiidan Repair Corvette gun sound effects.
* 'Frigate Complete' audio is now played for Taiidan Ion Frigates.
* 'Resource Controller Complete' audio is now played for Taiidan Resource Controllers
* 'Generator Complete' audio is now played for Taiidan Cloaked Generators.
* Fixed Taiidan's Emperor voice, when playing the 'Homeworld 1 Deathmatch' game type (it was playing Vaygr's Makaan voice).
* The survive 40+ minute challenges now play the correct audio.
* More details on HWR's bugs can be found in the [HWR Bugs & Solutions](http://web.archive.org/web/https://forums.gearboxsoftware.com/t/hwr-bugs-solutions/1639765) thread.

## Campaign
* When hyperspacing at the end of a mission, ships are now set to Defensive rather than Passive similar to the classics.
### Homeworld 1
* Fixed a rules of engagement bug that caused many Turanic, Kadeshi, and Junkyard ships to sometimes stop attacking unexpectedly and behave passively.
* Updated the parade formations to better handle salvaged ships.
* Fixed the Turanic Missile Corvette's missile burn effects.
* Captured Turanic Standard Corvettes can now be repaired.
* Increased Turanic Ion Array Frigate speed to be relatively similar to hw1c (a bit slower than Kushan Ions).
* Enemy Kadeshi ships now have red hyperspace windows like hw1c.
* Updated research costs to match multiplayer, and research times to 1.5x slower than multiplayer (the campaign research is slower paced). These hadn't been updated since HWR v1.0. Mission resources were also adjusted to support the changes.
* Properly balanced kushan ships vs swarmers to better reflect hw1c gameplay. Corrected swarmer behavior so they dock correctly, and don't stop attacking unexpectedly.
#### Mission 3
* Increased the cryo tray health to be closer to hw1c gameplay. (Gearbox increased the health on most Kushan/Taiidan ships to balance vs Hiigaran/Vaygr upgrades, but forgot some campaign only ships).
* After salvaging the first frigate for research, most of the remaining frigates can now be captured like hw1c.
#### Mission 4
* Bentusi Trade research costs have been increased to align with normal research costs. However if your in a bind, you may be offered a discount.
* The objective is now complete as soon as the carrier is killed, rather than after the explosion animation finishes (to prevent a timing error).
#### Mission 6
* Bentusi Trade research costs have been increased to align with normal research costs. However if your in a bind, you may be offered a discount.
#### Mission 7
* The enemy AI reinforcements now work properly based on your starting fleet value.
* Fixed an issue where the multi-gun corvette research sometimes doesn't get enabled. 
#### Mission 8
* Increased kadesh multi-beam frigate health and speed to be relatively similar to hw1c.
* Lowered the accuracy of the kadesh mothership ion cannons vs moving fighters and corvettes.
* Kadesh ships now properly defend the final area like in hw1c.
#### Mission 10
* Fixed the camera location at the start of the mission.
### Homeworld 2
* Fixed a rules of engagement bug that caused Keeper ships to sometimes stop attacking unexpectedly and behave passively.
* Applied some research cost/build time changes from the 2.0, 2.1, and 2.205/2.3 patches. These changes were made in multiplayer, but were accidently missed in the campaign. The campaign research stats now better match multiplayer.
* The base health of Vaygr missile platforms, destroyers, cruisers, and flagships have been slightly tweaked to align with multiplayer as they did in hw2c.
* Sajuuk's hyperspace transit and recovery times now match the Dreadnaught, previously it was very slow.
#### Mission 2
* The mothership's engine speed now matches the audio cues and hw2c.
* The transport ships' speed now increases after events as they did hw2c. 
* Increased Captain Soban's weapon damage to match hw2c.
#### Mission 5
* Lowered the Vaygr captial ship health upgrade to be closer to hw2c. (this was unintentionally altered in the 2.0 patch)
#### Mission 9
* After the dreadnaught repairs complete and it undocks, the 'dock dreadnaught' warning bug no longer occurs.
#### Mission 13
* Lowered the Vaygr corvette, frigate, and captial ship health upgrades to be closer to hw2c. (these were unintentionally altered in the 2.0 patch)
* Dreadnought weapon beam effects are now fully visible.



## Balance
* This section covers balances changes and balance related bug fixes. The 2.3 Patch has many bugs that render some units overpowered, underpowered, or useless.
* The Players Patch makes units relatively closer to their classic stats, performance, and feel while enabling balance across all races. The goal is to make all units useful and effective at what they are supposed to do, while utilizing ballistic/simulation combat features (so for example idle ships are generally easier to hit than moving ships).
* Fixed the major [666 Formation Targeting Bug](http://web.archive.org/web/https://forums.gearboxsoftware.com/t/666-formation-targeting-bug/1541832) - Formations and squadrons now perform as they were intended to! With the 666 bug resolved, all fighters and corvettes went through a very thorough balance testing process. Tweaks were made as needed to align them with intended balance that Gearbox and the balance testers had crafted.
* Thousands of ship vs ship tests have been performed with Gearbox's developer balance testing tools, to fine tune combat performance for skilled and casual players alike.
* Balanced dock repair times for fighters and corvettes. Addressed a bug that caused squadrons to dock extremely fast. hw2 ships now repair slower, closer to their hw2c rate. hw1 corvettes repair 4.5x faster than before, to balance vs hw2.
* Decreased the sensors range of all scouts and probes by about 20%, and 30% for the cheaper Kushan/Taiidan scouts. Scouting is easy in HWR compared to other RTS games, so this is intended to make information harder to obtain.
* Friendly fire reduced from 50% to 45% to make it a bit harder for scouts to EMP themselves.
* Kamikaze damage adjusted on some units to prevent exploits, and resolve typos.
* Hyperspace exit damage lowered from 25% to 10%, when running into a hyperspace inhibitor.
* Lowered death/scuttle blast range on frigates, motherships, carriers, shipyards, and battle cruisers (so fighters and corvettes can better survive capital ship battles).
* Movement speed while being repaired increased from 65% to 80%.
* Tweaked rotational speeds on some units, for example to aid in positioning motherships around asteriod patches.
* Fighters and corvettes in evasive stance now do 20% less damage (Aggressive 120%, Neutral 100%, Evasive 100%->80%).
* Removed evasive stance bonuses from non-combat/utility ships (evasive stance re-routes power from weapons to engines, however this is not possible on non-combat ships and had no effect in hw1c)
* Damaged resource collectors latched onto RU drop-offs now heal 2.5 times faster (so they don't clog up resource drop-offs for so long).
* Fixed several issues that made it hard for some ships to kill probes
* High unit caps: Destroyers 9->7, Missile Destroyers 4->3, Cruisers 4->3. Huge unit caps: Destroyers 11->14.
* Note: the base research times below get faster with each research ship/module.


 
### Hiigaran
* Hiigaran is largely the same as in Homeworld 2 Classic (hw2c), but with several improvements and many tweaks for better balance vs hw1 races. The biggest difference from hw2c is single tiered upgrades to balance against Homeworld 1 races that do not have upgrades (as implimented in the 2.0 patch).
* Hyperspace time reduced from 9.5 to 7 seconds for all non-production ships to add some race flavor.

#### Scouts
* Speed 512->480 (All scouts are now slower to make scouting harder)
* EMP Weapon:
    * Range 3000->1500 (Improves accuracy vs moving targets)
    * Now leads targets
    * Accuracy vs corvettes 0.15->1.0
    * Hiigaran scouts can now EMP frigates with just three squads, rather than six (Hiigaran EMP isn't very accurate vs fighters, so its now a bit better vs frigates than vaygr for some race flavor).
    * Kushan and Taiidan fighters and corvettes can now be EMP'd with just one squad of scouts, rather than two squads like before.

#### Interceptors
* Weapon:
    * Damage vs corvettes 0.55->0.29
    * Damage vs platforms 0.7->0.4

#### Bombers
* Speed Upgrade:
    * Cost 600->400 (to balance vs Vaygr)
* Speed 279->300
* Weapons:
    * Now check their line of fire (like the other races do, to avoid friendly fire incidents)
    * Velocity 1200->1800 (so they can hit subsystems on moving carriers)
    * Damage vs corvettes 1.0->0.7
    * Damage vs frigates 1.0->1.2
    * Damage vs resourcing 0.2->0.17
    * Accuracy vs corvettes 0.8->0.2

#### Gunship Corvettes
* Weapon:
    * Velocity 1500->1600
    * Damage vs frigates 0.8->0.7
    * Damage vs resourcing 0.8->0.6

#### Pulsar Gunship Corvettes
* Weapon:
    * Damage vs hw2 corvettes 0.95->0.63 (to balance vs Vaygr)
    * Damage vs frigates 1.5->1.35
    * Damage vs resourcing 0.59->0.4
    * Accuracy vs resourcing 0.6->0.5

#### Minelayer Corvettes
* Cost 800->400 (to balance vs hw1)
* Aggressive stance damage +32%->+10%
* Mine Duration 200->60 (to avoid stalemates)

#### Flak Frigates
* Armor 18000->18500

#### Torpedo Frigates
* Weapon:
    * Damage vs resourcing 1.3->1.15 (closer to hw2c effectiveness)

#### Ion Cannon Frigates
* Weapon:
    * Accuracy vs corvettes 0.24->0.06
    * Firing arc 6->12 (so it doesn't have to line up so precisely with its targets)

#### Marine Frigates
* Armor 20k->22k

#### Defense Field Frigates
* Speed 177->220
* Armor 20k->22k (since this ship can't be upgraded)

#### Motherships
* Weapon:
    * Damage vs fighters 3.0->2.25

#### Carriers
* Build Speed Upgrade:
    * Cost 1500->2250

#### Shipyards
* Weapon:
    * Damage vs fighters 3.0->1.0
    * Addressed a gun alignment bug. They were shooting to the side of their targets, and rarely landing hits vs small targets like probes, fighters, and corvettes.

#### Destroyers
* Armor 85k->90k (closer to hw2c when upgraded)
* Armor Regeneration Time 1074->750

#### Battlecruisers
* Gun Weapons:
    * Range 5000->4500
* Ion Weapons:
    * Range 6000->5500

#### Gun Platforms
* Speed 100->125 (to match hw2c)

#### Ion Cannon Platforms
* Health Upgrade:
    * Time 120->100
* Speed 100->125 (to match hw2c)
* Weapon:
    * Damage 600->500

#### Resource Collectors
* Armor Upgrade:
    * Cost 800->1000
    * Value 2.0->1.6
* Repair Research:
    * Cost 750->350
    * Time 40->25
* Kamikaze multiplier 0.2->0.6

#### Probes
* Cost 70->150
* Build Time 10->15
* Armor 800->400 (its now half way between hw1c and hw2c, as some ships were taking too long just to kill a probe.)

#### Proximity Sensors
* Cost 150->250
* Build Time 15->20
* Armor 800->400

#### Sensors Distortion Probes
* Build Time 20->30
* Armor 800->400
* Ability to reduce enemy sensor range is a bit stronger now.

#### Fire Control Tower Modules
* Now affect the ship they are on. (this is intended to balance two Hiigaran cruisers with FCTs vs two Vaygr cruisers with command corvettes)

#### Hyperspace Sensors Modules
* Cost 250->500
* Build Time 35->45

#### Anti-Cloaking Sensors Modules
* Cost 250->500
* Build Time 35->45



### Vaygr
* Vaygr is largely the same as in Homeworld 2 Classic (hw2c), but with several improvements and many tweaks for better balance vs hw1 races. The biggest difference from hw2c is single tiered upgrades to balance against Homeworld 1 races that do not have upgrades (as implimented in the 2.0 patch).

#### Scouts
* Speed 420->350 (All scouts are now slower to make scouting harder. When upgraded they are about the same speed as interceptors)
* Weapon:
    * Addressed a gun alignment bug. They were shooting to the side of their targets, and rarely landing hits vs small targets like probes and fighters.
    * Vaygr scouts can now EMP frigates with just four squads like hw2c, rather than six.
    * Kushan and Taiidan fighters and corvettes can now be EMP'd with just one squad of scouts, rather than two squads like before.

#### Assault Craft
* Weapon:
    * Damage corvettes vs 0.55->0.29
    * Damage vs platforms 0.7->0.4

#### Bombers
* Speed 279->300
* Weapons:
    * Velocity 1200->1800 (so they can hit subsystems on moving carriers)
    * Damage vs corvettes 1.0->0.7
    * Damage vs frigates 1.05->1.1
    * Damage vs resourcing 0.2->0.17
    * Accuracy vs corvettes 0.8->0.2

#### Lance Fighters
* Small/High unit caps increased to match bombers
* Speed 279->300
* Armor 90->110
* Weapon: (after the 666 bug was fixed, this weapon was overperforming vs everything)
    * Damage vs fighters 1.0->0.3
    * Damage vs corvettes 1.0->0.61
    * Damage vs frigates/capitals 1.0->0.4
    * Damage vs platforms 1.0->0.6
    * Damage vs resourcing 0.6->0.5

#### Corvettes
* Armor Upgrade:
    * Cost 1600->1800 (to balance vs Hiigaran)

#### Missile Corvettes
* Kamikaze multiplier 1.0->0.6 (To prevent exploits)
* Weapon:
    * Damage vs hw1 corvettes 0.2->0.4 (now performs similarly vs hw1 and hw2 corvettes)

#### Laser Corvettes
* Kamikaze multiplier 0.7->0.6 (To prevent exploits)
* Laser Corvettes were the only corvettes negatively impacted by the 666 Bug. They are now performing as intended: the best anti-frigate and anti-capital ship corvette in the game.
* Weapon:
    * Damage vs resourcing 0.24->0.12

#### Command Corvettes
* Cost 400->600
* Build Time 30->45 (slows down the replenishment of these powerful units)
* Ability damage/accuracy effect range 4500->2200 (forces these ships to be on the front line so they can be countered)

#### Minelayer Corvettes
* Cost 800->400 (to balance vs hw1)
* Aggressive stance damage +32%->+10%
* Mine Duration 200->60 (to avoid stalemates)

#### Assault Frigate
* Armor 17000->18500
* Gun Weapons:
    * Damage vs resourcing 1.0->0.6

#### Heavy Missile Frigates
* Weapon:
    * Range 4000->3750 (closer to hw2c's 3500)

#### Infiltrator Frigates
* Armor 20k->22k

#### Capital Ships
* Armor Upgrade:
    * Cost 4000->3500

#### Flagships
* Weapon:
    * Damage vs fighters 3.0->2.25

#### Carriers
* Build Speed Upgrade Cost 1500->2500

#### Shipyards
* Weapon:
    * Damage vs fighters 3.0->1.0

#### Destroyers
* Armor 85k->90k (closer to hw2c when upgraded)

#### Battlecruisers
* Missile Launcher Weapon:
    * Range 6000->5500 (All race cruiser ranges were reduced)
* Trinity Cannon Weapon
    * Range 5550->5050 (Being on the nose of the ship, the trinity cannon has 50 more effective range than all other cruiser weapons. With precise micro, vaygr can slightly out-range other cruisers and win.)
    * Firing arc 6->12 (so it doesn't have to line up so precisely with its targets)

#### Platforms
* Armor Upgrade:
    * Cost 1500->1600
    * Time 150->140

#### Gun Platforms
* Speed 100->125 (to match hw2c)

#### Heavy Missile Platforms
* Speed 100->125 (to match hw2c)
* Weapon:
    * Fire Delay 11->15 (same as hw2c)

#### Hyperspace Gate Platforms
* Build Time 45->25 (these took too long to setup)
* Speed 650->600 (to match hw2c as they should not be faster than a probe)
* Armor 18500->25900
* The gate is now able to hyperspace jump on its own.
* All probes can now travel through hyperspace gates.

#### Utility Ships
* Armor Upgrade:
    * Cost 1200->1400
    * Value 2.0->1.6

#### Mobile Refinerys
* Repair Research:
    * Cost 500->250
    * Time 30->20
* Speed 280->276
* Kamikaze multiplier 0.2->0.6
* Resource capacity 208->200 -4% (Now matches hw2c and Hiigaran. Vaygr still start with one extra collector to make up for their Flagship's long collector drop off route. Harvesting for all four races is now balanced.)

#### Probes
* Cost 70->150
* Build Time 10->15
* Armor 800->400 (its now half way between hw1c and hw2c, as some ships were taking too long just to kill a probe.)

#### Proximity Sensors
* Cost 150->250
* Build Time 15->20
* Armor 800->400

#### Sensors Distortion Probes
* Build Time 20->25
* Armor 800->400
* Ability to reduce enemy sensor range is a bit stronger now.

#### Fire Control Tower Modules
* Now affect the ship they are on.

#### Hyperspace Sensors Modules
* Cost 250->500
* Build Time 35->45



### Kushan and Taiidan
* Overhauled Kushan and Taiidan. These races were rushed into HWR at release, and repeatedly band-aided over the previous patches. All ship speeds, armor, costs, build times, and research costs/times are now consistently translated into the HWR engine, with a robust [design methodology](https://github.com/HW-PlayersPatch/File_Share/tree/master/BalanceInfo). Kushan and Taiidan now feel much more like hw1 classic, while being better balanced against Hiigaran and Vaygr.
* Adjusted Kushan/Taiidan harvesting so that harvesting for all four races is balanced at the 10, 20, and 30 minute marks. Previously hw1 was behind hw2 at 10mins, and ahead at 30minutes. Harvesting is also now better balanced on maps with different asteriod layouts.
* Generally research costs have gone up, while research times have come down. This improves balance vs hw2 upgrade costs, while allowing hw1 to tech up faster, eliminating some pain points.
* Non-attackable subsystem icons now appear in the UI for Kushan/Taiidan Motherships and Carriers after researching Fighter, Corvette, Frigate, and Capital Ship research.
* Removed hidden armour modifiers from all ships other than frigates. Relic only applied armour modifiers to frigates, however Gearbox used them sporadically on hw1 units.
* Corvettes now move around their targets a lot more in combat (similar to hw1c). Corvettes also now respond quickly to certain attack orders, without a long delay.
* Race specific unit abilities now perform closer to hw1c, details are below.
* Many changes below are to make ships relatively similar to hw1c, while also providing for better balance vs hw2 races.

#### Scouts
* Cost 70->90
* Speed 490->460 (All scouts are now slower to make scouting harder)
* Speed Burst:
    * Multiplier 1.25->1.10
    * Duration 50->10 (closer to hw1c)
    * Recharge 120->40
    * Can now be activated without full energy.
* Weapon:
    * Damage vs fighters 0.5->0.41
    * Damage vs corvettes 0.55->0.3
    * Damage vs platforms 0.8->0.6
    * Damage vs resourcing 0.79->0.45
    * Kushan and Taiidan Scouts are now balanced, previously Kushan would always win. (Not intended)

#### Interceptors
* Fighter Drive Research:
    * Cost 100->200
    * Time 35->20
* Fighter Chassis Research:
    * Cost 200->300
    * Time 50->30
* Build Time 7->9
* Weapon:
    * Damage vs corvettes 0.55->0.33
    * Damage vs platforms 0.7->0.5
    * Kushan and Taiidan Interceptors are now balanced, previously Taiidan would always win. (Not intended)

#### Defenders
* Defender Sub-Systems Research:
    * Cost 400->800
    * Time 90->75
* Build Time 9->7
* Armor -10% (removed a hidden multiplier)
* Armor 360->400
* Weapon:
    * Velocity 1200->1750

#### Attack Bombers
* Plasma Bomb Launcher Research:
    * Now required to unlock bombers in multiplayer, like hw1c.
    * Cost 400
    * Time 40
* Cost 120->130
* Speed 390->420
* Weapon:
    * Velocity 1200->1800 (so they can hit subsystems on moving carriers)
    * Damage vs fighters/corvettes 1.0->0.7
    * Damage vs frigates 1.4->1.6
    * Damage vs capitals 1.1->1.5
    * Damage vs platforms 0.7->0.85
    * Damage vs resourcing 0.2->0.23
    * Damage vs subsystems 2.5->2.0

#### Kushan Cloaked Fighters
* Cloaked Fighter Research:
    * Cost 500->1000
* Build Time 15->12
* Cloak ability now lasts indefinitely (same as hw1c)
* Now repair themselves in 60 seconds when idle and not taking damage
* Weapon:
    * Damage vs corvettes 0.6->0.8

#### Taiidan Defense Fighters
* Defense Fighter Research:
    * Cost 500->1000
* Built Time 18->12
* Armor +20% (removed a hidden multiplier)
* Armor 135->300
* Attack style is now closer to hw1c. Their laser weapon has been adjusted to be more consistent, and it now prioritizes mines over missiles.
* Added an accuracy reduction within the field of -1% (similar to Field Frigates, but a smaller effect)

#### Repair Corvettes
* Build Time 20->16
* Speed 255->320 (to be able to heal the fastest corvette)
* Armor -20% (removed a hidden multiplier)
* Healing beam arc increased

#### Salvage Corvettes
* Corvette Chassis Research:
    * Cost 900->700
    * Time 90->60
* Build Time 30->25
* Armor 1000->1200
* Can now kamikaze

#### Light Corvettes
* Corvette Drive Research:
    * Cost 800->1000
    * Time 100->75
* Cost 225->215
* Build Time 18->17
* Speed 285->305
* Weapon
    * Damage vs fighters 1.2->1.6
    * Damage vs frigates 0.8->0.7
    * Damage vs resourcing 0.7-0.4
    * Accuracy vs resourcing 0.9->0.7

#### Heavy Corvettes
* Heavy Corvette Research:
    * Cost 600->400
* Cost 285->230
* Build Time 22->19
* Speed 245->290
* No longer prioritize attacking fighters (since they aren't very good vs fighters)
* Weapon:
    * Damage vs hw2 fighters 1.0->0.5
    * Damage vs frigates 1.0->1.1
    * Damage vs resourcing 0.85->0.4
    * Accuracy vs resourcing 0.5->0.6
    * Kushan and Taiidan Heavy Corvettes are now balanced, previously Taiidan would always win. (Not intended)

#### Multi-Gun Corvettes
* Fast-Tracking Turret Research:
    * Cost 700->500
* Cost 300->225
* Build Time 22->21
* Speed 275->320
* Armor 1100->1400
* Weapon
    * Velocity 1500->1700
    * Damage vs fighters 1.8->0.88
    * Damage vs corvettes 1.0->0.85
    * Accuracy vs fighters 0.9->0.75

#### Minelayer Corvettes
* Minelaying Tech Research:
    * Cost 700->1200
    * Time 70->100
* Cost 275->325
* Build Time 25->35
* Speed 246->255
* Armor -20% (removed a hidden multiplier)
* Armor 900->1800
* Aggressive stance damage +32%->+10%
* Mine Duration 200->60 (to avoid stalemates)

#### Support Frigates
* Capital Ship Drive Research:
    * Cost 800->1000
    * Time 100->75
* Cost 800->600
* Build Time 85->65
* Armor 26k->21k
* Healing beam arc increased

#### Assault Frigates
* Capital Ship Chassis Research:
    * Cost 1400->1200
    * Time 120->90
* Cost 800->700
* Build Time 68->60
* Now prioritize attacking corvettes over frigates.
* Rebalanced weapons to be more consistent vs fighters and corvettes, by increasing accuracy and decreasing damage.
* For Taiidan, fixed a gun alignment bug which caused 2 of their 4 guns to always miss small targets.
* Gun Weapons:
    * Tracking speed 25->40
    * Damage vs fighters 0.45->0.1
    * Damage vs corvettes 0.5->0.16
    * Accuracy vs fighters 0.15->0.9
* Plasma Bomb Weapon:
    * Damage vs corvettes 1.25->0.5
    * Accuracy vs corvettes 0.55->0.7

#### Ion Cannon Frigates
* Ion Cannon Research:
    * Cost 1000->1700
    * Time 90->120 (same timing, considering the capital ship chassis research buff)
* Cost 900->800
* Build Time 73->60
* Weapon:
    * Accuracy vs corvettes 0.24->0.08
    * Firing arc 6->12 (so it doesn't have to line up so precisely with its targets)

#### Kushan Drone Frigates
* Drone Tech Research:
    * Time 40->80
* Build Time 77->70
* Speed 166->206
* Armor 25500->27500
* Drone ability now lasts indefinitely and drones deploy 70% faster (same as hw1c).
* Drones now attack while the frigate is moving. Previously the drones rarely ever fired while the frig was moving.
* Weapon:
    * Damage 15->50
    * Fire Delay 0.3->1.0 (Increased damage and reduced fire rate to improve the game's performance when these units are on the field)
    * Velocity 1700->2100
    * Damage vs fighters 1.0->0.15
    * Damage vs corvettes 1.0->0.07
    * Damage vs frigates 0.7->0.2
    * Damage vs capitals 0.88->0.25
    * Damage vs platforms 1.0->0.2
    * Damage vs resourcing 0.47->0.25
    * Accuracy vs fighters 0.7->0.9
    * Accuracy vs corvettes 0.25->0.75
    * Accuracy vs frigates/capitals 0.55->0.9

#### Taiidan Field Frigates
* Defense Field Research:
    * Time 40->80
* Build Time 77->70
* Speed 166->206
* Armor 26k->30k

#### Motherships
* Armor -15% (removed a hidden multiplier)
* Multiplayer Only: Armor 280k->420k (to match an upgraded Hiigaran Mothership)

#### Carriers
* Super Capital Ship Drive Research:
    * Cost 1300->1500
    * Time 100->50
* Cost 3000->3500 (with a frigate module Hiigaran is 3800 and Vaygr is 3100)
* Build Time 210->130 (it was a huge blow to lose a carrier, since they took so long to build)
* Armor 105k->120k

#### Missile Destroyers
* Now count againt the destroyer unit cap like hw1c.
* Guided Missile Research:
    * Cost 1400->3500
    * Time 60->120
* Cost 2000->2500
* Speed 130->145
* Armor 65k->106k
* Weapon:
    * Range 4500->4000
    * Damage vs fighters 0.576->0.58
    * Damage vs corvettes 1.25->0.8
* Missile Volley:
    * Range 4500->4000
    * Fire Delay 30->70 (closer to hw1c)
    * Damage vs fighters 0.576->0.72
    * Damage vs frigates 1.0->2.0
    * Damage vs capitals 1.0->2.5
    * Damage vs platforms 0.32->1.5
    * Damage vs resourcing 0.32->1.5

#### Destroyers
* Super Heavy Chassis Research:
    * Cost 1900->4000
    * Time 75->140
* Cost 2500->2250
* Build Time 160->145 (to balance vs hw2)
* Armor 106k->112k
* Weapon:
    * Damage vs fighters 1.0->0.5
    * Damage vs corvettes 1.0->0.5

#### Heavy Cruisers
* Heavy Gun Research:
    * Cost 5500->7000
* No longer take hyperspace damage when they hit an inhibitor/GW. (like hw2 cruisers)
* Gun Weapons:
    * Range 5500->5000
* Ion Weapons:
    * Range 5300->4800

#### Resource Collectors
* Small unit caps: 18->20. Normal unit caps: 22->24. High unit caps: 26->28. Huge unit caps: 30->33. Total resource class unit caps have also been increased accordingly. (Harvesting buff to better balance hw2's ability to dock heal fighters and corvettes for free)
* Cost 600->500
* Build Time 50->40
* Speed 110->206 (to match assault frigates speed like hw1c)
* Armor 6000->5000
* Resource capacity 500->250
* Kamikaze multiplier 0.2->0.6
* Minimum hyperspace cost 300->350

#### Resource Controllers
* Speed 100->190
* Armor -10% (removed a hidden multiplier)
* Armor 25k->30k

#### Research Ships
* Build Time 50->45 (the first hub now builds as fast as the rest)
* Speed 100->175
* Taiidan Armor 30k->45k (to match Kushan Armor)

#### Probes
* Cost 70->150
* Armor 800->400 (its now half way between hw1c and hw2c, as some ships were taking too long just to kill a probe.)

#### Proximity Sensors
* Proximity Sensor Research:
    * Cost 250->500
* Cost 150->250
* Build Time 6->20
* Speed 350->450
* Armor 800->400
* Can now guard ships (like hw1c)

#### Sensors Arrays
* Sensor Array Research:
    * Time 80->50
* Cost 700->500
* Build Time 70->50
* Speed 90->175

#### Gravwell Generators
* Gravity Generator Research:
    * Time 50->100
* Cost 800->1000
* Armor +20% (removed a hidden multiplier)
* Armor 18k->11k
* Ability duration 30->25 (they are extremely effective with ballistics)
* Ability update interval 1.9->1 (so ships are caught faster)
* Can now be repaired (like in hw1c)

#### Cloak Generators
* Cloak Generator Research:
    * Cost 800->500
    * Time 100->50
* Cost 800->600
* Speed 165->206
* Armor +20% (removed a hidden multiplier)
* Ability range 1000->2000
* Ability duration 100->120
