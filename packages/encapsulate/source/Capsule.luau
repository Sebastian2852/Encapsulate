local exports = {}

local function capsule<T>(initialValue: T)
	local currentValue = initialValue

	return function(newValue: T? | (currentValue: T) -> T)
		if type(newValue) == "function" then
			currentValue = newValue(currentValue)
			return
		elseif newValue ~= nil then
			currentValue = newValue
			return
		else
			return currentValue
		end
	end
end
exports.capsule = capsule

return exports
