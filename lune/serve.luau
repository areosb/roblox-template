local process = require("@lune/process")
local task = require("@lune/task")

local function larvae()
	print("Processing Larvae...")

	local result = process.exec("larvae", {
		"process",
		"-w",
	})

	if not result.ok then
		print("Larvae failed:")
		print(result.stdout)
	end
end

local function rogen()
	print("Processing Rogen...")

	local result = process.exec("rogen", {
		"watch",
	})

	if not result.ok then
		print("Rogen failed:")
		print(result.stderr)
	end
end

local function rojo()
	print("Serving Rojo...")

	local result = process.exec("rojo", {
		"serve",
		".larvae/build.project.json",
	})

	if not result.ok then
		print("Rojo Failed:")
		print(result.stderr)
	end
end

local function serve()
	task.spawn(larvae)
	task.spawn(rogen)
	task.spawn(rojo)
end

serve()
