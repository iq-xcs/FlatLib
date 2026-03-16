-- ══════════════════════════════════════════════════════════════
--  FlatLib  —  Roblox Executor UI Library  (2018 flat style)
--  Использование:
--
--  local FL = loadstring(...)()   или просто скопируй этот файл
--
--  local win = FL.Window("Мой чит")
--  local tab1 = win:Tab("ESP")
--  local tab2 = win:Tab("Player")
--
--  tab1:Toggle("Wallhack", false, function(v) end)
--  tab1:Button("Teleport", function() end)
--  tab1:Slider("Speed", 4, 120, 16, function(v) end)
--  tab1:TextBox("Name", "default", function(v) end)
--  tab1:Dropdown("Mode", {"A","B","C"}, function(v) end)
--  tab1:Label("-- Раздел --")
--  tab1:Separator()
--
--  win:Show()   /   win:Hide()   /   win:Toggle()
-- ══════════════════════════════════════════════════════════════

local FlatLib = {}
FlatLib.__index = FlatLib

-- ─── Сервисы ─────────────────────────────────────────────────
local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players          = game:GetService("Players")
local localPlayer      = Players.LocalPlayer
local playerGui        = localPlayer:WaitForChild("PlayerGui")

-- ─── Палитра ─────────────────────────────────────────────────
local C = {
    bg        = Color3.fromRGB(28,  28,  28),
    header    = Color3.fromRGB(45,  45,  45),
    tabBar    = Color3.fromRGB(35,  35,  35),
    tabActive = Color3.fromRGB(50,  50,  50),
    tabInact  = Color3.fromRGB(35,  35,  35),
    row       = Color3.fromRGB(36,  36,  36),
    rowHov    = Color3.fromRGB(46,  46,  46),
    border    = Color3.fromRGB(65,  65,  65),
    text      = Color3.fromRGB(215, 215, 215),
    dim       = Color3.fromRGB(130, 130, 130),
    on        = Color3.fromRGB(80,  175, 80),
    onBg      = Color3.fromRGB(35,  80,  35),
    off       = Color3.fromRGB(175, 55,  55),
    offBg     = Color3.fromRGB(70,  28,  28),
    accent    = Color3.fromRGB(195, 155, 55),
    accentDim = Color3.fromRGB(80,  65,  25),
    input     = Color3.fromRGB(20,  20,  20),
    sep       = Color3.fromRGB(55,  55,  55),
    scrollbar = Color3.fromRGB(80,  80,  80),
}

local FONT_BOLD   = Enum.Font.SourceSansBold
local FONT_REG    = Enum.Font.SourceSans
local ROW_H       = 28
local WIN_W       = 250
local CONTENT_H   = 320
local TAB_H       = 24

-- ─── Утилиты ─────────────────────────────────────────────────

local function inst(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    if parent then o.Parent = parent end
    return o
end

local function border(parent, color)
    return inst("Frame", {
        Size             = UDim2.new(1,0,0,1),
        Position         = UDim2.new(0,0,1,-1),
        BackgroundColor3 = color or C.border,
        BorderSizePixel  = 0,
    }, parent)
end

local function hoverRow(row)
    row.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseMovement then
            row.BackgroundColor3 = C.rowHov
        end
    end)
    row.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseMovement then
            row.BackgroundColor3 = C.row
        end
    end)
end

-- ─── Внутренний класс Tab ─────────────────────────────────────

local Tab = {}
Tab.__index = Tab

function Tab.new(scroll)
    local self = setmetatable({}, Tab)
    self._scroll = scroll
    self._order  = 0
    return self
end

function Tab:_nextOrder()
    self._order += 1
    return self._order
end

function Tab:_makeRow(h)
    local row = inst("Frame", {
        LayoutOrder      = self:_nextOrder(),
        Size             = UDim2.new(1,0,0, h or ROW_H),
        BackgroundColor3 = C.row,
        BorderSizePixel  = 0,
    }, self._scroll)
    border(row)
    return row
