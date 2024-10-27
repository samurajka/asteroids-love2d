Asteroid = Object:extend()

Asteroid.x = 0
Asteroid.y = 0
Asteroid.xspd = 0
Asteroid.yspd = 0
Asteroid.angle = 0
Asteroid.lifetime = 1
Asteroid.collisionSize = 0

Asteroid.shape = {}

AsteroidTable = {}


function Asteroid:new(x,y,shape,angle,collision)
    self.x = x
    self.y = y
    self.angle = angle or love.math.random(0,360)
    self.shape = shape
    self.collisionSize = collision or 3
    local spd = rotatePoint(0,0,self.angle,0,-1)
    self.xspd = spd[1] * 0.1
    self.yspd = spd[2] * 0.1
end

function Asteroid:update()
    self.x = self.x + self.xspd
    self.y = self.y + self.yspd
end

function Asteroid:draw()
    love.graphics.setColor(1,0.5,0,1)
    local finalShape = CalculateShapePos(self)
    love.graphics.polygon("line",finalShape)
end


function generateAsteroidShape(numOfVertices,radius,roughness)
    local numOfVertices = numOfVertices or 10
    local radius = radius or 10
    local roughness = roughness or 3
    local result = {}

    local angleDiff = 360/numOfVertices

    for i = 1, numOfVertices+1, 1 do
        local p = rotatePoint(0,0,angleDiff*(i-1),0,-radius)
        result[i*2-1] = p[1]
        result[i*2] = p[2]
    end

    for i, v in ipairs(result) do
        result[i] = v + love.math.random(-roughness*100,roughness*100)/100
    end

    return result
end

function newAsteroid(lifetime, cordx, cordy)
    local shape = generateAsteroidShape(lifetime*5,lifetime*5,lifetime*2-1)
    local asteroid = Asteroid(cordx,cordy,shape,love.math.random(0,360), lifetime*7)
    table.insert(AsteroidTable,asteroid)
end
    
