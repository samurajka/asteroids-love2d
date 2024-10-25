Projectile = Object:extend()

Projectile.x = 0
Projectile.y = 0
Projectile.xspd = 0
Projectile.yspd = 0
Projectile.angle = 0

--this table will store all projectile object
ProjectileTable = {}





function Projectile:new(x, y, angle)
    self.x = x
    self.y = y
    self.angle = angle
    local spd = rotatePoint(0,0,self.angle,0,1)
    self.xspd = spd[1] * 1
    self.yspd = spd[2] * 1
end


BasicLaser = Projectile:extend()

function BasicLaser:new(x,y,angle)
    BasicLaser.super.new(self,x,y,angle)
end

function BasicLaser:update()
    self.x = self.x - self.xspd
    self.y = self.y - self.yspd
end

function BasicLaser:draw()
    love.graphics.setColor(1,1,1,1)
    love.graphics.circle("fill",self.x,self.y,2)
end