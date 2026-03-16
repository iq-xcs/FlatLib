-- ═══════════════════════════════════════════════════════════
--  FlatLib v5.1  |  Sirius-style  |  clean rewrite
-- ═══════════════════════════════════════════════════════════

local FlatLib = {}

local UIS     = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenS  = game:GetService("TweenService")
local lp      = Players.LocalPlayer
local pg      = lp:WaitForChild("PlayerGui")

-- ════════════════════════
--  ТЕМЫ
-- ════════════════════════

FlatLib.Themes = {
    Dark = {
        winBg     = Color3.fromRGB(15,  15,  18),
        hdrBg     = Color3.fromRGB(20,  20,  26),
        tabBg     = Color3.fromRGB(12,  12,  16),
        tabOn     = Color3.fromRGB(22,  22,  30),
        tabOff    = Color3.fromRGB(12,  12,  16),
        rowBg     = Color3.fromRGB(22,  22,  28),
        rowHov    = Color3.fromRGB(30,  30,  40),
        stroke    = Color3.fromRGB(40,  40,  55),
        sep       = Color3.fromRGB(30,  30,  40),
        text      = Color3.fromRGB(220, 220, 230),
        dim       = Color3.fromRGB(90,  90,  115),
        on        = Color3.fromRGB(75,  195, 110),
        onBg      = Color3.fromRGB(20,  55,  30),
        off       = Color3.fromRGB(195, 65,  65),
        offBg     = Color3.fromRGB(55,  18,  18),
        accent    = Color3.fromRGB(90,  145, 255),
        inputBg   = Color3.fromRGB(11,  11,  15),
        inputBord = Color3.fromRGB(38,  38,  52),
        scrollCol = Color3.fromRGB(48,  48,  68),
        catBg     = Color3.fromRGB(12,  12,  16),
        catText   = Color3.fromRGB(65,  65,  95),
        gradA     = Color3.fromRGB(22,  55,  115),
        gradB     = Color3.fromRGB(55,  25,  110),
        btnTP     = Color3.fromRGB(35,  90,  190),
        btnSpy    = Color3.fromRGB(90,  60,  195),
        btnFling  = Color3.fromRGB(175, 40,  40),
    },
    Midnight = {
        winBg     = Color3.fromRGB(7,   7,   18),
        hdrBg     = Color3.fromRGB(11,  10,  26),
        tabBg     = Color3.fromRGB(8,   8,   20),
        tabOn     = Color3.fromRGB(18,  16,  38),
        tabOff    = Color3.fromRGB(8,   8,   20),
        rowBg     = Color3.fromRGB(11,  10,  24),
        rowHov    = Color3.fromRGB(20,  18,  44),
        stroke    = Color3.fromRGB(30,  28,  72),
        sep       = Color3.fromRGB(18,  16,  44),
        text      = Color3.fromRGB(195, 195, 235),
        dim       = Color3.fromRGB(65,  62,  120),
        on        = Color3.fromRGB(55,  175, 255),
        onBg      = Color3.fromRGB(10,  42,  80),
        off       = Color3.fromRGB(185, 50,  90),
        offBg     = Color3.fromRGB(52,  12,  28),
        accent    = Color3.fromRGB(115, 85,  255),
        inputBg   = Color3.fromRGB(6,   6,   16),
        inputBord = Color3.fromRGB(34,  30,  80),
        scrollCol = Color3.fromRGB(42,  38,  100),
        catBg     = Color3.fromRGB(7,   7,   18),
        catText   = Color3.fromRGB(45,  42,  110),
        gradA     = Color3.fromRGB(14,  28,  100),
        gradB     = Color3.fromRGB(55,  18,  110),
        btnTP     = Color3.fromRGB(38,  75,  200),
        btnSpy    = Color3.fromRGB(95,  55,  215),
        btnFling  = Color3.fromRGB(175, 38,  85),
    },
    Forest = {
        winBg     = Color3.fromRGB(7,   15,  9),
        hdrBg     = Color3.fromRGB(10,  22,  12),
        tabBg     = Color3.fromRGB(8,   14,  9),
        tabOn     = Color3.fromRGB(16,  28,  18),
        tabOff    = Color3.fromRGB(8,   14,  9),
        rowBg     = Color3.fromRGB(11,  20,  13),
        rowHov    = Color3.fromRGB(18,  34,  20),
        stroke    = Color3.fromRGB(26,  56,  30),
        sep       = Color3.fromRGB(16,  34,  18),
        text      = Color3.fromRGB(165, 235, 170),
        dim       = Color3.fromRGB(55,  110, 62),
        on        = Color3.fromRGB(60,  215, 80),
        onBg      = Color3.fromRGB(12,  60,  16),
        off       = Color3.fromRGB(195, 58,  40),
        offBg     = Color3.fromRGB(56,  13,  8),
        accent    = Color3.fromRGB(70,  230, 95),
        inputBg   = Color3.fromRGB(6,   12,  7),
        inputBord = Color3.fromRGB(24,  52,  28),
        scrollCol = Color3.fromRGB(32,  78,  38),
        catBg     = Color3.fromRGB(7,   13,  8),
        catText   = Color3.fromRGB(38,  88,  44),
        gradA     = Color3.fromRGB(12,  58,  18),
        gradB     = Color3.fromRGB(36,  95,  18),
        btnTP     = Color3.fromRGB(28,  145, 48),
        btnSpy    = Color3.fromRGB(75,  155, 38),
        btnFling  = Color3.fromRGB(165, 42,  24),
    },
    Crimson = {
        winBg     = Color3.fromRGB(13,  6,   6),
        hdrBg     = Color3.fromRGB(20,  8,   8),
        tabBg     = Color3.fromRGB(14,  6,   6),
        tabOn     = Color3.fromRGB(28,  12,  12),
        tabOff    = Color3.fromRGB(14,  6,   6),
        rowBg     = Color3.fromRGB(20,  9,   9),
        rowHov    = Color3.fromRGB(34,  14,  14),
        stroke    = Color3.fromRGB(62,  20,  20),
        sep       = Color3.fromRGB(36,  12,  12),
        text      = Color3.fromRGB(238, 200, 200),
        dim       = Color3.fromRGB(125, 58,  58),
        on        = Color3.fromRGB(210, 68,  68),
        onBg      = Color3.fromRGB(62,  13,  13),
        off       = Color3.fromRGB(95,  95,  95),
        offBg     = Color3.fromRGB(28,  24,  24),
        accent    = Color3.fromRGB(250, 85,  85),
        inputBg   = Color3.fromRGB(9,   4,   4),
        inputBord = Color3.fromRGB(55,  17,  17),
        scrollCol = Color3.fromRGB(86,  22,  22),
        catBg     = Color3.fromRGB(11,  5,   5),
        catText   = Color3.fromRGB(95,  30,  30),
        gradA     = Color3.fromRGB(85,  10,  10),
        gradB     = Color3.fromRGB(38,  5,   5),
        btnTP     = Color3.fromRGB(155, 30,  30),
        btnSpy    = Color3.fromRGB(185, 95,  20),
        btnFling  = Color3.fromRGB(235, 50,  50),
    },
    Slate = {
        winBg     = Color3.fromRGB(18,  22,  28),
        hdrBg     = Color3.fromRGB(24,  28,  36),
        tabBg     = Color3.fromRGB(16,  20,  26),
        tabOn     = Color3.fromRGB(28,  34,  46),
        tabOff    = Color3.fromRGB(16,  20,  26),
        rowBg     = Color3.fromRGB(22,  26,  34),
        rowHov    = Color3.fromRGB(32,  38,  52),
        stroke    = Color3.fromRGB(44,  52,  70),
        sep       = Color3.fromRGB(28,  34,  46),
        text      = Color3.fromRGB(205, 210, 225),
        dim       = Color3.fromRGB(85,  95,  120),
        on        = Color3.fromRGB(70,  180, 150),
        onBg      = Color3.fromRGB(14,  50,  42),
        off       = Color3.fromRGB(180, 65,  65),
        offBg     = Color3.fromRGB(52,  15,  15),
        accent    = Color3.fromRGB(88,  178, 238),
        inputBg   = Color3.fromRGB(13,  16,  22),
        inputBord = Color3.fromRGB(40,  48,  66),
        scrollCol = Color3.fromRGB(55,  66,  90),
        catBg     = Color3.fromRGB(16,  20,  26),
        catText   = Color3.fromRGB(65,  76,  105),
        gradA     = Color3.fromRGB(26,  58,  115),
        gradB     = Color3.fromRGB(46,  48,  105),
        btnTP     = Color3.fromRGB(38,  105, 190),
        btnSpy    = Color3.fromRGB(90,  118, 195),
        btnFling  = Color3.fromRGB(170, 50,  50),
    },
    Light = {
        winBg     = Color3.fromRGB(232, 232, 240),
        hdrBg     = Color3.fromRGB(215, 215, 228),
        tabBg     = Color3.fromRGB(222, 222, 235),
        tabOn     = Color3.fromRGB(248, 248, 255),
        tabOff    = Color3.fromRGB(222, 222, 235),
        rowBg     = Color3.fromRGB(245, 245, 252),
        rowHov    = Color3.fromRGB(228, 228, 242),
        stroke    = Color3.fromRGB(190, 190, 210),
        sep       = Color3.fromRGB(210, 210, 228),
        text      = Color3.fromRGB(22,  22,  32),
        dim       = Color3.fromRGB(110, 110, 145),
        on        = Color3.fromRGB(24,  140, 60),
        onBg      = Color3.fromRGB(190, 240, 205),
        off       = Color3.fromRGB(185, 36,  36),
        offBg     = Color3.fromRGB(250, 200, 200),
        accent    = Color3.fromRGB(55,  110, 220),
        inputBg   = Color3.fromRGB(255, 255, 255),
        inputBord = Color3.fromRGB(180, 180, 208),
        scrollCol = Color3.fromRGB(155, 155, 185),
        catBg     = Color3.fromRGB(220, 220, 232),
        catText   = Color3.fromRGB(90,  90,  125),
        gradA     = Color3.fromRGB(100, 140, 220),
        gradB     = Color3.fromRGB(140, 100, 220),
        btnTP     = Color3.fromRGB(40,  95,  195),
        btnSpy    = Color3.fromRGB(95,  60,  195),
        btnFling  = Color3.fromRGB(175, 36,  36),
    },
}

