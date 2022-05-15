-- draw setup
    lg.setDefaultFilter('nearest')
    
function draw()
    bg(0.6,0.6,0.65)
    --lg.rotate(pi/6)
    love.graphics.circle('fill',objs.ball.body:getX(),objs.ball.body:getY(),objs.ball.shape:getRadius())
    --love.graphics.polygon('fill',objs.gnd.body:getWorldPoints(objs.gnd.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd2.body:getWorldPoints(objs.gnd2.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd1_5.body:getWorldPoints(objs.gnd1_5.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd3.body:getWorldPoints(objs.gnd3.shape:getPoints()))
    --love.graphics.polygon('fill',objs.gnd4.body:getWorldPoints(objs.gnd4.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd5.body:getWorldPoints(objs.gnd5.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd4_5.body:getWorldPoints(objs.gnd4_5.shape:getPoints()))
    love.graphics.polygon('fill',objs.gnd6.body:getWorldPoints(objs.gnd6.shape:getPoints()))
    
    love.graphics.polygon('fill',objs.lpaddle.body:getWorldPoints(objs.lpaddle.shape:getPoints()))
    love.graphics.polygon('fill',objs.rpaddle.body:getWorldPoints(objs.rpaddle.shape:getPoints()))
    --local pt1x,pt1y,pt2x,pt2y=objs.border.body:getWorldPoints(objs.border.shape:getPoints())
    --love.graphics.rectangle('line',pt1x,pt1y,pt2x-pt1x,pt2y-pt1y)
    lg.print('hello world!')
end

love.draw= draw

