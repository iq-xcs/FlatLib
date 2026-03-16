-- ══════════════════════════════════════════════════════════════
--  FlatLib v4  |  2018 flat style  |  Roblox Executor UI Lib
--  Темы, масштаб и ресайз работают через реестр объектов
-- ══════════════════════════════════════════════════════════════

local FlatLib = {}

local UserInputService = game:GetService("UserInputService")
local Players          = game:GetService("Players")
local lp               = Players.LocalPlayer
local pg               = lp:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════
--  ТЕМЫ
-- ══════════════════════════════════════════════════

FlatLib.Themes = {
    Dark = {
        bg        = Color3.fromRGB(28,  28,  28),
        header    = Color3.fromRGB(45,  45,  45),
        tabBar    = Color3.fromRGB(33,  33,  33),
        tabOn     = Color3.fromRGB(52,  52,  52),
        tabOff    = Color3.fromRGB(33,  33,  33),
        row       = Color3.fromRGB(36,  36,  36),
        rowHov    = Color3.fromRGB(48,  48,  48),
        border    = Color3.fromRGB(62,  62,  62),
        sep       = Color3.fromRGB(50,  50,  50),
        text      = Color3.fromRGB(215, 215, 215),
        dim       = Color3.fromRGB(115, 115, 115),
        on        = Color3.fromRGB(78,  170, 78),
        onBg      = Color3.fromRGB(28,  65,  28),
        off       = Color3.fromRGB(170, 52,  52),
        offBg     = Color3.fromRGB(64,  20,  20),
        accent    = Color3.fromRGB(190, 150, 50),
        input     = Color3.fromRGB(20,  20,  20),
        inputBord = Color3.fromRGB(65,  65,  65),
        scroll    = Color3.fromRGB(70,  70,  70),
        catBg     = Color3.fromRGB(22,  22,  22),
        catText   = Color3.fromRGB(105, 105, 105),
    },
    Light = {
        bg        = Color3.fromRGB(238, 238, 238),
        header    = Color3.fromRGB(210, 210, 210),
        tabBar    = Color3.fromRGB(220, 220, 220),
        tabOn     = Color3.fromRGB(248, 248, 248),
        tabOff    = Color3.fromRGB(220, 220, 220),
        row       = Color3.fromRGB(245, 245, 245),
        rowHov    = Color3.fromRGB(228, 228, 228),
        border    = Color3.fromRGB(185, 185, 185),
        sep       = Color3.fromRGB(200, 200, 200),
        text      = Color3.fromRGB(30,  30,  30),
        dim       = Color3.fromRGB(120, 120, 120),
        on        = Color3.fromRGB(35,  140, 35),
        onBg      = Color3.fromRGB(195, 235, 195),
        off       = Color3.fromRGB(180, 40,  40),
        offBg     = Color3.fromRGB(245, 200, 200),
        accent    = Color3.fromRGB(155, 108, 18),
        input     = Color3.fromRGB(255, 255, 255),
        inputBord = Color3.fromRGB(175, 175, 175),
        scroll    = Color3.fromRGB(155, 155, 155),
        catBg     = Color3.fromRGB(215, 215, 215),
        catText   = Color3.fromRGB(95,  95,  95),
    },
    Midnight = {
        bg        = Color3.fromRGB(12,  12,  22),
        header    = Color3.fromRGB(20,  20,  40),
        tabBar    = Color3.fromRGB(15,  15,  30),
        tabOn     = Color3.fromRGB(26,  26,  50),
        tabOff    = Color3.fromRGB(15,  15,  30),
        row       = Color3.fromRGB(17,  17,  34),
        rowHov    = Color3.fromRGB(25,  25,  48),
        border    = Color3.fromRGB(44,  44,  80),
        sep       = Color3.fromRGB(32,  32,  60),
        text      = Color3.fromRGB(200, 200, 235),
        dim       = Color3.fromRGB(85,  85,  130),
        on        = Color3.fromRGB(80,  180, 255),
        onBg      = Color3.fromRGB(18,  52,  90),
        off       = Color3.fromRGB(180, 60,  100),
        offBg     = Color3.fromRGB(58,  18,  34),
        accent    = Color3.fromRGB(140, 100, 255),
        input     = Color3.fromRGB(10,  10,  20),
        inputBord = Color3.fromRGB(48,  48,  88),
        scroll    = Color3.fromRGB(58,  58,  105),
        catBg     = Color3.fromRGB(10,  10,  18),
        catText   = Color3.fromRGB(70,  70,  120),
    },
    Green = {
        bg        = Color3.fromRGB(13,  22,  13),
        header    = Color3.fromRGB(20,  38,  20),
        tabBar    = Color3.fromRGB(15,  28,  15),
        tabOn     = Color3.fromRGB(24,  44,  24),
        tabOff    = Color3.fromRGB(15,  28,  15),
        row       = Color3.fromRGB(17,  30,  17),
        rowHov    = Color3.fromRGB(24,  42,  24),
        border    = Color3.fromRGB(38,  72,  38),
        sep       = Color3.fromRGB(28,  52,  28),
        text      = Color3.fromRGB(175, 230, 175),
        dim       = Color3.fromRGB(75,  130, 75),
        on        = Color3.fromRGB(80,  225, 80),
        onBg      = Color3.fromRGB(18,  72,  18),
        off       = Color3.fromRGB(200, 68,  48),
        offBg     = Color3.fromRGB(62,  20,  14),
        accent    = Color3.fromRGB(95,  255, 115),
        input     = Color3.fromRGB(10,  18,  10),
        inputBord = Color3.fromRGB(38,  68,  38),
        scroll    = Color3.fromRGB(48,  98,  48),
        catBg     = Color3.fromRGB(10,  18,  10),
        catText   = Color3.fromRGB(55,  108, 55),
    },
}

-- активная тема — копия, можно менять отдельные ключи
local C = {}
for k, v in pairs(FlatLib.Themes.Dark) do C[k] = v end

local SCALE = 1.0
local function px(v) return math.floor(v * SCALE) end

local FB = Enum.Font.SourceSansBold
local FR = Enum.Font.SourceSans

-- ══════════════════════════════════════════════════
--  РЕЕСТР — список { inst, paintFn }
--  paintFn(inst) вызывается при смене темы/масштаба
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

-- нижняя граница строки
local function mkBorder(parent)
    local b = new("Frame",{
        Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,1,-1),
        BackgroundColor3=C.border, BorderSizePixel=0, ZIndex=2,
    }, parent)
    reg(b, function(o) o.BackgroundColor3=C.border end)
    return b
end

-- hover для строки
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

-- ══════════════════════════════════════════════════
--  TAB CLASS
-- ══════════════════════════════════════════════════

local Tab = {}; Tab.__index = Tab

function Tab._new(scroll)
    return setmetatable({ _s=scroll, _ord=0 }, Tab)
end

function Tab:_o() self._ord+=1; return self._ord end

-- базовая строка высотой h
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

-- квадрат-индикатор
local function dot(parent, colorFn, ox, oy)
    ox = ox or 8; oy = oy or nil  -- oy=nil → центр по Y
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

    -- обновляем ширину всех кнопок и их paint
    local total = #self._tabList
    for _, n in ipairs(self._tabList) do
        local d = self._tabs[n]
        d.btn.Size = UDim2.new(1/total,0,1,0)
        -- захватываем n для paint
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
