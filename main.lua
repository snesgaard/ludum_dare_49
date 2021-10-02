local nw = require "nodeworks"
local palette = require "palette"

local function draw_rectangle(x, y, w, h)
    gfx.setColor(0, 0, 0)
    gfx.rectangle("line", x, y, w, h, 3)
    gfx.setColor(palette.blue)
    gfx.rectangle("fill", x, y, w, h, 3)
end

local function draw_eyes(x, y, w, h)
    gfx.setColor(0, 0, 0)
    gfx.rectangle("fill", x, y, w, h)
end

local function draw_player(x, y, mirror)
    x = x or 0
    y = y or 0
    gfx.setLineWidth(4)
    gfx.translate(x, y)
    if mirror then
        gfx.scale(-1, 1)
    end
    gfx.translate(-25, 0)
    draw_rectangle(50, 15, 10, 20)
    draw_rectangle(0, 0, 50, 50)
    draw_rectangle(20, -10, 35, 35)
    draw_eyes(45, -5, 5, 20)
    draw_eyes(35, -5, 5, 20)
    draw_rectangle(-15, 15, 10, 20)
    draw_rectangle(5, 55, 10, 15)
    draw_rectangle(30, 55, 10, 15)
end

function love.keypressed(key, scancode, isrepeat)
    if key == "escape" then love.event.quit() end
    if key == "m" then mirror = not mirror end
end

function love.draw()
    draw_player(200, 200, mirror)
    gfx.setColor(palette.deep_blue)
    gfx.rectangle("fill", 300, 200, 100, 100)
end