end

-- ── Toggle ───────────────────────────────────────────────────

function Tab:Toggle(label, default, callback)
    local row = self:_makeRow()
    hoverRow(row)

    -- цветной квадрат-статус
    local sq = inst("Frame", {
        Size             = UDim2.new(0,6,0,6),
        Position         = UDim2.new(0,8,0.5,-3),
        BackgroundColor3 = default and C.on or C.off,
        BorderSizePixel  = 0,
    }, row)

    inst("TextLabel", {
        Size                  = UDim2.new(1,-115,1,0),
        Position              = UDim2.new(0,22,0,0),
        BackgroundTransparency = 1,
        Text                  = label,
        TextColor3            = C.text,
        TextSize              = 13,
        Font                  = FONT_REG,
        TextXAlignment        = Enum.TextXAlignment.Left,
    }, row)

    local btn = inst("TextButton", {
        Size             = UDim2.new(0,56,0,18),
        Position         = UDim2.new(1,-64,0.5,-9),
        BackgroundColor3 = default and C.onBg or C.offBg,
        BorderColor3     = default and C.on  or C.off,
        BorderSizePixel  = 1,
        Text             = default and "ON" or "OFF",
        TextColor3       = default and C.on  or C.off,
        TextSize         = 12,
        Font             = FONT_BOLD,
        AutoButtonColor  = false,
    }, row)

    local state = default
    btn.MouseButton1Click:Connect(function()
        state = not state
        sq.BackgroundColor3  = state and C.on   or C.off
        btn.Text             = state and "ON"   or "OFF"
        btn.TextColor3       = state and C.on   or C.off
        btn.BackgroundColor3 = state and C.onBg or C.offBg
        btn.BorderColor3     = state and C.on   or C.off
        if callback then callback(state) end
    end)

    -- возвращаем объект для внешнего управления
    return {
        SetState = function(_, v)
            state = v
            sq.BackgroundColor3  = v and C.on   or C.off
            btn.Text             = v and "ON"   or "OFF"
            btn.TextColor3       = v and C.on   or C.off
            btn.BackgroundColor3 = v and C.onBg or C.offBg
            btn.BorderColor3     = v and C.on   or C.off
        end,
        GetState = function() return state end,
    }
end

-- ── Button ───────────────────────────────────────────────────

function Tab:Button(label, callback)
    local btn = inst("TextButton", {
        LayoutOrder      = self:_nextOrder(),
        Size             = UDim2.new(1,0,0,ROW_H),
        BackgroundColor3 = C.row,
        BorderSizePixel  = 0,
        Text             = "",
        AutoButtonColor  = false,
    }, self._scroll)
    border(btn)

    inst("TextLabel", {
        Size                  = UDim2.new(0,14,1,0),
        Position              = UDim2.new(0,8,0,0),
        BackgroundTransparency = 1,
        Text                  = ">",
        TextColor3            = C.accent,
        TextSize              = 13,
        Font                  = FONT_BOLD,
    }, btn)

    inst("TextLabel", {
        Size                  = UDim2.new(1,-26,1,0),
        Position              = UDim2.new(0,24,0,0),
        BackgroundTransparency = 1,
        Text                  = label,
        TextColor3            = C.text,
        TextSize              = 13,
        Font                  = FONT_REG,
        TextXAlignment        = Enum.TextXAlignment.Left,
    }, btn)

    btn.MouseEnter:Connect(function() btn.BackgroundColor3 = C.rowHov end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3 = C.row    end)
    btn.MouseButton1Click:Connect(function()
        if callback then callback() end
    end)
end

-- ── Slider ───────────────────────────────────────────────────

