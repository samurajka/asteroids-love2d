Player = Object:extend()

Player.x = 50
Player.y = 50
Player.angle = 25
Player.shape = {0,-15,9,6,-9,6}

Player.xspd = 0
Player.yspd = 0

Player.accel = 0.01
Player.maxspd = 1

Player.weapon = {
    ready = 0,
    cooldown = 50
}

function Player:new()
    
end

function Player:update()
   Player:movement() 
   Player:shoot()
   Player:printDebug()
end

function Player:draw()
    love.graphics.setColor(0,1,0,1)
    local renderShape = CalculateShapePos(self)
    love.graphics.polygon("line", renderShape)
end


function Player:movement()
    if KEY_A then
        self.angle = self.angle - 1
    end

    if KEY_D then
        self.angle = self.angle + 1
    end
    
    if KEY_W then
        local spdToAdd = rotatePoint(0,0,self.angle,0,-1)
        self.xspd = self.xspd + (spdToAdd[1] * self.accel)
        self.yspd = self.yspd + (spdToAdd[2] * self.accel)
    end

    if self.xspd > self.maxspd then
        self.xspd = self.maxspd
    end
    if self.yspd > self.maxspd then
        self.yspd = self.maxspd
    end
    if self.xspd < self.maxspd *-1 then
        self.xspd = self.maxspd *-1
    end
    if self.yspd < self.maxspd *-1 then
        self.yspd = self.maxspd *-1
    end


    self.x = self.x + self.xspd
    self.y = self.y + self.yspd
end

function Player:shoot()
    if KEY_K and self.weapon.ready==0 then
        local newProjectile = BasicLaser(self.x,self.y,self.angle)
        table.insert(ProjectileTable, newProjectile)
        self.weapon.ready = self.weapon.ready - self.weapon.cooldown
    end

    if self.weapon.ready < 0 then
        self.weapon.ready = self.weapon.ready + 1
    end
end


function Player:printDebug()
    os.execute("clear")
    
    print("X cord", self.x)
    print("Y cord", self.y)
    print("X spd", self.xspd)
    print("Y spd", self.yspd)

end