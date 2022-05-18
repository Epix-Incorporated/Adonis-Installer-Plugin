local Plugin = script.Parent.Parent
local Root = Plugin.Parent
local Packages = Root.Packages

local Roact = require(Packages.Roact)
local StudioComponents = require(Packages.StudioComponents)

local Widget = StudioComponents.Widget
local App = require(Plugin.Components.App)

local e = Roact.createElement

local Main = Roact.Component:extend("Main")

function Main:setActive(active: boolean)
    self:setState({
        Active = active
    })
    self.props.button:SetActive(active)
end

function Main:init()
    self:setActive(false)
end

function Main:didMount()
    self.event = self.props.button.Click:Connect(function()
        self:setActive(not self.state.Active)
    end)
end

function Main:willUnmount()
    self.event:Disconnect()
end

function Main:render()
    return self.state.Active and e(Widget, {
        Id = "MainAdonisInstallerWidget",
        Name = "MainAdonisInstallerWidget",
        Title = "Adonis Installer",
        InitialDockState = Enum.InitialDockState.Float,
        MinimumWindowSize = Vector2.new(300, 200),
        OnClosed = function()
            self:setActive(false)
        end
    }, {
        e(App, {
            plugin = self.props.plugin
        })
    })
end

return Main