function Tab:Slider(label, min, max, default, callback)
    local row = inst("Frame", {
        LayoutOrder      = self:_nextOrder(),
        Size             = UDim2.new(1,0,0,46),
        BackgroundColor3 = C.row,
        BorderSizePixel  = 0,
    }, self._scroll)
    border(row)

    inst("Frame", {
        Size             = UDim2.new(0,6,0,6),
        Position         = UDim2.new(0,8,0,10),
        BackgroundColor3 = C.accent,
        BorderSizePixel  = 0,
    }, row)

    inst("TextLabel", {
        Size                  = UDim2.new(1,-80,0,18),
        Position              = UDim2.new(0,22,0,4),
        BackgroundTransparency = 1,
        Text                  = label,
        TextColor3            = C.text,
        TextSize              = 13,
        Font                  = FONT_REG,
        TextXAlignment        = Enum.TextXAlignment.Left,
    }, row)

    local valLbl = inst("TextLabel", {
        Size                  = UDim2.new(0,52,0,18),
        Position              = UDim2.new(1,-58,0,4),
        BackgroundTransparency = 1,
        Text                  = tostring(default),
        TextColor3            = C.accent,
        TextSize              = 12,
        Font                  = FONT_BOLD,
        TextXAlignment        = Enum.TextXAlignment.Right,
    }, row)

    -- трек
    local track = inst("Frame", {
        Size             = UDim2.new(1,-22,0,6),
        Position         = UDim2.new(0,14,0,34),
        BackgroundColor3 = C.input,
        BorderColor3     = C.border,
        BorderSizePixel  = 1,
    }, row)

    local pct0 = (default - min) / (max - min)
    local fill = inst("Frame", {
        Size             = UDim2.new(pct0, 0, 1, 0),
        BackgroundColor3 = C.accent,
        BorderSizePixel  = 0,
    }, track)

    local handle = inst("Frame", {
        Size             = UDim2.new(0,2,1,2),
        Position         = UDim2.new(pct0,0,0,-1),
        BackgroundColor3 = Color3.fromRGB(220,220,220),
        BorderSizePixel  = 0,
    }, track)

    local current = default
    local dragging = false

    local function update(px)
        local ap = track.AbsolutePosition
        local as = track.AbsoluteSize
        local p  = math.clamp((px - ap.X) / as.X, 0, 1)
        current  = math.floor(min + p * (max - min))
        fill.Size     = UDim2.new(p, 0, 1, 0)
        handle.Position = UDim2.new(p, -1, 0, -1)
        valLbl.Text   = tostring(current)
        if callback then callback(current) end
    end

    local hitbox = inst("TextButton", {
        Size                  = UDim2.new(1,0,3,0),
        Position              = UDim2.new(0,0,-1,0),
        BackgroundTransparency = 1,
        Text                  = "",
        ZIndex                = 5,
    }, track)

    hitbox.MouseButton1Down:Connect(function(x) dragging = true; update(x) end)
    UserInputService.InputChanged:Connect(function(i)
        if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
            update(i.Position.X)
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)

    return {
        SetValue = function(_, v) update(track.AbsolutePosition.X + (v-min)/(max-min)*track.AbsoluteSize.X) end,
        GetValue = function() return current end,
    }
end

-- ── TextBox ──────────────────────────────────────────────────

function Tab:TextBox(label, placeholder, callback)
    local row = inst("Frame", {
        LayoutOrder      = self:_nextOrder(),
        Size             = UDim2.new(1,0,0,ROW_H),
        BackgroundColor3 = C.row,
        BorderSizePixel  = 0,
    }, self._scroll)
    border(row)

    inst("TextLabel", {
        Size                  = UDim2.new(0.45,0,1,0),
        Position              = UDim2.new(0,22,0,0),
        BackgroundTransparency = 1,
        Text                  = label,
        TextColor3            = C.text,
        TextSize              = 13,
        Font                  = FONT_REG,
        TextXAlignment        = Enum.TextXAlignment.Left,
    }, row)

    inst("Frame", {
        Size             = UDim2.new(0,6,0,6),
        Position         = UDim2.new(0,8,0.5,-3),
        BackgroundColor3 = C.dim,
        BorderSizePixel  = 0,
    }, row)

    local box = inst("TextBox", {
        Size             = UDim2.new(0.5,-8,0,18),
        Position         = UDim2.new(0.5,0,0.5,-9),
        BackgroundColor3 = C.input,
        BorderColor3     = C.border,
        BorderSizePixel  = 1,
        PlaceholderText  = placeholder or "",
        PlaceholderColor3 = C.dim,
        Text             = "",
        TextColor3       = C.text,
        TextSize         = 12,
        Font             = FONT_REG,
        ClearTextOnFocus = false,
    }, row)

    box.FocusLost:Connect(function(enter)
        if callback then callback(box.Text) end
    end)

    return {
        GetText = function() return box.Text end,
        SetText = function(_, v) box.Text = v end,
    }
