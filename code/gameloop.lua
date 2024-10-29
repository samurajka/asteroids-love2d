


function checkAsteroidProjectileCollisions()
    for i, v in ipairs(AsteroidTable) do

        print(v.lifetime)

        for j, w in ipairs(ProjectileTable) do
            if collisionDetection(v,w) then

                table.remove(ProjectileTable,j)

                if v.lifetime ~= 1 then
                    newAsteroid(v.lifetime-1,v.x+love.math.random(-2,2),v.y+love.math.random(-2,2))
                    newAsteroid(v.lifetime-1,v.x+love.math.random(-2,2),v.y+love.math.random(-2,2))
                end
                
                Counter.addScore(mainCounter,50+v.lifetime*50)
                table.remove(AsteroidTable,i)                
            end
        end
    end
end





function gameloopUpdate()
    checkInputs()

    p:update()
    

    if ObjectXTableCollision(p,AsteroidTable) and Player.invul == 0 then
        p.invul = 120
        p.hp = p.hp - 1
        
        if p.hp == 0 then GAMESTATE = "GAMEOVER" end
    end


    debugtimer = debugtimer + 1/60

    updateTableObjects(ProjectileTable)
    updateTableObjects(AsteroidTable)
    updateTableObjects(WormholeTable)

    checkLifetime(WormholeTable)

    ticker1:update()

    mainCounter:update()
    checkAsteroidProjectileCollisions()
end