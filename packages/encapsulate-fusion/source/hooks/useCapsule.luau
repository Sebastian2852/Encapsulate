local encapsulate = require(script.Parent.Parent.Parent.encapsulate)

local exports = {}

function useCapsule<T>(scope, capsule: encapsulate.Capsule<T>)
	local state = scope:Value(capsule())
	local disconnect = encapsulate.onCapsuleChanged(capsule, function(v)
		state:set(v)
	end)
	table.insert(scope, disconnect)
	return state
end
exports.useCapsule = useCapsule

return exports
