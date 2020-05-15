require 'euchreEngine'

function trumpChosen(suit, button)
    -- this is the action that occurs when my player has chosen to call trump
    -- first round
    setTrump(suit)
    print('trump set to '..suit)
    button:rest()
    -- head to gameplay
    manager:enter(state.inGame)
end
