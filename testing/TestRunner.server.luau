local ReplicatedStorage = game:GetService("ReplicatedStorage")

local TestEZ = require(ReplicatedStorage.Dev.TestEZ)
TestEZ.TestBootstrap:run({ script.Parent.Tests }, TestEZ.Reporters.TextReporter)