end

-- ── Dropdown ─────────────────────────────────────────────────

function Tab:Dropdown(label, options, callback)
    -- основная строка
    local row = inst("Frame", {
        LayoutOrder      = self:_nextOrder(),
        Size             = UDim2.new(1,0,0,ROW_H),
        BackgroundColor3 = C.row,
        BorderSizePixel  = 0,
        ClipsDescendants = false,
        ZIndex           = 10,
    }, self._scroll)
    border(row)

    inst("Frame", {
        Size             = UDim2.new(0,6,0,6),
        Position         = UDim2.new(0,8,0.5,-3),
        BackgroundColor3 = C.accent,
        BorderSizePixel  = 0,
        ZIndex           = 10,
    }, row)

    inst("TextLabel", {
        Size                  = UDim2.new(0.45,0,1,0),
        Position              = UDim2.new(0,22,0,0),
        BackgroundTransparency = 1,
        Text                  = label,
        TextColor3            = C.text,
        TextSize              = 13,
        Font                  = FONT_REG,
        TextXAlignment        = Enum.TextXAlignment.Left,
        ZIndex                = 10,
    }, row)

    local selected = options[1] or ""
    local open     = false

    local selBtn = inst("TextButton", {
        Size             = UDim2.new(0.5,-8,0,18),
        Position         = UDim2.new(0.5,0,0.5,-9),
        BackgroundColor3 = C.input,
        BorderColor3     = C.border,
        BorderSizePixel  = 1,
        Text             = selected .. " v",
        TextColor3       = C.text,
        TextSize         = 12,
        Font             = FONT_REG,
        AutoButtonColor  = false,
        ZIndex           = 10,
    }, row)

    -- выпадающий список
    local dropFrame = inst("Frame", {
        Size             = UDim2.new(0.5,-8,0, #options * 22),
        Position         = UDim2.new(0.5,0,1,1),
        BackgroundColor3 = C.input,
        BorderColor3     = C.border,
        BorderSizePixel  = 1,
        Visible          = false,
        ZIndex           = 20,
    }, row)

    local dList = inst("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding   = UDim.new(0,0),
    }, dropFrame)

    for i, opt in ipairs(options) do
        local ob = inst("TextButton", {
            LayoutOrder      = i,
            Size             = UDim2.new(1,0,0,22),
            BackgroundColor3 = C.input,
            BorderSizePixel  = 0,
            Text             = opt,
            TextColor3       = C.dim,
            TextSize         = 12,
            Font             = FONT_REG,
            AutoButtonColor  = false,
            ZIndex           = 20,
        }, dropFrame)

        local bord2 = inst("Frame", {
            Size             = UDim2.new(1,0,0,1),
            Position         = UDim2.new(0,0,1,-1),
            BackgroundColor3 = C.sep,
            BorderSizePixel  = 0,
            ZIndex           = 20,
        }, ob)

        ob.MouseEnter:Connect(function() ob.BackgroundColor3 = C.rowHov end)
        ob.MouseLeave:Connect(function() ob.BackgroundColor3 = C.input  end)
        ob.MouseButton1Click:Connect(function()
            selected      = opt
            selBtn.Text   = opt .. " v"
            dropFrame.Visible = false
            open          = false
            if callback then callback(selected) end
        end)
    end

    selBtn.MouseButton1Click:Connect(function()
        open = not open
        dropFrame.Visible = open
    end)

    -- закрыть при клике мимо
    UserInputService.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 and open then
            task.wait()
            if open then
                dropFrame.Visible = false; open = false
            end
        end
    end)

    return {
        GetSelected = function() return selected end,
        SetSelected = function(_, v) selected=v; selBtn.Text=v.." v" end,
    }
