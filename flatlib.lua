-- ══════════════════════════════════════════════════════════════
--  FlatLib v4.1  |  2018 flat style  |  Roblox Executor UI Lib
--  Темы, масштаб и ресайз работают через реестр объектов
--  + PlayerList (teleport / spectate / fling)
-- ══════════════════════════════════════════════════════════════

local FlatLib = {}

local UserInputService = game:GetService("UserInputService")
local Players          = game:GetService("Players")
local RunService       = game:GetService("RunService")
local TweenService     = game:GetService("TweenService")
local lp               = Players.LocalPlayer
local pg               = lp:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════
--  ТЕМЫ (исправленные + новые)
-- ══════════════════════════════════════════════════

FlatLib.Themes = {

    -- ── Dark (пересмотрен: более контрастный акцент) ──
    Dark = {
        bg        = Color3.fromRGB(22,  22,  24),
        header    = Color3.fromRGB(38,  38,  42),
        tabBar    = Color3.fromRGB(28,  28,  32),
        tabOn     = Color3.fromRGB(46,  46,  52),
        tabOff    = Color3.fromRGB(28,  28,  32),
        row       = Color3.fromRGB(30,  30,  34),
        rowHov    = Color3.fromRGB(44,  44,  50),
        border    = Color3.fromRGB(58,  58,  66),
        sep       = Color3.fromRGB(42,  42,  48),
        text      = Color3.fromRGB(222, 222, 228),
        dim       = Color3.fromRGB(110, 110, 122),
        on        = Color3.fromRGB(88,  200, 88),
        onBg      = Color3.fromRGB(24,  60,  24),
        off       = Color3.fromRGB(200, 60,  60),
        offBg     = Color3.fromRGB(62,  18,  18),
        accent    = Color3.fromRGB(220, 170, 40),   -- золото
        input     = Color3.fromRGB(16,  16,  18),
        inputBord = Color3.fromRGB(60,  60,  68),
        scroll    = Color3.fromRGB(72,  72,  82),
        catBg     = Color3.fromRGB(18,  18,  20),
        catText   = Color3.fromRGB(100, 100, 115),
        btnPrim   = Color3.fromRGB(55,  120, 200),  -- синяя кнопка (телепорт)
        btnWarn   = Color3.fromRGB(200, 140, 30),   -- жёлтая (слежка)
        btnDang   = Color3.fromRGB(185, 48,  48),   -- красная (fling)
    },

    -- ── Light (чище, меньше серости) ──
    Light = {
        bg        = Color3.fromRGB(242, 242, 245),
        header    = Color3.fromRGB(215, 215, 220),
        tabBar    = Color3.fromRGB(225, 225, 230),
        tabOn     = Color3.fromRGB(250, 250, 254),
        tabOff    = Color3.fromRGB(225, 225, 230),
        row       = Color3.fromRGB(248, 248, 252),
        rowHov    = Color3.fromRGB(230, 230, 238),
        border    = Color3.fromRGB(190, 190, 200),
        sep       = Color3.fromRGB(210, 210, 218),
        text      = Color3.fromRGB(22,  22,  28),
        dim       = Color3.fromRGB(118, 118, 130),
        on        = Color3.fromRGB(28,  140, 40),
        onBg      = Color3.fromRGB(195, 240, 200),
        off       = Color3.fromRGB(185, 38,  38),
        offBg     = Color3.fromRGB(248, 200, 200),
        accent    = Color3.fromRGB(168, 110, 10),
        input     = Color3.fromRGB(255, 255, 255),
        inputBord = Color3.fromRGB(180, 180, 192),
        scroll    = Color3.fromRGB(158, 158, 172),
        catBg     = Color3.fromRGB(218, 218, 224),
        catText   = Color3.fromRGB(90,  90,  105),
        btnPrim   = Color3.fromRGB(40,  100, 190),
        btnWarn   = Color3.fromRGB(185, 125, 18),
        btnDang   = Color3.fromRGB(178, 38,  38),
    },

    -- ── Midnight (глубокий синий, неоновые акценты) ──
    Midnight = {
        bg        = Color3.fromRGB(8,   10,  20),
        header    = Color3.fromRGB(14,  18,  38),
        tabBar    = Color3.fromRGB(10,  12,  26),
        tabOn     = Color3.fromRGB(20,  24,  50),
        tabOff    = Color3.fromRGB(10,  12,  26),
        row       = Color3.fromRGB(12,  14,  30),
        rowHov    = Color3.fromRGB(20,  24,  48),
        border    = Color3.fromRGB(38,  44,  88),
        sep       = Color3.fromRGB(24,  28,  58),
        text      = Color3.fromRGB(200, 205, 240),
        dim       = Color3.fromRGB(78,  84,  138),
        on        = Color3.fromRGB(64,  190, 255),
        onBg      = Color3.fromRGB(12,  48,  90),
        off       = Color3.fromRGB(200, 54,  100),
        offBg     = Color3.fromRGB(56,  12,  32),
        accent    = Color3.fromRGB(130, 90,  255),  -- фиолет
        input     = Color3.fromRGB(6,   8,   18),
        inputBord = Color3.fromRGB(40,  46,  92),
        scroll    = Color3.fromRGB(52,  58,  110),
        catBg     = Color3.fromRGB(6,   8,   16),
        catText   = Color3.fromRGB(58,  64,  120),
        btnPrim   = Color3.fromRGB(64,  120, 220),
        btnWarn   = Color3.fromRGB(130, 90,  255),
        btnDang   = Color3.fromRGB(200, 54,  100),
    },

    -- ── Forest (глубокий зелёный, приглушённые тона) ──
    Forest = {
        bg        = Color3.fromRGB(10,  18,  12),
        header    = Color3.fromRGB(16,  32,  18),
        tabBar    = Color3.fromRGB(12,  22,  14),
        tabOn     = Color3.fromRGB(20,  38,  22),
        tabOff    = Color3.fromRGB(12,  22,  14),
        row       = Color3.fromRGB(13,  24,  15),
        rowHov    = Color3.fromRGB(20,  36,  22),
        border    = Color3.fromRGB(32,  64,  36),
        sep       = Color3.fromRGB(22,  44,  26),
        text      = Color3.fromRGB(168, 228, 175),
        dim       = Color3.fromRGB(65,  115, 72),
        on        = Color3.fromRGB(70,  220, 88),
        onBg      = Color3.fromRGB(14,  66,  18),
        off       = Color3.fromRGB(210, 62,  44),
        offBg     = Color3.fromRGB(60,  16,  10),
        accent    = Color3.fromRGB(88,  248, 110),
        input     = Color3.fromRGB(8,   14,  10),
        inputBord = Color3.fromRGB(30,  58,  34),
        scroll    = Color3.fromRGB(40,  88,  46),
        catBg     = Color3.fromRGB(8,   14,  10),
        catText   = Color3.fromRGB(48,  100, 54),
        btnPrim   = Color3.fromRGB(40,  160, 58),
        btnWarn   = Color3.fromRGB(180, 155, 30),
        btnDang   = Color3.fromRGB(185, 48,  32),
    },

    -- ── Crimson (тёмно-красная тема) ──
    Crimson = {
        bg        = Color3.fromRGB(18,  8,   8),
        header    = Color3.fromRGB(36,  12,  12),
        tabBar    = Color3.fromRGB(26,  10,  10),
        tabOn     = Color3.fromRGB(46,  16,  16),
        tabOff    = Color3.fromRGB(26,  10,  10),
        row       = Color3.fromRGB(28,  10,  10),
        rowHov    = Color3.fromRGB(46,  16,  16),
        border    = Color3.fromRGB(88,  28,  28),
        sep       = Color3.fromRGB(58,  18,  18),
        text      = Color3.fromRGB(240, 205, 205),
        dim       = Color3.fromRGB(140, 78,  78),
        on        = Color3.fromRGB(220, 80,  80),
        onBg      = Color3.fromRGB(68,  14,  14),
        off       = Color3.fromRGB(100, 100, 100),
        offBg     = Color3.fromRGB(30,  26,  26),
        accent    = Color3.fromRGB(255, 100, 100),
        input     = Color3.fromRGB(14,  6,   6),
        inputBord = Color3.fromRGB(78,  24,  24),
        scroll    = Color3.fromRGB(100, 30,  30),
        catBg     = Color3.fromRGB(12,  6,   6),
        catText   = Color3.fromRGB(110, 40,  40),
        btnPrim   = Color3.fromRGB(180, 40,  40),
        btnWarn   = Color3.fromRGB(200, 120, 30),
        btnDang   = Color3.fromRGB(255, 60,  60),
    },

    -- ── Slate (серо-стальная, нейтральная) ──
    Slate = {
        bg        = Color3.fromRGB(30,  34,  40),
        header    = Color3.fromRGB(44,  50,  60),
        tabBar    = Color3.fromRGB(36,  40,  48),
        tabOn     = Color3.fromRGB(52,  58,  70),
        tabOff    = Color3.fromRGB(36,  40,  48),
        row       = Color3.fromRGB(38,  42,  50),
        rowHov    = Color3.fromRGB(52,  58,  68),
        border    = Color3.fromRGB(68,  76,  90),
        sep       = Color3.fromRGB(52,  58,  68),
        text      = Color3.fromRGB(210, 215, 225),
        dim       = Color3.fromRGB(110, 118, 135),
        on        = Color3.fromRGB(80,  190, 155),
        onBg      = Color3.fromRGB(18,  60,  48),
        off       = Color3.fromRGB(190, 80,  80),
        offBg     = Color3.fromRGB(58,  18,  18),
        accent    = Color3.fromRGB(100, 195, 240),
        input     = Color3.fromRGB(24,  28,  34),
        inputBord = Color3.fromRGB(62,  70,  84),
        scroll    = Color3.fromRGB(78,  88,  105),
        catBg     = Color3.fromRGB(24,  28,  34),
        catText   = Color3.fromRGB(88,  96,  115),
        btnPrim   = Color3.fromRGB(60,  130, 200),
        btnWarn   = Color3.fromRGB(200, 155, 30),
        btnDang   = Color3.fromRGB(185, 58,  58),
    },
}

