local FRemap = require('foundation_remapping')
local remapper = FRemap.new()
remapper:remap('capslock', 'f18')
remapper:remap('rightcmd', 'f17')

-- 현재 사용중인 키맵보기
-- hs.hotkey.bind({"cmd", "shift"}, "0", function ()
-- hs.alert.show(hs.keycodes.currentSourceID())
-- end)

local caps_mode = hs.hotkey.modal.new()
local inputEnglish = "com.apple.keylayout.ABC"
local inputKorea = "com.apple.inputmethod.Korean.2SetKorean"
local inputJapanese = "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese"
local showSeconds = 0.5
local cleanAlertStyle = {radius = 20, strokeColor = { white = 0, alpha = 0.3 }}

local on_caps_mode = function()
    caps_mode:enter()
end

-- 한영 변경 키
local off_caps_mode = function()

    caps_mode:exit()

    local input_source = hs.keycodes.currentSourceID()

    if input_source == inputKorea then
        hs.keycodes.currentSourceID(inputEnglish)
        language = '🇺🇸 English'
    elseif input_source == inputEnglish then
        hs.keycodes.currentSourceID(inputKorea)
        language = '🇰🇷 Korean'
    end

    hs.alert.closeAll()
    hs.alert.show(language, cleanAlertStyle, showSeconds)
end

-- 일영 변경 키
local off_rightcmd_mode = function()

    caps_mode:exit()

    local input_source = hs.keycodes.currentSourceID()

    if input_source == inputJapanese then
        hs.keycodes.currentSourceID(inputEnglish)
        language = '🇺🇸 English'
    elseif input_source == inputEnglish then
        hs.keycodes.currentSourceID(inputJapanese)
        language = '🇯🇵 Japanese'
    end

    hs.alert.closeAll()
    hs.alert.show(language, cleanAlertStyle, showSeconds)
end

hs.hotkey.bind({}, 'f18', on_caps_mode, off_caps_mode)
hs.hotkey.bind({}, 'f17', on_caps_mode, off_rightcmd_mode)

remapper:register()