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

			expect(didObserve).to.equal(true)
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

		it("Disconnectes", function()
			local capsule = Encapsulate.createCapsule(0)

			local timesFired = 0

			local cleanup = Encapsulate.onCapsuleChanged(capsule, function(previous, new)
				timesFired += 1
			end)

			capsule(5)
			cleanup()
			capsule(5)

			expect(timesFired).to.equal(1)
		end)
	end)
end