-- активная тема
local C = {}
for k, v in pairs(FlatLib.Themes.Dark) do C[k] = v end

local SCALE = 1.0
local function px(v) return math.floor(v * SCALE) end

local FB = Enum.Font.SourceSansBold
local FR = Enum.Font.SourceSans

-- ══════════════════════════════════════════════════
--  РЕЕСТР
-- ══════════════════════════════════════════════════

local registry = {}

local function reg(inst, paintFn)
    table.insert(registry, { i = inst, p = paintFn })
    return inst
end

local function applyAll()
    for idx = #registry, 1, -1 do
        local e = registry[idx]
        if e.i and e.i.Parent then
            pcall(e.p, e.i)
        else
            table.remove(registry, idx)
        end
    end
end

-- ══════════════════════════════════════════════════
--  ГЛОБАЛЬНЫЙ API
-- ══════════════════════════════════════════════════

function FlatLib.SetTheme(name)
    local t = type(name) == "string" and FlatLib.Themes[name] or name
    if not t then return end
    for k, v in pairs(t) do C[k] = v end
    applyAll()
end

function FlatLib.SetColor(key, color3)
    C[key] = color3
    applyAll()
end

function FlatLib.SetScale(s)
    SCALE = math.clamp(s, 0.6, 2.0)
    applyAll()
