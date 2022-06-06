-- betterTunnel
-- chrimsbrew

data = nil

------------
-- CONFIG --
------------
auto_refuel = true
place_torches = true
height = ...
------------

last_torch = 0

while true do -- infinite loop
    if auto_refuel then -- when the fuel level is less than 20 scan for fuel (usually coal) and consume it (if auto refuel is enabled).
        if turtle.getFuelLevel() < 20 then
            turtle.refuel()
        end
    end
    
    turtle.dig() -- main movement
    turtle.forward()
    turtle.turnLeft()
    turtle.dig()
    for i=0,height-3 do
        turtle.digUp()
        turtle.up()
        turtle.dig()
    end
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    for i=0,height-3 do
        turtle.down()
        turtle.dig()
    end
    turtle.turnLeft()

    if place_torches then -- turn around and place a torch (if place torches is enabled)
        if last_torch == 14 then
            turtle.select(1)
            last_torch = 0
            turtle.turnLeft()
            turtle.turnLeft()
            turtle.place()
            turtle.turnLeft()
            turtle.turnLeft()
        end
        last_torch = last_torch + 1
    end
end
