local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Encapsulate = require(ReplicatedStorage.Packages.encapsulate)

return function()
	describe("Capsule", function()
		it("Initial Value", function()
			local capsule = Encapsulate.createCapsule(5)
			expect(capsule()).to.equal(5)
		end)

		it("Update state with value", function()
			local capsule = Encapsulate.createCapsule(5)
			capsule(10)
			expect(capsule()).to.equal(10)
		end)

		it("Update state with function", function()
			local capsule = Encapsulate.createCapsule(5)
			capsule(function(prev)
				return prev * 3
			end)
			expect(capsule()).to.equal(15)
		end)
	end)
end