end

function FlatLib.SetToggleKey(win, keyCode)
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == keyCode then win:Toggle() end
    end)
end

-- ══════════════════════════════════════════════════
--  УТИЛИТЫ
-- ══════════════════════════════════════════════════

local function new(class, props, parent)
    local o = Instance.new(class)
    for k, v in pairs(props) do o[k] = v end
    if parent then o.Parent = parent end
    return o
end

local function mkBorder(parent)
    local b = new("Frame",{
        Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,1,-1),
        BackgroundColor3=C.border, BorderSizePixel=0, ZIndex=2,
    }, parent)
    reg(b, function(o) o.BackgroundColor3=C.border end)
    return b
end

local function addHover(frame)
    frame.InputBegan:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseMovement then
            frame.BackgroundColor3=C.rowHov
        end
    end)
    frame.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseMovement then
            frame.BackgroundColor3=C.row
        end
    end)
end

-- мини-кнопка с цветом
local function mkSmallBtn(parent, text, bgColor, textColor, x, w, h, callback)
    w = w or 42; h = h or 17
    local btn = new("TextButton",{
        Size=UDim2.new(0,px(w),0,px(h)),
        Position=UDim2.new(1,-px(x),0.5,-px(math.floor(h/2))),
        BackgroundColor3=bgColor, BorderSizePixel=0,
        Text=text, TextColor3=textColor or Color3.fromRGB(255,255,255),
        TextSize=px(10), Font=FB, AutoButtonColor=false, ZIndex=4,
    }, parent)
    reg(btn, function(o)
        o.TextSize=px(10)
        o.Size=UDim2.new(0,px(w),0,px(h))
        o.Position=UDim2.new(1,-px(x),0.5,-px(math.floor(h/2)))
    end)
    btn.MouseEnter:Connect(function()
        btn.BackgroundColor3 = Color3.fromRGB(
            math.min(bgColor.R*255+20,255)/255,
            math.min(bgColor.G*255+20,255)/255,
            math.min(bgColor.B*255+20,255)/255)
    end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3=bgColor end)
    btn.MouseButton1Click:Connect(function() if callback then callback() end end)
    return btn
end

-- ══════════════════════════════════════════════════
--  TAB CLASS
-- ══════════════════════════════════════════════════

local Tab = {}; Tab.__index = Tab

function Tab._new(scroll)
    return setmetatable({ _s=scroll, _ord=0 }, Tab)
end

function Tab:_o() self._ord+=1; return self._ord end

function Tab:_row(h)
    h = h or 28
    local row = new("Frame",{
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(h)),
        BackgroundColor3=C.row, BorderSizePixel=0,
    }, self._s)
    mkBorder(row)
    reg(row, function(o) o.BackgroundColor3=C.row; o.Size=UDim2.new(1,0,0,px(h)) end)
    addHover(row)
    return row
end

local function dot(parent, colorFn, ox, oy)
    ox = ox or 8
    local posY = oy and UDim2.new(0,px(ox),0,px(oy)) or UDim2.new(0,px(ox),0.5,-px(3))
    local d = new("Frame",{
        Size=UDim2.new(0,px(6),0,px(6)), Position=posY,
        BackgroundColor3=colorFn(), BorderSizePixel=0,
    }, parent)
    reg(d, function(o)
        o.BackgroundColor3=colorFn()
        o.Size=UDim2.new(0,px(6),0,px(6))
        o.Position = oy and UDim2.new(0,px(ox),0,px(oy)) or UDim2.new(0,px(ox),0.5,-px(3))
    end)
    return d
end

-- ── Toggle ───────────────────────────────────────

