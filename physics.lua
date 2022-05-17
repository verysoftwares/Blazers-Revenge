function beginContact(a,b,coll)
    if (a:getUserData()=='ball' and b:getUserData()=='bumper') or (a:getUserData()=='bumper' and b:getUserData()=='ball') then
        local nx,ny=coll:getNormal()
        objs.ball.body:applyLinearImpulse(nx*250,ny*250)
        if upgrades.gate1>0 then upgrades.gate1=upgrades.gate1-1 end
    end
end

function physicsload()
    objs={}
    love.physics.setMeter(36)
    world=love.physics.newWorld(0,9.81*5*36,true)
    world:setCallbacks(beginContact, function() end, function() end, function() end)
    
    objs.ball={}
    objs.ball.body=love.physics.newBody(world,14*36-18,22*36-2*36,'dynamic')
    objs.ball.shape=love.physics.newCircleShape(14)
    objs.ball.fixture=love.physics.newFixture(objs.ball.body,objs.ball.shape,0.4)
    objs.ball.fixture:setRestitution(0.4)
    objs.ball.fixture:setUserData('ball')

    --objs.border={}
    --objs.border.body=love.physics.newBody(world,-6*36,-11*36)
    --objs.border.shape=love.physics.newEdgeShape(0,0,12*36,22*36)
    --objs.border.fixture=love.physics.newFixture(objs.border.body,objs.border.shape)

    for i,v in ipairs({{7*36,-18,14*36,1*36},{14*36+18,11*36,1*36,22*36},{7*36,22*36+18,14*36,1*36},{-18,11*36,1*36,22*36}}) do
        objs['wall'..i]={}
        objs['wall'..i].body=love.physics.newBody(world,v[1],v[2])
        objs['wall'..i].shape=love.physics.newRectangleShape(v[3],v[4])
        objs['wall'..i].fixture=love.physics.newFixture(objs['wall'..i].body,objs['wall'..i].shape)
    end

    objs.gnd={}
    objs.gnd.body=love.physics.newBody(world,2*36,20*36+18)
    objs.gnd.shape=love.physics.newRectangleShape(3*36,4*36)
    objs.gnd.fixture=love.physics.newFixture(objs.gnd.body,objs.gnd.shape)
    
    --objs.gnd1_5={}
    --objs.gnd1_5.body=love.physics.newBody(world,0,16*36)
    --objs.gnd1_5.shape=love.physics.newPolygonShape(0,0,3.5*36,2*36,0,2*36)
    --objs.gnd1_5.fixture=love.physics.newFixture(objs.gnd1_5.body,objs.gnd1_5.shape)

    objs.gnd2={}
    objs.gnd2.body=love.physics.newBody(world,2*36,22*36)
    objs.gnd2.shape=love.physics.newRectangleShape(4*36,4*36)
    objs.gnd2.fixture=love.physics.newFixture(objs.gnd2.body,objs.gnd2.shape)
    
    objs.gnd3={}
    objs.gnd3.body=love.physics.newBody(world,1.5*36,20*36)
    objs.gnd3.shape=love.physics.newRectangleShape(3*36,4*36)
    objs.gnd3.fixture=love.physics.newFixture(objs.gnd3.body,objs.gnd3.shape)
    --objs.edge=love.physics.newEdgeShape(0,0,12*36,22*36)

    objs.gnd4={}
    objs.gnd4.body=love.physics.newBody(world,12*36-2*36+18,20*36+18)
    objs.gnd4.shape=love.physics.newRectangleShape(3*36,4*36)
    objs.gnd4.fixture=love.physics.newFixture(objs.gnd4.body,objs.gnd4.shape)
    
    --objs.gnd4_5={}
    --objs.gnd4_5.body=love.physics.newBody(world,12*36+18,16*36)
    --objs.gnd4_5.shape=love.physics.newPolygonShape(0,0,-3.5*36,2*36,0,2*36)
    --objs.gnd4_5.fixture=love.physics.newFixture(objs.gnd4_5.body,objs.gnd4_5.shape)

    objs.gnd5={}
    objs.gnd5.body=love.physics.newBody(world,12*36-2*36+18,22*36)
    objs.gnd5.shape=love.physics.newRectangleShape(4*36,4*36)
    objs.gnd5.fixture=love.physics.newFixture(objs.gnd5.body,objs.gnd5.shape)
    
    objs.gnd6={}
    objs.gnd6.body=love.physics.newBody(world,12*36-1.5*36+18,20*36)
    objs.gnd6.shape=love.physics.newRectangleShape(3*36,4*36)
    objs.gnd6.fixture=love.physics.newFixture(objs.gnd6.body,objs.gnd6.shape)

    objs.fence={}
    objs.fence.body=love.physics.newBody(world,14*36-1.5*36+9,13*36)
    objs.fence.shape=love.physics.newRectangleShape(18,18*36)
    objs.fence.fixture=love.physics.newFixture(objs.fence.body,objs.fence.shape)

    objs.fence2={}
    objs.fence2.body=love.physics.newBody(world,1.5*36+9,5*36)
    objs.fence2.shape=love.physics.newRectangleShape(18,10*36)
    objs.fence2.fixture=love.physics.newFixture(objs.fence2.body,objs.fence2.shape)

    objs.fence3={}
    objs.fence3.body=love.physics.newBody(world,11*36-9,7*36)
    objs.fence3.shape=love.physics.newRectangleShape(18,6*36)
    objs.fence3.fixture=love.physics.newFixture(objs.fence3.body,objs.fence3.shape)

    objs.backfence={}
    objs.backfence.body=love.physics.newBody(world,1*36,2*36)
    objs.backfence.shape=love.physics.newRectangleShape(2*36,4*36)
    objs.backfence.fixture=love.physics.newFixture(objs.backfence.body,objs.backfence.shape)
    --objs.curve={}

    -- "This shape can have 8 vertices at most, 
    -- and must form a convex shape."
    --local curve={14*36-5*36,0,14*36,0,14*36,5*36}
    --for i=1,20 do
    --    local a=-i/20*pi/2
    --    ins(curve,14*36-5*36-cos(a)*5*36)
    --    ins(curve,5*36-sin(a)*5*36)
    --end
    --objs.curve.body=love.physics.newBody(world,0,0)
    --objs.curve.shape=love.physics.newPolygonShape(unpack(curve))
    --objs.curve.fixture=love.physics.newFixture(objs.curve.body,objs.curve.shape)
    for i=1,5 do
        objs['curve'..i]={}
        local a1=-(i-1)/5*pi/2
        local a2=-i/5*pi/2
        objs['curve'..i].body=love.physics.newBody(world,0,0)
        objs['curve'..i].shape=love.physics.newPolygonShape(14*36,0,14*36-5*36+cos(a1)*5*36,5*36+sin(a1)*5*36,14*36-5*36+cos(a2)*5*36,5*36+sin(a2)*5*36)
        objs['curve'..i].fixture=love.physics.newFixture(objs['curve'..i].body,objs['curve'..i].shape)
    end
    for i=1,5 do
        objs['curve2_'..i]={}
        local a1=-(i-1)/5*pi/2-pi/2
        local a2=-i/5*pi/2-pi/2
        objs['curve2_'..i].body=love.physics.newBody(world,0,0)
        objs['curve2_'..i].shape=love.physics.newPolygonShape(2*36,0,14*36-7*36+cos(a1)*5*36,5*36+sin(a1)*5*36,14*36-7*36+cos(a2)*5*36,5*36+sin(a2)*5*36)
        objs['curve2_'..i].fixture=love.physics.newFixture(objs['curve2_'..i].body,objs['curve2_'..i].shape)
    end
    for i=1,5 do
        objs['curve3_'..i]={}
        local a1=-(i-1)/5*pi/2-pi
        local a2=-i/5*pi/2-pi
        objs['curve3_'..i].body=love.physics.newBody(world,0,0)
        objs['curve3_'..i].shape=love.physics.newPolygonShape(0*36,16*36+2*36,3.5*36+cos(a1)*3.5*36,16*36-5*36+sin(a1)*7*36,3.5*36+cos(a2)*3.5*36,16*36-5*36+sin(a2)*7*36)
        objs['curve3_'..i].fixture=love.physics.newFixture(objs['curve3_'..i].body,objs['curve3_'..i].shape)
    end
    for i=1,5 do
        objs['curve4_'..i]={}
        local a1=-(i-1)/5*pi/2-3*pi/2
        local a2=-i/5*pi/2-3*pi/2
        objs['curve4_'..i].body=love.physics.newBody(world,0,0)
        objs['curve4_'..i].shape=love.physics.newPolygonShape(12*36+18,16*36+2*36,5*36+18+3.5*36+cos(a1)*3.5*36,16*36-5*36+sin(a1)*7*36,5*36+18+3.5*36+cos(a2)*3.5*36,16*36-5*36+sin(a2)*7*36)
        objs['curve4_'..i].fixture=love.physics.newFixture(objs['curve4_'..i].body,objs['curve4_'..i].shape)
    end

    for i=1,3 do
    local a=-(i-1)/3*pi*2-pi/2
    objs['bumper'..i]={}
    objs['bumper'..i].body=love.physics.newBody(world,10*36-2*36-36+cos(a)*2.5*36,5*36+sin(a)*2.5*36)
    objs['bumper'..i].shape=love.physics.newCircleShape(36+9)
    objs['bumper'..i].fixture=love.physics.newFixture(objs['bumper'..i].body,objs['bumper'..i].shape,0.4)
    objs['bumper'..i].fixture:setUserData('bumper')
    end

    objs.plunger={}
    objs.plunger.body=love.physics.newBody(world,14*36-18,22*36-18-9)
    objs.plunger.shape=love.physics.newRectangleShape(36,36+18)
    objs.plunger.fixture=love.physics.newFixture(objs.plunger.body,objs.plunger.shape)

    objs.lpaddle={}
    objs.lpaddle.body=love.physics.newBody(world,0,0,'dynamic')
    objs.lpaddle.shape=love.physics.newPolygonShape(3*36,19*36,3*36+14,19*36-14,6*36-14,19*36-14,6*36,19*36,6*36-14,19*36+14,3*36+14,19*36+14)
    objs.lpaddle.fixture=love.physics.newFixture(objs.lpaddle.body,objs.lpaddle.shape)

    objs.lpaddlemax={}
    --objs.lpaddlemax.body=love.physics.newBody(world,0,0,'kinematic')
    --objs.lpaddlemax.shape=love.physics.newPolygonShape(3*36,19*36,6*36,19*36,6*36,20*36)
    --objs.lpaddlemax.fixture=love.physics.newFixture(objs.lpaddlemax.body,objs.lpaddlemax.shape,0)

    --love.physics.newWeldJoint(objs.lpaddlemax.body,objs.lpaddle.body,6*36,19*36,false)

    objs.rpaddle={}
    objs.rpaddle.body=love.physics.newBody(world,0,0,'dynamic')
    objs.rpaddle.shape=love.physics.newPolygonShape(12*36-3*36+18,19*36,12*36-(3*36+14)+18,19*36-14,12*36-(6*36-14)+18,19*36-14,12*36-6*36+18,19*36,12*36-(6*36-14)+18,19*36+14,12*36-(3*36+14)+18,19*36+14)
    objs.rpaddle.fixture=love.physics.newFixture(objs.rpaddle.body,objs.rpaddle.shape)

    love.physics.newRevoluteJoint(objs.lpaddle.body,objs.gnd.body,3*36,19*36,false)
    love.physics.newRevoluteJoint(objs.rpaddle.body,objs.gnd4.body,12*36-3*36+18,19*36,false)
end