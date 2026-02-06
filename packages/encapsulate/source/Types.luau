export type CapsuleFn<T> = (newValue: T? | (currentValue: T) -> T) -> T
export type ListnerFn<T> = (prev: T, new: T) -> nil

export type EncapsulateAPI = {
	createCapsule: CapsuleFn<unknown>,
	onCapsuleChanged: <T>(capsule: CapsuleFn<T>, handler: (previous: T, new: T) -> nil) -> () -> (),
}

export type Map<K, V> = { [K]: V }
export type WeakValueMap<K, V> = typeof(setmetatable({} :: Map<K, V>, { __mode = "v" }))
export type WeakKeyMap<K, V> = typeof(setmetatable({} :: Map<K, V>, { __mode = "k" }))

return nil
