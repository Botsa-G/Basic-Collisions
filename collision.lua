-- for rectangles with 0,0 origin AABB collision
function check_AABB_collision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and x1 + w1 > x2 and y1 < y2 + h2 and y1 + h1 > y2
end

-- for rectangles with center origin AABB collision 
function check_AABB_center_collision(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 - 0.5 * w1 < x2 + 0.5 * w2 and x1 + 0.5 * w1 > x2 - 0.5 * w2 and y1 - 0.5 * h1 < y2 + 0.5 * h2 and y1 +
               0.5 * h1 > y2 - 0.5 * h2
end

-- for rectangles collision only in the y axis
function Ycollide(x1, y1, w1, h1, x2, y2, w2, h2)
    return y1 < y2 + h2 and y1 + h1 > y2
end

-- for rectangles collision only in the x axis
function Xcollide(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2 and x1 + w1 > x2
end
-- for rectangles right side collision in the X axis
function RXcollide(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 < x2 + w2
end
-- for rectangles left side collision in the X axis
function LXcollide(x1, y1, w1, h1, x2, y2, w2, h2)
    return x1 + w1 > x2
end
-- for rectangles  bottom collision  in the Y axis
function BYcollide(x1, y1, w1, h1, x2, y2, w2, h2)
    return y1 < y2 + h2
end
-- for rectangles  top only side collision in the Y axis
function TYcollide(x1, y1, w1, h1, x2, y2, w2, h2)
    return y1 + h1 > y2
end

-- for the distance between two points
function dist(x1, y1, x2, y2)
    return math.sqrt((y2 - y1) * (y2 - y1) + (x2 - x1) * (x2 - x1))
end

-- for collision between two circles

function circle_collide(circle1_x, circle1_y, circle1_r, circle2_x, circle2_y, circle2_r)

    if dist(circle1_x, circle1_y, circle2_x, circle2_y) < (circle1_r + circle2_r) then
        return true
    else
    end
end

-- for only on initial circle collision

function circle_collide_oot(circle1_x, circle1_y, circle1_r, circle2_x, circle2_y, circle2_r)

    local angle = math.atan2((circle2_y - circle1_y), (circle2_x - circle1_x))
    local x1 = circle1_x + circle1_r * math.cos(angle)
    local x2 = circle2_x - circle2_r * math.cos(angle)
    local y1 = circle1_y + circle1_r * math.sin(angle)
    local y2 = circle2_y - circle2_r * math.sin(angle)

    if dist(x1, y1, x2, y2) < 1 then
        return true
    else
    end
end

-- for collision between a circle and  rectancle

function circle_rect_collide(circle_x, circle_y, circle_r, rect_x, rect_y, rect_w, rect_h)

    local point_x, point_y = circle_x, circle_y

    if circle_x < rect_x then
        point_x = rect_x
    end
    if circle_x > rect_x + rect_w then
        point_x = rect_x + rect_w
    end
    if circle_y < rect_y then
        point_y = rect_y
    end
    if circle_y > rect_y + rect_h then
        point_y = rect_y + rect_h
    end

    if dist(point_x, point_y, circle_x, circle_y) < circle_r then
        return true
    else
    end

end
