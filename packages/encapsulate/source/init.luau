local Types = require("@self/Types")
export type EncapsulateAPI = Types.EncapsulateAPI
export type Capsule<T> = Types.Capsule<T>

local Capsule = require("@self/Capsule")
local capsule = Capsule.capsule

local EncapsulateAPI = {} :: EncapsulateAPI
EncapsulateAPI.createCapsule = capsule
return EncapsulateAPI