-- активная тема
local C = {}
for k,v in pairs(FlatLib.Themes.Dark) do C[k]=v end

-- ════════════════════════
--  РЕЕСТР
-- ════════════════════════

local REG = {}
local function reg(o, fn) table.insert(REG, {i=o, p=fn}) end
local function applyAll()
    for i = #REG, 1, -1 do
        local e = REG[i]
        if e.i and e.i.Parent then pcall(e.p, e.i)
        else table.remove(REG, i) end
    end
end

-- ════════════════════════
--  PUBLIC API
-- ════════════════════════

function FlatLib.SetTheme(name)
    local t = type(name)=="string" and FlatLib.Themes[name] or name
    if not t then return end
    for k,v in pairs(t) do C[k]=v end
    applyAll()
end
function FlatLib.SetColor(k,v) C[k]=v; applyAll() end
function FlatLib.SetToggleKey(win, key)
    UIS.InputBegan:Connect(function(i,gp)
        if not gp and i.KeyCode==key then win:Toggle() end
    end)
end

-- ════════════════════════
--  HELPERS
-- ════════════════════════

-- создать instance с props и parent
local function mk(cls, props, parent)
    local o = Instance.new(cls)
    for k,v in pairs(props) do o[k]=v end
    if parent then o.Parent=parent end
    return o
end

-- быстрый tween (Quint Out)
local function tw(o, t, props)
    TweenS:Create(o, TweenInfo.new(t, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), props):Play()
end

local function corner(r, p)  mk("UICorner",{CornerRadius=UDim.new(0,r)}, p) end
local function padding(t,b,l,r2,p)
    mk("UIPadding",{PaddingTop=UDim.new(0,t),PaddingBottom=UDim.new(0,b),
                    PaddingLeft=UDim.new(0,l),PaddingRight=UDim.new(0,r2)}, p)
end

local function addStroke(p, col, thick, trans)
    local s = mk("UIStroke",{
        Color=col, Thickness=thick or 1,
        Transparency=trans or 0,
        ApplyStrokeMode=Enum.ApplyStrokeMode.Border,
    }, p)
    return s
