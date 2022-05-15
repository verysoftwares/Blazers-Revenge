plunger={ready=false,draw=0}

function update(hw_dt)
    world:update(1/60)

    if (press('lctrl') or press('rctrl')) and tapped('return') then love.event.quit('restart') end

    if tapped('lshift') then
        --local _,_,_,_,x1,y1=objs.lpaddle.body:getWorldPoints(objs.lpaddle.shape:getPoints())
        --print(x1,y1)
        objs.lpaddle.body:applyLinearImpulse(0,-350*10)
    end
    if tapped('rshift') then
        objs.rpaddle.body:applyLinearImpulse(0,-350*10)
    end

    if state=='plunger' then
        if press('down') then
            plunger.ready=true
            plunger.draw=plunger.draw+1
            if plunger.draw>36-4 then plunger.draw=36-4 end
        elseif plunger.ready then
            if objs.ball.body:getY()>=22*36-2*36 then
            objs.ball.body:applyLinearImpulse(0,-30*plunger.draw*0.6)
            end
            plunger.ready=false
            plunger.draw=0
        end
        if objs.ball.body:getX()<12*36 then plunger.ready=false; plunger.draw=0; state=nil end
    end

    t = t+1
end

state='plunger'
love.update= update