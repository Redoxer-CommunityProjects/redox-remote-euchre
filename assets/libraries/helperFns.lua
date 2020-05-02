function table.shallow_copy(t)
    local t2 = {}
    for k,v in pairs(t) do
      t2[k] = v
    end
    return t2
end

function table.find(f, l) -- find element v of l satisfying f(v)
  for _, v in ipairs(l) do
    if f(v) then
      return v
    end
  end
  return nil
end

function splitString (inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={}
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    table.insert(t, str)
  end
  return t
end

function table.generateValueIndex(index, inputTable)
  local newTable = {}
  local pathTable = splitString(index, '.')
  for _, v in ipairs(inputTable) do
    local property = v[pathTable[1]]
    for i = 2, #pathTable do
      local nextPath = pathTable[i]
      property = property[nextPath]
    end
    if (newTable[property] == nil) then
      newTable[property] = {}
    end
    table.insert(newTable[property], v)
  end
  return newTable
end

function table.indexOf(t, object)
  if type(t) ~= "table" then error("table expected, got " .. type(t), 2) end

  for i, v in ipairs(t) do
      if object == v then
          return i
      end
  end
end