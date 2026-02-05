local Types = require("./Types")
type CapsuleFn<T> = Types.CapsuleFn<T>
type RawCapsule<T> = Types.RawCapsule<T>
type LinkedListItem<T> = Types.CapsuleListnerLinkedListItem<T>

local exports = {}

local function onChange<T>(capsule: CapsuleFn<T>, handler: (previous: T, new: T) -> nil)
	local rawCapsule = (capsule :: any) :: RawCapsule<T>

	local disconnected = false
	local myIndex = #rawCapsule._Listners + 1

	local me = {
		fn = handler,
	} :: LinkedListItem<T>
	rawCapsule._Listners[myIndex] = me

	do
		local previousItem = rawCapsule._Listners[myIndex - 1]
		if previousItem ~= nil then
			previousItem._next = me
			me._prev = previousItem
		end
	end

	return function()
		if not disconnected then
			if me._prev then
				me._prev._next = me._next
			end
			if me._next then
				me._next._prev = me._prev
			end
			me.fn = nil
			disconnected = true
		end
	end
end
exports.onChange = onChange

return exports