end

-- ── Label ────────────────────────────────────────────────────

function Tab:Label(text)
    local row = inst("Frame", {
        LayoutOrder      = self:_nextOrder(),
        Size             = UDim2.new(1,0,0,20),
        BackgroundColor3 = Color3.fromRGB(22,22,22),
        BorderSizePixel  = 0,
    }, self._scroll)

    inst("TextLabel", {
        Size                  = UDim2.new(1,-12,1,0),
        Position              = UDim2.new(0,8,0,0),
        BackgroundTransparency = 1,
        Text                  = text,
        TextColor3            = C.dim,
        TextSize              = 11,
        Font                  = FONT_BOLD,
        TextXAlignment        = Enum.TextXAlignment.Left,
    }, row)
end

-- ── Separator ────────────────────────────────────────────────

function Tab:Separator()
    inst("Frame", {
        LayoutOrder      = self:_nextOrder(),
        Size             = UDim2.new(1,0,0,1),
        BackgroundColor3 = C.sep,
        BorderSizePixel  = 0,
    }, self._scroll)
end

-- ─── Класс Window ─────────────────────────────────────────────

local Window = {}
Window.__index = Window

function FlatLib.Window(title)
    local self = setmetatable({}, Window)
    self._tabs     = {}
    self._tabBtns  = {}
    self._active   = nil
    self._visible  = true

    -- ScreenGui
    self._sg = inst("ScreenGui", {
        Name           = "FlatLib_" .. title,
        ResetOnSpawn   = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    }, playerGui)

    -- корневой фрейм
    local win = inst("Frame", {
        Size             = UDim2.new(0,WIN_W,0,0),
        Position         = UDim2.new(0,8,0,8),
        BackgroundColor3 = C.bg,
        BorderColor3     = C.border,
        BorderSizePixel  = 1,
        AutomaticSize    = Enum.AutomaticSize.None,
        Active           = true,
        Draggable        = true,
    }, self._sg)
    self._win = win

    inst("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding   = UDim.new(0,0),
    }, win)

    -- шапка
    local header = inst("Frame", {
        LayoutOrder      = 0,
        Size             = UDim2.new(1,0,0,24),
        BackgroundColor3 = C.header,
        BorderSizePixel  = 0,
    }, win)

    inst("TextLabel", {
        Size                  = UDim2.new(1,-8,1,0),
        Position              = UDim2.new(0,6,0,0),
        BackgroundTransparency = 1,
        Text                  = "[FL] " .. title,
        TextColor3            = C.text,
        TextSize              = 13,
        Font                  = FONT_BOLD,
        TextXAlignment        = Enum.TextXAlignment.Left,
    }, header)

    -- разделитель
    inst("Frame", {
        LayoutOrder      = 1,
        Size             = UDim2.new(1,0,0,1),
        BackgroundColor3 = C.border,
        BorderSizePixel  = 0,
    }, win)

    -- панель вкладок
    self._tabBar = inst("Frame", {
        LayoutOrder      = 2,
        Size             = UDim2.new(1,0,0,TAB_H),
        BackgroundColor3 = C.tabBar,
        BorderSizePixel  = 0,
        ClipsDescendants = true,
    }, win)

    self._tabList = inst("UIListLayout", {
        FillDirection      = Enum.FillDirection.Horizontal,
        SortOrder          = Enum.SortOrder.LayoutOrder,
        Padding            = UDim.new(0,0),
    }, self._tabBar)

    inst("Frame", {
        LayoutOrder      = 3,
        Size             = UDim2.new(1,0,0,1),
        BackgroundColor3 = C.border,
        BorderSizePixel  = 0,
    }, win)

    -- контент
    self._contentWrap = inst("Frame", {
        LayoutOrder      = 4,
        Size             = UDim2.new(1,0,0,CONTENT_H),
        BackgroundColor3 = C.bg,
        BorderSizePixel  = 0,
        ClipsDescendants = true,
    }, win)

    -- обновляем высоту окна
    self:_updateHeight()

    return self
