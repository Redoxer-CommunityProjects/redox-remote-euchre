-- this is the 'index' file for all of our pages
-- main.lua will require this when using roomy to manage our different scenes

local state = {
    title = require "assets/pages/title",
    inGame = require "assets/pages/game/inGame",
    bidding = require "assets/pages/game/bidding"
}

return state