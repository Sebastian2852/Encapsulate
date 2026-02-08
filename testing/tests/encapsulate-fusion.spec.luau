local ReplicatedStorage = game:GetService("ReplicatedStorage")

local encapsulate_fusion = require(script.Parent.Parent.Parent.ReplicatedStorage.Packages["encapsulate-fusion"])
local Encapsulate = require(ReplicatedStorage.Packages.encapsulate)

local Fusion = require(ReplicatedStorage.Packages.Fusion)
local scoped = Fusion.scoped
local peek = Fusion.peek

return function()
	describe("Hooks", function()
		it("Can update with capsule state", function()
			local scope = scoped(Fusion)
			local capsule = Encapsulate.createCapsule(0)

			local capsuleValue = encapsulate_fusion.useCapsule(scope, capsule)
			expect(peek(capsuleValue)).to.equal(0)
			capsule(5)
			expect(peek(capsuleValue)).to.equal(5)
		end)
	end)
end
