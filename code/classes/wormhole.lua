Wormhole = Object:extend()

Wormhole.x = 0
Wormhole.y = 0
Wormhole.dormant = 180
Wormhole.cooldown = 60
Wormhole.ready = Wormhole.cooldown
Wormhole.lifetime = 3

Wormhole.shape = {}

WormholeTable = {}

function Wormhole:new(x,y,lifetime,cooldown)
    self.x = x
    self.y = y
    self.lifetime = lifetime or Wormhole.lifetime
    self.cooldown = cooldown or Wormhole.cooldown
    self.shape = generateAsteroidShape(30,5,15)
end


function Wormhole:update()
    if self.dormant > 0 then self.dormant = self.dormant-1 end
    if self.dormant == 0 then
        if self.ready > 0 then self.ready = self.ready-1 end
        if self.ready == 0 then
            self.ready = self.cooldown
            newAsteroid(love.math.random(1,3),self.x,self.y)
            self.lifetime = self.lifetime-1
        end
    end
end


function Wormhole:draw()
    if self.dormant == 0 then love.graphics.setColor(1,0,0,1) else love.graphics.setColor(1,1,1,1) end
    local shape = CalculateShapePos(self)
    love.graphics.polygon("line", shape)
end

function newWormhole(x,y,lifetime,cooldown)
    table.insert(WormholeTable, Wormhole(x,y,lifetime,cooldown))
end