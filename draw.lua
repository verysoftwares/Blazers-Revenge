-- draw setup
    lg.setDefaultFilter('nearest')
    
function draw()
    bg(0.6,0.6,0.65)
    --lg.rotate(pi/6)

    if world==world1 then
    if upgrades.gate1>0 then
        fg(1,1,0.8)
        lg.circle('fill',18+9,36*5,18+6)
        fg(0.6,0.6,0.65)
        lg.print(upgrades.gate1,18+9-mainfont:getWidth(upgrades.gate1)/2,36*5-9-2)
    else
        fg(0.15,0.15,0.15)
        lg.circle('fill',18+9,36*5,18+6)
    end

    fg(1,1,1)
    love.graphics.circle('fill',objs.ball.body:getX(),objs.ball.body:getY(),objs.ball.shape:getRadius())
    --love.graphics.polygon('fill',objs.gnd.body:getWorldPoints(objs.gnd.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd2.body:getWorldPoints(objs.gnd2.shape:getPoints()))
    --love.graphics.polygon('fill',objs.gnd1_5.body:getWorldPoints(objs.gnd1_5.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd3.body:getWorldPoints(objs.gnd3.shape:getPoints()))
    --love.graphics.polygon('fill',objs.gnd4.body:getWorldPoints(objs.gnd4.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd5.body:getWorldPoints(objs.gnd5.shape:getPoints()))
    --love.graphics.polygon('fill',objs.gnd4_5.body:getWorldPoints(objs.gnd4_5.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd6.body:getWorldPoints(objs.gnd6.shape:getPoints()))

    love.graphics.polygon('fill',objs.fence.body:getWorldPoints(objs.fence.shape:getPoints()))
    love.graphics.polygon('fill',objs.fence2.body:getWorldPoints(objs.fence2.shape:getPoints()))
    love.graphics.polygon('fill',objs.fence3.body:getWorldPoints(objs.fence3.shape:getPoints()))
    love.graphics.polygon('fill',objs.backfence.body:getWorldPoints(objs.backfence.shape:getPoints()))
    for i=1,5 do
    love.graphics.polygon('fill',objs['curve'..i].body:getWorldPoints(objs['curve'..i].shape:getPoints()))    
    love.graphics.polygon('fill',objs['curve2_'..i].body:getWorldPoints(objs['curve2_'..i].shape:getPoints()))    
    love.graphics.polygon('fill',objs['curve3_'..i].body:getWorldPoints(objs['curve3_'..i].shape:getPoints()))    
    love.graphics.polygon('fill',objs['curve4_'..i].body:getWorldPoints(objs['curve4_'..i].shape:getPoints()))    
    end

    love.graphics.polygon('fill',objs.plunger.body:getWorldPoints(objs.plunger.shape:getPoints()))    
    fg(0.6,0.6,0.65)
    rect('fill',14*36-36+4,22*36-2*36+18+9,36-8,36) 
    fg(0.6,0.2,0.2)
    rect('fill',14*36-36+4,22*36-2*36+18+9+plunger.draw,36-8,4)   
    fg(1,1,1,1)

    fg(0.6,0.2,0.2)
    for i=1,3 do
        love.graphics.circle('fill',objs['bumper'..i].body:getX(),objs['bumper'..i].body:getY(),objs['bumper'..i].shape:getRadius())
    end
    
    fg(1,1,1,1)
    love.graphics.polygon('fill',objs.lpaddle.body:getWorldPoints(objs.lpaddle.shape:getPoints()))
    --fg(0.6,0.2,0.6)
    --love.graphics.polygon('fill',objs.lpaddlemax.body:getWorldPoints(objs.lpaddlemax.shape:getPoints()))
    --fg(1,1,1)
    love.graphics.polygon('fill',objs.rpaddle.body:getWorldPoints(objs.rpaddle.shape:getPoints()))
    --local pt1x,pt1y,pt2x,pt2y=objs.border.body:getWorldPoints(objs.border.shape:getPoints())
    --love.graphics.rectangle('line',pt1x,pt1y,pt2x-pt1x,pt2y-pt1y)
    fg(0.6,0.6,0.65)
    lg.print('hello\nworld!')
    fg(1,1,1)
    end
    if world==world2 then
    end
end

love.draw= draw

