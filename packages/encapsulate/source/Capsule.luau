local Types = require(script.Parent.Types)
type Capsule<T> = Types.CapsuleFn<T>

local Box = require(script.Parent.Box)
local capsules = Box.capsules
local sendUpdate = Box.sendUpdate

local exports = {}

--[=[
	Create a capsule with an initial state. The state can be pretty much anything.

	@param initialValue -- starting state of the capsule
	@return a new capsule.
]=]
local function createCapsule<T>(initialValue: T): Capsule<T>
	local currentValue = initialValue

	local capsule
	capsule = function(newValue: T? | (currentValue: T) -> T)
		if type(newValue) == "function" then
			local prev = currentValue
			currentValue = newValue(currentValue)
			sendUpdate(capsule, prev, currentValue)
			return
		elseif newValue ~= nil then
			local prev = currentValue
			currentValue = newValue
			sendUpdate(capsule, prev, currentValue)
			return
		else
			return currentValue
		end
	end

	capsules[capsule] = setmetatable({}, { __mode = "k" })

	return capsule
end
exports.createCapsule = createCapsule

return exports
