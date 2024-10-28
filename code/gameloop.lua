


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

                table.remove(AsteroidTable,i)                
            end
        end
    end
end





function gameloopUpdate()
    checkAsteroidProjectileCollisions()
end