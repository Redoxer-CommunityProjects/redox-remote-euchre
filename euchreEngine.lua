require 'assets/libraries/helperFns'

urand = assert (io.open ('/dev/urandom', 'rb')) -- this pegs us to relying on Unix-like systems
rand  = assert (io.open ('/dev/random', 'rb'))

function RNG (b, m, r) -- graciously copied from https://stackoverflow.com/questions/31082209/other-ways-to-get-a-random-number-in-lua
  	b = b or 4
  	m = m or 256
  	r = r or urand
  	local n, s = 0, r:read (b)

  	for i = 1, s:len () do
    	n = m * n + s:byte (i)
  	end

  	return n
end

function FYShuffle( tInput )
    math.randomseed(RNG(32))
    local tReturn = {}
    for i = #tInput, 1, -1 do
        local j = math.random(i)
        tInput[i], tInput[j] = tInput[j], tInput[i]
        table.insert(tReturn, tInput[i])
    end
    return tReturn
end

function shuffleDeck(deck)
    math.randomseed(RNG(32))
    local randomTimes = math.random(3, 30) -- we'll use this to determine the number of times to shuffle
    local shuffledDeck = deck
    for i=1, randomTimes do
        shuffledDeck = FYShuffle(shuffledDeck)
    end
    return shuffledDeck
end

function deal(gameState)
	local deckToDeal = table.shallow_copy(gameState.deck)
  	local dealerPos = gameState.dealerPos
  	-- euchre is dealt with 2 and only 2 passes around the table
	-- starting with position immediately to the right (+1 to tableOrder table)
	for i = 1, 2 do
		for j = 1, 4 do
			local nextPos = (dealerPos + j) % 4
			local pos = nextPos == 0 and 4 or nextPos
			for k = 1, i + 1 do
				table.insert(gameState[gameState.tableOrder[pos]], table.remove(deckToDeal, 1))
			end
		end
	end
	
	-- the remaining cards go to the kitty
  	return gameState
end

function startHand(gameState)
  	-- reset currentHand attributes (trump, tricks, etc..)
	gameState.currentHand = {
    	trump = nil,
    	tricks = { us = 0, them = 0 }
	}
	  
	-- move the dealer
	local nextPos = gameState.dealerPos + 1 % 4
	gameState.dealerPos = nextPos == 0 and 4 or nextPos -- this is a js ternary
  	-- deal the next hand
  	return deal(gameState)
end

function startGame(gameState)
  	-- reset score
  	gameState.score = { us = 0, them = 0 }

  	-- shuffle!
  	local curDeck = gameState.deck
  	local shuffledDeck = shuffleDeck(curDeck)

  	-- need to assign a dealer
  	math.randomseed(RNG(32))
  	gameState.dealerPos = math.random(4)
  	local dealer = gameState.tableOrder[gameState.dealerPos]
  	gameState[dealer].isDealer = true

  	-- now start up our hand
  	return startHand(gameState)
end