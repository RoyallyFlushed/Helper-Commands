
--[[  Constrain Command: p5.js source  ]]
local function constrain(n, low, high)
    return math.max(math.min(n, high), low)
end

--// EX:
for angle = 1, 100 do
    local constrainedAngle = constrain(angle, 1, 50) 
end
-->> constrainedAngle will never exceed 50 in value
--

--[[  Map Command: p5.js source  ]]
--// maps a given range from a specific iterator to a new range
local function map(n, start, stop, newStart, newStop, withinBounds)
    local value = ((n - start) / (stop - start)) * (newStop - newStart) + newStart
    
    --// Returns basic value
    if not withinBounds then
        return value
    end
    
    --// Returns values constrained to exact range
    if newStart < newStop then
        return constrain(value, newStart, newStop)
    else
        return constrain(value, newStop, newStart)
    end
end

--// EX:
for i = 0, 600 do
    print(map(i, 0, 600, 0, 255, true))
    -->> Outputs the range 0-600 mapped between 0-255
end
--

