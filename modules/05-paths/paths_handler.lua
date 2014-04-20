--[[
  @Authors: Ben Dol (BeniS)
  @Details: Paths bot module handler for module registration
            and control.
]]

dofile('paths.lua')

-- required by the event handler
function PathsModule.getModuleId()
  return "PathsModule"
end

PathsModule.dependencies = {
  "BotModule"
}

--[[ Default Options ]]

PathsModule.options = {
  ['AutoExplore'] = false
}

--[[ Register Events ]]

table.merge(PathsModule, {
  --autoTarget = 1
})

PathsModule.events = {
  --[PathsModule.autoTarget] = {
  --  option = "AutoTarget", 
  --  callback = PathsModule.AutoTarget.Event
  --}
}

--[[ Register Listeners ]]

table.merge(PathsModule, {
  autoExplore = 1
})

PathsModule.listeners = {
  [PathsModule.autoExplore] = {
    option = "AutoExplore", 
    connect = PathsModule.AutoExplore.ConnectListener, 
    disconnect = PathsModule.AutoExplore.DisconnectListener
  }
}

--[[ Functions ]]

function PathsModule.stop()
  EventHandler.stopEvents(PathsModule.getModuleId())
  ListenerHandler.stopListeners(PathsModule.getModuleId())
end

-- Start Module
PathsModule.init()