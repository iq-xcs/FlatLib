-- ══════════════════════════════════════════════════════════════
--  FlatLib v5  |  Sirius-inspired design
--  Тёмный стиль, градиенты, аватарки, плавные анимации
--  Темы / масштаб через реестр. PlayerList с TP/SPY/FLG.
-- ══════════════════════════════════════════════════════════════

local FlatLib = {}

local UserInputService = game:GetService("UserInputService")
local Players          = game:GetService("Players")
local TweenService     = game:GetService("TweenService")
local lp               = Players.LocalPlayer
local pg               = lp:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════
--  ТЕМЫ
-- ══════════════════════════════════════════════════

FlatLib.Themes = {

    Dark = {
        winBg       = Color3.fromRGB(12,  12,  14),   -- основной фон окна
        panelBg     = Color3.fromRGB(18,  18,  22),   -- фон контента
        headerBg    = Color3.fromRGB(16,  16,  20),   -- шапка
        tabBarBg    = Color3.fromRGB(14,  14,  18),   -- таб-бар
        tabOn       = Color3.fromRGB(24,  24,  30),
        tabOff      = Color3.fromRGB(14,  14,  18),
        rowBg       = Color3.fromRGB(20,  20,  26),
        rowHov      = Color3.fromRGB(30,  30,  40),
        stroke      = Color3.fromRGB(38,  38,  52),
        strokeHov   = Color3.fromRGB(60,  60,  80),
        sep         = Color3.fromRGB(28,  28,  38),
        text        = Color3.fromRGB(228, 228, 235),
        textDim     = Color3.fromRGB(100, 100, 120),
        on          = Color3.fromRGB(80,  200, 120),
        onBg        = Color3.fromRGB(18,  58,  32),
        off         = Color3.fromRGB(200, 70,  70),
        offBg       = Color3.fromRGB(58,  18,  18),
        accent      = Color3.fromRGB(100, 160, 255),  -- синий акцент
        accentAlt   = Color3.fromRGB(140, 100, 255),  -- второй акцент
        inputBg     = Color3.fromRGB(10,  10,  14),
        inputStroke = Color3.fromRGB(42,  42,  58),
        scrollBar   = Color3.fromRGB(50,  50,  70),
        catBg       = Color3.fromRGB(14,  14,  18),
        catText     = Color3.fromRGB(70,  70,  100),
        shadow      = Color3.fromRGB(0,   0,   0),
        btnTP       = Color3.fromRGB(38,  100, 200),
        btnSpy      = Color3.fromRGB(100, 75,  200),
        btnFling    = Color3.fromRGB(180, 45,  45),
        gradA       = Color3.fromRGB(20,  60,  120),  -- градиент шапки A
        gradB       = Color3.fromRGB(60,  30,  120),  -- градиент шапки B
    },

    Midnight = {
        winBg       = Color3.fromRGB(6,   6,   16),
        panelBg     = Color3.fromRGB(10,  10,  24),
        headerBg    = Color3.fromRGB(10,  8,   22),
        tabBarBg    = Color3.fromRGB(8,   8,   18),
        tabOn       = Color3.fromRGB(18,  16,  36),
        tabOff      = Color3.fromRGB(8,   8,   18),
        rowBg       = Color3.fromRGB(12,  10,  26),
        rowHov      = Color3.fromRGB(22,  18,  48),
        stroke      = Color3.fromRGB(32,  28,  72),
        strokeHov   = Color3.fromRGB(60,  50,  130),
        sep         = Color3.fromRGB(20,  18,  44),
        text        = Color3.fromRGB(200, 200, 240),
        textDim     = Color3.fromRGB(70,  68,  120),
        on          = Color3.fromRGB(60,  180, 255),
        onBg        = Color3.fromRGB(12,  44,  80),
        off         = Color3.fromRGB(190, 55,  90),
        offBg       = Color3.fromRGB(55,  12,  30),
        accent      = Color3.fromRGB(120, 90,  255),
        accentAlt   = Color3.fromRGB(60,  160, 255),
        inputBg     = Color3.fromRGB(6,   6,   14),
        inputStroke = Color3.fromRGB(36,  32,  80),
        scrollBar   = Color3.fromRGB(44,  40,  100),
        catBg       = Color3.fromRGB(8,   8,   18),
        catText     = Color3.fromRGB(50,  48,  110),
        shadow      = Color3.fromRGB(0,   0,   0),
        btnTP       = Color3.fromRGB(40,  80,  200),
        btnSpy      = Color3.fromRGB(100, 60,  220),
        btnFling    = Color3.fromRGB(180, 40,  90),
        gradA       = Color3.fromRGB(15,  30,  100),
        gradB       = Color3.fromRGB(60,  20,  120),
    },

    Forest = {
        winBg       = Color3.fromRGB(6,   14,  8),
        panelBg     = Color3.fromRGB(10,  20,  12),
        headerBg    = Color3.fromRGB(8,   18,  10),
        tabBarBg    = Color3.fromRGB(7,   15,  9),
        tabOn       = Color3.fromRGB(16,  30,  18),
        tabOff      = Color3.fromRGB(7,   15,  9),
        rowBg       = Color3.fromRGB(10,  20,  12),
        rowHov      = Color3.fromRGB(18,  36,  20),
        stroke      = Color3.fromRGB(26,  55,  30),
        strokeHov   = Color3.fromRGB(50,  100, 55),
        sep         = Color3.fromRGB(16,  34,  18),
        text        = Color3.fromRGB(170, 235, 175),
        textDim     = Color3.fromRGB(60,  110, 66),
        on          = Color3.fromRGB(65,  220, 85),
        onBg        = Color3.fromRGB(14,  62,  18),
        off         = Color3.fromRGB(200, 60,  44),
        offBg       = Color3.fromRGB(58,  14,  10),
        accent      = Color3.fromRGB(75,  235, 100),
        accentAlt   = Color3.fromRGB(140, 200, 60),
        inputBg     = Color3.fromRGB(6,   12,  7),
        inputStroke = Color3.fromRGB(28,  55,  32),
        scrollBar   = Color3.fromRGB(36,  80,  42),
        catBg       = Color3.fromRGB(7,   14,  8),
        catText     = Color3.fromRGB(42,  90,  48),
        shadow      = Color3.fromRGB(0,   0,   0),
        btnTP       = Color3.fromRGB(30,  150, 50),
        btnSpy      = Color3.fromRGB(80,  160, 40),
        btnFling    = Color3.fromRGB(170, 44,  28),
        gradA       = Color3.fromRGB(14,  60,  20),
        gradB       = Color3.fromRGB(40,  100, 20),
    },

    Crimson = {
        winBg       = Color3.fromRGB(12,  6,   6),
        panelBg     = Color3.fromRGB(18,  8,   8),
        headerBg    = Color3.fromRGB(16,  7,   7),
        tabBarBg    = Color3.fromRGB(14,  6,   6),
        tabOn       = Color3.fromRGB(28,  12,  12),
        tabOff      = Color3.fromRGB(14,  6,   6),
        rowBg       = Color3.fromRGB(20,  9,   9),
        rowHov      = Color3.fromRGB(34,  14,  14),
        stroke      = Color3.fromRGB(60,  20,  20),
        strokeHov   = Color3.fromRGB(110, 35,  35),
        sep         = Color3.fromRGB(36,  12,  12),
        text        = Color3.fromRGB(240, 205, 205),
        textDim     = Color3.fromRGB(130, 65,  65),
        on          = Color3.fromRGB(215, 75,  75),
        onBg        = Color3.fromRGB(65,  14,  14),
        off         = Color3.fromRGB(100, 100, 100),
        offBg       = Color3.fromRGB(30,  26,  26),
        accent      = Color3.fromRGB(255, 90,  90),
        accentAlt   = Color3.fromRGB(220, 140, 60),
        inputBg     = Color3.fromRGB(9,   4,   4),
        inputStroke = Color3.fromRGB(58,  18,  18),
        scrollBar   = Color3.fromRGB(90,  24,  24),
        catBg       = Color3.fromRGB(12,  5,   5),
        catText     = Color3.fromRGB(100, 34,  34),
        shadow      = Color3.fromRGB(0,   0,   0),
        btnTP       = Color3.fromRGB(160, 34,  34),
        btnSpy      = Color3.fromRGB(190, 100, 24),
        btnFling    = Color3.fromRGB(240, 55,  55),
        gradA       = Color3.fromRGB(90,  12,  12),
        gradB       = Color3.fromRGB(40,  6,   6),
    },

    Slate = {
        winBg       = Color3.fromRGB(18,  22,  28),
        panelBg     = Color3.fromRGB(24,  28,  36),
        headerBg    = Color3.fromRGB(22,  26,  34),
        tabBarBg    = Color3.fromRGB(18,  22,  30),
        tabOn       = Color3.fromRGB(32,  38,  50),
        tabOff      = Color3.fromRGB(18,  22,  30),
        rowBg       = Color3.fromRGB(26,  30,  40),
        rowHov      = Color3.fromRGB(36,  42,  56),
        stroke      = Color3.fromRGB(46,  54,  72),
        strokeHov   = Color3.fromRGB(80,  92,  120),
        sep         = Color3.fromRGB(32,  38,  50),
        text        = Color3.fromRGB(210, 215, 228),
        textDim     = Color3.fromRGB(92,  100, 125),
        on          = Color3.fromRGB(75,  185, 155),
        onBg        = Color3.fromRGB(16,  54,  44),
        off         = Color3.fromRGB(185, 70,  70),
        offBg       = Color3.fromRGB(55,  16,  16),
        accent      = Color3.fromRGB(95,  185, 240),
        accentAlt   = Color3.fromRGB(140, 160, 220),
        inputBg     = Color3.fromRGB(14,  18,  24),
        inputStroke = Color3.fromRGB(44,  52,  70),
        scrollBar   = Color3.fromRGB(60,  70,  95),
        catBg       = Color3.fromRGB(18,  22,  30),
        catText     = Color3.fromRGB(72,  82,  108),
        shadow      = Color3.fromRGB(0,   0,   0),
        btnTP       = Color3.fromRGB(44,  110, 195),
        btnSpy      = Color3.fromRGB(95,  125, 200),
        btnFling    = Color3.fromRGB(175, 52,  52),
        gradA       = Color3.fromRGB(30,  60,  120),
        gradB       = Color3.fromRGB(50,  50,  110),
    },

    Light = {
        winBg       = Color3.fromRGB(235, 235, 242),
        panelBg     = Color3.fromRGB(244, 244, 250),
        headerBg    = Color3.fromRGB(220, 222, 232),
        tabBarBg    = Color3.fromRGB(228, 228, 238),
        tabOn       = Color3.fromRGB(252, 252, 255),
        tabOff      = Color3.fromRGB(228, 228, 238),
        rowBg       = Color3.fromRGB(248, 248, 254),
        rowHov      = Color3.fromRGB(232, 232, 245),
        stroke      = Color3.fromRGB(190, 190, 210),
        strokeHov   = Color3.fromRGB(150, 150, 185),
        sep         = Color3.fromRGB(210, 210, 225),
        text        = Color3.fromRGB(22,  22,  30),
        textDim     = Color3.fromRGB(110, 110, 140),
        on          = Color3.fromRGB(24,  140, 60),
        onBg        = Color3.fromRGB(190, 240, 205),
        off         = Color3.fromRGB(185, 36,  36),
        offBg       = Color3.fromRGB(250, 200, 200),
        accent      = Color3.fromRGB(55,  110, 220),
        accentAlt   = Color3.fromRGB(110, 70,  210),
        inputBg     = Color3.fromRGB(255, 255, 255),
        inputStroke = Color3.fromRGB(180, 180, 205),
        scrollBar   = Color3.fromRGB(155, 155, 180),
        catBg       = Color3.fromRGB(220, 220, 232),
        catText     = Color3.fromRGB(90,  90,  120),
        shadow      = Color3.fromRGB(160, 160, 190),
        btnTP       = Color3.fromRGB(40,  95,  195),
        btnSpy      = Color3.fromRGB(95,  60,  195),
        btnFling    = Color3.fromRGB(175, 36,  36),
        gradA       = Color3.fromRGB(100, 140, 220),
        gradB       = Color3.fromRGB(140, 100, 220),
    },
}

