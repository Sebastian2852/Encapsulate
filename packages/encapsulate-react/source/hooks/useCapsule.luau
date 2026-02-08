local encapsulate = require(script.Parent.Parent.Parent.encapsulate)
local React = require(script.Parent.Parent.Parent.React)

local exports = {}

--[=[
	React hook to watch changes of the `capsule` and re-render the component when the `capsule`'s state changes.

	@param capsule -- capsule to watch state changes
	@return current state of the capsule
]=]
local function useCapsule<T>(capsule: encapsulate.Capsule<T>)
	local value, setValue = React.useState(capsule())

	React.useEffect(function()
		local cleanup = encapsulate.onCapsuleChanged(capsule, function(new, previous)
			setValue(new)
		end)
		return cleanup
	end, {})

	return value
end
exports.useCapsule = useCapsule

return exports
