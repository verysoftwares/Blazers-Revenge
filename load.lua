function love.load()
    mainfont = lg.newFont('wares/manaspc.ttf', 24)
    lg.setFont(mainfont)
    audio={}
    images={}
    physicsload()
end

function physicsload()
    objs={}
    love.physics.setMeter(36)
    world=love.physics.newWorld(0,9.81*5*36,true)
    
    objs.ball={}
    objs.ball.body=love.physics.newBody(world,4*36,12*36,'dynamic')
    objs.ball.shape=love.physics.newCircleShape(14)
    objs.ball.fixture=love.physics.newFixture(objs.ball.body,objs.ball.shape,0.4)
    objs.ball.fixture:setRestitution(0.8)

    --objs.border={}
    --objs.border.body=love.physics.newBody(world,-6*36,-11*36)
    --objs.border.shape=love.physics.newEdgeShape(0,0,12*36,22*36)
    --objs.border.fixture=love.physics.newFixture(objs.border.body,objs.border.shape)

    for i,v in ipairs({{6*36,-18,12*36,1*36},{12*36+18,11*36,1*36,22*36},{6*36,22*36+18,12*36,1*36},{-18,11*36,1*36,22*36}}) do
        objs['wall'..i]={}
        objs['wall'..i].body=love.physics.newBody(world,v[1],v[2])
        objs['wall'..i].shape=love.physics.newRectangleShape(v[3],v[4])
        objs['wall'..i].fixture=love.physics.newFixture(objs['wall'..i].body,objs['wall'..i].shape)
    end

    objs.gnd={}
    objs.gnd.body=love.physics.newBody(world,2*36,20*36+18)
    objs.gnd.shape=love.physics.newRectangleShape(3*36,4*36)
    objs.gnd.fixture=love.physics.newFixture(objs.gnd.body,objs.gnd.shape)
    
    objs.gnd1_5={}
    objs.gnd1_5.body=love.physics.newBody(world,0,16*36)
    objs.gnd1_5.shape=love.physics.newPolygonShape(0,0,3.5*36,2*36,0,2*36)
    objs.gnd1_5.fixture=love.physics.newFixture(objs.gnd1_5.body,objs.gnd1_5.shape)

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
    
    objs.gnd4_5={}
    objs.gnd4_5.body=love.physics.newBody(world,12*36+18,16*36)
    objs.gnd4_5.shape=love.physics.newPolygonShape(0,0,-3.5*36,2*36,0,2*36)
    objs.gnd4_5.fixture=love.physics.newFixture(objs.gnd4_5.body,objs.gnd4_5.shape)

    objs.gnd5={}
    objs.gnd5.body=love.physics.newBody(world,12*36-2*36+18,22*36)
    objs.gnd5.shape=love.physics.newRectangleShape(4*36,4*36)
    objs.gnd5.fixture=love.physics.newFixture(objs.gnd5.body,objs.gnd5.shape)
    
    objs.gnd6={}
    objs.gnd6.body=love.physics.newBody(world,12*36-1.5*36+18,20*36)
    objs.gnd6.shape=love.physics.newRectangleShape(3*36,4*36)
    objs.gnd6.fixture=love.physics.newFixture(objs.gnd6.body,objs.gnd6.shape)

    objs.lpaddle={}
    objs.lpaddle.body=love.physics.newBody(world,0,0,'dynamic')
    objs.lpaddle.shape=love.physics.newPolygonShape(3*36,19*36,3*36+14,19*36-14,6*36,19*36,3*36+14,19*36+14)
    objs.lpaddle.fixture=love.physics.newFixture(objs.lpaddle.body,objs.lpaddle.shape)

    objs.rpaddle={}
    objs.rpaddle.body=love.physics.newBody(world,0,0,'dynamic')
    objs.rpaddle.shape=love.physics.newPolygonShape(12*36-3*36+18,19*36,12*36-(3*36+14)+18,19*36-14,12*36-6*36+18,19*36,12*36-(3*36+14)+18,19*36+14)
    objs.rpaddle.fixture=love.physics.newFixture(objs.rpaddle.body,objs.rpaddle.shape)

    love.physics.newRevoluteJoint(objs.lpaddle.body,objs.gnd.body,3*36,19*36,false)
    love.physics.newRevoluteJoint(objs.rpaddle.body,objs.gnd4.body,12*36-3*36+18,19*36,false)
end