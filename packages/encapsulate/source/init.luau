local Types = require(script.Types)
export type EncapsulateAPI = Types.EncapsulateAPI
export type Capsule<T> = Types.CapsuleFn<T>

local Capsule = require(script.Capsule)
local OnChange = require(script.OnChange)
local capsule = Capsule.capsule
local onChange = OnChange.onChange

local EncapsulateAPI = {} :: EncapsulateAPI
EncapsulateAPI.createCapsule = capsule
EncapsulateAPI.onCapsuleChanged = onChange
return EncapsulateAPI
