local ButtonManager = {}

function isOverButton(mouseX, mouseY, button)
    if mouseX > button.x and mouseX < button.x + button.width
        and mouseY > button.y and mouseY < button.y + button.height then
        
        return true
    end
    return false
end
-- ------------------------------------------------
-- Constructor
-- ------------------------------------------------
function ButtonManager.new()
    local self = {}
    local buttons = {}

    function self:addButton(id, button)
        buttons[id] = button;
    end

    function self:addButtons(buttonsToAdd)
        for id, button in ipairs(buttonsToAdd) do
            buttons[id] = button
        end
    end

    function self:buttonExists(id)
        return buttons[id] ~= nil
    end

    function self:removeButton(id)
        buttons[id] = nil
    end

    function self:removeAllButtons()
        buttons = nil
    end

    function self:draw()
        for _, button in ipairs(buttons) do
            button:draw()
        end
    end

    -- the button manager should highlight button currently hovered
    function self:update(dt)
        mouseX, mouseY = love.mouse.getPosition()
        -- check each button, confirm if the mouse is over it
        -- if so, call the button's highlight
        for _, button in ipairs(buttons) do
            button:update(dt)
            if isOverButton(mouseX, mouseY, button) then
                button:highlight()
            else
                -- otherwise, make sure the button is at resting state
                button:rest()
            end
        end
    end

    function self:handleMouseClick(x, y, k)
        if k == 1 then
            for _, button in ipairs(buttons) do
                if isOverButton(mouseX, mouseY, button) then
                    button:press()
                end
            end
        end
    end

    return self;
end

-- ------------------------------------------------
-- Return Module
-- ------------------------------------------------
return ButtonManager;