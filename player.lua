
-- Static Objects
adjectives = {
    'Squishy',
    'Floppy',
    'Unwarranted',
    'Nuclear',
    'Self-Inflicted',
    'Inevitable',
    'Passive-aggressive',
    'Squirting',
    'Crusty',
    'Stringy',
    'Cowering',
    'Curious',
    'Delicious',
    'Synergistic',
    'Bidirectional',
    'Pouty',
    'Vigorous'
}

nouns = {
    'Tardigrade',
    'Lumberjack',
    'Helicopter Mom',
    'Dark Web',
    'Burp',
    'Proposition',
    'Violation',
    'Mullet',
    'Breath',
    'Whiskey',
    'Teletubby',
    'Vision Board',
    'Mayonnaise',
    'Cheese',
    'Pinky Toe',
    'Party Drugs',
    'Sausage',
    'Caress',
    'Shart',
    'Toddler',
    'Introvert',
    'Night Terrors',
    'Underpants'
    
}

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'


--
function nameGenerator()
    nameIn = getRealName()
    generateFakeName(nameIn)
end

function getRealName()
    nameIn = "Alex Nussel"
    return nameIn
end

function generateFakeName(data)
  -- Base64 to Base10 = nameIn10
    nameBase64 = encBase64(data)
    nameBase10 = base64ToBase10(nameBase64)
  -- First = nameIn10 mod Number of Adjectives
    firstNameIndex = math.fmod(nameBase10,#adjectives)
    firstName = adjectives[firstNameIndex]
  -- Last = nameIn10 mod Number of Nouns
    lastNameIndex = math.fmod(nameBase10,#nouns)
    lastName = nouns[lastNameIndex]
    print(firstName .. ' ' .. lastName)
end


-- Helper Functions


-- encoding
function encBase64(data)
    return ((data:gsub('.', function(x) 
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#data%3+1])
end

-- decoding
function decBase64(data)
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

function base64ToBase10(data)
    -- For each character in data
    local array = {}
    for i in string.gmatch(data, ".") do
      table.insert(array, i)
    end

    runningTotal = 0
    for j = #array-1, 1, -1 do                      -- Iterate backwards, Start with 2, because last char is "="
        x = string.find(b, array[j])
        index = #array-j+1                          -- Start Counting from 0
        runningTotal = runningTotal + x * 64^(index)
    end
    return runningTotal


end
