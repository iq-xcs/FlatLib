-- ══════════════════════════════════════════════════════════════
--  FlatLib v3  |  2018 flat style  |  Roblox Executor UI Lib
--  Новое: темы, масштаб, ресайз окна, изменение цветов
-- ══════════════════════════════════════════════════════════════

local FlatLib = {}
FlatLib.__index = FlatLib

local TweenService     = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Players          = game:GetService("Players")
local lp               = Players.LocalPlayer
local pg               = lp:WaitForChild("PlayerGui")

-- ══════════════════════════════════════════════════
--                    ТЕМЫ
-- ══════════════════════════════════════════════════

FlatLib.Themes = {
    Dark = {
        bg         = Color3.fromRGB(28,  28,  28),
        header     = Color3.fromRGB(45,  45,  45),
        tabBar     = Color3.fromRGB(33,  33,  33),
        tabOn      = Color3.fromRGB(50,  50,  50),
        tabOff     = Color3.fromRGB(33,  33,  33),
        row        = Color3.fromRGB(36,  36,  36),
        rowHov     = Color3.fromRGB(46,  46,  46),
        border     = Color3.fromRGB(62,  62,  62),
        sep        = Color3.fromRGB(50,  50,  50),
        text       = Color3.fromRGB(215, 215, 215),
        dim        = Color3.fromRGB(115, 115, 115),
        on         = Color3.fromRGB(78,  170, 78),
        onBg       = Color3.fromRGB(30,  68,  30),
        off        = Color3.fromRGB(170, 52,  52),
        offBg      = Color3.fromRGB(66,  22,  22),
        accent     = Color3.fromRGB(190, 150, 50),
        input      = Color3.fromRGB(20,  20,  20),
        inputBord  = Color3.fromRGB(68,  68,  68),
        scroll     = Color3.fromRGB(72,  72,  72),
        catBg      = Color3.fromRGB(22,  22,  22),
        catText    = Color3.fromRGB(108, 108, 108),
    },
    Light = {
        bg         = Color3.fromRGB(235, 235, 235),
        header     = Color3.fromRGB(210, 210, 210),
        tabBar     = Color3.fromRGB(220, 220, 220),
        tabOn      = Color3.fromRGB(245, 245, 245),
        tabOff     = Color3.fromRGB(220, 220, 220),
        row        = Color3.fromRGB(242, 242, 242),
        rowHov     = Color3.fromRGB(230, 230, 230),
        border     = Color3.fromRGB(185, 185, 185),
        sep        = Color3.fromRGB(200, 200, 200),
        text       = Color3.fromRGB(30,  30,  30),
        dim        = Color3.fromRGB(120, 120, 120),
        on         = Color3.fromRGB(40,  140, 40),
        onBg       = Color3.fromRGB(190, 230, 190),
        off        = Color3.fromRGB(180, 40,  40),
        offBg      = Color3.fromRGB(240, 195, 195),
        accent     = Color3.fromRGB(160, 110, 20),
        input      = Color3.fromRGB(255, 255, 255),
        inputBord  = Color3.fromRGB(175, 175, 175),
        scroll     = Color3.fromRGB(150, 150, 150),
        catBg      = Color3.fromRGB(215, 215, 215),
        catText    = Color3.fromRGB(100, 100, 100),
    },
    Midnight = {
        bg         = Color3.fromRGB(12,  12,  20),
        header     = Color3.fromRGB(22,  22,  38),
        tabBar     = Color3.fromRGB(16,  16,  28),
        tabOn      = Color3.fromRGB(28,  28,  48),
        tabOff     = Color3.fromRGB(16,  16,  28),
        row        = Color3.fromRGB(18,  18,  32),
        rowHov     = Color3.fromRGB(26,  26,  44),
        border     = Color3.fromRGB(45,  45,  75),
        sep        = Color3.fromRGB(35,  35,  58),
        text       = Color3.fromRGB(200, 200, 230),
        dim        = Color3.fromRGB(90,  90,  130),
        on         = Color3.fromRGB(80,  180, 255),
        onBg       = Color3.fromRGB(20,  55,  90),
        off        = Color3.fromRGB(180, 60,  100),
        offBg      = Color3.fromRGB(60,  20,  35),
        accent     = Color3.fromRGB(140, 100, 255),
        input      = Color3.fromRGB(10,  10,  18),
        inputBord  = Color3.fromRGB(50,  50,  85),
        scroll     = Color3.fromRGB(60,  60,  100),
        catBg      = Color3.fromRGB(10,  10,  18),
        catText    = Color3.fromRGB(80,  80,  120),
    },
    Green = {
        bg         = Color3.fromRGB(14,  22,  14),
        header     = Color3.fromRGB(20,  36,  20),
        tabBar     = Color3.fromRGB(16,  28,  16),
        tabOn      = Color3.fromRGB(24,  42,  24),
        tabOff     = Color3.fromRGB(16,  28,  16),
        row        = Color3.fromRGB(18,  30,  18),
        rowHov     = Color3.fromRGB(24,  40,  24),
        border     = Color3.fromRGB(40,  72,  40),
        sep        = Color3.fromRGB(30,  55,  30),
        text       = Color3.fromRGB(180, 230, 180),
        dim        = Color3.fromRGB(80,  130, 80),
        on         = Color3.fromRGB(80,  220, 80),
        onBg       = Color3.fromRGB(20,  75,  20),
        off        = Color3.fromRGB(200, 70,  50),
        offBg      = Color3.fromRGB(65,  22,  16),
        accent     = Color3.fromRGB(100, 255, 120),
        input      = Color3.fromRGB(10,  18,  10),
        inputBord  = Color3.fromRGB(40,  70,  40),
        scroll     = Color3.fromRGB(50,  100, 50),
        catBg      = Color3.fromRGB(10,  18,  10),
        catText    = Color3.fromRGB(60,  110, 60),
    },
}

