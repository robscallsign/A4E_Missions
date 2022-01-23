-- mission script loader
-- only for development purposes

scriptPath = "C:\\Hypeman\\A4_Airboss\\"
--local theatre = env.mission.theatre
--USE_SWAPR = true

assert(loadfile(scriptPath.."Moose.lua"))()
assert(loadfile(scriptPath.."ForrestalAirboss.lua"))()
