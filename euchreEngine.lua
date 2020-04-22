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