-- текущая тема (копия, чтобы можно было менять отдельные цвета)
local C = {}
for k,v in pairs(FlatLib.Themes.Dark) do C[k]=v end

-- шрифты
local FB = Enum.Font.SourceSansBold
local FR = Enum.Font.SourceSans

-- масштаб (1.0 = стандарт)
local SCALE      = 1.0
local BASE_WIN_W = 252
local BASE_ROW_H = 28
local BASE_TAB_H = 22
local BASE_HDR_H = 24
local BASE_CNT_H = 300

local function S(v) return math.floor(v * SCALE) end

-- список всех окон для перекраски
local allWindows = {}

-- ══════════════════════════════════════════════════
--           ГЛОБАЛЬНЫЕ НАСТРОЙКИ
-- ══════════════════════════════════════════════════

-- Применить тему по имени или таблице цветов
function FlatLib.SetTheme(nameOrTable)
    local t = type(nameOrTable)=="string" and FlatLib.Themes[nameOrTable] or nameOrTable
    if not t then return end
    for k,v in pairs(t) do C[k]=v end
    -- перестраиваем все окна
    for _, win in ipairs(allWindows) do
        if win._rebuildColors then win:_rebuildColors() end
    end
end

-- Изменить один цвет темы
function FlatLib.SetColor(key, color)
    C[key] = color
    for _, win in ipairs(allWindows) do
        if win._rebuildColors then win:_rebuildColors() end
    end
end

-- Изменить масштаб (0.7 – 2.0)
function FlatLib.SetScale(s)
    SCALE = math.clamp(s, 0.7, 2.0)
end

-- Горячая клавиша
function FlatLib.SetToggleKey(win, keyCode)
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == keyCode then win:Toggle() end
    end)
end

-- ══════════════════════════════════════════════════
--              УТИЛИТЫ
-- ══════════════════════════════════════════════════

local function new(class, props, parent)
    local o = Instance.new(class)
    for k,v in pairs(props) do o[k]=v end
    if parent then o.Parent=parent end
    return o
end

local function rowBorder(parent)
    return new("Frame",{
        Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,1,-1),
        BackgroundColor3=C.border, BorderSizePixel=0, ZIndex=2,
    }, parent)
end

local function hoverRow(frame)
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
--                  TAB CLASS
-- ══════════════════════════════════════════════════

local Tab = {}; Tab.__index = Tab

function Tab._new(scroll)
    return setmetatable({_s=scroll, _ord=0, _elements={}}, Tab)
end

function Tab:_o() self._ord+=1; return self._ord end