end

function Window:_updateHeight()
    local h = 24 + 1 + TAB_H + 1 + CONTENT_H
    self._win.Size = UDim2.new(0, WIN_W, 0, h)
end

function Window:_activateTab(name)
    for tname, data in pairs(self._tabs) do
        local isActive = (tname == name)
        data.scroll.Visible          = isActive
        data.btn.BackgroundColor3    = isActive and C.tabActive or C.tabInact
        data.btn.TextColor3          = isActive and C.text or C.dim
        -- нижняя полоска активной вкладки
        data.indicator.BackgroundColor3 = isActive
            and C.accent or C.tabBar
    end
    self._active = name
end

function Window:Tab(name)
    -- кнопка таба — ширина равномерная
    local tabCount = 0
    for _ in pairs(self._tabs) do tabCount += 1 end
    tabCount += 1  -- включаем новый

    local btn = inst("TextButton", {
        LayoutOrder      = tabCount,
        Size             = UDim2.new(1/tabCount, 0, 1, 0),
        BackgroundColor3 = C.tabInact,
        BorderSizePixel  = 0,
        Text             = name,
        TextColor3       = C.dim,
        TextSize         = 12,
        Font             = FONT_BOLD,
        AutoButtonColor  = false,
    }, self._tabBar)

    -- индикатор активной вкладки (нижняя линия)
    local indicator = inst("Frame", {
        Size             = UDim2.new(1,0,0,2),
        Position         = UDim2.new(0,0,1,-2),
        BackgroundColor3 = C.tabBar,
        BorderSizePixel  = 0,
    }, btn)

    -- ScrollingFrame для контента вкладки
    local scroll = inst("ScrollingFrame", {
        Size                  = UDim2.new(1,0,1,0),
        BackgroundTransparency = 1,
        BorderSizePixel       = 0,
        ScrollBarThickness    = 3,
        ScrollBarImageColor3  = C.scrollbar,
        CanvasSize            = UDim2.new(0,0,0,0),
        AutomaticCanvasSize   = Enum.AutomaticSize.Y,
        Visible               = false,
    }, self._contentWrap)

    inst("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding   = UDim.new(0,0),
    }, scroll)

    local tabObj = Tab.new(scroll)
    tabObj._btn = btn

    self._tabs[name] = {
        scroll    = scroll,
        btn       = btn,
        indicator = indicator,
        obj       = tabObj,
    }

    -- пересчитываем ширину кнопок
    local total = 0
    for _ in pairs(self._tabs) do total += 1 end
    for _, data in pairs(self._tabs) do
        data.btn.Size = UDim2.new(1/total, 0, 1, 0)
    end

    btn.MouseButton1Click:Connect(function()
        self:_activateTab(name)
    end)

    -- активируем первую вкладку автоматически
    if not self._active then
        self:_activateTab(name)
    end

    self:_updateHeight()
    return tabObj
end

function Window:Show()
    self._win.Visible = true
    self._visible = true
end

function Window:Hide()
    self._win.Visible = false
    self._visible = false
end

function Window:Toggle()
    if self._visible then self:Hide() else self:Show() end
end

function Window:Destroy()
    self._sg:Destroy()
end

-- ─── Горячая клавиша для показа/скрытия (RightShift) ─────────
-- можно переопределить: FL.SetToggleKey(win, Enum.KeyCode.Insert)

function FlatLib.SetToggleKey(win, keyCode)
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == keyCode then win:Toggle() end
    end)
end

return FlatLib