end

-- ════════════════════════
--  TAB CLASS
-- ════════════════════════

local Tab = {}; Tab.__index = Tab

function Tab._new(scroll)
    return setmetatable({_s=scroll, _n=0}, Tab)
end
function Tab:_lo() self._n += 1; return self._n end

-- базовая строка-контейнер высотой h
function Tab:_row(h)
    local f = mk("Frame",{
        LayoutOrder      = self:_lo(),
        Size             = UDim2.new(1,0,0,h),
        BackgroundColor3 = C.rowBg,
        BorderSizePixel  = 0,
    }, self._s)
    corner(6,f)
    local sk = addStroke(f, C.stroke, 1, 0)
    reg(f,  function(o) o.BackgroundColor3=C.rowBg end)
    reg(sk, function(o) o.Color=C.stroke end)
    f.MouseEnter:Connect(function()
        tw(f, 0.2, {BackgroundColor3=C.rowHov})
        tw(sk,0.2, {Color=C.accent, Transparency=0.6})
    end)
    f.MouseLeave:Connect(function()
        tw(f, 0.18,{BackgroundColor3=C.rowBg})
        tw(sk,0.18,{Color=C.stroke, Transparency=0})
    end)
    return f, sk
end

-- ── Toggle ──────────────────────────────────────

