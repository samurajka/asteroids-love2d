

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


--  returns a table with .x and .y
--  these values can be
--  -1 if value is bigger than screen size
--  1 if value is negative
--  0 if value is inside screen
--  this will be useful in further calculations
function checkOutOfBounds(object)
    local result = {}
    result.x = 0
    result.y = 0
    if object.x < 0 then
        result.x = 1
    end
    if object.x > gw then
        result.x = -1
    end
    if object.y < 0 then
        result.y = 1
    end
    if object.y > gh then
        result.y = -1
    end
    return result
end

function teleportOffscreenObject(object)
    local outOfBounds = checkOutOfBounds(object)
    if outOfBounds.x == 0 and outOfBounds.y == 0 then return end

    object.x = object.x + outOfBounds.x*gw
    object.y = object.y + outOfBounds.y*gh
end


function checkLifetime(tb)
    for index, value in ipairs(tb) do
        if value.lifetime == 0 then table.remove(tb,index) end
    end
end


Ticker = Object:extend()
Ticker.limit = 60
Ticker.frames = 0
Ticker.fn = nil

function Ticker:new(limit, fn)
    self.limit = limit
    self.fn = fn
end

function Ticker:update()
    self.frames = self.frames + 1
    if self.frames >= self.limit then
        self.frames = 0
        self.fn()
    end
end
