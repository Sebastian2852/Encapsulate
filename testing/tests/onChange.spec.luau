local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Encapsulate = require(ReplicatedStorage.Packages.encapsulate)

return function()
	describe("On Change", function()
		it("Observe changes", function()
			local capsule = Encapsulate.createCapsule(5)
			local didObserve = false

			local cleanup
			local onChange = function(prev, new)
				didObserve = true
				cleanup()
			end

			cleanup = Encapsulate.onCapsuleChanged(capsule, onChange)
			capsule(10)

			expect(didObserve).to.be.ok()
		end)

		it("Passes correct arguments", function()
			local capsule = Encapsulate.createCapsule(0)

			local gotPrev, gotNew

			local cleanup
			local onChange = function(prev, new)
				gotPrev = prev
				gotNew = new
				cleanup()
			end

			cleanup = Encapsulate.onCapsuleChanged(capsule, onChange)
			capsule(10)

			expect(gotPrev).to.equal(0)
			expect(gotNew).to.equal(10)
		end)
	end)
end
