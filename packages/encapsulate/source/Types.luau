export type Capsule<T> = (newValue: T? | (currentValue: T) -> T) -> T

export type EncapsulateAPI = {
	createCapsule: Capsule<unknown>,
}

return nil
