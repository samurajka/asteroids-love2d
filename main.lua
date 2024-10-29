Object = require "libraries.classic.classic"

require "code.engine"
require "code.renderer"
require "code.gameloop"



require "code.classes.player"
require "code.classes.enemy"
require "code.classes.projectiles"
require "code.classes.asteroid"
require "code.classes.counter"
require "code.classes.wormhole"

DEBUGMODE = true
debugtimer = 0

GAMESTATE = "GAMERUNNING"



function love.load()
    love.window.setMode(gw*4, gh*4, {display = 1, fullscreen = false, borderless = false})

    love.graphics.setDefaultFilter("nearest")

    love.graphics.setBlendMode("alpha")

    love.graphics.setLineWidth(1)
    love.graphics.setLineStyle("rough")

    canvas = love.graphics.newCanvas(480,270)


    fontSize = 20
    pixelFont = love.graphics.newFont(fontSize,"mono")
    pixelFont:setFilter("nearest")
    love.graphics.setFont(pixelFont)



    p = Player()

    mainCounter = Counter()


    newAsteroid(3,200,200)
    newAsteroid(2,200,200)
    newAsteroid(1,200,200)


    newWormhole(70,70,3,60)



    function tempFn()
        newWormhole(love.math.random(50,gw-50),love.math.random(50,gh-50),3,60)
    end
    ticker1 = Ticker(180,tempFn) 

end

function love.update(dt)

    if GAMESTATE == "GAMERUNNING" then
        gameloopUpdate()
    end

    if GAMESTATE == "GAMEOVER" then
        
    end

    

    



end

function love.draw()

    if GAMESTATE == "GAMERUNNING" then
        
    end

    if GAMESTATE == "GAMEOVER" then
        
    end
    
    love.graphics.setCanvas(canvas)
        love.graphics.clear()
        
        mainCounter:draw()     
        
        p:draw()

           

        drawTableObjects(ProjectileTable)
        drawTableObjects(AsteroidTable)
        drawTableObjects(WormholeTable)

    love.graphics.setCanvas()

    love.graphics.clear()
    love.graphics.setColor(1,1,1,1)
    love.graphics.draw(canvas,0,0,0,4)


    


    if DEBUGMODE then print("Fps: " .. tostring(love.timer.getFPS())) end
    if DEBUGMODE then print(debugtimer) end

end