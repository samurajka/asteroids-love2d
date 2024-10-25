


function CalculateShapePos(object)
    local shape = object.shape
    local result = {}
    
    --calculates the position of the shape
    for i, v in ipairs(shape) do
        if i%2 == 1 then
            result[i] = v + object.x
        else
            result[i] = v + object.y
        end
    end


    -- if the object has a static angle dont rotate
    if object.angle == nil then
        return result
    end

    --rotate the points
    local rads = math.rad(object.angle)
    local si = math.sin(rads)
    local co = math.cos(rads)

    for i=1, #result/2 do
        local px = result[i*2-1] - object.x
        local py = result[i*2] - object.y

        local newx = px * co - py * si
        local newy = px * si + py * co

        newx = newx + object.x
        newy = newy + object.y

        newx = math.floor(newx*1000)/1000
        newy = math.floor(newy*1000)/1000

        result[i*2-1] = newx
        result[i*2] = newy
    end


    return result
end


function drawTableObjects(table)
    local tableLen = #table
    for i = 1, tableLen, 1 do
        table[i]:draw()
    end
end