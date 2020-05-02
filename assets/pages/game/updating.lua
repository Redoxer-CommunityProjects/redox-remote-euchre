local animateTimeCounter = 0
local frequency = .5 -- slooooooowww
local angFreq = 2 * math.pi * frequency
local amp = 5 -- move it 10 pixels each way

function animateIndicator(dt)
    animateTimeCounter = animateTimeCounter + dt
    -- oscillate the indicator
    -- we'll use a time-based sine wave to make this simple
    local currentArrowPos = gameState.currentHand.bidding.currentArrowPos
    local pos = amp * math.sin(angFreq * animateTimeCounter)
    -- now update the position, based on the direction the arrow is facing
    if (gameState.currentHand.bidding.currentChoice == 'myPlayer'
        or gameState.currentHand.bidding.currentChoice == 'partner') then
        -- apply the oscillation to the y value (the app that setup positions transposed x and y)
        gameState.currentHand.bidding.arrowPos.y = gameState.currentHand.bidding.arrowPos.origY + pos
    else
        gameState.currentHand.bidding.arrowPos.x = gameState.currentHand.bidding.arrowPos.origX + pos
    end
end