Enemy = Object:extend()

Enemy.x = 60
Enemy.y = 60
Enemy.angle = 0

function Enemy:new()
    
end

function Enemy:update()
    
end

function Enemy:draw()
    love.graphics.setColor(1,0,0,1)
    love.graphics.polygon("line", self.x, self.y-5, self.x-5,self.y, self.x+5, self.y)
end