function Tab:Toggle(label, default, callback)
    local row = self:_row(28)
    local state = default

    local statusDot = dot(row, function() return state and C.on or C.off end)

    local lbl = new("TextLabel",{
        Size=UDim2.new(1,-px(110),1,0), Position=UDim2.new(0,px(22),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=px(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, row)
    reg(lbl, function(o)
        o.TextColor3=C.text; o.TextSize=px(13)
        o.Size=UDim2.new(1,-px(110),1,0); o.Position=UDim2.new(0,px(22),0,0)
    end)

    local btn = new("TextButton",{
        Size=UDim2.new(0,px(54),0,px(17)), Position=UDim2.new(1,-px(62),0.5,-px(8)),
        BackgroundColor3=state and C.onBg or C.offBg,
        BorderColor3=state and C.on or C.off, BorderSizePixel=1,
        Text=state and "ON" or "OFF",
        TextColor3=state and C.on or C.off,
        TextSize=px(11), Font=FB, AutoButtonColor=false,
    }, row)
    reg(btn, function(o)
        o.Size=UDim2.new(0,px(54),0,px(17)); o.Position=UDim2.new(1,-px(62),0.5,-px(8))
        o.TextSize=px(11)
        o.BackgroundColor3 = state and C.onBg or C.offBg
        o.BorderColor3     = state and C.on   or C.off
        o.TextColor3       = state and C.on   or C.off
    end)

    local function refresh(v)
        state = v
        statusDot.BackgroundColor3 = v and C.on   or C.off
        btn.Text             = v and "ON"   or "OFF"
        btn.TextColor3       = v and C.on   or C.off
        btn.BackgroundColor3 = v and C.onBg or C.offBg
        btn.BorderColor3     = v and C.on   or C.off
    end

    btn.MouseButton1Click:Connect(function()
        refresh(not state)
        if callback then callback(state) end
    end)

    return {
        Set = function(_, v) refresh(v) end,
        Get = function() return state end,
    }
end

-- ── Button ───────────────────────────────────────

function Tab:Button(label, callback)
    local btn = new("TextButton",{
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(28)),
        BackgroundColor3=C.row, BorderSizePixel=0,
        Text="", AutoButtonColor=false,
    }, self._s)
    mkBorder(btn)
    reg(btn, function(o) o.BackgroundColor3=C.row; o.Size=UDim2.new(1,0,0,px(28)) end)

    local arrow = new("TextLabel",{
        Size=UDim2.new(0,px(14),1,0), Position=UDim2.new(0,px(8),0,0),
        BackgroundTransparency=1, Text=">",
        TextColor3=C.accent, TextSize=px(13), Font=FB,
    }, btn)
    local lbl = new("TextLabel",{
        Size=UDim2.new(1,-px(26),1,0), Position=UDim2.new(0,px(24),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=px(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, btn)

    reg(arrow, function(o) o.TextColor3=C.accent; o.TextSize=px(13); o.Size=UDim2.new(0,px(14),1,0); o.Position=UDim2.new(0,px(8),0,0) end)
    reg(lbl,   function(o) o.TextColor3=C.text; o.TextSize=px(13); o.Size=UDim2.new(1,-px(26),1,0); o.Position=UDim2.new(0,px(24),0,0) end)

    btn.MouseEnter:Connect(function() btn.BackgroundColor3=C.rowHov end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3=C.row    end)
    btn.MouseButton1Click:Connect(function() if callback then callback() end end)
end

-- ── Slider ───────────────────────────────────────

function Tab:Slider(label, min, max, default, callback)
    local row = new("Frame",{
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(44)),
        BackgroundColor3=C.row, BorderSizePixel=0,
    }, self._s)
    mkBorder(row)
    reg(row, function(o) o.BackgroundColor3=C.row; o.Size=UDim2.new(1,0,0,px(44)) end)

    dot(row, function() return C.accent end, 8, 9)

    local lbl = new("TextLabel",{
        Size=UDim2.new(1,-px(80),0,px(16)), Position=UDim2.new(0,px(22),0,px(3)),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=px(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, row)
    reg(lbl, function(o) o.TextColor3=C.text; o.TextSize=px(13); o.Size=UDim2.new(1,-px(80),0,px(16)); o.Position=UDim2.new(0,px(22),0,px(3)) end)

    local valLbl = new("TextLabel",{
        Size=UDim2.new(0,px(54),0,px(16)), Position=UDim2.new(1,-px(60),0,px(3)),
        BackgroundTransparency=1, Text=tostring(default),
        TextColor3=C.accent, TextSize=px(12), Font=FB,
        TextXAlignment=Enum.TextXAlignment.Right,
    }, row)
    reg(valLbl, function(o) o.TextColor3=C.accent; o.TextSize=px(12); o.Size=UDim2.new(0,px(54),0,px(16)); o.Position=UDim2.new(1,-px(60),0,px(3)) end)

    local track = new("Frame",{
        Size=UDim2.new(1,-px(20),0,px(5)), Position=UDim2.new(0,px(12),0,px(32)),
        BackgroundColor3=C.input, BorderColor3=C.inputBord, BorderSizePixel=1,
    }, row)
    reg(track, function(o) o.BackgroundColor3=C.input; o.BorderColor3=C.inputBord; o.Size=UDim2.new(1,-px(20),0,px(5)); o.Position=UDim2.new(0,px(12),0,px(32)) end)

    local p0   = math.clamp((default-min)/(max-min),0,1)
    local fill = new("Frame",{Size=UDim2.new(p0,0,1,0),BackgroundColor3=C.accent,BorderSizePixel=0},track)
    local knob = new("Frame",{Size=UDim2.new(0,2,1,4),Position=UDim2.new(p0,-1,0,-2),BackgroundColor3=Color3.fromRGB(210,210,210),BorderSizePixel=0,ZIndex=3},track)
    reg(fill, function(o) o.BackgroundColor3=C.accent end)

    local cur  = default
    local drag = false

    local function upd(mx)
        local ap=track.AbsolutePosition; local as=track.AbsoluteSize
        local p=math.clamp((mx-ap.X)/as.X,0,1)
        cur=math.floor(min+p*(max-min))
        fill.Size=UDim2.new(p,0,1,0); knob.Position=UDim2.new(p,-1,0,-2)
        valLbl.Text=tostring(cur)
        if callback then callback(cur) end
    end

    local hit = new("TextButton",{Size=UDim2.new(1,0,4,0),Position=UDim2.new(0,0,-1.5,0),BackgroundTransparency=1,Text="",ZIndex=5},track)
    hit.MouseButton1Down:Connect(function(x) drag=true; upd(x) end)
    UserInputService.InputChanged:Connect(function(i)
        if drag and i.UserInputType==Enum.UserInputType.MouseMovement then upd(i.Position.X) end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end
    end)

    return {
        Get = function() return cur end,
        Set = function(_,v)
            local p=math.clamp((v-min)/(max-min),0,1)
            cur=math.floor(v); fill.Size=UDim2.new(p,0,1,0)
            knob.Position=UDim2.new(p,-1,0,-2); valLbl.Text=tostring(cur)
        end,
    }
end

-- ── TextBox ──────────────────────────────────────

function Tab:TextBox(label, placeholder, callback)
    local row = self:_row(28)

    dot(row, function() return C.dim end)

    local lbl = new("TextLabel",{
        Size=UDim2.new(0.44,0,1,0), Position=UDim2.new(0,px(22),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=px(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, row)
    reg(lbl, function(o) o.TextColor3=C.text; o.TextSize=px(13); o.Position=UDim2.new(0,px(22),0,0) end)

    local box = new("TextBox",{
        Size=UDim2.new(0.5,-px(6),0,px(17)), Position=UDim2.new(0.5,0,0.5,-px(8)),
        BackgroundColor3=C.input, BorderColor3=C.inputBord, BorderSizePixel=1,
        PlaceholderText=placeholder or "", PlaceholderColor3=C.dim,
        Text="", TextColor3=C.text, TextSize=px(12), Font=FR,
        ClearTextOnFocus=false,
    }, row)
    reg(box, function(o)
        o.BackgroundColor3=C.input; o.BorderColor3=C.inputBord
        o.PlaceholderColor3=C.dim; o.TextColor3=C.text; o.TextSize=px(12)
        o.Size=UDim2.new(0.5,-px(6),0,px(17)); o.Position=UDim2.new(0.5,0,0.5,-px(8))
    end)

    box.FocusLost:Connect(function() if callback then callback(box.Text) end end)
    return {
        Get = function() return box.Text end,
        Set = function(_,v) box.Text=v end,
    }
end

-- ── Dropdown ─────────────────────────────────────

function Tab:Dropdown(label, options, default, callback)
    local row = new("Frame",{
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(28)),
        BackgroundColor3=C.row, BorderSizePixel=0,
        ClipsDescendants=false, ZIndex=5,
    }, self._s)
    mkBorder(row)
    reg(row, function(o) o.BackgroundColor3=C.row; o.Size=UDim2.new(1,0,0,px(28)) end)

    dot(row, function() return C.accent end)

    local lbl = new("TextLabel",{
        Size=UDim2.new(0.44,0,1,0), Position=UDim2.new(0,px(22),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=px(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left, ZIndex=5,
    }, row)
    reg(lbl, function(o) o.TextColor3=C.text; o.TextSize=px(13); o.Position=UDim2.new(0,px(22),0,0) end)

    local sel  = default or options[1] or ""
    local open = false

    local selBtn = new("TextButton",{
        Size=UDim2.new(0.5,-px(6),0,px(17)), Position=UDim2.new(0.5,0,0.5,-px(8)),
        BackgroundColor3=C.input, BorderColor3=C.inputBord, BorderSizePixel=1,
        Text=sel.." v", TextColor3=C.text,
        TextSize=px(12), Font=FR, AutoButtonColor=false, ZIndex=5,
    }, row)
    reg(selBtn, function(o)
        o.BackgroundColor3=C.input; o.BorderColor3=C.inputBord; o.TextColor3=C.text; o.TextSize=px(12)
        o.Size=UDim2.new(0.5,-px(6),0,px(17)); o.Position=UDim2.new(0.5,0,0.5,-px(8))
    end)

    local drop = new("Frame",{
        Size=UDim2.new(0.5,-px(6),0,#options*px(20)), Position=UDim2.new(0.5,0,1,1),
        BackgroundColor3=C.input, BorderColor3=C.border, BorderSizePixel=1,
        Visible=false, ZIndex=20, ClipsDescendants=true,
    }, row)
    new("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)},drop)
    reg(drop, function(o) o.BackgroundColor3=C.input; o.BorderColor3=C.border; o.Size=UDim2.new(0.5,-px(6),0,#options*px(20)) end)

    for i, opt in ipairs(options) do
        local ob = new("TextButton",{
            LayoutOrder=i, Size=UDim2.new(1,0,0,px(20)),
            BackgroundColor3=C.input, BorderSizePixel=0,
            Text=opt, TextColor3=C.dim,
            TextSize=px(12), Font=FR, AutoButtonColor=false, ZIndex=20,
        }, drop)
        local sp = new("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,1,-1),BackgroundColor3=C.sep,BorderSizePixel=0,ZIndex=20},ob)
        reg(ob, function(o) o.BackgroundColor3=C.input; o.TextColor3=C.dim; o.TextSize=px(12); o.Size=UDim2.new(1,0,0,px(20)) end)
        reg(sp, function(o) o.BackgroundColor3=C.sep end)
        ob.MouseEnter:Connect(function() ob.BackgroundColor3=C.rowHov end)
        ob.MouseLeave:Connect(function() ob.BackgroundColor3=C.input  end)
        ob.MouseButton1Click:Connect(function()
            sel=opt; selBtn.Text=opt.." v"
            drop.Visible=false; open=false
            if callback then callback(sel) end
        end)
    end

    selBtn.MouseButton1Click:Connect(function() open=not open; drop.Visible=open end)
    UserInputService.InputBegan:Connect(function(i)
        if open and i.UserInputType==Enum.UserInputType.MouseButton1 then
            task.wait(); drop.Visible=false; open=false
        end
    end)

    return {
        Get = function() return sel end,
        Set = function(_,v) sel=v; selBtn.Text=v.." v" end,
    }
end

-- ── Label ────────────────────────────────────────

function Tab:Label(text)
    local f = new("Frame",{
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(18)),
        BackgroundColor3=C.catBg, BorderSizePixel=0,
    }, self._s)
    local l = new("TextLabel",{
        Size=UDim2.new(1,-px(10),1,0), Position=UDim2.new(0,px(8),0,0),
        BackgroundTransparency=1, Text=text,
        TextColor3=C.catText, TextSize=px(11), Font=FB,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, f)
    local line = new("Frame",{Size=UDim2.new(1,0,0,1),Position=UDim2.new(0,0,1,-1),BackgroundColor3=C.sep,BorderSizePixel=0},f)

    reg(f,    function(o) o.BackgroundColor3=C.catBg; o.Size=UDim2.new(1,0,0,px(18)) end)
    reg(l,    function(o) o.TextColor3=C.catText; o.TextSize=px(11); o.Size=UDim2.new(1,-px(10),1,0); o.Position=UDim2.new(0,px(8),0,0) end)
    reg(line, function(o) o.BackgroundColor3=C.sep end)
end

-- ── Separator ────────────────────────────────────

function Tab:Separator()
    local s  = new("Frame",{LayoutOrder=self:_o(),Size=UDim2.new(1,0,0,1),BackgroundColor3=C.sep,BorderSizePixel=0},self._s)
    local sp = new("Frame",{LayoutOrder=self:_o(),Size=UDim2.new(1,0,0,px(4)),BackgroundTransparency=1,BorderSizePixel=0},self._s)
    reg(s,  function(o) o.BackgroundColor3=C.sep end)
    reg(sp, function(o) o.Size=UDim2.new(1,0,0,px(4)) end)
end

-- ══════════════════════════════════════════════════
--  PLAYER LIST COMPONENT
--  Tab:PlayerList(options)
--
--  options = {
--    showTeleport = true,     -- кнопка телепортации к игроку
--    showSpectate = true,     -- кнопка слежки (spectate)
--    showFling    = false,    -- кнопка fling (опционально)
--    onTeleport   = function(player) end,
--    onSpectate   = function(player) end,
--    onFling      = function(player) end,
--  }
-- ══════════════════════════════════════════════════

function Tab:PlayerList(options)
    options = options or {}
    local showTP  = options.showTeleport ~= false
    local showSP  = options.showSpectate ~= false
    local showFL  = options.showFling    == true

    -- Заголовок
    self:Label("PLAYERS")

    -- Кол-во видимых кнопок → подбираем ширину
    local btnW = 38
    local btnGap = 4
    local numBtns = (showTP and 1 or 0) + (showSP and 1 or 0) + (showFL and 1 or 0)
    local totalBtnW = numBtns * (btnW + btnGap)

    -- Контейнер для строк игроков
    local container = new("Frame",{
        LayoutOrder=self:_o(),
        Size=UDim2.new(1,0,0,0),
        AutomaticSize=Enum.AutomaticSize.Y,
        BackgroundTransparency=1,
        BorderSizePixel=0,
    }, self._s)
    new("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)},container)
    reg(container, function() end) -- placeholder

    local playerRows = {}  -- name → row frame
    local spectating = nil -- текущий spectate target

    -- ── Внутренние функции действий ─────────────

    local function doTeleport(target)
        if options.onTeleport then
            options.onTeleport(target)
            return
        end
        -- дефолт: телепортируем своего персонажа к target
        local chr = lp.Character
        local tgt = target.Character
        if chr and tgt then
            local hrp = chr:FindFirstChild("HumanoidRootPart")
            local tHrp = tgt:FindFirstChild("HumanoidRootPart")
            if hrp and tHrp then
                hrp.CFrame = tHrp.CFrame + Vector3.new(0, 3, 0)
            end
        end
    end

    local function doSpectate(target)
        if options.onSpectate then
            options.onSpectate(target)
            return
        end
        -- дефолт: переключаем камеру на target
        local cam = workspace.CurrentCamera
        if spectating == target then
            -- отключаем слежку
            cam.CameraSubject = lp.Character and lp.Character:FindFirstChild("Humanoid")
            cam.CameraType    = Enum.CameraType.Custom
            spectating        = nil
        else
            local tgt = target.Character
            if tgt then
                local hum = tgt:FindFirstChild("Humanoid")
                if hum then
                    cam.CameraSubject = hum
                    cam.CameraType    = Enum.CameraType.Follow
                    spectating        = target
                end
            end
        end
    end

    local function doFling(target)
        if options.onFling then
            options.onFling(target)
            return
        end
        -- дефолт: применяем импульс к HumanoidRootPart цели
        local tgt = target.Character
        if tgt then
            local hrp = tgt:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bv = Instance.new("BodyVelocity")
                bv.Velocity = Vector3.new(
                    math.random(-200,200),
                    math.random(200,400),
                    math.random(-200,200))
                bv.MaxForce = Vector3.new(1e9,1e9,1e9)
                bv.P = 1e9
                bv.Parent = hrp
                game:GetService("Debris"):AddItem(bv, 0.15)
            end
        end
    end

    -- ── Создать строку для игрока ────────────────

    local function buildRow(player)
        if player == lp then return end  -- себя не показываем
        if playerRows[player.Name] then return end

        local rowH = 28
        local row = new("Frame",{
            LayoutOrder = 1,
            Size = UDim2.new(1,0,0,px(rowH)),
            BackgroundColor3 = C.row,
            BorderSizePixel = 0,
        }, container)
        mkBorder(row)
        reg(row, function(o) o.BackgroundColor3=C.row; o.Size=UDim2.new(1,0,0,px(rowH)) end)
        addHover(row)

        -- цветной кружок (онлайн индикатор)
        local ind = new("Frame",{
            Size=UDim2.new(0,px(5),0,px(5)),
            Position=UDim2.new(0,px(8),0.5,-px(2)),
            BackgroundColor3=C.on,
            BorderSizePixel=0,
        }, row)
        reg(ind, function(o) o.BackgroundColor3=C.on; o.Size=UDim2.new(0,px(5),0,px(5)); o.Position=UDim2.new(0,px(8),0.5,-px(2)) end)

        -- имя игрока
        local nameLbl = new("TextLabel",{
            Size=UDim2.new(1,-px(totalBtnW+24),1,0),
            Position=UDim2.new(0,px(20),0,0),
            BackgroundTransparency=1,
            Text=player.DisplayName ~= player.Name
                and (player.DisplayName.." ("..player.Name..")")
                or player.Name,
            TextColor3=C.text, TextSize=px(12), Font=FR,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd,
        }, row)
        reg(nameLbl, function(o)
            o.TextColor3=C.text; o.TextSize=px(12)
            o.Size=UDim2.new(1,-px(totalBtnW+24),1,0)
            o.Position=UDim2.new(0,px(20),0,0)
        end)

        -- кнопки справа налево
        local curX = 6

        if showFL then
            local fBtn = mkSmallBtn(row, "FLG",
                C.btnDang, Color3.fromRGB(255,220,220),
                curX, btnW, 16,
                function() doFling(player) end)
            reg(fBtn, function(o)
                o.BackgroundColor3=C.btnDang
            end)
            curX = curX + btnW + btnGap
        end

        if showSP then
            local sBtn = mkSmallBtn(row, "SPY",
                C.btnWarn, Color3.fromRGB(255,245,200),
                curX, btnW, 16,
                function() doSpectate(player) end)
            reg(sBtn, function(o)
                o.BackgroundColor3=C.btnWarn
            end)
            curX = curX + btnW + btnGap
        end

        if showTP then
            local tBtn = mkSmallBtn(row, "TP",
                C.btnPrim, Color3.fromRGB(200,225,255),
                curX, btnW, 16,
                function() doTeleport(player) end)
            reg(tBtn, function(o)
                o.BackgroundColor3=C.btnPrim
            end)
        end

        playerRows[player.Name] = row
    end

    -- ── Удалить строку игрока ────────────────────

    local function removeRow(player)
        -- если spectating этого игрока — сбросить
        if spectating == player then
            local cam = workspace.CurrentCamera
            cam.CameraSubject = lp.Character and lp.Character:FindFirstChild("Humanoid")
            cam.CameraType    = Enum.CameraType.Custom
            spectating = nil
        end
        local row = playerRows[player.Name]
        if row then
            row:Destroy()
            playerRows[player.Name] = nil
        end
    end

    -- ── Наполнить список текущими игроками ───────

    for _, p in ipairs(Players:GetPlayers()) do
        buildRow(p)
    end

    -- ── Слушаем события Players ──────────────────

    Players.PlayerAdded:Connect(buildRow)
    Players.PlayerRemoving:Connect(removeRow)

    -- ── Кнопка "Refresh" ─────────────────────────

    local refRow = new("Frame",{
        LayoutOrder=self:_o(),
        Size=UDim2.new(1,0,0,px(22)),
        BackgroundColor3=C.catBg,
        BorderSizePixel=0,
    }, self._s)
    local refBtn = new("TextButton",{
        Size=UDim2.new(1,-px(16),0,px(14)),
        Position=UDim2.new(0,px(8),0.5,-px(7)),
        BackgroundColor3=C.tabBar,
        BorderColor3=C.border, BorderSizePixel=1,
        Text="↺  Refresh list",
        TextColor3=C.dim, TextSize=px(11), Font=FB,
        AutoButtonColor=false,
    }, refRow)
    reg(refRow, function(o) o.BackgroundColor3=C.catBg; o.Size=UDim2.new(1,0,0,px(22)) end)
    reg(refBtn, function(o) o.BackgroundColor3=C.tabBar; o.BorderColor3=C.border; o.TextColor3=C.dim; o.TextSize=px(11) end)
    refBtn.MouseEnter:Connect(function() refBtn.BackgroundColor3=C.rowHov end)
    refBtn.MouseLeave:Connect(function() refBtn.BackgroundColor3=C.tabBar end)
    refBtn.MouseButton1Click:Connect(function()
        -- удаляем устаревшие строки
        for name, row in pairs(playerRows) do
            if not Players:FindFirstChild(name) then
                row:Destroy()
                playerRows[name] = nil
            end
        end
        -- добавляем новых
        for _, p in ipairs(Players:GetPlayers()) do
            buildRow(p)
        end
    end)
end

-- ══════════════════════════════════════════════════
--  WINDOW CLASS
-- ══════════════════════════════════════════════════

local Window = {}; Window.__index = Window

function FlatLib.Window(title)
    local self      = setmetatable({}, Window)
    self._tabs      = {}
    self._tabList   = {}
    self._active    = nil
    self._visible   = true

    self._sg = new("ScreenGui",{
        Name="FlatLib_"..title, ResetOnSpawn=false,
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    }, pg)

    local win = new("Frame",{
        Size=UDim2.new(0,px(252),0,px(350)),
        Position=UDim2.new(0,8,0,8),
        BackgroundColor3=C.bg, BorderColor3=C.border, BorderSizePixel=1,
        Active=true, Draggable=true, ClipsDescendants=false,
    }, self._sg)
    self._win = win
    reg(win, function(o) o.BackgroundColor3=C.bg; o.BorderColor3=C.border end)

    new("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)},win)

    -- шапка
    local hdr = new("Frame",{LayoutOrder=0,Size=UDim2.new(1,0,0,px(24)),BackgroundColor3=C.header,BorderSizePixel=0},win)
    reg(hdr, function(o) o.BackgroundColor3=C.header; o.Size=UDim2.new(1,0,0,px(24)) end)

    local titleLbl = new("TextLabel",{
        Size=UDim2.new(1,-px(10),1,0), Position=UDim2.new(0,px(7),0,0),
        BackgroundTransparency=1, Text="[FL] "..title,
        TextColor3=C.text, TextSize=px(13), Font=FB,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, hdr)
    reg(titleLbl, function(o) o.TextColor3=C.text; o.TextSize=px(13); o.Size=UDim2.new(1,-px(10),1,0); o.Position=UDim2.new(0,px(7),0,0) end)

    local hdrDiv = new("Frame",{LayoutOrder=1,Size=UDim2.new(1,0,0,1),BackgroundColor3=C.border,BorderSizePixel=0},win)
    reg(hdrDiv, function(o) o.BackgroundColor3=C.border end)

    -- таб-бар
    self._tabBar = new("Frame",{LayoutOrder=2,Size=UDim2.new(1,0,0,px(22)),BackgroundColor3=C.tabBar,BorderSizePixel=0,ClipsDescendants=true},win)
    reg(self._tabBar, function(o) o.BackgroundColor3=C.tabBar; o.Size=UDim2.new(1,0,0,px(22)) end)
    self._tabBarLayout = new("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)},self._tabBar)

    local tabDiv = new("Frame",{LayoutOrder=3,Size=UDim2.new(1,0,0,1),BackgroundColor3=C.border,BorderSizePixel=0},win)
    reg(tabDiv, function(o) o.BackgroundColor3=C.border end)

    -- контент
    self._content = new("Frame",{
        LayoutOrder=4, Size=UDim2.new(1,0,1,-(px(24)+1+px(22)+1)),
        BackgroundColor3=C.bg, BorderSizePixel=0, ClipsDescendants=true,
    }, win)
    reg(self._content, function(o) o.BackgroundColor3=C.bg; o.Size=UDim2.new(1,0,1,-(px(24)+1+px(22)+1)) end)

    -- ресайз-ручка
    local rsh = new("TextButton",{
        Size=UDim2.new(0,14,0,14), Position=UDim2.new(1,-14,1,-14),
        BackgroundColor3=C.border, BorderSizePixel=0,
        Text="◢", TextColor3=C.dim, TextSize=10, Font=FB,
        AutoButtonColor=false, ZIndex=10,
    }, win)
    reg(rsh, function(o) o.BackgroundColor3=C.border; o.TextColor3=C.dim end)

    local rsDown=false; local rsSt, rsSz
    rsh.MouseButton1Down:Connect(function(x,y)
        rsDown=true; win.Draggable=false
        rsSt=Vector2.new(x,y); rsSz=Vector2.new(win.AbsoluteSize.X,win.AbsoluteSize.Y)
    end)
    UserInputService.InputChanged:Connect(function(i)
        if not rsDown then return end
        if i.UserInputType~=Enum.UserInputType.MouseMovement then return end
        local d=Vector2.new(i.Position.X,i.Position.Y)-rsSt
        win.Size=UDim2.new(0,math.max(180,rsSz.X+d.X),0,math.max(120,rsSz.Y+d.Y))
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then rsDown=false; win.Draggable=true end
    end)

    return self
end

function Window:Tab(name)
    local idx = #self._tabList + 1

    local btn = new("TextButton",{
        LayoutOrder=idx, Size=UDim2.new(0,1,1,0),
        BackgroundColor3=C.tabOff, BorderSizePixel=0,
        Text=name, TextColor3=C.dim, TextSize=px(11), Font=FB, AutoButtonColor=false,
    }, self._tabBar)

    local ind = new("Frame",{
        Size=UDim2.new(1,0,0,2), Position=UDim2.new(0,0,1,-2),
        BackgroundColor3=C.tabBar, BorderSizePixel=0,
    }, btn)

    local scroll = new("ScrollingFrame",{
        Size=UDim2.new(1,0,1,0), BackgroundTransparency=1, BorderSizePixel=0,
        ScrollBarThickness=3, ScrollBarImageColor3=C.scroll,
        CanvasSize=UDim2.new(0,0,0,0), AutomaticCanvasSize=Enum.AutomaticSize.Y,
        Visible=false,
    }, self._content)
    new("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)},scroll)
    reg(scroll, function(o) o.ScrollBarImageColor3=C.scroll end)

    self._tabs[name]   = { btn=btn, ind=ind, scroll=scroll }
    self._tabList[idx] = name

    local total = #self._tabList
    for _, n in ipairs(self._tabList) do
        local d = self._tabs[n]
        d.btn.Size = UDim2.new(1/total,0,1,0)
        local cn = n
        local cself = self
        reg(d.btn, function(o)
            local on = (cn == cself._active)
            o.BackgroundColor3 = on and C.tabOn or C.tabOff
            o.TextColor3       = on and C.text  or C.dim
            o.TextSize         = px(11)
            o.Size             = UDim2.new(1/#cself._tabList,0,1,0)
        end)
        reg(d.ind, function(o)
            o.BackgroundColor3 = (cn == cself._active) and C.accent or C.tabBar
        end)
    end

    btn.MouseButton1Click:Connect(function() self:_activate(name) end)
    if idx == 1 then self:_activate(name) end

    return Tab._new(scroll)
end

function Window:_activate(name)
    self._active = name
    for n, d in pairs(self._tabs) do
        local on = (n == name)
        d.scroll.Visible       = on
        d.btn.BackgroundColor3 = on and C.tabOn  or C.tabOff
        d.btn.TextColor3       = on and C.text   or C.dim
        d.ind.BackgroundColor3 = on and C.accent or C.tabBar
    end
end

function Window:Show()   self._win.Visible=true;  self._visible=true  end
function Window:Hide()   self._win.Visible=false; self._visible=false end
function Window:Toggle() if self._visible then self:Hide() else self:Show() end end
function Window:Destroy()
    for i=#registry,1,-1 do
        local e=registry[i]
        if not e.i or not e.i.Parent then table.remove(registry,i) end
    end
    self._sg:Destroy()
end

return FlatLib
