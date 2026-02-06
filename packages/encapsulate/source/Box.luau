local Types = require(script.Parent.Types)
type WeakKeyMap<K, V> = Types.WeakKeyMap<K, V>
type Map<K, V> = Types.Map<K, V>
type Capsule<T> = Types.CapsuleFn<T>
type ListnerFn<T> = Types.ListnerFn<T>

local exports = {}

local capsules = {} :: Map<Capsule<unknown>, WeakKeyMap<ListnerFn<unknown>, boolean?>>
exports.capsules = capsules

local function clearBox()
	table.clear(capsules)
end
exports.clearBox = clearBox

local function listenToUpdates<T>(capsule: Capsule<T>, callback: ListnerFn<T>)
	capsules[capsule][callback] = true

	return function()
		capsules[capsule][callback] = nil
	end
end
exports.listenToUpdates = listenToUpdates

local function sendUpdate<T>(capsule: Capsule<T>, prev: T, new: T)
	local listners = capsules[capsule]
	assert(listners, "INTERNAL ERROR: Failed to find listners for capsule")

	for func, ref in listners :: { [ListnerFn<T>]: boolean } do
		if ref then
			func(prev, new)
		end	
	end
end
exports.sendUpdate = sendUpdate

return exports
