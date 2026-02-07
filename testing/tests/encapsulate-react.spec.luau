local ReplicatedStorage = game:GetService("ReplicatedStorage")

local encapsulate_react = require(script.Parent.Parent.Parent.ReplicatedStorage.Packages["encapsulate-react"])
local renderHook = require(script.Parent.Parent.Utils.renderHook)
local Encapsulate = require(ReplicatedStorage.Packages.encapsulate)

return function()
	describe("Hooks", function()
		it("Can update with capsule state", function()
			local capsule = Encapsulate.createCapsule(0)
			local hook = renderHook(function()
				return encapsulate_react.useCapsule(capsule)
			end)
			expect(hook.result).to.equal(0)
			capsule(5)
			expect(hook.result).to.equal(5)
		end)
	end)
end
