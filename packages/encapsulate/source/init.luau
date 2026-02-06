local Types = require(script.Types)
export type EncapsulateAPI = Types.EncapsulateAPI
export type Capsule<T> = Types.CapsuleFn<T>

local Capsule = require(script.Capsule)
local createCapsule = Capsule.createCapsule

local Box = require(script.Box)
local listenToUpdates = Box.listenToUpdates

local EncapsulateAPI = {} :: EncapsulateAPI
EncapsulateAPI.createCapsule = createCapsule
EncapsulateAPI.onCapsuleChanged = listenToUpdates
return EncapsulateAPI
