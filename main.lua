Object = require "libraries.classic.classic"

require "code.engine"
require "code.renderer"



require "code.classes.player"
require "code.classes.enemy"
require "code.classes.projectiles"
require "code.classes.asteroid"


x = x or 0

function love.load()
    love.window.setMode(gw*4, gh*4, {display = 1, fullscreen = false, borderless = false})

    love.graphics.setDefaultFilter("nearest")

    love.graphics.setBlendMode("none")

    love.graphics.setLineWidth(1)
    love.graphics.setLineStyle("rough")

    canvas = love.graphics.newCanvas(480,270)

    
    p = Player()
    e = Enemy()


    newpoint = rotatePoint(0,0,45,1,0)

    print(newpoint[1])
    print(newpoint[2])


    table.insert(AsteroidTable,Asteroid(100,100,generateAsteroidShape()))
    table.insert(AsteroidTable,Asteroid(100,150,generateAsteroidShape()))
    table.insert(AsteroidTable,Asteroid(150,100,generateAsteroidShape()))

end

function love.update(dt)
    checkInputs()

    p:update()
    
    updateTableObjects(ProjectileTable)
    updateTableObjects(AsteroidTable)

end

function love.draw()
    
    love.graphics.setCanvas(canvas)
        love.graphics.clear()
        
        
        p:draw()
        e:draw()
        
        drawTableObjects(ProjectileTable)
        drawTableObjects(AsteroidTable)

    love.graphics.setCanvas()

    love.graphics.clear()
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(canvas,0,0,0,4)

end