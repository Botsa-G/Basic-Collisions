require "collision"
player = {
    x = 50,
    y = 100,
    w = 50,
    h = 50,
    r = 10,
    status = "fill"
}

function player:new(tab)
    tab = tab or {}
    setmetatable(tab, self)
    self.__index = self
    return tab
end

function player:draw_rect()
    love.graphics.rectangle(self.status, self.x, self.y, self.w, self.h)
end

function player:draw_circle()
    love.graphics.circle(self.status, self.x, self.y, self.r)
end

local speed = 30

function love.load()

    -- controllable circle 
    circle_a = player:new({
        x = 200,
        y = 200,
        r = 20
    })

    -- uncontrollable shapes
    circle_b = player:new({
        x = 400,
        y = 100,
        r = 45
    })

    rect_a = player:new({
        x = 100,
        y = 400,
        w = 70,
        h = 150
    })

end

function love.update(dt)

    if love.keyboard.isDown("right") then
        circle_a.x = circle_a.x + speed * dt
    end
    if love.keyboard.isDown("left") then
        circle_a.x = circle_a.x - speed * dt
    end
    if love.keyboard.isDown("up") then
        circle_a.y = circle_a.y - speed * dt
    end
    if love.keyboard.isDown("down") then
        circle_a.y = circle_a.y + speed * dt
    end

    if circle_collide(circle_a.x, circle_a.y, circle_a.r, circle_b.x, circle_b.y, circle_b.r) then
        circle_a.status = "line"
        circle_b.status = "line"
    elseif circle_rect_collide(circle_a.x, circle_a.y, circle_a.r, rect_a.x, rect_a.y, rect_a.w, rect_a.h) then
        circle_a.status = "line"
        rect_a.status = "line"
    else
        circle_b.status = "fill"
        rect_a.status = "fill"
        circle_a.status = "fill"
    end

end

function love.draw()
    circle_a:draw_circle()
    circle_b:draw_circle()
    rect_a:draw_rect()
end