local C = {}
for k, v in pairs(FlatLib.Themes.Dark) do C[k] = v end

local SCALE = 1.0
local function px(v) return math.floor(v * SCALE) end

local FB  = Enum.Font.GothamBold
local FM  = Enum.Font.Gotham
local FR  = Enum.Font.Gotham

-- tween helper
local function tw(obj, t, props)
    TweenService:Create(obj, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props):Play()
end

-- ══════════════════════════════════════════════════
--  РЕЕСТР
-- ══════════════════════════════════════════════════

local registry = {}
local function reg(inst, fn) table.insert(registry, {i=inst, p=fn}); return inst end
local function applyAll()
    for idx = #registry, 1, -1 do
        local e = registry[idx]
        if e.i and e.i.Parent then pcall(e.p, e.i)
        else table.remove(registry, idx) end
    end
end

-- ══════════════════════════════════════════════════
--  ГЛОБАЛЬНЫЙ API
-- ══════════════════════════════════════════════════

function FlatLib.SetTheme(name)
    local t = type(name)=="string" and FlatLib.Themes[name] or name
    if not t then return end
    for k,v in pairs(t) do C[k]=v end
    applyAll()
end

function FlatLib.SetColor(key, c3) C[key]=c3; applyAll() end

function FlatLib.SetScale(s)
    SCALE = math.clamp(s, 0.6, 2.0)
    applyAll()
end

function FlatLib.SetToggleKey(win, key)
    UserInputService.InputBegan:Connect(function(i, gp)
        if gp then return end
        if i.KeyCode == key then win:Toggle() end
    end)
end

