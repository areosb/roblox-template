--!strict
local Lest = require("@lest")
local calculateLuck = require("../../src/systems/shared/calculateLuck")
local rng = require("../../src/systems/shared/rng")
local _describe, it, expect = Lest.describe, Lest.it, Lest.expect

local function test()
	local ROLLS = 10_000 -- more rolls = less variance
	local PRECISION = 1 -- 1 decimal place (±0.1)
	local SEED = 1234567890

	local luck = calculateLuck()

	math.randomseed(SEED)

	local weights = {
		Common = 70,
		Rare = 25,
		Legendary = 5,
	}

	local expected = rng.calculateRngChances(weights, luck)

	local hardExpected = {
		Common = 0.4,
		Rare = 0.5,
		Legendary = 0.1,
	}

	local counts: { [string]: number } = {
		Common = 0,
		Rare = 0,
		Legendary = 0,
	}

	for _ = 1, ROLLS do
		local result = rng.rng(weights, luck)
		counts[result] += 1
	end

	for item, expectedChance in expected do
		local observed = counts[item] / ROLLS
		local hardExpectedChance = hardExpected[item]
		expect(observed).toBeCloseTo(expectedChance, PRECISION)
		expect(expectedChance).toBeCloseTo(hardExpectedChance, PRECISION)
	end
end

it("rng statistical distribution w/ calculated luck", test)
