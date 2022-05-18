if not plugin then return end

local Root = script.Parent
local Plugin = script
local Packages = Root.Packages

local Roact = require(Packages.Roact)
local Main = require(Plugin.Components.Main)

local toolbar = plugin:CreateToolbar("Adonis Installer")
local button = toolbar:CreateButton(
    "ToggleAdonisInstallerWidget",
    "Toggle Adonis Installer Widget",
    "rbxthumb://type=Asset&w=150&h=150&id=7510622625",
    "Adonis Installer"
)
button.ClickableWhenViewportHidden = true

local main = Roact.createElement(Main, {
    plugin = plugin,
    button = button
})
local tree = Roact.mount(main, nil, "AdonisInstaller")

plugin.Unloading:Connect(function()
    Roact.unmount(tree)
end)