-- ══════════════════════════════════════════════════
--  УТИЛИТЫ
-- ══════════════════════════════════════════════════

local function new(cls, props, parent)
    local o = Instance.new(cls)
    for k,v in pairs(props) do o[k]=v end
    if parent then o.Parent=parent end
    return o
end

-- UICorner
local function corner(r, parent)
    return new("UICorner", {CornerRadius=UDim.new(0, r)}, parent)
end

-- UIStroke
local function stroke(thickness, color, transparency, parent)
    local s = new("UIStroke", {
        Thickness=thickness, Color=color,
        Transparency=transparency or 0,
        ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
    }, parent)
    return s
end

-- shadow ImageLabel (имитация через чёрный полупрозрачный frame)
local function mkShadow(parent, size, pos)
    local sh = new("Frame", {
        Size=size or UDim2.new(1, 8, 1, 8),
        Position=pos or UDim2.new(0, -4, 0, 4),
        BackgroundColor3=C.shadow,
        BackgroundTransparency=0.7,
        BorderSizePixel=0,
        ZIndex=(parent.ZIndex or 1)-1,
    }, parent)
    corner(10, sh)
    reg(sh, function(o) o.BackgroundColor3=C.shadow end)
    return sh
end

-- горизонтальный разделитель
local function mkSep(parent, lo)
    local s = new("Frame", {
        LayoutOrder=lo or 0, Size=UDim2.new(1,-px(16),0,1),
        Position=UDim2.new(0,px(8),0,0),
        BackgroundColor3=C.sep, BorderSizePixel=0,
    }, parent)
    reg(s, function(o) o.BackgroundColor3=C.sep end)
    return s
end

-- UIGradient для кнопок/шапки
local function mkGradient(parent, a, b, rot)
    return new("UIGradient", {
        Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0, a),
            ColorSequenceKeypoint.new(1, b),
        }),
        Rotation=rot or 90,
    }, parent)
end

-- ══════════════════════════════════════════════════
--  TAB CLASS
-- ══════════════════════════════════════════════════

local Tab = {}; Tab.__index = Tab

function Tab._new(scroll)
    return setmetatable({_s=scroll, _ord=0}, Tab)
end
function Tab:_o() self._ord+=1; return self._ord end

-- ── базовая строка ────────────────────────────────
function Tab:_row(h, noBorder)
    h = h or 36
    local row = new("Frame", {
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(h)),
        BackgroundColor3=C.rowBg, BorderSizePixel=0,
    }, self._s)
    corner(6, row)
    local sk = stroke(1, C.stroke, 0.5, row)

    reg(row, function(o) o.BackgroundColor3=C.rowBg; o.Size=UDim2.new(1,0,0,px(h)) end)
    reg(sk,  function(o) o.Color=C.stroke end)

    row.MouseEnter:Connect(function()
        tw(row, 0.35, {BackgroundColor3=C.rowHov})
        tw(sk,  0.35, {Color=C.strokeHov, Transparency=0})
    end)
    row.MouseLeave:Connect(function()
        tw(row, 0.3, {BackgroundColor3=C.rowBg})
        tw(sk,  0.3, {Color=C.stroke, Transparency=0.5})
    end)
    return row
end

-- маленький цветной индикатор-кружок
local function dot(parent, colorFn)
    local d = new("Frame", {
        Size=UDim2.new(0,px(6),0,px(6)),
        Position=UDim2.new(0,px(12),0.5,-px(3)),
        BackgroundColor3=colorFn(), BorderSizePixel=0,
    }, parent)
    corner(3, d)
    reg(d, function(o) o.BackgroundColor3=colorFn(); o.Size=UDim2.new(0,px(6),0,px(6)) end)
    return d
end

-- ── Toggle ───────────────────────────────────────

