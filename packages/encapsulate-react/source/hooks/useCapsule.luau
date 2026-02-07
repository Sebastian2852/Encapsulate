local encapsulate = require(script.Parent.Parent.Parent.encapsulate)
local React = require(script.Parent.Parent.Parent.React)

local exports = {}

local function useCapsule<T>(capsule: encapsulate.Capsule<T>)
	local value, setValue = React.useState(capsule())

	React.useEffect(function()
		local cleanup = encapsulate.onCapsuleChanged(capsule, function(previous, new)
			setValue(new)
		end)
		return cleanup
	end, {})

	return value
end
exports.useCapsule = useCapsule

return exports
