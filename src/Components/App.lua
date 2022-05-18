local Plugin = script.Parent.Parent
local Root = Plugin.Parent
local Packages = Root.Packages

local Roact = require(Packages.Roact)
local StudioComponents = require(Packages.StudioComponents)

local e = Roact.createElement

local App = Roact.Component:extend("App")

function App:init()

end

function App:render()
    return e("Frame", {
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        e("TextLabel", {
            Text = "Test",
            Size = UDim2.new(1, 0, 1, 0)
        })
    })
end

return App