Counter = Object:extend()

Counter.time = 0
Counter.score = 0

function Counter:new()
    self.time = 0
    self.score = 0
end

function Counter:update()
    self.time = self.time + 1/60
end

function Counter:draw()
    love.graphics.setColor(1,1,1,0.5)
    local timeLen = string.len("time: " .. math.floor(self.time))
    local scoreLen = string.len("score: " .. math.floor(self.score))
    love.graphics.print("time: " .. math.floor(self.time), gw/2-timeLen*fontSize/4,gh/2)
    love.graphics.print("score: " .. math.floor(self.score), gw/2-scoreLen*fontSize/4,gh/2+fontSize)
end

function Counter:addScore(number)
    self.score = self.score + number
end