function Tab:Toggle(label, default, callback)
    local H = 34
    local f, _ = self:_row(H)
    local state = (default==true)

    -- маркер слева
    local marker = mk("Frame",{
        Size=UDim2.new(0,2,0,16), Position=UDim2.new(0,10,0,(H-16)/2),
        BackgroundColor3=state and C.on or C.off, BorderSizePixel=0,
    }, f)
    corner(1,marker)
    reg(marker, function(o) o.BackgroundColor3=state and C.on or C.off end)

    -- текст
    local lbl = mk("TextLabel",{
        Size=UDim2.new(1,-118,1,0), Position=UDim2.new(0,20,0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=12, Font=Enum.Font.GothamMedium,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, f)
    reg(lbl, function(o) o.TextColor3=C.text end)

    -- pill переключатель
    local PW,PH = 40,20
    local pill = mk("Frame",{
        Size=UDim2.new(0,PW,0,PH), Position=UDim2.new(1,-PW-10,0,(H-PH)/2),
        BackgroundColor3=state and C.onBg or C.offBg, BorderSizePixel=0,
    }, f)
    corner(PH/2,pill)
    local pillSk = addStroke(pill, state and C.on or C.off, 1, 0)
    reg(pill,   function(o) o.BackgroundColor3=state and C.onBg or C.offBg end)
    reg(pillSk, function(o) o.Color=state and C.on or C.off end)

    local KS = PH-6
    local knob = mk("Frame",{
        Size=UDim2.new(0,KS,0,KS),
        Position=state and UDim2.new(1,-KS-3,0,3) or UDim2.new(0,3,0,3),
        BackgroundColor3=state and C.on or C.off, BorderSizePixel=0, ZIndex=2,
    }, pill)
    corner(KS/2,knob)
    reg(knob, function(o) o.BackgroundColor3=state and C.on or C.off end)

    local function refresh(v)
        state=v
        local col = v and C.on or C.off
        marker.BackgroundColor3 = col
        tw(pill,   0.22, {BackgroundColor3=v and C.onBg or C.offBg})
        tw(pillSk, 0.22, {Color=col})
        tw(knob,   0.25, {
            BackgroundColor3=col,
            Position=v and UDim2.new(1,-KS-3,0,3) or UDim2.new(0,3,0,3),
        })
    end

    local hit = mk("TextButton",{
        Size=UDim2.new(1,0,1,0), BackgroundTransparency=1, Text="", ZIndex=5,
    }, f)
    hit.MouseButton1Click:Connect(function()
        refresh(not state)
        if callback then callback(state) end
    end)

    return { Set=function(_,v) refresh(v) end, Get=function() return state end }
end

-- ── Button ──────────────────────────────────────

function Tab:Button(label, callback)
    local H = 34
    local btn = mk("TextButton",{
        LayoutOrder=self:_lo(), Size=UDim2.new(1,0,0,H),
        BackgroundColor3=C.rowBg, BorderSizePixel=0,
        Text="", AutoButtonColor=false,
    }, self._s)
    corner(6,btn)
    local sk = addStroke(btn, C.stroke, 1, 0)
    reg(btn, function(o) o.BackgroundColor3=C.rowBg end)
    reg(sk,  function(o) o.Color=C.stroke end)

    -- акцент-черта
    local bar = mk("Frame",{
        Size=UDim2.new(0,2,0,16), Position=UDim2.new(0,10,0,(H-16)/2),
        BackgroundColor3=C.accent, BorderSizePixel=0,
    }, btn)
    corner(1,bar)
    reg(bar, function(o) o.BackgroundColor3=C.accent end)

    local lbl = mk("TextLabel",{
        Size=UDim2.new(1,-36,1,0), Position=UDim2.new(0,20,0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=12, Font=Enum.Font.GothamMedium,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, btn)
    reg(lbl, function(o) o.TextColor3=C.text end)

    local arr = mk("TextLabel",{
        Size=UDim2.new(0,18,1,0), Position=UDim2.new(1,-20,0,0),
        BackgroundTransparency=1, Text="›",
        TextColor3=C.accent, TextSize=18, Font=Enum.Font.GothamBold,
    }, btn)
    reg(arr, function(o) o.TextColor3=C.accent end)

    btn.MouseEnter:Connect(function()
        tw(btn,0.18,{BackgroundColor3=C.rowHov})
        tw(sk, 0.18,{Color=C.accent, Transparency=0.6})
    end)
    btn.MouseLeave:Connect(function()
        tw(btn,0.16,{BackgroundColor3=C.rowBg})
        tw(sk, 0.16,{Color=C.stroke, Transparency=0})
    end)
    btn.MouseButton1Click:Connect(function()
        tw(btn,0.07,{BackgroundColor3=C.accent})
        task.delay(0.09,function() tw(btn,0.16,{BackgroundColor3=C.rowBg}) end)
        if callback then callback() end
    end)
end

-- ── Slider ──────────────────────────────────────

function Tab:Slider(label, mn, mx, default, callback)
    local H = 50
    local f = mk("Frame",{
        LayoutOrder=self:_lo(), Size=UDim2.new(1,0,0,H),
        BackgroundColor3=C.rowBg, BorderSizePixel=0,
    }, self._s)
    corner(6,f)
    local sk = addStroke(f, C.stroke, 1, 0)
    reg(f,  function(o) o.BackgroundColor3=C.rowBg end)
    reg(sk, function(o) o.Color=C.stroke end)

    local lbl = mk("TextLabel",{
        Size=UDim2.new(1,-70,0,16), Position=UDim2.new(0,12,0,8),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.dim, TextSize=11, Font=Enum.Font.Gotham,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, f)
    reg(lbl, function(o) o.TextColor3=C.dim end)

    local valLbl = mk("TextLabel",{
        Size=UDim2.new(0,52,0,16), Position=UDim2.new(1,-60,0,8),
        BackgroundTransparency=1, Text=tostring(default),
        TextColor3=C.accent, TextSize=11, Font=Enum.Font.GothamBold,
        TextXAlignment=Enum.TextXAlignment.Right,
    }, f)
    reg(valLbl, function(o) o.TextColor3=C.accent end)

    -- трек
    local TH = 4
    local track = mk("Frame",{
        Size=UDim2.new(1,-24,0,TH), Position=UDim2.new(0,12,0,34),
        BackgroundColor3=C.inputBg, BorderSizePixel=0,
    }, f)
    corner(TH/2,track)
    addStroke(track, C.inputBord, 1, 0.3)
    reg(track, function(o) o.BackgroundColor3=C.inputBg end)

    local p0   = math.clamp((default-mn)/(mx-mn),0,1)
    local fill = mk("Frame",{
        Size=UDim2.new(p0,0,1,0), BackgroundColor3=C.accent, BorderSizePixel=0,
    }, track)
    corner(TH/2,fill)
    reg(fill, function(o) o.BackgroundColor3=C.accent end)

    local KS=12
    local knob = mk("Frame",{
        Size=UDim2.new(0,KS,0,KS), Position=UDim2.new(p0,-KS/2,0.5,-KS/2),
        BackgroundColor3=C.text, BorderSizePixel=0, ZIndex=3,
    }, track)
    corner(KS/2,knob)
    reg(knob, function(o) o.BackgroundColor3=C.text end)

    local cur=default; local drag=false
    local function upd(mx2)
        local ap=track.AbsolutePosition; local as=track.AbsoluteSize
        local p=math.clamp((mx2-ap.X)/as.X,0,1)
        cur=math.floor(mn+p*(mx-mn))
        fill.Size=UDim2.new(p,0,1,0)
        knob.Position=UDim2.new(p,-KS/2,0.5,-KS/2)
        valLbl.Text=tostring(cur)
        if callback then callback(cur) end
    end
    local hitBtn = mk("TextButton",{
        Size=UDim2.new(1,0,0,24), Position=UDim2.new(0,0,0,-10),
        BackgroundTransparency=1, Text="", ZIndex=5,
    }, track)
    hitBtn.MouseButton1Down:Connect(function(x) drag=true; upd(x) end)
    UIS.InputChanged:Connect(function(i)
        if drag and i.UserInputType==Enum.UserInputType.MouseMovement then upd(i.Position.X) end
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then drag=false end
    end)

    return {
        Get=function() return cur end,
        Set=function(_,v)
            local p=math.clamp((v-mn)/(mx-mn),0,1)
            cur=math.floor(v); fill.Size=UDim2.new(p,0,1,0)
            knob.Position=UDim2.new(p,-KS/2,0.5,-KS/2); valLbl.Text=tostring(cur)
        end,
    }
end

-- ── TextBox ─────────────────────────────────────

function Tab:TextBox(label, placeholder, callback)
    local H=34
    local f,_ = self:_row(H)

    mk("TextLabel",{
        Size=UDim2.new(0.48,-8,1,0), Position=UDim2.new(0,20,0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=12, Font=Enum.Font.GothamMedium,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, f)

    local BW=108
    local boxBg = mk("Frame",{
        Size=UDim2.new(0,BW,0,22), Position=UDim2.new(1,-BW-10,0,(H-22)/2),
        BackgroundColor3=C.inputBg, BorderSizePixel=0,
    }, f)
    corner(5,boxBg)
    local bsk = addStroke(boxBg, C.inputBord, 1, 0)
    reg(boxBg, function(o) o.BackgroundColor3=C.inputBg end)
    reg(bsk,   function(o) o.Color=C.inputBord end)

    local box = mk("TextBox",{
        Size=UDim2.new(1,-10,1,0), Position=UDim2.new(0,5,0,0),
        BackgroundTransparency=1,
        PlaceholderText=placeholder or "", PlaceholderColor3=C.dim,
        Text="", TextColor3=C.text, TextSize=11, Font=Enum.Font.Gotham,
        ClearTextOnFocus=false,
    }, boxBg)
    reg(box, function(o) o.PlaceholderColor3=C.dim; o.TextColor3=C.text end)
    box.Focused:Connect(function()   tw(bsk,0.18,{Color=C.accent}) end)
    box.FocusLost:Connect(function()
        tw(bsk,0.18,{Color=C.inputBord})
        if callback then callback(box.Text) end
    end)
    return { Get=function() return box.Text end, Set=function(_,v) box.Text=v end }
end

-- ── Dropdown ────────────────────────────────────

function Tab:Dropdown(label, options, default, callback)
    local H=34; local ITEM_H=24; local BW=108
    local f = mk("Frame",{
        LayoutOrder=self:_lo(), Size=UDim2.new(1,0,0,H),
        BackgroundColor3=C.rowBg, BorderSizePixel=0,
        ClipsDescendants=false, ZIndex=5,
    }, self._s)
    corner(6,f)
    local sk = addStroke(f, C.stroke, 1, 0)
    reg(f,  function(o) o.BackgroundColor3=C.rowBg end)
    reg(sk, function(o) o.Color=C.stroke end)

    mk("TextLabel",{
        Size=UDim2.new(0.5,-10,1,0), Position=UDim2.new(0,20,0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=12, Font=Enum.Font.GothamMedium,
        TextXAlignment=Enum.TextXAlignment.Left, ZIndex=5,
    }, f)

    local sel=default or options[1] or ""; local open=false

    local selBtn = mk("TextButton",{
        Size=UDim2.new(0,BW,0,22), Position=UDim2.new(1,-BW-10,0,(H-22)/2),
        BackgroundColor3=C.inputBg, BorderSizePixel=0,
        Text=sel.." ▾", TextColor3=C.text,
        TextSize=11, Font=Enum.Font.Gotham,
        AutoButtonColor=false, ZIndex=5,
    }, f)
    corner(5,selBtn)
    addStroke(selBtn, C.inputBord, 1, 0)
    reg(selBtn, function(o) o.BackgroundColor3=C.inputBg; o.TextColor3=C.text end)

    local drop = mk("Frame",{
        Size=UDim2.new(0,BW,0,#options*ITEM_H),
        Position=UDim2.new(1,-BW-10,1,3),
        BackgroundColor3=C.inputBg, BorderSizePixel=0,
        Visible=false, ZIndex=20, ClipsDescendants=true,
    }, f)
    corner(6,drop)
    addStroke(drop, C.stroke, 1, 0)
    mk("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)},drop)
    reg(drop, function(o) o.BackgroundColor3=C.inputBg end)

    for i,opt in ipairs(options) do
        local ob = mk("TextButton",{
            LayoutOrder=i, Size=UDim2.new(1,0,0,ITEM_H),
            BackgroundColor3=C.inputBg, BorderSizePixel=0,
            Text=opt, TextColor3=C.dim,
            TextSize=11, Font=Enum.Font.Gotham,
            AutoButtonColor=false, ZIndex=20,
        }, drop)
        local sp = mk("Frame",{
            Size=UDim2.new(1,-10,0,1), Position=UDim2.new(0,5,1,-1),
            BackgroundColor3=C.sep, BorderSizePixel=0, ZIndex=21,
        }, ob)
        reg(ob, function(o) o.BackgroundColor3=C.inputBg; o.TextColor3=C.dim end)
        reg(sp, function(o) o.BackgroundColor3=C.sep end)
        ob.MouseEnter:Connect(function() tw(ob,0.15,{BackgroundColor3=C.rowHov,TextColor3=C.text}) end)
        ob.MouseLeave:Connect(function() tw(ob,0.15,{BackgroundColor3=C.inputBg,TextColor3=C.dim}) end)
        ob.MouseButton1Click:Connect(function()
            sel=opt; selBtn.Text=opt.." ▾"
            drop.Visible=false; open=false
            if callback then callback(sel) end
        end)
    end

    selBtn.MouseButton1Click:Connect(function() open=not open; drop.Visible=open end)
    UIS.InputBegan:Connect(function(i)
        if open and i.UserInputType==Enum.UserInputType.MouseButton1 then
            task.wait(); drop.Visible=false; open=false
        end
    end)

    return { Get=function() return sel end, Set=function(_,v) sel=v; selBtn.Text=v.." ▾" end }
end

-- ── Label ───────────────────────────────────────

function Tab:Label(text)
    local H=20
    local f = mk("Frame",{
        LayoutOrder=self:_lo(), Size=UDim2.new(1,0,0,H),
        BackgroundColor3=C.catBg, BorderSizePixel=0,
    }, self._s)
    local bar = mk("Frame",{
        Size=UDim2.new(0,2,0,10), Position=UDim2.new(0,10,0,(H-10)/2),
        BackgroundColor3=C.accent, BorderSizePixel=0,
    }, f)
    corner(1,bar)
    mk("TextLabel",{
        Size=UDim2.new(1,-24,1,0), Position=UDim2.new(0,18,0,0),
        BackgroundTransparency=1, Text=string.upper(text),
        TextColor3=C.catText, TextSize=10, Font=Enum.Font.GothamBold,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, f)
    reg(f,   function(o) o.BackgroundColor3=C.catBg end)
    reg(bar, function(o) o.BackgroundColor3=C.accent end)
end

-- ── Separator ───────────────────────────────────

function Tab:Separator()
    local f = mk("Frame",{
        LayoutOrder=self:_lo(), Size=UDim2.new(1,0,0,8),
        BackgroundTransparency=1, BorderSizePixel=0,
    }, self._s)
    local s = mk("Frame",{
        Size=UDim2.new(1,-16,0,1), Position=UDim2.new(0,8,0.5,0),
        BackgroundColor3=C.sep, BorderSizePixel=0,
    }, f)
    reg(s, function(o) o.BackgroundColor3=C.sep end)
end

-- ════════════════════════
--  PLAYER LIST
-- ════════════════════════

--[[
Tab:PlayerList(options)
options = {
  showTeleport = true,
  showSpectate = true,
  showFling    = false,
  showAvatars  = true,
  onTeleport   = function(player) end,
  onSpectate   = function(player) end,
  onFling      = function(player) end,
}
]]

function Tab:PlayerList(options)
    options = options or {}
    local showTP = options.showTeleport ~= false
    local showSP = options.showSpectate ~= false
    local showFL = options.showFling    == true
    local showAV = options.showAvatars  ~= false

    self:Label("Players")

    -- габариты кнопок
    local BW=34; local BH=18; local BG=3
    local numBtns = (showTP and 1 or 0)+(showSP and 1 or 0)+(showFL and 1 or 0)
    -- общая ширина блока кнопок
    local totalBW = numBtns*BW + math.max(0,numBtns-1)*BG

    local container = mk("Frame",{
        LayoutOrder=self:_lo(),
        Size=UDim2.new(1,0,0,0), AutomaticSize=Enum.AutomaticSize.Y,
        BackgroundTransparency=1, BorderSizePixel=0,
    }, self._s)
    mk("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3)},container)

    local rows={}; local spectating=nil

    -- ── действия ──────────────────────────────

    local function doTP(p)
        if options.onTeleport then options.onTeleport(p); return end
        local c=lp.Character; local t=p.Character
        if c and t then
            local hr=c:FindFirstChild("HumanoidRootPart")
            local tr=t:FindFirstChild("HumanoidRootPart")
            if hr and tr then hr.CFrame=tr.CFrame+Vector3.new(0,3,0) end
        end
    end

    local function doSpy(p)
        if options.onSpectate then options.onSpectate(p); return end
        local cam=workspace.CurrentCamera
        if spectating==p then
            cam.CameraSubject=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
            cam.CameraType=Enum.CameraType.Custom; spectating=nil
        else
            local ch=p.Character
            if ch then
                local h=ch:FindFirstChildOfClass("Humanoid")
                if h then cam.CameraSubject=h; cam.CameraType=Enum.CameraType.Follow; spectating=p end
            end
        end
    end

    local function doFling(p)
        if options.onFling then options.onFling(p); return end
        local ch=p.Character
        if ch then
            local hr=ch:FindFirstChild("HumanoidRootPart")
            if hr then
                local bv=Instance.new("BodyVelocity")
                bv.Velocity=Vector3.new(math.random(-160,160),math.random(200,360),math.random(-160,160))
                bv.MaxForce=Vector3.new(1e9,1e9,1e9); bv.P=1e9; bv.Parent=hr
                game:GetService("Debris"):AddItem(bv,0.15)
            end
        end
    end

    -- ── мини-кнопка ───────────────────────────

    local function mkBtn(parent, label, bgCol, rightX, cb)
        -- rightX = отступ правого края кнопки от правого края строки
        local b = mk("TextButton",{
            Size=UDim2.new(0,BW,0,BH),
            Position=UDim2.new(1,-rightX,0.5,-BH/2),
            BackgroundColor3=bgCol, BorderSizePixel=0,
            Text=label, TextColor3=Color3.fromRGB(255,255,255),
            TextSize=9, Font=Enum.Font.GothamBold,
            AutoButtonColor=false, ZIndex=3,
        }, parent)
        corner(4,b)
        reg(b, function(o) o.BackgroundColor3=bgCol end)
        b.MouseEnter:Connect(function() tw(b,0.12,{BackgroundTransparency=0.35}) end)
        b.MouseLeave:Connect(function() tw(b,0.12,{BackgroundTransparency=0})    end)
        b.MouseButton1Click:Connect(function() if cb then cb() end end)
        return b
    end

    -- ── строка игрока ─────────────────────────

    local function buildRow(player)
        if player==lp then return end
        if rows[player.Name] then return end

        local ROW_H=42; local AV=28

        local row = mk("Frame",{
            LayoutOrder=1, Size=UDim2.new(1,0,0,ROW_H),
            BackgroundColor3=C.rowBg, BorderSizePixel=0,
        }, container)
        corner(7,row)
        local rsk = addStroke(row, C.stroke, 1, 0)
        reg(row, function(o) o.BackgroundColor3=C.rowBg end)
        reg(rsk, function(o) o.Color=C.stroke end)
        row.MouseEnter:Connect(function() tw(row,0.18,{BackgroundColor3=C.rowHov}) end)
        row.MouseLeave:Connect(function() tw(row,0.16,{BackgroundColor3=C.rowBg})  end)

        local xL=10 -- текущий X левого курсора

        -- аватарка
        if showAV then
            local av = mk("ImageLabel",{
                Size=UDim2.new(0,AV,0,AV), Position=UDim2.new(0,xL,0,(ROW_H-AV)/2),
                BackgroundColor3=C.inputBg, BorderSizePixel=0,
                Image="https://www.roblox.com/headshot-thumbnail/image?userId="
                      ..player.UserId.."&width=100&height=100&format=png",
                ZIndex=2,
            }, row)
            corner(AV/2,av)
            addStroke(av, C.stroke, 1, 0)
            xL = xL+AV+8
        end

        -- онлайн-точка (поверх правого нижнего угла аватарки)
        local DS=7
        local dX = showAV and (10+AV-DS/2-1) or 10
        local dY = (ROW_H-AV)/2 + AV - DS/2 - 1
        if not showAV then dY=(ROW_H-DS)/2 end
        local onDot = mk("Frame",{
            Size=UDim2.new(0,DS,0,DS), Position=UDim2.new(0,dX,0,dY),
            BackgroundColor3=C.on, BorderSizePixel=0, ZIndex=3,
        }, row)
        corner(DS/2,onDot)
        -- обводка совпадает с фоном строки (чтоб был «отступ» вокруг точки)
        local dotSk = addStroke(onDot, C.rowBg, 1.5, 0)
        reg(onDot,  function(o) o.BackgroundColor3=C.on end)
        reg(dotSk,  function(o) o.Color=C.rowBg end)

        -- тексты
        -- доступная ширина для имени = вся ширина − xL − блок кнопок − правый отступ 10
        local nameW = UDim2.new(1, -(xL + totalBW + 18), 0, 14)
        local nameY = (ROW_H/2) - 15

        local nameLbl = mk("TextLabel",{
            Size=nameW, Position=UDim2.new(0,xL,0,nameY),
            BackgroundTransparency=1, Text=player.DisplayName,
            TextColor3=C.text, TextSize=12, Font=Enum.Font.GothamBold,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd, ZIndex=2,
        }, row)
        reg(nameLbl, function(o) o.TextColor3=C.text end)

        local subLbl = mk("TextLabel",{
            Size=nameW, Position=UDim2.new(0,xL,0,nameY+15),
            BackgroundTransparency=1, Text="@"..player.Name,
            TextColor3=C.dim, TextSize=10, Font=Enum.Font.Gotham,
            TextXAlignment=Enum.TextXAlignment.Left,
            TextTruncate=Enum.TextTruncate.AtEnd, ZIndex=2,
        }, row)
        reg(subLbl, function(o) o.TextColor3=C.dim end)

        -- кнопки: TP — самая правая (отступ 8+BW), дальше SPY, дальше FLG
        local rX = BW+8  -- правый край первой кнопки
        if showTP then
            mkBtn(row,"TP", C.btnTP,  rX, function() doTP(player)   end)
            rX = rX+BW+BG
        end
        if showSP then
            mkBtn(row,"SPY",C.btnSpy, rX, function() doSpy(player)  end)
            rX = rX+BW+BG
        end
        if showFL then
            mkBtn(row,"FLG",C.btnFling,rX,function() doFling(player) end)
        end

        rows[player.Name]=row
    end

    local function removeRow(player)
        if spectating==player then
            local cam=workspace.CurrentCamera
            cam.CameraSubject=lp.Character and lp.Character:FindFirstChildOfClass("Humanoid")
            cam.CameraType=Enum.CameraType.Custom; spectating=nil
        end
        local r=rows[player.Name]
        if r then r:Destroy(); rows[player.Name]=nil end
    end

    for _,p in ipairs(Players:GetPlayers()) do buildRow(p) end
    Players.PlayerAdded:Connect(function(p) buildRow(p) end)
    Players.PlayerRemoving:Connect(function(p) removeRow(p) end)

    -- Refresh
    local refF = mk("Frame",{
        LayoutOrder=self:_lo(), Size=UDim2.new(1,0,0,26),
        BackgroundColor3=C.catBg, BorderSizePixel=0,
    }, self._s)
    reg(refF, function(o) o.BackgroundColor3=C.catBg end)

    local refBtn = mk("TextButton",{
        Size=UDim2.new(1,-16,0,18), Position=UDim2.new(0,8,0,4),
        BackgroundColor3=C.rowBg, BorderSizePixel=0,
        Text="↺  Refresh list",
        TextColor3=C.dim, TextSize=10, Font=Enum.Font.GothamBold,
        AutoButtonColor=false,
    }, refF)
    corner(5,refBtn)
    addStroke(refBtn, C.stroke, 1, 0.3)
    reg(refBtn, function(o) o.BackgroundColor3=C.rowBg; o.TextColor3=C.dim end)
    refBtn.MouseEnter:Connect(function() tw(refBtn,0.15,{BackgroundColor3=C.rowHov,TextColor3=C.text}) end)
    refBtn.MouseLeave:Connect(function() tw(refBtn,0.15,{BackgroundColor3=C.rowBg, TextColor3=C.dim})  end)
    refBtn.MouseButton1Click:Connect(function()
        for name,r in pairs(rows) do
            if not Players:FindFirstChild(name) then r:Destroy(); rows[name]=nil end
        end
        for _,p in ipairs(Players:GetPlayers()) do buildRow(p) end
    end)
end

-- ════════════════════════
--  WINDOW
-- ════════════════════════

local Window={}; Window.__index=Window

function FlatLib.Window(title, subtitle)
    local self=setmetatable({_tabs={},_tabList={},_active=nil,_visible=true},Window)

    self._sg = mk("ScreenGui",{
        Name="FlatLib_"..title, ResetOnSpawn=false,
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    }, pg)

    local WIN_W=272; local HDR_H=50; local TAB_H=28; local WIN_H=360

    -- главный фрейм
    local win = mk("Frame",{
        Size=UDim2.new(0,WIN_W,0,WIN_H), Position=UDim2.new(0,10,0,10),
        BackgroundColor3=C.winBg, BorderSizePixel=0,
        Active=true, Draggable=true, ClipsDescendants=false,
    }, self._sg)
    self._win=win
    corner(10,win)
    local winSk = addStroke(win, C.stroke, 1, 0)
    reg(win,   function(o) o.BackgroundColor3=C.winBg end)
    reg(winSk, function(o) o.Color=C.stroke end)

    -- тень
    local sh = mk("Frame",{
        Size=UDim2.new(1,20,1,20), Position=UDim2.new(0,-10,0,8),
        BackgroundColor3=Color3.fromRGB(0,0,0), BackgroundTransparency=0.65,
        BorderSizePixel=0, ZIndex=0,
    }, win)
    corner(14,sh)

    mk("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)},win)

    -- ── шапка ──────────────────────────────────
    local HDR_H_CONST = HDR_H  -- фиксируем для замыкания
    local hdr = mk("Frame",{
        LayoutOrder=0, Size=UDim2.new(1,0,0,HDR_H_CONST),
        BackgroundColor3=C.hdrBg, BorderSizePixel=0,
    }, win)
    corner(10,hdr)
    -- «закрыть» нижние скругления шапки
    mk("Frame",{
        Size=UDim2.new(1,0,0,10), Position=UDim2.new(0,0,1,-10),
        BackgroundColor3=C.hdrBg, BorderSizePixel=0,
    }, hdr)
    reg(hdr, function(o) o.BackgroundColor3=C.hdrBg end)

    -- градиент шапки
    local hGrad = mk("UIGradient",{
        Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0,C.gradA),
            ColorSequenceKeypoint.new(1,C.gradB),
        }), Rotation=135,
    }, hdr)
    reg(hGrad, function(o)
        o.Color=ColorSequence.new({
            ColorSequenceKeypoint.new(0,C.gradA),
            ColorSequenceKeypoint.new(1,C.gradB),
        })
    end)

    -- иконка
    local IS=28
    local icon = mk("Frame",{
        Size=UDim2.new(0,IS,0,IS), Position=UDim2.new(0,11,0,(HDR_H_CONST-IS)/2),
        BackgroundColor3=Color3.fromRGB(255,255,255), BackgroundTransparency=0.85,
        BorderSizePixel=0,
    }, hdr)
    corner(7,icon)
    addStroke(icon, Color3.fromRGB(255,255,255), 1, 0.7)
    mk("TextLabel",{Size=UDim2.new(1,0,1,0),BackgroundTransparency=1,
        Text="◈",TextColor3=Color3.fromRGB(255,255,255),TextSize=14,Font=Enum.Font.GothamBold}, icon)

    -- заголовок
    local hasSubtitle = subtitle and subtitle~=""
    local titleY = hasSubtitle and (HDR_H_CONST/2-11) or (HDR_H_CONST/2-7)

    mk("TextLabel",{
        Size=UDim2.new(1,-IS-22,0,14), Position=UDim2.new(0,IS+18,0,titleY),
        BackgroundTransparency=1, Text=title,
        TextColor3=Color3.fromRGB(255,255,255), TextSize=13, Font=Enum.Font.GothamBold,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, hdr)

    if hasSubtitle then
        mk("TextLabel",{
            Size=UDim2.new(1,-IS-22,0,12), Position=UDim2.new(0,IS+18,0,titleY+16),
            BackgroundTransparency=1, Text=subtitle,
            TextColor3=Color3.fromRGB(255,255,255), TextTransparency=0.45,
            TextSize=10, Font=Enum.Font.Gotham,
            TextXAlignment=Enum.TextXAlignment.Left,
        }, hdr)
    end

    -- разделитель шапка/таб-бар
    local div1 = mk("Frame",{LayoutOrder=1,Size=UDim2.new(1,0,0,1),
        BackgroundColor3=C.stroke,BorderSizePixel=0},win)
    reg(div1, function(o) o.BackgroundColor3=C.stroke end)

    -- ── таб-бар ────────────────────────────────
    self._tabBar = mk("Frame",{
        LayoutOrder=2, Size=UDim2.new(1,0,0,TAB_H),
        BackgroundColor3=C.tabBg, BorderSizePixel=0, ClipsDescendants=true,
    }, win)
    reg(self._tabBar, function(o) o.BackgroundColor3=C.tabBg; o.Size=UDim2.new(1,0,0,TAB_H) end)
    mk("UIListLayout",{FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)}, self._tabBar)

    local div2 = mk("Frame",{LayoutOrder=3,Size=UDim2.new(1,0,0,1),
        BackgroundColor3=C.stroke,BorderSizePixel=0},win)
    reg(div2, function(o) o.BackgroundColor3=C.stroke end)

    -- ── контент ────────────────────────────────
    local contentH = WIN_H - HDR_H_CONST - 1 - TAB_H - 1
    self._content = mk("Frame",{
        LayoutOrder=4, Size=UDim2.new(1,0,0,contentH),
        BackgroundColor3=C.winBg, BorderSizePixel=0, ClipsDescendants=true,
    }, win)
    corner(10, self._content)
    reg(self._content, function(o) o.BackgroundColor3=C.winBg end)

    -- ── ресайз ─────────────────────────────────
    local rsh = mk("TextButton",{
        Size=UDim2.new(0,14,0,14), Position=UDim2.new(1,-14,1,-14),
        BackgroundColor3=C.stroke, BackgroundTransparency=0.3, BorderSizePixel=0,
        Text="◢", TextColor3=C.dim, TextSize=9, Font=Enum.Font.GothamBold,
        AutoButtonColor=false, ZIndex=10,
    }, win)
    corner(3,rsh)
    reg(rsh, function(o) o.BackgroundColor3=C.stroke; o.TextColor3=C.dim end)

    local rsDown=false; local rsSt,rsSz
    rsh.MouseButton1Down:Connect(function(x,y)
        rsDown=true; win.Draggable=false
        rsSt=Vector2.new(x,y); rsSz=Vector2.new(win.AbsoluteSize.X,win.AbsoluteSize.Y)
    end)
    UIS.InputChanged:Connect(function(i)
        if not rsDown then return end
        if i.UserInputType~=Enum.UserInputType.MouseMovement then return end
        local d=Vector2.new(i.Position.X,i.Position.Y)-rsSt
        win.Size=UDim2.new(0,math.max(200,rsSz.X+d.X),0,math.max(150,rsSz.Y+d.Y))
    end)
    UIS.InputEnded:Connect(function(i)
        if i.UserInputType==Enum.UserInputType.MouseButton1 then rsDown=false; win.Draggable=true end
    end)

    return self
end

function Window:Tab(name)
    local idx=#self._tabList+1

    local btn = mk("TextButton",{
        LayoutOrder=idx, Size=UDim2.new(1/math.max(1,idx),0,1,0),
        BackgroundColor3=C.tabOff, BorderSizePixel=0,
        Text=name, TextColor3=C.dim,
        TextSize=10, Font=Enum.Font.GothamBold,
        AutoButtonColor=false,
    }, self._tabBar)

    -- акцент-линия снизу
    local line = mk("Frame",{
        Size=UDim2.new(0.5,0,0,2), Position=UDim2.new(0.25,0,1,-2),
        BackgroundColor3=C.accent, BackgroundTransparency=1, BorderSizePixel=0,
    }, btn)
    reg(line, function(o) o.BackgroundColor3=C.accent end)

    -- скролл
    local scroll = mk("ScrollingFrame",{
        Size=UDim2.new(1,0,1,0), BackgroundTransparency=1, BorderSizePixel=0,
        ScrollBarThickness=3, ScrollBarImageColor3=C.scrollCol,
        CanvasSize=UDim2.new(0,0,0,0), AutomaticCanvasSize=Enum.AutomaticSize.Y,
        Visible=false,
    }, self._content)
    padding(6,6,6,6,scroll)
    mk("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,3)},scroll)
    reg(scroll, function(o) o.ScrollBarImageColor3=C.scrollCol end)

    self._tabs[name]={btn=btn,line=line,scroll=scroll}
    self._tabList[idx]=name

    local total=#self._tabList
    for i,n in ipairs(self._tabList) do
        local d=self._tabs[n]
        d.btn.Size=UDim2.new(1/total,0,1,0)
        d.btn.LayoutOrder=i
        local cn=n; local cs=self
        reg(d.btn, function(o)
            local on=(cn==cs._active)
            o.BackgroundColor3=on and C.tabOn or C.tabOff
            o.TextColor3=on and C.text or C.dim
            o.TextSize=10
            o.Size=UDim2.new(1/#cs._tabList,0,1,0)
        end)
        reg(d.line, function(o) o.BackgroundColor3=C.accent end)
    end

    btn.MouseButton1Click:Connect(function() self:_activate(name) end)
    if idx==1 then self:_activate(name) end

    return Tab._new(scroll)
end

function Window:_activate(name)
    self._active=name
    for n,d in pairs(self._tabs) do
        local on=(n==name)
        d.scroll.Visible=on
        tw(d.btn, 0.18,{BackgroundColor3=on and C.tabOn or C.tabOff,
                        TextColor3=on and C.text or C.dim})
        tw(d.line,0.18,{BackgroundTransparency=on and 0 or 1})
    end
end

function Window:Show()   self._win.Visible=true;  self._visible=true  end
function Window:Hide()   self._win.Visible=false; self._visible=false end
function Window:Toggle() if self._visible then self:Hide() else self:Show() end end
function Window:Destroy()
    for i=#REG,1,-1 do
        local e=REG[i]
        if not e.i or not e.i.Parent then table.remove(REG,i) end
    end
    self._sg:Destroy()
end

return FlatLib