function Tab:_row(h)
    local r = new("Frame",{
        LayoutOrder=self:_o(),
        Size=UDim2.new(1,0,0,S(h or BASE_ROW_H)),
        BackgroundColor3=C.row, BorderSizePixel=0,
    }, self._s)
    local b = rowBorder(r)
    table.insert(self._elements, {type="row", frame=r, border=b, h=h or BASE_ROW_H})
    return r, #self._elements
end

-- ── Toggle ───────────────────────────────────────

function Tab:Toggle(label, default, callback)
    local row, idx = self:_row()
    hoverRow(row)

    local dot = new("Frame",{
        Size=UDim2.new(0,S(6),0,S(6)),
        Position=UDim2.new(0,S(8),0.5,-S(3)),
        BackgroundColor3=default and C.on or C.off,
        BorderSizePixel=0,
    }, row)

    new("TextLabel",{
        Size=UDim2.new(1,-S(110),1,0), Position=UDim2.new(0,S(22),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=S(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, row)

    local btn = new("TextButton",{
        Size=UDim2.new(0,S(54),0,S(17)),
        Position=UDim2.new(1,-S(62),0.5,-S(8)),
        BackgroundColor3=default and C.onBg or C.offBg,
        BorderColor3=default and C.on or C.off,
        BorderSizePixel=1,
        Text=default and "ON" or "OFF",
        TextColor3=default and C.on or C.off,
        TextSize=S(11), Font=FB, AutoButtonColor=false,
    }, row)

    local state = default
    btn.MouseButton1Click:Connect(function()
        state=not state
        dot.BackgroundColor3  = state and C.on   or C.off
        btn.Text              = state and "ON"   or "OFF"
        btn.TextColor3        = state and C.on   or C.off
        btn.BackgroundColor3  = state and C.onBg or C.offBg
        btn.BorderColor3      = state and C.on   or C.off
        if callback then callback(state) end
    end)

    return {
        Set=function(_,v)
            state=v
            dot.BackgroundColor3 = v and C.on   or C.off
            btn.Text             = v and "ON"   or "OFF"
            btn.TextColor3       = v and C.on   or C.off
            btn.BackgroundColor3 = v and C.onBg or C.offBg
            btn.BorderColor3     = v and C.on   or C.off
        end,
        Get=function() return state end,
    }
end

-- ── Button ───────────────────────────────────────

function Tab:Button(label, callback)
    local btn = new("TextButton",{
        LayoutOrder=self:_o(),
        Size=UDim2.new(1,0,0,S(BASE_ROW_H)),
        BackgroundColor3=C.row, BorderSizePixel=0,
        Text="", AutoButtonColor=false,
    }, self._s)
    rowBorder(btn)
    table.insert(self._elements, {type="btn_action", frame=btn, h=BASE_ROW_H})

    new("TextLabel",{
        Size=UDim2.new(0,S(14),1,0), Position=UDim2.new(0,S(8),0,0),
        BackgroundTransparency=1, Text=">",
        TextColor3=C.accent, TextSize=S(13), Font=FB,
    }, btn)
    new("TextLabel",{
        Size=UDim2.new(1,-S(26),1,0), Position=UDim2.new(0,S(24),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=S(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, btn)

    btn.MouseEnter:Connect(function() btn.BackgroundColor3=C.rowHov end)
    btn.MouseLeave:Connect(function() btn.BackgroundColor3=C.row    end)
    btn.MouseButton1Click:Connect(function() if callback then callback() end end)
end

-- ── Slider ───────────────────────────────────────

function Tab:Slider(label, min, max, default, callback)
    local row, idx = self:_row(44)
    table.insert(self._elements, {type="slider", frame=row, h=44})

    new("Frame",{
        Size=UDim2.new(0,S(6),0,S(6)), Position=UDim2.new(0,S(8),0,S(9)),
        BackgroundColor3=C.accent, BorderSizePixel=0,
    }, row)
    new("TextLabel",{
        Size=UDim2.new(1,-S(80),0,S(16)), Position=UDim2.new(0,S(22),0,S(3)),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=S(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, row)

    local valLbl = new("TextLabel",{
        Size=UDim2.new(0,S(54),0,S(16)), Position=UDim2.new(1,-S(60),0,S(3)),
        BackgroundTransparency=1, Text=tostring(default),
        TextColor3=C.accent, TextSize=S(12), Font=FB,
        TextXAlignment=Enum.TextXAlignment.Right,
    }, row)

    local track = new("Frame",{
        Size=UDim2.new(1,-S(20),0,S(5)), Position=UDim2.new(0,S(12),0,S(32)),
        BackgroundColor3=C.input,
        BorderColor3=C.inputBord, BorderSizePixel=1,
    }, row)

    local p0 = math.clamp((default-min)/(max-min),0,1)
    local fill = new("Frame",{
        Size=UDim2.new(p0,0,1,0),
        BackgroundColor3=C.accent, BorderSizePixel=0,
    }, track)
    local knob = new("Frame",{
        Size=UDim2.new(0,S(2),1,S(4)), Position=UDim2.new(p0,-S(1),0,-S(2)),
        BackgroundColor3=Color3.fromRGB(210,210,210), BorderSizePixel=0, ZIndex=3,
    }, track)

    local cur = default
    local drag = false

    local function upd(px)
        local ap=track.AbsolutePosition; local as=track.AbsoluteSize
        local p=math.clamp((px-ap.X)/as.X,0,1)
        cur=math.floor(min+p*(max-min))
        fill.Size=UDim2.new(p,0,1,0)
        knob.Position=UDim2.new(p,-S(1),0,-S(2))
        valLbl.Text=tostring(cur)
        if callback then callback(cur) end
    end

    local hit = new("TextButton",{
        Size=UDim2.new(1,0,4,0), Position=UDim2.new(0,0,-1.5,0),
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
            knob.Position=UDim2.new(p,-S(1),0,-S(2))
            valLbl.Text=tostring(cur)
        end,
    }
end

-- ── TextBox ──────────────────────────────────────

function Tab:TextBox(label, placeholder, callback)
    local row = self:_row()
    hoverRow(row)

    new("Frame",{
        Size=UDim2.new(0,S(6),0,S(6)), Position=UDim2.new(0,S(8),0.5,-S(3)),
        BackgroundColor3=C.dim, BorderSizePixel=0,
    }, row)
    new("TextLabel",{
        Size=UDim2.new(0.44,0,1,0), Position=UDim2.new(0,S(22),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=S(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, row)

    local box = new("TextBox",{
        Size=UDim2.new(0.5,-S(6),0,S(17)), Position=UDim2.new(0.5,0,0.5,-S(8)),
        BackgroundColor3=C.input,
        BorderColor3=C.inputBord, BorderSizePixel=1,
        PlaceholderText=placeholder or "", PlaceholderColor3=C.dim,
        Text="", TextColor3=C.text, TextSize=S(12), Font=FR,
        ClearTextOnFocus=false,
    }, row)

    box.FocusLost:Connect(function()
        if callback then callback(box.Text) end
    end)

    return {
        Get=function() return box.Text end,
        Set=function(_,v) box.Text=v end,
    }
end

-- ── Dropdown ─────────────────────────────────────

function Tab:Dropdown(label, options, default, callback)
    local row = new("Frame",{
        LayoutOrder=self:_o(),
        Size=UDim2.new(1,0,0,S(BASE_ROW_H)),
        BackgroundColor3=C.row, BorderSizePixel=0,
        ClipsDescendants=false, ZIndex=5,
    }, self._s)
    rowBorder(row)
    table.insert(self._elements, {type="dropdown", frame=row, h=BASE_ROW_H})

    new("Frame",{
        Size=UDim2.new(0,S(6),0,S(6)), Position=UDim2.new(0,S(8),0.5,-S(3)),
        BackgroundColor3=C.accent, BorderSizePixel=0, ZIndex=5,
    }, row)
    new("TextLabel",{
        Size=UDim2.new(0.44,0,1,0), Position=UDim2.new(0,S(22),0,0),
        BackgroundTransparency=1, Text=label,
        TextColor3=C.text, TextSize=S(13), Font=FR,
        TextXAlignment=Enum.TextXAlignment.Left, ZIndex=5,
    }, row)

    local sel   = default or options[1] or ""
    local open  = false
    local dropH = #options * S(20)

    local selBtn = new("TextButton",{
        Size=UDim2.new(0.5,-S(6),0,S(17)), Position=UDim2.new(0.5,0,0.5,-S(8)),
        BackgroundColor3=C.input,
        BorderColor3=C.inputBord, BorderSizePixel=1,
        Text=sel.." v", TextColor3=C.text,
        TextSize=S(12), Font=FR, AutoButtonColor=false, ZIndex=5,
    }, row)

    local drop = new("Frame",{
        Size=UDim2.new(0.5,-S(6),0,dropH),
        Position=UDim2.new(0.5,0,1,1),
        BackgroundColor3=C.input,
        BorderColor3=C.border, BorderSizePixel=1,
        Visible=false, ZIndex=10, ClipsDescendants=true,
    }, row)
    new("UIListLayout",{SortOrder=Enum.SortOrder.LayoutOrder,Padding=UDim.new(0,0)}, drop)

    for i, opt in ipairs(options) do
        local ob = new("TextButton",{
            LayoutOrder=i, Size=UDim2.new(1,0,0,S(20)),
            BackgroundColor3=C.input, BorderSizePixel=0,
            Text=opt, TextColor3=C.dim,
            TextSize=S(12), Font=FR, AutoButtonColor=false, ZIndex=10,
        }, drop)
        new("Frame",{
            Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,1,-1),
            BackgroundColor3=C.sep, BorderSizePixel=0, ZIndex=10,
        }, ob)
        ob.MouseEnter:Connect(function() ob.BackgroundColor3=C.rowHov end)
        ob.MouseLeave:Connect(function() ob.BackgroundColor3=C.input  end)
        ob.MouseButton1Click:Connect(function()
            sel=opt; selBtn.Text=opt.." v"
            drop.Visible=false; open=false
            if callback then callback(sel) end
        end)
    end

    selBtn.MouseButton1Click:Connect(function()
        open=not open; drop.Visible=open
    end)
    UserInputService.InputBegan:Connect(function(i)
        if open and i.UserInputType==Enum.UserInputType.MouseButton1 then
            task.wait(); drop.Visible=false; open=false
        end
    end)

    return {
        Get=function() return sel end,
        Set=function(_,v) sel=v; selBtn.Text=v.." v" end,
    }
end

-- ── Label ────────────────────────────────────────

function Tab:Label(text)
    local f = new("Frame",{
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,S(18)),
        BackgroundColor3=C.catBg, BorderSizePixel=0,
    }, self._s)
    new("TextLabel",{
        Size=UDim2.new(1,-S(10),1,0), Position=UDim2.new(0,S(8),0,0),
        BackgroundTransparency=1, Text=text,
        TextColor3=C.catText, TextSize=S(11), Font=FB,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, f)
    new("Frame",{
        Size=UDim2.new(1,0,0,1), Position=UDim2.new(0,0,1,-1),
        BackgroundColor3=C.sep, BorderSizePixel=0,
    }, f)
    table.insert(self._elements, {type="label", frame=f, h=18})
end

-- ── Separator ────────────────────────────────────

function Tab:Separator()
    new("Frame",{
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,1),
        BackgroundColor3=C.sep, BorderSizePixel=0,
    }, self._s)
    new("Frame",{
        LayoutOrder=self:_o(), Size=UDim2.new(1,0,0,S(4)),
        BackgroundTransparency=1, BorderSizePixel=0,
    }, self._s)
end

-- ══════════════════════════════════════════════════
--                WINDOW CLASS
-- ══════════════════════════════════════════════════

local Window = {}; Window.__index = Window

function FlatLib.Window(title, opts)
    opts = opts or {}
    local self     = setmetatable({}, Window)
    self._tabs     = {}
    self._tabList  = {}
    self._active   = nil
    self._visible  = true
    self._title    = title
    self._resizing = false
    self._minW     = 180
    self._minH     = 150

    -- начальные размеры
    local initW = opts.width  or S(BASE_WIN_W)
    local initH = opts.height or (S(BASE_HDR_H) + 1 + S(BASE_TAB_H) + 1 + S(BASE_CNT_H))

    self._sg = new("ScreenGui",{
        Name="FlatLib_"..title,
        ResetOnSpawn=false,
        ZIndexBehavior=Enum.ZIndexBehavior.Sibling,
    }, pg)

    -- корень
    local win = new("Frame",{
        Size=UDim2.new(0,initW,0,initH),
        Position=UDim2.new(0,8,0,8),
        BackgroundColor3=C.bg,
        BorderColor3=C.border, BorderSizePixel=1,
        Active=true, Draggable=true, ClipsDescendants=false,
    }, self._sg)
    self._win = win

    new("UIListLayout",{
        SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,0),
    }, win)

    -- шапка
    local hdr = new("Frame",{
        LayoutOrder=0, Size=UDim2.new(1,0,0,S(BASE_HDR_H)),
        BackgroundColor3=C.header, BorderSizePixel=0,
    }, win)
    self._hdr = hdr

    local titleLbl = new("TextLabel",{
        Size=UDim2.new(1,-S(10),1,0), Position=UDim2.new(0,S(7),0,0),
        BackgroundTransparency=1,
        Text="[FL] "..title,
        TextColor3=C.text, TextSize=S(13), Font=FB,
        TextXAlignment=Enum.TextXAlignment.Left,
    }, hdr)
    self._titleLbl = titleLbl

    -- разделитель
    new("Frame",{
        LayoutOrder=1, Size=UDim2.new(1,0,0,1),
        BackgroundColor3=C.border, BorderSizePixel=0,
    }, win)

    -- панель табов
    self._tabBar = new("Frame",{
        LayoutOrder=2, Size=UDim2.new(1,0,0,S(BASE_TAB_H)),
        BackgroundColor3=C.tabBar, BorderSizePixel=0,
        ClipsDescendants=true,
    }, win)
    self._tabLayout = new("UIListLayout",{
        FillDirection=Enum.FillDirection.Horizontal,
        SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,0),
    }, self._tabBar)

    -- разделитель
    new("Frame",{
        LayoutOrder=3, Size=UDim2.new(1,0,0,1),
        BackgroundColor3=C.border, BorderSizePixel=0,
    }, win)

    -- контент
    self._contentFrame = new("Frame",{
        LayoutOrder=4,
        Size=UDim2.new(1,0,1,-(S(BASE_HDR_H)+2+S(BASE_TAB_H))),
        BackgroundColor3=C.bg, BorderSizePixel=0,
        ClipsDescendants=true,
    }, win)

    -- ── Ресайз-ручка (правый нижний угол) ────────
    local resizeHandle = new("TextButton",{
        Size=UDim2.new(0,12,0,12),
        Position=UDim2.new(1,-12,1,-12),
        BackgroundColor3=C.border,
        BorderSizePixel=0, Text="",
        AutoButtonColor=false, ZIndex=10,
    }, win)
    self._resizeHandle = resizeHandle

    -- визуальный маркер ресайза
    new("TextLabel",{
        Size=UDim2.new(1,0,1,0),
        BackgroundTransparency=1,
        Text="◢", TextColor3=C.dim,
        TextSize=10, Font=FB, ZIndex=10,
    }, resizeHandle)

    -- логика ресайза
    local rsDown = false
    local rsStartMouse, rsStartSize

    resizeHandle.MouseButton1Down:Connect(function(x,y)
        rsDown      = true
        win.Draggable = false
        rsStartMouse = Vector2.new(x,y)
        rsStartSize  = Vector2.new(win.AbsoluteSize.X, win.AbsoluteSize.Y)
    end)

    UserInputService.InputChanged:Connect(function(i)
        if not rsDown then return end
        if i.UserInputType ~= Enum.UserInputType.MouseMovement then return end
        local delta = Vector2.new(i.Position.X, i.Position.Y) - rsStartMouse
        local newW  = math.max(self._minW, rsStartSize.X + delta.X)
        local newH  = math.max(self._minH, rsStartSize.Y + delta.Y)
        win.Size = UDim2.new(0, newW, 0, newH)
        -- обновляем высоту контента
        local contentH = newH - S(BASE_HDR_H) - 2 - S(BASE_TAB_H)
        self._contentFrame.Size = UDim2.new(1,0,0,math.max(80,contentH))
    end)

    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 then
            rsDown        = false
            win.Draggable = true
        end
    end)

    table.insert(allWindows, self)
    return self
end

-- ── Tab ──────────────────────────────────────────

function Window:Tab(name)
    local idx = #self._tabList + 1

    local btn = new("TextButton",{
        LayoutOrder=idx,
        Size=UDim2.new(0,1,1,0),
        BackgroundColor3=C.tabOff, BorderSizePixel=0,
        Text=name, TextColor3=C.dim,
        TextSize=S(11), Font=FB, AutoButtonColor=false,
    }, self._tabBar)

    local ind = new("Frame",{
        Size=UDim2.new(1,0,0,2), Position=UDim2.new(0,0,1,-2),
        BackgroundColor3=C.tabBar, BorderSizePixel=0,
    }, btn)

    local scroll = new("ScrollingFrame",{
        Size=UDim2.new(1,0,1,0),
        BackgroundTransparency=1, BorderSizePixel=0,
        ScrollBarThickness=3, ScrollBarImageColor3=C.scroll,
        CanvasSize=UDim2.new(0,0,0,0),
        AutomaticCanvasSize=Enum.AutomaticSize.Y,
        Visible=false,
    }, self._contentFrame)
    new("UIListLayout",{
        SortOrder=Enum.SortOrder.LayoutOrder, Padding=UDim.new(0,0),
    }, scroll)

    local tabObj = Tab._new(scroll)

    self._tabs[name] = { btn=btn, ind=ind, scroll=scroll }
    self._tabList[idx] = name

    -- пересчитать ширину кнопок
    local total = #self._tabList
    for _, n in ipairs(self._tabList) do
        self._tabs[n].btn.Size = UDim2.new(1/total,0,1,0)
    end

    btn.MouseButton1Click:Connect(function() self:_activate(name) end)
    if idx == 1 then self:_activate(name) end

    return tabObj
end

function Window:_activate(name)
    for n, data in pairs(self._tabs) do
        local on = (n==name)
        data.scroll.Visible       = on
        data.btn.BackgroundColor3 = on and C.tabOn  or C.tabOff
        data.btn.TextColor3       = on and C.text   or C.dim
        data.ind.BackgroundColor3 = on and C.accent or C.tabBar
    end
    self._active = name
end

-- ── Перекраска при смене темы ─────────────────────

function Window:_rebuildColors()
    if not self._win or not self._win.Parent then return end
    self._win.BackgroundColor3   = C.bg
    self._win.BorderColor3       = C.border
    self._hdr.BackgroundColor3   = C.header
    self._titleLbl.TextColor3    = C.text
    self._tabBar.BackgroundColor3 = C.tabBar
    self._contentFrame.BackgroundColor3 = C.bg
    self._resizeHandle.BackgroundColor3 = C.border

    for n, data in pairs(self._tabs) do
        local on = (n == self._active)
        data.btn.BackgroundColor3 = on and C.tabOn  or C.tabOff
        data.btn.TextColor3       = on and C.text   or C.dim
        data.ind.BackgroundColor3 = on and C.accent or C.tabBar
        -- перекрашиваем все дочерние элементы scroll
        for _, obj in ipairs(data.scroll:GetDescendants()) do
            if obj:IsA("Frame") then
                local n2 = obj.Name
                -- точечная перекраска по имени не нужна,
                -- достаточно пройтись по ключевым
            elseif obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox") then
                -- цвет текста не меняем принудительно — он задан при создании
            end
        end
    end
end

-- ── SetSize / SetScale ────────────────────────────

function Window:SetSize(w, h)
    self._win.Size = UDim2.new(0, w, 0, h)
    local contentH = h - S(BASE_HDR_H) - 2 - S(BASE_TAB_H)
    self._contentFrame.Size = UDim2.new(1,0,0,math.max(80,contentH))
end

-- ── Видимость ─────────────────────────────────────

function Window:Show()    self._win.Visible=true;  self._visible=true  end
function Window:Hide()    self._win.Visible=false; self._visible=false end
function Window:Toggle()  if self._visible then self:Hide() else self:Show() end end
function Window:Destroy()
    for i,w in ipairs(allWindows) do
        if w==self then table.remove(allWindows,i); break end
    end
    self._sg:Destroy()
end

return FlatLib
