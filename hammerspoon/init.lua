local mash = {"cmd", "alt", "ctrl"}
local smash = {"cmd", "alt", "ctrl", "shift"}

--
-- window management
--
units = {
  bottom = { x = 0.0, y = 0.5, w = 1.0, h = 0.5 },
  left   = { x = 0.0, y = 0.0, w = 0.5, h = 1.0 },
  right  = { x = 0.5, y = 0.0, w = 0.5, h = 1.0 },
  top    = { x = 0.0, y = 0.0, w = 1.0, h = 0.5 },
  tl     = { x = 0.0, y = 0.0, w = 0.5, h = 0.5 },
  tr     = { x = 0.5, y = 0.0, w = 0.5, h = 0.5 },
  bl     = { x = 0.0, y = 0.5, w = 0.5, h = 0.5 },
  br     = { x = 0.5, y = 0.5, w = 0.5, h = 0.5 },
}

function moveWindow(rect)
  return function ()
    hs.window.focusedWindow():move(rect, nil, true, 0)
  end
end

hs.hotkey.bind(mash, 'left', moveWindow(units.left))
hs.hotkey.bind(mash, 'right', moveWindow(units.right))
hs.hotkey.bind(mash, 'up', moveWindow(units.top))
hs.hotkey.bind(mash, 'down', moveWindow(units.bottom))

hs.hotkey.bind(smash, 'left', moveWindow(units.tl))
hs.hotkey.bind(smash, 'right', moveWindow(units.br))
hs.hotkey.bind(smash, 'down', moveWindow(units.tr))
hs.hotkey.bind(smash, 'up', moveWindow(units.bl))

hs.hotkey.bind(mash, 'm', function()
  window = hs.window.focusedWindow()
  window:maximize(0)
end)
hs.hotkey.bind(mash, 'n', function()
  window = hs.window.focusedWindow()
  window:moveToScreen(window:screen():next(), false, true, 0)
end)
hs.hotkey.bind(mash, 'p', function()
  window = hs.window.focusedWindow()
  window:moveToScreen(window:screen():previous(), false, true, 0)
end)



--
-- mash-D to highlight the mouse
--
mouseCircle = nil
mouseCircleTimer = nil

function mouseHighlight()
  -- Delete an existing highlight if it exists
  if mouseCircle then
    mouseCircle:delete()
    if mouseCircleTimer then
      mouseCircleTimer:stop()
    end
  end
  -- Get the current co-ordinates of the mouse pointer
  mousepoint = hs.mouse.absolutePosition()
  -- Prepare a big red circle around the mouse pointer
  mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
  mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
  mouseCircle:setFill(false)
  mouseCircle:setStrokeWidth(5)
  mouseCircle:show()

  -- Set a timer to delete the circle
  mouseCircleTimer = hs.timer.doAfter(1, function()
    mouseCircle:delete()
    mouseCircle = nil
  end)
end
hs.hotkey.bind(mash, "D", mouseHighlight)



--
-- test
--
hs.hotkey.bind(mash, 'f', function()
      --execute front window's active tab javascript "window.alert('hello from Hammerspoon');"
      -- function rocket(n) { if (n > 0) { document.getElementById('rockets').click(); setTimeout(() => rocket(n-1), 100); }}"
  hs.osascript.applescript([[
    tell application "Tandem"
      execute front window's active tab javascript "document.getElementById('rockets').click();"
    end tell
  ]])
end)



--
-- mash-R to reload Hammerspoon config
--
function reload_config(files)
  hs.reload()
end
hs.hotkey.bind(mash, "R", reload_config)
hs.alert.show("Config loaded")
