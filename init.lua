local FRemap = require('foundation_remapping')
local remapper = FRemap.new()

-- Custom key mapping --------------------------------------------------------------
remapper:remap('capslock', 'f18')
remapper:remap('rightcmd', 'f17')
------------------------------------------------------------------------------------

-- Check the name of the language currently in use ---------------------------------
-- hs.hotkey.bind({"cmd", "shift"}, "0", function ()
-- hs.alert.show(hs.keycodes.currentSourceID())
-- end)
------------------------------------------------------------------------------------

-- Language mapping ----------------------------------------------------------------
local inputEnglish = "com.apple.keylayout.ABC"
local inputKorean = "com.apple.inputmethod.Korean.2SetKorean"
local inputJapanese = "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese"
------------------------------------------------------------------------------------

-- Alert style ---------------------------------------------------------------------
local showSeconds = 0.5
local cleanAlertStyle = {radius = 20, strokeColor = { white = 0, alpha = 0.3 }}
------------------------------------------------------------------------------------

local caps_mode = hs.hotkey.modal.new()

local on_caps_mode = function()
    caps_mode:enter()
end

-- Change from Korean to English ---------------------------------------------------
local off_caps_mode = function()

    caps_mode:exit()

    local input_source = hs.keycodes.currentSourceID()

    if input_source == inputKorean then
        hs.keycodes.currentSourceID(inputEnglish)
        language = '🇺🇸 English'
    elseif input_source == inputEnglish or input_source == inputJapanese then
        hs.keycodes.currentSourceID(inputKorean)
        language = '🇰🇷 Korean'
    end

    hs.alert.closeAll()
    hs.alert.show(language, cleanAlertStyle, showSeconds)
end
------------------------------------------------------------------------------------

-- Change from Japanese to English -------------------------------------------------
local off_rightcmd_mode = function()

    caps_mode:exit()

    local input_source = hs.keycodes.currentSourceID()

    if input_source == inputJapanese then
        hs.keycodes.currentSourceID(inputEnglish)
        language = '🇺🇸 English'
    elseif input_source == inputEnglish or input_source == inputKorean then
        hs.keycodes.currentSourceID(inputJapanese)
        language = '🇯🇵 Japanese'
    end

    hs.alert.closeAll()
    hs.alert.show(language, cleanAlertStyle, showSeconds)
end
------------------------------------------------------------------------------------

-- Key binding ---------------------------------------------------------------------
hs.hotkey.bind({}, 'f18', on_caps_mode, off_caps_mode)
hs.hotkey.bind({}, 'f17', on_caps_mode, off_rightcmd_mode)
------------------------------------------------------------------------------------

remapper:register()