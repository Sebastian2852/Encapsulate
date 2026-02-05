local Types = require("@self/Types")
export type EncapsulateAPI = Types.EncapsulateAPI
export type Capsule<T> = Types.CapsuleFn<T>

local Capsule = require("@self/Capsule")
local OnChange = require("@self/OnChange")
local capsule = Capsule.capsule
local onChange = OnChange.onChange

local EncapsulateAPI = {} :: EncapsulateAPI
EncapsulateAPI.createCapsule = capsule
EncapsulateAPI.onCapsuleChanged = onChange
return EncapsulateAPI
