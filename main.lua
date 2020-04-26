require 'player'

local manager = require 'assets/libraries/roomy'.new()
local state = require 'assets/pages/state'

local iffyCards, iffyCardBacks
local shuffledDeck = {}

-- for our scene manager to work and draw, these have to be global :(
initVars = require 'initVariables'
gameState = initVars.gameState
drawLayers = require 'assets/gameTable'

function love.load()
    nameGenerator()
    -- shuffle like 8 bajillion times.
    shuffledDeck = shuffleDeck(initVars.euchreDeck) -- this is our initial shuffled deck. we'll shuffle more later ;)
    gameState.deck = shuffledDeck
    manager:hook()
    manager:enter(state.inGame) -- just enter in to an "in process" game for now
end

function love.update(dt)
    -- roomy handles all updates based on scene
end

function love.draw()
    love.graphics.setBackgroundColor(0, 120/255, 0) -- a sweet sweet felt green :)
end