

function checkInputs()
    if love.keyboard.isDown("a") then
        KEY_A = true
    else
        KEY_A = false
    end

    if love.keyboard.isDown("d") then
        KEY_D = true
    else
        KEY_D = false
    end

    if love.keyboard.isDown("w") then
        KEY_W = true
    else
        KEY_W = false
    end

    if love.keyboard.isDown("k") then
        KEY_K = true
    else
        KEY_K = false
    end
end



function rotatePoint(cx, cy, angle, px, py)
    local rads = math.rad(angle)

    local si = math.sin(rads)
    local co = math.cos(rads)

    px = px - cx
    py = py - cy

    local newx = px * co - py * si
    local newy = px * si + py * co

    newx = newx + cx
    newy = newy + cy

    newx = math.floor(newx*1000)/1000
    newy = math.floor(newy*1000)/1000

    local point = {newx,newy}

    return point
end

function updateTableObjects(table)
    local tableLen = #table
    for i = 1, tableLen, 1 do
        table[i]:update()
    end
end

function collisionDetection(object1, object2)
    if (object2.x - object1.x)^2 + (object2.y - object1.y)^2 <= (object1.collisionSize + object2.collisionSize)^2 then return true else return false end
end