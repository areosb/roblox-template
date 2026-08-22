--!strict
local Lest = require("@lest")
local rng = require("../../src/systems/shared/rng")
local _describe, it, expect = Lest.describe, Lest.it, Lest.expect

local function test()
	local ROLLS = 10_000
	local PRECISION = 1
	local SEED = 1234567890

	math.randomseed(SEED)

	local weights = {
		Common = 70,
		Rare = 25,
		Legendary = 5,
	}

	local expected: { [string]: number } = {
		Common = 0.70,
		Rare = 0.25,
		Legendary = 0.05,
	}

	local counts: { [string]: number } = {
		Common = 0,
		Rare = 0,
		Legendary = 0,
	}

	for _ = 1, ROLLS do
		local result = rng.rng(weights)
		counts[result] += 1
	end

	for item, expectedChance in expected do
		local observed = counts[item] / ROLLS
		expect(observed).toBeCloseTo(expectedChance, PRECISION)
	end
end

it("rng statistical distribution", test)
