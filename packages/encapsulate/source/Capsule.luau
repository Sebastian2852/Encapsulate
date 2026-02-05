local Types = require("./Types")
type CapsuleFn<T> = Types.CapsuleFn<T>
type RawCapsule<T> = Types.RawCapsule<T>

local function updateListners<T>(lastValue: T, newValue: T, capsule: RawCapsule<T>)
	local firstIndex = 0
	local emptyIndexes = {}

	for i, v in capsule._Listners do
		if v.fn ~= nil then
			firstIndex = i
			break
		else
			table.insert(emptyIndexes, i)
		end
	end

	local current = capsule._Listners[firstIndex]
	while current ~= nil do
		current.fn(lastValue, newValue)
		current = current._next
	end

	for _, i in emptyIndexes do
		table.remove(capsule._Listners, i)
	end
end

local exports = {}

local function capsule<T>(initialValue: T)
	local currentValue = initialValue

	local callFn = function(self: RawCapsule<T>, newValue: T? | (currentValue: T) -> T)
		if type(newValue) == "function" then
			local oldValue = currentValue
			currentValue = newValue(currentValue)
			updateListners(oldValue, currentValue, self)
			return
		elseif newValue ~= nil then
			local oldValue = currentValue
			currentValue = newValue
			updateListners(oldValue, currentValue, self)
			return
		else
			return currentValue
		end
	end

	return (setmetatable({ _Listners = {} }, { __call = callFn }) :: any) :: CapsuleFn<T>
end
exports.capsule = capsule

return exports
