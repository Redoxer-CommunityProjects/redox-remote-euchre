local lEuchreDeck = {
    { 'Clubs9', 'Clubs', '9' },
    { 'Clubs10', 'Clubs', '10' },
    { 'ClubsJ', 'Clubs', 'J' },
    { 'ClubsQ', 'Clubs', 'Q' },
    { 'ClubsK', 'Clubs', 'K' },
    { 'ClubsA', 'Clubs', 'A' },
    { 'Hearts9', 'Hearts', '9' },
    { 'Hearts10', 'Hearts', '10' },
    { 'HeartsJ', 'Hearts', 'J' },
    { 'HeartsQ', 'Hearts', 'Q' },
    { 'HeartsK', 'Hearts', 'K' },
    { 'HeartsA', 'Hearts', 'A' },
    { 'Diamonds9', 'Diamonds', '9' },
    { 'Diamonds10', 'Diamonds', '10' },
    { 'DiamondsJ', 'Diamonds', 'J' },
    { 'DiamondsQ', 'Diamonds', 'Q' },
    { 'DiamondsK', 'Diamonds', 'K' },
    { 'DiamondsA', 'Diamonds', 'A' },
    { 'Spades9', 'Spades', '9' },
    { 'Spades10', 'Spades', '10' },
    { 'SpadesJ', 'Spades', 'J' },
    { 'SpadesQ', 'Spades', 'Q' },
    { 'SpadesK', 'Spades', 'K' },
    { 'SpadesA', 'Spades', 'A' },
}

local lGameState = {
    myPlayer = {},
    opp1 = {},
    opp2 = {},
    partner = {},
    score = {},
    currentHand = {},
    deck = {},
    tableOrder = { 'myPlayer', 'opp1', 'partner', 'opp2'}
}

local lScaleCards = 0.8

return {
    euchreDeck = lEuchreDeck,
    gameState = lGameState,
    scaleCards = lScaleCards,
}