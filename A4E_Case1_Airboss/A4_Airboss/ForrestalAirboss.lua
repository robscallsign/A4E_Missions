-- DCS A-4E Community Naval Avaiation Mission
-- Caucasus Map, CV-59 USS Forrestal
-- Designed for the A-4E-C 2.0+ community mod
--
-- Assets:
--
-- 262
-- 268 
-- 
-- 50 miles - enter Marshall. 404 Forrestal inbound for Marshall 7.5, marking moms 180 for 45 angels 17, state 7.5
-- 
-- Button 1: Approach 264Mhz
-- Button 2: Marshall 265Mhz
-- Button 3: LSO 256Mhz
-- Button 4: Low Tanker - 254
-- Button 5: High Tanker - 250
-- Button 6: Awacs
--
-- 
-- Arco: 268Mhz, Angles 15, Tacan 55X ARC

AIRBOSS.MenuF10Root=MENU_MISSION:New("Airboss").MenuPath
_SETTINGS:SetPlayerMenuOff()

cvUnitName = "CV59"
local hightanker=RECOVERYTANKER:New(UNIT:FindByName(cvUnitName), "Arco")
hightanker:SetTakeoffAir()
hightanker:SetRadio(250)
hightanker:SetAltitude(15000)
hightanker:SetRacetrackDistances(20, 5)
hightanker:SetModex(611)
hightanker:SetTACAN(55, "ARC")
hightanker:SetSpeed(336)
hightanker:Start()

--Recovery Tankers   *Callsign parameters (1=Texaco, 2=Arco, 3=Shell)
local tanker=RECOVERYTANKER:New(UNIT:FindByName(cvUnitName), "Texaco")
-- tanker:SetTakeoffHot()
-- tanker:SetCallsign(CALLSIGN.Tanker.Texaco, 1)
tanker:SetTakeoffAir()
tanker:SetRadio(254)
tanker:SetModex(511)
-- tanker:SetSpeed(300)
-- tanker:SetRacetrackDistances(10, 6) -- go for default
-- tanker:SetAltitude(6000) -- go for default
tanker:SetTACAN(60, "TKR")
tanker:__Start(3)

local forrestal=AIRBOSS:New(cvUnitName)

forrestal:SetMenuRecovery(60, 29, true, 0)
forrestal:Load()
-- forrestal:SetAutoSave()
forrestal.trapsheet = false
forrestal:SetTACAN(59, "X", "ZIP")
forrestal:SetICLS(9,"FOR")
forrestal:SetLSORadio(256,AM)
forrestal:SetMarshalRadio(265, AM)
forrestal:SetPatrolAdInfinitum()
forrestal:SetAirbossNiceGuy()
forrestal:SetRadioRelayLSO("Forrestal LSO Huey")
forrestal:SetRadioRelayMarshal("Forrestal Huey")
forrestal:SetDefaultPlayerSkill(AIRBOSS.Difficulty.NORMAL)
forrestal:SetMaxSectionSize(4)
forrestal:SetMPWireCorrection(12)
forrestal:SetSoundfilesFolder("Airboss Soundfiles/")
forrestal:SetDespawnOnEngineShutdown()
forrestal:SetMenuSingleCarrier(true)

-- list to stop AI from recovering at the boat
local CarrierExcludeSet=SET_GROUP:New():FilterPrefixes("Arco"):FilterStart()

--- Function called when recovery starts.
local function play_recovery_sound()
  trigger.action.outSound("Airboss Soundfiles/BossRecoverAircraft.ogg")
end

function forrestal:OnAfterRecoveryStart(Event, From, To, Case, Offset)
  env.info(string.format("Starting Recovery Case %d ops.", Case))
  timer.scheduleFunction(play_recovery_sound, {}, timer.getTime() + 10)
  -- spawnsCVOff() -- probably swapr, just ignore
end

forrestal:SetExcludeAI(CarrierExcludeSet)

-- Start airboss class.

forrestal:Start()

function tanker:OnAfterStart(From,Event,To)
	forrestal:SetRecoveryTanker(tanker)
end

function forrestallRecovery()
	-- trigger.action.outText("Forrestal Start Recovery",10,true)
	-- timer.scheduleFunction(play_recovery_sound, {}, timer.getTime() + 10)
	forrestal:AddRecoveryWindow(nil)	
end

timer.scheduleFunction(forrestallRecovery, {}, timer.getTime() + 3)
