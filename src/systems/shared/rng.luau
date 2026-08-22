--!native

type Rarities = { [string]: number }

local function calculateRngChances(rarities: Rarities, luck: number?): Rarities
	luck = luck or 1
	local ordered = {}

	for name, chance in rarities do
		table.insert(ordered, {
			name = name,
			chance = chance / 100,
		})
	end

	-- Rarest → most common
	table.sort(ordered, function(a, b)
		return a.chance < b.chance
	end)

	local result: Rarities = {}
	local remaining = 1

	for i = 1, #ordered - 1 do
		local rarity = ordered[i]

		local chance = math.min(rarity.chance * luck, remaining)

		result[rarity.name] = chance
		remaining -= chance
	end

	-- Most common rarity gets whatever is left
	result[ordered[#ordered].name] = remaining

	return result
end

local function rng(rarities: Rarities, luck: number?): string
	luck = luck or 1
	local chances = calculateRngChances(rarities, luck)

	local random = math.random()
	local accumulator = 0

	for rarity, chance in chances do
		accumulator += chance

		if random < accumulator then
			return rarity
		end
	end

	error("unreachable")
end

return {
	rng = rng,
	calculateRngChances = calculateRngChances,
}