function Tab:Toggle(label, default, callback)
    local row = self:_row(36)
    local state = default

    local statusDot = dot(row, function() return state and C.on or C.off end)

    local lbl = new("TextLabel", {
        Size=UDim2.new(1,-px(110),1,0), Position=UDim2.new(0,px(26),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=px(12), Font=FM,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, row)
    reg(lbl, function(o) o.TextColor3=C.text; o.TextSize=px(12) end)

    -- pill-переключатель
    local pillW, pillH = px(44), px(22)
    local pill = new("Frame", {
        Size=UDim2.new(0,pillW,0,pillH),
        Position=UDim2.new(1,-pillW-px(10),0.5,-pillH/2),
        BackgroundColor3=state and C.onBg or C.offBg,
        BorderSizePixel=0,
    }, row)
    corner(pillH/2, pill)
    local pillStroke = stroke(1, state and C.on or C.off, 0, pill)

    local knobSz = pillH - 4
    local knob = new("Frame", {
        Size=UDim2.new(0,knobSz,0,knobSz),
        Position=state and UDim2.new(1,-knobSz-2,0.5,-knobSz/2)
                       or UDim2.new(0,2,0.5,-knobSz/2),
        BackgroundColor3=state and C.on or C.off,
        BorderSizePixel=0, ZIndex=3,
    }, pill)
    corner(knobSz/2, knob)

    reg(pill, function(o)
        o.BackgroundColor3 = state and C.onBg or C.offBg
        o.Size=UDim2.new(0,px(44),0,px(22))
        o.Position=UDim2.new(1,-px(44)-px(10),0.5,-px(11))
    end)
    reg(pillStroke, function(o) o.Color = state and C.on or C.off end)
    reg(knob, function(o)
        o.BackgroundColor3 = state and C.on or C.off
        o.Size=UDim2.new(0,px(18),0,px(18))
    end)

    local function refresh(v)
        state = v
        local col = v and C.on or C.off
        local bg  = v and C.onBg or C.offBg
        statusDot.BackgroundColor3 = col
        tw(pill,       0.3, {BackgroundColor3=bg})
        tw(pillStroke, 0.3, {Color=col})
        tw(knob,       0.35, {
            BackgroundColor3=col,
            Position = v and UDim2.new(1,-knob.Size.X.Offset-2,0.5,-knob.Size.Y.Offset/2)
                          or UDim2.new(0,2,0.5,-knob.Size.Y.Offset/2)
        })
    end

    local hit = new("TextButton", {
        Size=UDim2.new(1,0,1,0), BackgroundTransparency=1, Text="", ZIndex=5,
    }, row)
    hit.MouseButton1Click:Connect(function()
        refresh(not state)
        if callback then callback(state) end
    end)

    return {
        Set=function(_,v) refresh(v) end,
        Get=function() return state end,
    }
end

-- ── Button ───────────────────────────────────────

function Tab:Button(label, callback)
    local btn = new("TextButton", {
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(36)),
        BackgroundColor3=C.rowBg, BorderSizePixel=0,
        Text="", AutoButtonColor=false,
    }, self._s)
    corner(6, btn)
    local sk = stroke(1, C.stroke, 0.5, btn)

    reg(btn, function(o) o.BackgroundColor3=C.rowBg; o.Size=UDim2.new(1,0,0,px(36)) end)
    reg(sk,  function(o) o.Color=C.stroke end)

    -- акцентная левая полоска
    local bar = new("Frame", {
        Size=UDim2.new(0,px(3),0,px(18)),
        Position=UDim2.new(0,px(10),0.5,-px(9)),
        BackgroundColor3=C.accent, BorderSizePixel=0,
    }, btn)
    corner(2, bar)
    reg(bar, function(o) o.BackgroundColor3=C.accent end)

    local lbl = new("TextLabel", {
        Size=UDim2.new(1,-px(30),1,0), Position=UDim2.new(0,px(22),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=px(12), Font=FM,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, btn)
    reg(lbl, function(o) o.TextColor3=C.text; o.TextSize=px(12) end)

    -- стрелка
    local arr = new("TextLabel", {
        Size=UDim2.new(0,px(16),1,0), Position=UDim2.new(1,-px(20),0,0),
        BackgroundTransparency=1, Text="›",
        TextColor3=C.accent, TextSize=px(16), Font=FB,
    }, btn)
    reg(arr, function(o) o.TextColor3=C.accent; o.TextSize=px(16) end)

    btn.MouseEnter:Connect(function()
        tw(btn, 0.3, {BackgroundColor3=C.rowHov})
        tw(sk,  0.3, {Color=C.strokeHov, Transparency=0})
    end)
    btn.MouseLeave:Connect(function()
        tw(btn, 0.25, {BackgroundColor3=C.rowBg})
        tw(sk,  0.25, {Color=C.stroke, Transparency=0.5})
    end)
    btn.MouseButton1Click:Connect(function()
        tw(btn, 0.1, {BackgroundColor3=C.accent})
        task.delay(0.12, function() tw(btn, 0.2, {BackgroundColor3=C.rowBg}) end)
        if callback then callback() end
    end)
end

-- ── Slider ───────────────────────────────────────

function Tab:Slider(label, min, max, default, callback)
    local row = new("Frame", {
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(52)),
        BackgroundColor3=C.rowBg, BorderSizePixel=0,
    }, self._s)
    corner(6, row)
    local sk = stroke(1, C.stroke, 0.5, row)
    reg(row, function(o) o.BackgroundColor3=C.rowBg; o.Size=UDim2.new(1,0,0,px(52)) end)
    reg(sk,  function(o) o.Color=C.stroke end)

    local lbl = new("TextLabel", {
        Size=UDim2.new(0.6,0,0,px(16)), Position=UDim2.new(0,px(14),0,px(8)),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.textDim, TextSize=px(11), Font=FM,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, row)
    reg(lbl, function(o) o.TextColor3=C.textDim; o.TextSize=px(11) end)

    local valLbl = new("TextLabel", {
        Size=UDim2.new(0,px(50),0,px(16)), Position=UDim2.new(1,-px(60),0,px(8)),
        BackgroundTransparency=1, Text=tostring(default),
        TextColor3=C.accent, TextSize=px(11), Font=FB,
        TextXAlignment=Enum.TextXAlignment.Right,
    }, row)
    reg(valLbl, function(o) o.TextColor3=C.accent; o.TextSize=px(11) end)

    -- трек
    local track = new("Frame", {
        Size=UDim2.new(1,-px(28),0,px(4)),
        Position=UDim2.new(0,px(14),0,px(34)),
        BackgroundColor3=C.inputBg, BorderSizePixel=0,
    }, row)
    corner(2, track)
    stroke(1, C.inputStroke, 0.3, track)
    reg(track, function(o) o.BackgroundColor3=C.inputBg end)

    local p0   = math.clamp((default-min)/(max-min),0,1)
    local fill = new("Frame", {
        Size=UDim2.new(p0,0,1,0), BackgroundColor3=C.accent, BorderSizePixel=0,
    }, track)
    corner(2, fill)
    reg(fill, function(o) o.BackgroundColor3=C.accent end)

    local knobSz = px(12)
    local knob = new("Frame", {
        Size=UDim2.new(0,knobSz,0,knobSz),
        Position=UDim2.new(p0,-knobSz/2,0.5,-knobSz/2),
        BackgroundColor3=C.text, BorderSizePixel=0, ZIndex=3,
    }, track)
    corner(knobSz/2, knob)
    reg(knob, function(o) o.BackgroundColor3=C.text end)

    local cur = default
    local drag = false

    local function upd(mx)
        local ap=track.AbsolutePosition; local as=track.AbsoluteSize
        local p=math.clamp((mx-ap.X)/as.X,0,1)
        cur=math.floor(min+p*(max-min))
        fill.Size=UDim2.new(p,0,1,0)
        knob.Position=UDim2.new(p,-knobSz/2,0.5,-knobSz/2)
        valLbl.Text=tostring(cur)
        if callback then callback(cur) end
    end

    local hit = new("TextButton", {
        Size=UDim2.new(1,0,6,0), Position=UDim2.new(0,0,-1,0),
        BackgroundTransparency=1, Text="", ZIndex=5,
    }, track)
    hit.MouseButton1Down:Connect(function(x) drag=true; upd(x) end)
    UserInputService.InputChanged:Connect(function(i)
        if drag and i.UserInputType==Enum.UserInputType.MouseMovement then upd(i.Position.X) end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end
    end)

    return {
        Get=function() return cur end,
        Set=function(_,v)
            local p=math.clamp((v-min)/(max-min),0,1)
            cur=math.floor(v)
            fill.Size=UDim2.new(p,0,1,0)
            knob.Position=UDim2.new(p,-knobSz/2,0.5,-knobSz/2)
            valLbl.Text=tostring(cur)
        end,
    }
end

-- ── TextBox ──────────────────────────────────────

function Tab:TextBox(label, placeholder, callback)
    local row = self:_row(36)

    local lbl = new("TextLabel", {
        Size=UDim2.new(0.44,0,1,0), Position=UDim2.new(0,px(26),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=px(12), Font=FM,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, row)
    reg(lbl, function(o) o.TextColor3=C.text; o.TextSize=px(12) end)

    local boxW = px(120)
    local boxFrame = new("Frame", {
        Size=UDim2.new(0,boxW,0,px(22)),
        Position=UDim2.new(1,-boxW-px(10),0.5,-px(11)),
        BackgroundColor3=C.inputBg, BorderSizePixel=0,
    }, row)
    corner(5, boxFrame)
    local bsk = stroke(1, C.inputStroke, 0, boxFrame)
    reg(boxFrame, function(o) o.BackgroundColor3=C.inputBg end)
    reg(bsk,      function(o) o.Color=C.inputStroke end)

    local box = new("TextBox", {
        Size=UDim2.new(1,-px(10),1,0), Position=UDim2.new(0,px(5),0,0),
        BackgroundTransparency=1,
        PlaceholderText=placeholder or "",
        PlaceholderColor3=C.textDim,
        Text="", TextColor3=C.text, TextSize=px(11), Font=FR,
        ClearTextOnFocus=false,
    }, boxFrame)
    reg(box, function(o) o.PlaceholderColor3=C.textDim; o.TextColor3=C.text; o.TextSize=px(11) end)

    box.Focused:Connect(function()   tw(bsk, 0.2, {Color=C.accent}) end)
    box.FocusLost:Connect(function()
        tw(bsk, 0.2, {Color=C.inputStroke})
        if callback then callback(box.Text) end
    end)

    return {
        Get=function() return box.Text end,
        Set=function(_,v) box.Text=v end,
    }
end

-- ── Dropdown ─────────────────────────────────────

function Tab:Dropdown(label, options, default, callback)
    local row = new("Frame", {
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(36)),
        BackgroundColor3=C.rowBg, BorderSizePixel=0,
        ClipsDescendants=false, ZIndex=5,
    }, self._s)
    corner(6, row)
    local sk = stroke(1, C.stroke, 0.5, row)
    reg(row, function(o) o.BackgroundColor3=C.rowBg end)
    reg(sk,  function(o) o.Color=C.stroke end)

    local lbl = new("TextLabel", {
        Size=UDim2.new(0.44,0,1,0), Position=UDim2.new(0,px(14),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=px(12), Font=FM,
        TextXAlignment=Enum.TextXAlignment.Left, ZIndex=5,
    }, row)
    reg(lbl, function(o) o.TextColor3=C.text; o.TextSize=px(12) end)

    local sel  = default or options[1] or ""
    local open = false
    local selBtnW = px(110)

    local selBtn = new("TextButton", {
        Size=UDim2.new(0,selBtnW,0,px(22)),
        Position=UDim2.new(1,-selBtnW-px(10),0.5,-px(11)),
        BackgroundColor3=C.inputBg, BorderSizePixel=0,
        Text=sel.." ▾", TextColor3=C.text,
        TextSize=px(11), Font=FM, AutoButtonColor=false, ZIndex=5,
    }, row)
    corner(5, selBtn)
    stroke(1, C.inputStroke, 0, selBtn)
    reg(selBtn, function(o) o.BackgroundColor3=C.inputBg; o.TextColor3=C.text; o.TextSize=px(11) end)

    local dropH = #options * px(26)
    local drop = new("Frame", {
        Size=UDim2.new(0,selBtnW,0,dropH),
        Position=UDim2.new(1,-selBtnW-px(10),1,px(4)),
        BackgroundColor3=C.inputBg, BorderSizePixel=0,
        Visible=false, ZIndex=20, ClipsDescendants=true,
    }, row)
    corner(6, drop)
    stroke(1, C.stroke, 0, drop)
    new("UIListLayout", {SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,0)}, drop)
    reg(drop, function(o) o.BackgroundColor3=C.inputBg end)

    for i, opt in ipairs(options) do
        local ob = new("TextButton", {
            LayoutOrder=i, Size=UDim2.new(1,0,0,px(26)),
            BackgroundColor3=C.inputBg, BorderSizePixel=0,
            Text=opt, TextColor3=C.textDim,
            TextSize=px(11), Font=FM, AutoButtonColor=false, ZIndex=20,
        }, drop)
        local sepLine = new("Frame", {
            Size=UDim2.new(1,-px(10),0,1), Position=UDim2.new(0,px(5),1,-1),
            BackgroundColor3=C.sep, BorderSizePixel=0, ZIndex=21,
        }, ob)
        reg(ob,      function(o) o.BackgroundColor3=C.inputBg; o.TextColor3=C.textDim; o.TextSize=px(11) end)
        reg(sepLine, function(o) o.BackgroundColor3=C.sep end)
        ob.MouseEnter:Connect(function() tw(ob, 0.2, {BackgroundColor3=C.rowHov, TextColor3=C.text}) end)
        ob.MouseLeave:Connect(function() tw(ob, 0.2, {BackgroundColor3=C.inputBg, TextColor3=C.textDim}) end)
        ob.MouseButton1Click:Connect(function()
            sel=opt; selBtn.Text=opt.." ▾"
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
        Get=function() return sel end,
        Set=function(_,v) sel=v; selBtn.Text=v.." ▾" end,
    }
end

-- ── Label (категория) ────────────────────────────

function Tab:Label(text)
    local f = new("Frame", {
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(22)),
        BackgroundColor3=C.catBg, BorderSizePixel=0,
    }, self._s)

    -- левая акцентная полоска
    local bar = new("Frame", {
        Size=UDim2.new(0,px(2),0,px(12)),
        Position=UDim2.new(0,px(10),0.5,-px(6)),
        BackgroundColor3=C.accent, BorderSizePixel=0,
    }, f)
    corner(1, bar)
    reg(bar, function(o) o.BackgroundColor3=C.accent end)

    local l = new("TextLabel", {
        Size=UDim2.new(1,-px(24),1,0), Position=UDim2.new(0,px(20),0,0),
        BackgroundTransparency=1,
        Text=string.upper(text),
        TextColor3=C.catText, TextSize=px(10), Font=FB,
        TextXAlignment=Enum.TextXAlignment.Left,
        LetterSpacing=2,
    }, f)
    reg(f, function(o) o.BackgroundColor3=C.catBg; o.Size=UDim2.new(1,0,0,px(22)) end)
    reg(l, function(o) o.TextColor3=C.catText; o.TextSize=px(10) end)
end

-- ── Separator ────────────────────────────────────

function Tab:Separator()
    local wrap = new("Frame", {
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,px(10)),
        BackgroundTransparency=1, BorderSizePixel=0,
    }, self._s)
    local s = new("Frame", {
        Size=UDim2.new(1,-px(20),0,1), Position=UDim2.new(0,px(10),0.5,0),
        BackgroundColor3=C.sep, BorderSizePixel=0,
    }, wrap)
    reg(wrap, function(o) o.Size=UDim2.new(1,0,0,px(10)) end)
    reg(s,    function(o) o.BackgroundColor3=C.sep end)
end

-- ══════════════════════════════════════════════════
--  PLAYER LIST
-- ══════════════════════════════════════════════════
--[[
  Tab:PlayerList(options)
  options = {
    showTeleport = true,
    showSpectate = true,
    showFling    = false,
    showAvatars  = true,
    onTeleport   = fn(player),
    onSpectate   = fn(player),
    onFling      = fn(player),
  }
]]

function Tab:PlayerList(options)
    options = options or {}
    local showTP  = options.showTeleport ~= false
    local showSP  = options.showSpectate ~= false
    local showFL  = options.showFling    == true
    local showAV  = options.showAvatars  ~= false

    self:Label("Players")

    -- контейнер строк
    local container = new("Frame", {
        LayoutOrder=self:_o(),
        Size=UDim2.new(1,0,0,0),
        AutomaticSize=Enum.AutomaticSize.Y,
        BackgroundTransparency=1,
        BorderSizePixel=0,
    }, self._s)
    new("UIListLayout", {
        SortOrder=Enum.SortOrder.LayoutOrder,
        Padding=UDim.new(0,px(3)),
    }, container)

    local playerRows = {}
    local spectating = nil

    -- ── действия (дефолт) ──────────────────────

    local function doTP(target)
        if options.onTeleport then options.onTeleport(target); return end
        local chr = lp.Character; local tgt = target.Character
        if chr and tgt then
            local h = chr:FindFirstChild("HumanoidRootPart")
            local t = tgt:FindFirstChild("HumanoidRootPart")
            if h and t then h.CFrame = t.CFrame + Vector3.new(0,3,0) end
        end
    end

    local function doSpy(target)
        if options.onSpectate then options.onSpectate(target); return end
        local cam = workspace.CurrentCamera
        if spectating == target then
            cam.CameraSubject = lp.Character and lp.Character:FindFirstChild("Humanoid")
            cam.CameraType    = Enum.CameraType.Custom
            spectating = nil
        else
            local tgt = target.Character
            if tgt then
                local hum = tgt:FindFirstChild("Humanoid")
                if hum then
                    cam.CameraSubject = hum
                    cam.CameraType    = Enum.CameraType.Follow
                    spectating = target
                end
            end
        end
    end

    local function doFling(target)
        if options.onFling then options.onFling(target); return end
        local tgt = target.Character
        if tgt then
            local hrp = tgt:FindFirstChild("HumanoidRootPart")
            if hrp then
                local bv = Instance.new("BodyVelocity")
                bv.Velocity   = Vector3.new(math.random(-180,180), math.random(200,380), math.random(-180,180))
                bv.MaxForce   = Vector3.new(1e9,1e9,1e9)
                bv.P          = 1e9
                bv.Parent     = hrp
                game:GetService("Debris"):AddItem(bv, 0.15)
            end
        end
    end

    -- ── строка одного игрока ───────────────────

    local function buildRow(player)
        if player == lp then return end
        if playerRows[player.Name] then return end

        local ROW_H  = px(46)
        local AV_SZ  = px(28)
        local BTN_H  = px(20)
        local BTN_W  = px(38)
        local BTN_G  = px(4)

        -- Кнопки справа (видимые сразу; по дизайну — слева от правого края)
        -- Считаем общую ширину кнопок
        local numBtns = (showTP and 1 or 0) + (showSP and 1 or 0) + (showFL and 1 or 0)
        local totalBtnW = numBtns * (BTN_W + BTN_G) - BTN_G

        local row = new("Frame", {
            LayoutOrder=1,
            Size=UDim2.new(1,0,0,ROW_H),
            BackgroundColor3=C.rowBg,
            BorderSizePixel=0,
        }, container)
        corner(8, row)
        local rsk = stroke(1, C.stroke, 0.6, row)
        reg(row, function(o) o.BackgroundColor3=C.rowBg; o.Size=UDim2.new(1,0,0,ROW_H) end)
        reg(rsk, function(o) o.Color=C.stroke end)

        row.MouseEnter:Connect(function()
            tw(row, 0.3, {BackgroundColor3=C.rowHov})
            tw(rsk, 0.3, {Color=C.strokeHov, Transparency=0})
        end)
        row.MouseLeave:Connect(function()
            tw(row, 0.25, {BackgroundColor3=C.rowBg})
            tw(rsk, 0.25, {Color=C.stroke, Transparency=0.6})
        end)

        local xCursor = px(10) -- текущий X слева

        -- аватарка
        local avFrame
        if showAV then
            avFrame = new("ImageLabel", {
                Size=UDim2.new(0,AV_SZ,0,AV_SZ),
                Position=UDim2.new(0,xCursor,0.5,-AV_SZ/2),
                BackgroundColor3=C.inputBg,
                BorderSizePixel=0,
                Image="https://www.roblox.com/headshot-thumbnail/image?userId="
                    ..player.UserId.."&width=150&height=150&format=png",
                ZIndex=2,
            }, row)
            corner(AV_SZ/2, avFrame)
            stroke(1, C.stroke, 0, avFrame)
            xCursor = xCursor + AV_SZ + px(8)
        end

        -- онлайн-индикатор
        local onlineDot = new("Frame", {
            Size=UDim2.new(0,px(6),0,px(6)),
            Position=UDim2.new(0,px(10+(showAV and AV_SZ-6 or -4)),0,px(10+(showAV and AV_SZ-6 or -4))),
            BackgroundColor3=C.on, BorderSizePixel=0, ZIndex=3,
        }, row)
        corner(px(3), onlineDot)
        reg(onlineDot, function(o) o.BackgroundColor3=C.on end)

        -- имя
        local nameX = xCursor
        local nameLbl = new("TextLabel", {
            Size=UDim2.new(1,-nameX-totalBtnW-px(20),0,px(14)),
            Position=UDim2.new(0,nameX,0.5,-px(14)),
            BackgroundTransparency=1,
            Text=player.DisplayName,
            TextColor3=C.text,
            TextSize=px(12), Font=FB,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd,
            ZIndex=2,
        }, row)
        reg(nameLbl, function(o)
            o.TextColor3=C.text; o.TextSize=px(12)
            o.Size=UDim2.new(1,-nameX-totalBtnW-px(20),0,px(14))
        end)

        -- @username (маленький)
        local userLbl = new("TextLabel", {
            Size=UDim2.new(1,-nameX-totalBtnW-px(20),0,px(10)),
            Position=UDim2.new(0,nameX,0.5,px(2)),
            BackgroundTransparency=1,
            Text="@"..player.Name,
            TextColor3=C.textDim,
            TextSize=px(10), Font=FM,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd,
            ZIndex=2,
        }, row)
        reg(userLbl, function(o) o.TextColor3=C.textDim; o.TextSize=px(10) end)

        -- ── кнопки (слева, у правого края) ──
        local function mkBtn(label, bgCol, xFromRight, cb)
            local b = new("TextButton", {
                Size=UDim2.new(0,BTN_W,0,BTN_H),
                Position=UDim2.new(1,-xFromRight,0.5,-BTN_H/2),
                BackgroundColor3=bgCol,
                BorderSizePixel=0,
                Text=label,
                TextColor3=Color3.fromRGB(255,255,255),
                TextSize=px(9), Font=FB,
                AutoButtonColor=false, ZIndex=3,
            }, row)
            corner(4, b)

            -- полупрозрачное «стекло» поверх кнопки
            local glass = new("Frame", {
                Size=UDim2.new(1,0,0.5,0), Position=UDim2.new(0,0,0,0),
                BackgroundColor3=Color3.fromRGB(255,255,255),
                BackgroundTransparency=0.88, BorderSizePixel=0, ZIndex=4,
            }, b)
            corner(4, glass)

            reg(b, function(o)
                o.BackgroundColor3=bgCol
                o.TextSize=px(9)
                o.Size=UDim2.new(0,BTN_W,0,BTN_H)
            end)

            b.MouseEnter:Connect(function()
                tw(b, 0.2, {
                    BackgroundColor3=Color3.fromRGB(
                        math.min(bgCol.R*255+30,255)/255,
                        math.min(bgCol.G*255+30,255)/255,
                        math.min(bgCol.B*255+30,255)/255)
                })
            end)
            b.MouseLeave:Connect(function() tw(b, 0.2, {BackgroundColor3=bgCol}) end)
            b.MouseButton1Click:Connect(function()
                tw(b, 0.08, {BackgroundTransparency=0.4})
                task.delay(0.1, function() tw(b, 0.15, {BackgroundTransparency=0}) end)
                if cb then cb() end
            end)
            return b
        end

        local rX = px(8)
        if showFL then
            mkBtn("FLG", C.btnFling, rX+BTN_W, function() doFling(player) end)
            rX = rX + BTN_W + BTN_G
        end
        if showSP then
            mkBtn("SPY", C.btnSpy, rX+BTN_W, function() doSpy(player) end)
            rX = rX + BTN_W + BTN_G
        end
        if showTP then
            mkBtn("TP", C.btnTP, rX+BTN_W, function() doTP(player) end)
        end

        reg(row, function(o)
            if C.btnTP then
                -- обновляем цвета кнопок (они уже в реестре отдельно)
            end
        end)

        playerRows[player.Name] = row
    end

    local function removeRow(player)
        if spectating == player then
            local cam = workspace.CurrentCamera
            cam.CameraSubject = lp.Character and lp.Character:FindFirstChild("Humanoid")
            cam.CameraType    = Enum.CameraType.Custom
            spectating = nil
        end
        local r = playerRows[player.Name]
        if r then r:Destroy(); playerRows[player.Name]=nil end
    end

    for _, p in ipairs(Players:GetPlayers()) do buildRow(p) end
    Players.PlayerAdded:Connect(buildRow)
    Players.PlayerRemoving:Connect(removeRow)

    -- кнопка обновить
    local refRow = new("Frame", {
        LayoutOrder=self:_o(),
        Size=UDim2.new(1,0,0,px(28)),
        BackgroundColor3=C.catBg, BorderSizePixel=0,
    }, self._s)
    local refBtn = new("TextButton", {
        Size=UDim2.new(1,-px(20),0,px(20)),
        Position=UDim2.new(0,px(10),0.5,-px(10)),
        BackgroundColor3=C.rowBg, BorderSizePixel=0,
        Text="↺  Refresh",
        TextColor3=C.textDim, TextSize=px(10), Font=FB,
        AutoButtonColor=false,
    }, refRow)
    corner(5, refBtn)
    stroke(1, C.stroke, 0.4, refBtn)
    reg(refRow, function(o) o.BackgroundColor3=C.catBg; o.Size=UDim2.new(1,0,0,px(28)) end)
    reg(refBtn, function(o) o.BackgroundColor3=C.rowBg; o.TextColor3=C.textDim; o.TextSize=px(10) end)

    refBtn.MouseEnter:Connect(function() tw(refBtn, 0.2, {BackgroundColor3=C.rowHov, TextColor3=C.text}) end)
    refBtn.MouseLeave:Connect(function() tw(refBtn, 0.2, {BackgroundColor3=C.rowBg, TextColor3=C.textDim}) end)
    refBtn.MouseButton1Click:Connect(function()
        for name, r in pairs(playerRows) do
            if not Players:FindFirstChild(name) then r:Destroy(); playerRows[name]=nil end
        end
        for _, p in ipairs(Players:GetPlayers()) do buildRow(p) end
    end)
end

-- ══════════════════════════════════════════════════
--  WINDOW CLASS
-- ══════════════════════════════════════════════════

local Window = {}; Window.__index = Window

function FlatLib.Window(title, subtitle)
    local self = setmetatable({}, Window)
    self._tabs    = {}
    self._tabList = {}
    self._active  = nil
    self._visible = true

    self._sg = new("ScreenGui", {
        Name="FlatLib5_"..title, ResetOnSpawn=false,
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    }, pg)

    -- ── основной фрейм ────────────────────────────

    local WIN_W, WIN_H = px(280), px(360)

    local win = new("Frame", {
        Size=UDim2.new(0,WIN_W,0,WIN_H),
        Position=UDim2.new(0,12,0,12),
        BackgroundColor3=C.winBg,
        BorderSizePixel=0,
        Active=true, Draggable=true,
        ClipsDescendants=false,
    }, self._sg)
    self._win = win
    corner(10, win)
    local winStroke = stroke(1, C.stroke, 0, win)
    reg(win,       function(o) o.BackgroundColor3=C.winBg end)
    reg(winStroke, function(o) o.Color=C.stroke end)

    -- тень
    local shadow = new("Frame", {
        Size=UDim2.new(1,px(16),1,px(16)),
        Position=UDim2.new(0,-px(8),0,px(8)),
        BackgroundColor3=C.shadow,
        BackgroundTransparency=0.65,
        BorderSizePixel=0, ZIndex=0,
    }, win)
    corner(14, shadow)
    reg(shadow, function(o) o.BackgroundColor3=C.shadow end)

    new("UIListLayout", {SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,0)}, win)

    -- ── шапка с градиентом ───────────────────────

    local HDR_H = px(52)
    local hdr = new("Frame", {
        LayoutOrder=0,
        Size=UDim2.new(1,0,0,HDR_H),
        BackgroundColor3=C.headerBg,
        BorderSizePixel=0,
    }, win)
    corner(10, hdr)

    -- градиент шапки
    local hdrGrad = new("UIGradient", {
        Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.gradA),
            ColorSequenceKeypoint.new(1, C.gradB),
        }),
        Rotation=135,
    }, hdr)
    reg(hdr,     function(o) o.BackgroundColor3=C.headerBg; o.Size=UDim2.new(1,0,0,HDR_H) end)
    reg(hdrGrad, function(o)
        o.Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0, C.gradA),
            ColorSequenceKeypoint.new(1, C.gradB),
        })
    end)

    -- перекрытие нижних скруглений шапки
    local hdrFill = new("Frame", {
        Size=UDim2.new(1,0,0,px(10)),
        Position=UDim2.new(0,0,1,-px(10)),
        BackgroundColor3=C.headerBg, BorderSizePixel=0,
    }, hdr)
    reg(hdrFill, function(o) o.BackgroundColor3=C.headerBg end)

    -- маленький иконка-квадрат слева
    local iconBox = new("Frame", {
        Size=UDim2.new(0,px(26),0,px(26)),
        Position=UDim2.new(0,px(12),0.5,-px(13)),
        BackgroundColor3=Color3.fromRGB(255,255,255),
        BackgroundTransparency=0.88,
        BorderSizePixel=0,
    }, hdr)
    corner(6, iconBox)
    stroke(1, Color3.fromRGB(255,255,255), 0.75, iconBox)
    local iconLbl = new("TextLabel", {
        Size=UDim2.new(1,0,1,0),
        BackgroundTransparency=1,
        Text="◈", TextColor3=Color3.fromRGB(255,255,255),
        TextSize=px(14), Font=FB,
    }, iconBox)

    local titleLbl = new("TextLabel", {
        Size=UDim2.new(1,-px(58),0,px(16)),
        Position=UDim2.new(0,px(46),0.5,-px(subtitle and 12 or 8)),
        BackgroundTransparency=1,
        Text=title,
        TextColor3=Color3.fromRGB(255,255,255),
        TextSize=px(13), Font=FB,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, hdr)
    reg(titleLbl, function(o) o.TextSize=px(13) end)

    if subtitle then
        local subLbl = new("TextLabel", {
            Size=UDim2.new(1,-px(58),0,px(10)),
            Position=UDim2.new(0,px(46),0.5,px(2)),
            BackgroundTransparency=1,
            Text=subtitle,
            TextColor3=Color3.fromRGB(255,255,255),
            TextTransparency=0.45,
            TextSize=px(10), Font=FM,
            TextXAlignment=Enum.TextXAlignment.Left,
        }, hdr)
        reg(subLbl, function(o) o.TextSize=px(10) end)
    end

    -- разделитель шапка/таб-бар
    local hdrDiv = new("Frame", {
        LayoutOrder=1, Size=UDim2.new(1,0,0,1),
        BackgroundColor3=C.stroke, BorderSizePixel=0,
    }, win)
    reg(hdrDiv, function(o) o.BackgroundColor3=C.stroke end)

    -- ── таб-бар ──────────────────────────────────

    local TAB_H = px(30)
    self._tabBar = new("Frame", {
        LayoutOrder=2, Size=UDim2.new(1,0,0,TAB_H),
        BackgroundColor3=C.tabBarBg, BorderSizePixel=0,
        ClipsDescendants=true,
    }, win)
    reg(self._tabBar, function(o) o.BackgroundColor3=C.tabBarBg; o.Size=UDim2.new(1,0,0,TAB_H) end)
    new("UIListLayout", {
        FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder,
        Padding=UDim.new(0,0),
    }, self._tabBar)

    local tabDiv = new("Frame", {
        LayoutOrder=3, Size=UDim2.new(1,0,0,1),
        BackgroundColor3=C.stroke, BorderSizePixel=0,
    }, win)
    reg(tabDiv, function(o) o.BackgroundColor3=C.stroke end)

    -- ── контент ──────────────────────────────────

    local CONTENT_H = px(HDR_H) + 1 + TAB_H + 1
    self._content = new("Frame", {
        LayoutOrder=4,
        Size=UDim2.new(1,0,1,-(CONTENT_H/SCALE)),
        BackgroundColor3=C.panelBg,
        BorderSizePixel=0,
        ClipsDescendants=true,
    }, win)
    reg(self._content, function(o) o.BackgroundColor3=C.panelBg end)

    -- скругление снизу
    corner(10, self._content)

    -- ── ресайз ───────────────────────────────────

    local rsh = new("TextButton", {
        Size=UDim2.new(0,px(16),0,px(16)),
        Position=UDim2.new(1,-px(16),1,-px(16)),
        BackgroundColor3=C.stroke,
        BackgroundTransparency=0.4,
        BorderSizePixel=0,
        Text="⌟", TextColor3=C.textDim,
        TextSize=px(10), Font=FB,
        AutoButtonColor=false, ZIndex=10,
    }, win)
    corner(3, rsh)
    reg(rsh, function(o) o.BackgroundColor3=C.stroke; o.TextColor3=C.textDim end)

    local rsDown=false; local rsSt, rsSz
    rsh.MouseButton1Down:Connect(function(x,y)
        rsDown=true; win.Draggable=false
        rsSt=Vector2.new(x,y)
        rsSz=Vector2.new(win.AbsoluteSize.X, win.AbsoluteSize.Y)
    end)
    UserInputService.InputChanged:Connect(function(i)
        if not rsDown then return end
        if i.UserInputType~=Enum.UserInputType.MouseMovement then return end
        local d=Vector2.new(i.Position.X,i.Position.Y)-rsSt
        win.Size=UDim2.new(0,math.max(200,rsSz.X+d.X),0,math.max(150,rsSz.Y+d.Y))
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then
            rsDown=false; win.Draggable=true
        end
    end)

    return self
end

function Window:Tab(name)
    local idx = #self._tabList + 1

    local TAB_H = px(30)

    local btn = new("TextButton", {
        LayoutOrder=idx,
        Size=UDim2.new(0,1,1,0),
        BackgroundColor3=C.tabOff,
        BorderSizePixel=0,
        Text=name,
        TextColor3=C.textDim,
        TextSize=px(10), Font=FB,
        AutoButtonColor=false,
    }, self._tabBar)

    -- нижняя акцент-линия (видна у активного)
    local accentLine = new("Frame", {
        Size=UDim2.new(0.5,0,0,px(2)),
        Position=UDim2.new(0.25,0,1,-px(2)),
        BackgroundColor3=C.accent,
        BackgroundTransparency=1,
        BorderSizePixel=0,
    }, btn)
    reg(accentLine, function(o) o.BackgroundColor3=C.accent end)

    local scroll = new("ScrollingFrame", {
        Size=UDim2.new(1,0,1,0),
        BackgroundTransparency=1,
        BorderSizePixel=0,
        ScrollBarThickness=px(3),
        ScrollBarImageColor3=C.scrollBar,
        CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        Visible=false,
    }, self._content)

    -- padding внутри скролл-фрейма
    new("UIPadding", {
        PaddingTop=UDim.new(0,px(6)),
        PaddingBottom=UDim.new(0,px(6)),
        PaddingLeft=UDim.new(0,px(6)),
        PaddingRight=UDim.new(0,px(6)),
    }, scroll)

    new("UIListLayout", {
        SortOrder=Enum.SortOrder.LayoutOrder,
        Padding=UDim.new(0,px(3)),
    }, scroll)

    reg(scroll, function(o) o.ScrollBarImageColor3=C.scrollBar end)

    self._tabs[name]   = {btn=btn, line=accentLine, scroll=scroll}
    self._tabList[idx] = name

    local total = #self._tabList
    for _, n in ipairs(self._tabList) do
        local d = self._tabs[n]
        d.btn.Size = UDim2.new(1/total, 0, 1, 0)
        local cn = n; local cself = self
        reg(d.btn, function(o)
            local on = (cn == cself._active)
            o.BackgroundColor3 = on and C.tabOn or C.tabOff
            o.TextColor3       = on and C.text  or C.textDim
            o.TextSize         = px(10)
            o.Size             = UDim2.new(1/#cself._tabList, 0, 1, 0)
        end)
        reg(d.line, function(o) o.BackgroundColor3=C.accent end)
    end

    btn.MouseButton1Click:Connect(function() self:_activate(name) end)
    if idx == 1 then self:_activate(name) end

    return Tab._new(scroll)
end

function Window:_activate(name)
    self._active = name
    for n, d in pairs(self._tabs) do
        local on = (n == name)
        d.scroll.Visible = on
        tw(d.btn,  0.25, {BackgroundColor3=on and C.tabOn  or C.tabOff,
                          TextColor3      =on and C.text   or C.textDim})
        tw(d.line, 0.25, {BackgroundTransparency=on and 0 or 1})
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
