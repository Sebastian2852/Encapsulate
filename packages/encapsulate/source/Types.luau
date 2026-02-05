export type CapsuleFn<T> = (newValue: T? | (currentValue: T) -> T) -> T

export type CapsuleListnerLinkedListItem<T> = {
	_next: CapsuleListnerLinkedListItem<T>,
	_prev: CapsuleListnerLinkedListItem<T>,
	fn: (prev: T, new: T) -> nil,
}

export type RawCapsule<T> = typeof(setmetatable(
	{} :: {
		_Listners: { CapsuleListnerLinkedListItem<T> },
	},
	{} :: { __call: CapsuleFn<T> }
))

export type EncapsulateAPI = {
	createCapsule: CapsuleFn<unknown>,
	onCapsuleChanged: <T>(capsule: CapsuleFn<T>, handler: (previous: T, new: T) -> nil) -> () -> (),
}

return nil
