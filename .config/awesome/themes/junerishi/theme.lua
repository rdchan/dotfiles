--[[

     Multicolor Awesome WM theme 2.0
     github.com/lcpz

--]]

local gears = require("gears")
local lain  = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local dpi   = require("beautiful.xresources").apply_dpi
local spotify_widget = require("awesome-wm-widgets.spotify-widget.spotify")
local calendar_widget = require("awesome-wm-widgets.calendar-widget.calendar")

local os = os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme                                     = {}
theme.confdir                                   = os.getenv("HOME") .. "/.config/awesome/themes/junerishi"
theme.wallpaper                                 = theme.confdir .. "/wall.png"
theme.font                                      = "Terminus 8"
theme.menu_bg_normal                            = "#000000"
theme.menu_bg_focus                             = "#000000"
theme.bg_normal                                 = "#000000"
theme.bg_focus                                  = "#000000"
theme.bg_urgent                                 = "#000000"
theme.fg_normal                                 = "#aaaaaa"
theme.fg_focus                                  = "#ff8c00"
theme.fg_urgent                                 = "#af1d18"
theme.fg_minimize                               = "#ffffff"
theme.border_width                              = dpi(1)
theme.border_normal                             = "#1c2022"
theme.border_focus                              = "#e75637" --"#838383"-- change between gray and "#00ff33" this is a neon green previously was ffffff
theme.border_marked                             = "#3ca4d8"
theme.menu_border_width                         = 0
theme.menu_width                                = dpi(130)
theme.menu_submenu_icon                         = theme.confdir .. "/icons/submenu.png"
theme.menu_fg_normal                            = "#aaaaaa"
theme.menu_fg_focus                             = "#ff8c00"
theme.menu_bg_normal                            = "#050505dd"
theme.menu_bg_focus                             = "#050505dd"
theme.widget_temp                               = theme.confdir .. "/icons/temp.png"
theme.widget_uptime                             = theme.confdir .. "/icons/ac.png"
theme.widget_cpu                                = theme.confdir .. "/icons/cpu.png"
theme.widget_weather                            = theme.confdir .. "/icons/pinkcloud.png"
theme.widget_fs                                 = theme.confdir .. "/icons/fs.png"
theme.widget_mem                                = theme.confdir .. "/icons/mem.png"
theme.widget_note                               = theme.confdir .. "/icons/note.png"
theme.widget_note_on                            = theme.confdir .. "/icons/note_on.png"
theme.widget_netdown                            = theme.confdir .. "/icons/net_down.png"
theme.widget_netup                              = theme.confdir .. "/icons/net_up.png"
theme.widget_mail                               = theme.confdir .. "/icons/mail.png"
theme.widget_batt                               = theme.confdir .. "/icons/bat.png"
theme.widget_clock                              = theme.confdir .. "/icons/clock.png"
theme.widget_vol                                = theme.confdir .. "/icons/spkr.png"
theme.widget_voloff                             = theme.confdir .. "/icons/spkroff.png"
theme.widget_volmute                            = theme.confdir .. "/icons/spkrshhh.png"
theme.widget_volloud                            = theme.confdir .. "/icons/spkrloud.png"
theme.widget_volsoft                            = theme.confdir .. "/icons/spkrsoft.png"
theme.widget_volveryloud                        = theme.confdir .. "/icons/spkrveryloud.png"
theme.widget_spotify_play                       = theme.confdir .. "/icons/spotify_playing.png"
theme.widget_spotify_pause                      = theme.confdir .. "/icons/spotify_paused.png"
--theme.taglist_squares_sel                       = theme.confdir .. "/icons/square_a.png"
--theme.taglist_squares_unsel                     = theme.confdir .. "/icons/square_b.png"
theme.tasklist_plain_task_name                  = true
theme.tasklist_disable_icon                     = true
theme.useless_gap                               = 5
theme.layout_tile                               = theme.confdir .. "/icons/tile.png"
theme.layout_tilegaps                           = theme.confdir .. "/icons/tilegaps.png"
theme.layout_tileleft                           = theme.confdir .. "/icons/tileleft.png"
theme.layout_tilebottom                         = theme.confdir .. "/icons/tilebottom.png"
theme.layout_tiletop                            = theme.confdir .. "/icons/tiletop.png"
theme.layout_fairv                              = theme.confdir .. "/icons/fairv.png"
theme.layout_fairh                              = theme.confdir .. "/icons/fairh.png"
theme.layout_spiral                             = theme.confdir .. "/icons/spiral.png"
theme.layout_dwindle                            = theme.confdir .. "/icons/dwindle.png"
theme.layout_max                                = theme.confdir .. "/icons/max.png"
theme.layout_fullscreen                         = theme.confdir .. "/icons/fullscreen.png"
theme.layout_magnifier                          = theme.confdir .. "/icons/magnifier.png"
theme.layout_floating                           = theme.confdir .. "/icons/floating.png"
theme.titlebar_close_button_normal              = theme.confdir .. "/icons/titlebar/close_normal.png"
theme.titlebar_close_button_focus               = theme.confdir .. "/icons/titlebar/close_focus.png"
theme.titlebar_minimize_button_normal           = theme.confdir .. "/icons/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus            = theme.confdir .. "/icons/titlebar/minimize_focus.png"
theme.titlebar_ontop_button_normal_inactive     = theme.confdir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive      = theme.confdir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active       = theme.confdir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active        = theme.confdir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_sticky_button_normal_inactive    = theme.confdir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive     = theme.confdir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active      = theme.confdir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active       = theme.confdir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_floating_button_normal_inactive  = theme.confdir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive   = theme.confdir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active    = theme.confdir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active     = theme.confdir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_maximized_button_normal_inactive = theme.confdir .. "/icons/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = theme.confdir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active   = theme.confdir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active    = theme.confdir .. "/icons/titlebar/maximized_focus_active.png"

local markup = lain.util.markup

-- Spotify Widget
-- local spotify_widget({
--         font = "Terminus 10",
--         dim_when_paused = true
--         dim_opacity = 0.5,
--         max_length = -1,
--         show_tooltip = true
-- })

-- Textclock
os.setlocale(os.getenv("LANG")) -- to localize the clock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
-- OLD local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %d %B ") .. markup("#ab7367", ">") .. markup("#de5e1e", " %H:%M "))
-- JUST THE DATE!!! we have center clock for the actual clock
local mytextclock = wibox.widget.textclock(markup("#7788af", "%A %B %d"))
mytextclock.font = theme.font
local centerclock = wibox.widget.textclock(markup("#de5e1e", "<b>%H:%M:%S</b>"), 1)
centerclock.font = theme.font
-- Calendar
--theme.cal = lain.widget.cal({
--    attach_to = { mytextclock },
--    notification_preset = {
--        font = "Terminus 10",
--        fg   = theme.fg_normal,
--        bg   = theme.bg_normal
--    }
--})
theme.cal = calendar_widget({
    placement = 'top_center',
    attach_to = {centerclock},
    theme = 'gruvbox'
})
--centerclock:connect_signal("button::press", 
--    function(_, _, _, button)
--        if button == 1 then cw.toggle() end
--    end)

-- Weather
local weathericon = wibox.widget.imagebox(theme.widget_weather)
theme.weather = lain.widget.weather({
    city_id = 4671654, -- (Austin)
    notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
    weather_na_markup = markup.fontfg(theme.font, "#eca4c4", "N/A "),
    units = "imperial",
    settings = function()
        descr = weather_now["weather"][1]["description"]:lower()
        units = math.floor(weather_now["main"]["temp"])
        widget:set_markup(markup.fontfg(theme.font, "#eca4c4", descr .. " @ " .. units .. "°F "))
    end
})

-- / fs
--[[ commented because it needs Gio/Glib >= 2.54
local fsicon = wibox.widget.imagebox(theme.widget_fs)
theme.fs = lain.widget.fs({
    notification_preset = { font = "Terminus 10", fg = theme.fg_normal },
    settings  = function()
        widget:set_markup(markup.fontfg(theme.font, "#80d9d8", string.format("%.1f", fs_now["/"].used) .. "% "))
    end
})
--]]

-- Mail IMAP check
--[[ commented because it needs to be set before use
local mailicon = wibox.widget.imagebox()
theme.mail = lain.widget.imap({
    timeout  = 180,
    server   = "server",
    mail     = "mail",
    password = "keyring get mail",
    settings = function()
        if mailcount > 0 then
            mailicon:set_image(theme.widget_mail)
            widget:set_markup(markup.fontfg(theme.font, "#cccccc", mailcount .. " "))
        else
            widget:set_text("")
            --mailicon:set_image() -- not working in 4.0
            mailicon._private.image = nil
            mailicon:emit_signal("widget::redraw_needed")
            mailicon:emit_signal("widget::layout_changed")
        end
    end
})
--]]

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e33a6e", cpu_now.usage .. "% "))
    end
})

-- Coretemp
local tempicon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#f1af5f", coretemp_now .. "°C "))
    end
})

-- Battery
--local baticon = wibox.widget.imagebox(theme.widget_batt)
--local bat = lain.widget.bat({
--    settings = function()
--        local perc = bat_now.perc ~= "N/A" and bat_now.perc .. "%" or bat_now.perc
--
--        if bat_now.ac_status == 1 then
--            perc = perc .. " plug"
--        end
--
--        widget:set_markup(markup.fontfg(theme.font, theme.fg_normal, perc .. " "))
--    end
--})

-- ALSA volume bar (Holo)
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsabar({
    notification_preset = { font = "Monospace 9"},
    --togglechannel = "IEC958,3",
    width = dpi(80), height = dpi(10), border_width = dpi(0),
    colors = {
        background = "#383838",
        unmute     = "#80CCE6",
        mute       = "#FF9F9F"
    },
    timeout=1,
    settings = function()
        if volume_now.status == "off" then
            volicon.image = gears.surface.load(theme.widget_volmute)
        elseif volume_now.level == 0 then
            volicon.image = gears.surface.load(theme.widget_voloff)
        elseif volume_now.level < 10 then
            volicon.image = gears.surface.load(theme.widget_volsoft)
        elseif volume_now.level < 20 then
            volicon.image = gears.surface.load(theme.widget_vol)
        elseif volume_now.level < 30 then 
            volicon.image = gears.surface.load(theme.widget_volloud)
        else
            volicon.image = gears.surface.load(theme.widget_volveryloud)
        end
    end
})
theme.volume.bar.paddings = dpi(0)
theme.volume.bar.margins = dpi(5)
local volumewidget = wibox.container.background(theme.volume.bar, theme.bg_focus, gears.shape.rectangle)
volumewidget = wibox.container.margin(volumewidget, dpi(0), dpi(0), dpi(0), dpi(0))

--Original ALSA Volume display (multicolor)
--local volicon = wibox.widget.imagebox(theme.widget_vol)
--theme.volume = lain.widget.alsa({
--    settings = function()
--        if volume_now.status == "off" then
--            volume_now.level = volume_now.level .. "M"
--        end
--
--        widget:set_markup(markup.fontfg(theme.font, "#7493d2", volume_now.level .. "% "))
--    end
--})

-- Net
local netdownicon = wibox.widget.imagebox(theme.widget_netdown)
local netdowninfo = wibox.widget.textbox()
local netupicon = wibox.widget.imagebox(theme.widget_netup)
local netupinfo = lain.widget.net({
    settings = function()
        if iface ~= "network off" and
           string.match(theme.weather.widget.text, "N/A")
        then
            theme.weather.update()
        end

        widget:set_markup(markup.fontfg(theme.font, "#e54c62", net_now.sent .. " "))
        netdowninfo:set_markup(markup.fontfg(theme.font, "#87af5f", net_now.received .. " "))
    end
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local memory = lain.widget.mem({
    settings = function()
        widget:set_markup(markup.fontfg(theme.font, "#e0da37", mem_now.used .. "M "))
    end
})

-- MPD
local mpdicon = wibox.widget.imagebox()
theme.mpd = lain.widget.mpd({
    music_dir="~/Musicc",
    settings = function()
        mpd_notification_preset = {
            text = string.format("%s [%s] - %s\n%s", mpd_now.artist,
                   mpd_now.album, mpd_now.date, mpd_now.title)
        }

        if mpd_now.date == "N/A" then
            year = ""
        else
            year = "(" .. mpd_now.date .. ")"
        end

        if mpd_now.state == "play" then
            artist = mpd_now.artist .. " > "
            title  = mpd_now.title .. " "
            mpdicon:set_image(theme.widget_note_on)
            mpdcolor = "#e54c62"
        elseif mpd_now.state == "pause" then
            artist = mpd_now.artist .. " > "
            title  = mpd_now.title .. " "
            mpdcolor = "#b2b2b2"
            --artist = "mpd "
            --title  = "paused "
            mpdicon:set_image(theme.widget_note)
        else
            artist = ""
            title  = ""
            year = ""
            --mpdicon:set_image() -- not working in 4.0
            mpdicon._private.image = nil
            mpdicon:emit_signal("widget::redraw_needed")
            mpdicon:emit_signal("widget::layout_changed")
        end
        widget:set_markup(markup.fontfg(theme.font, mpdcolor, artist .. title .. year))
    end
})

function theme.at_screen_connect(s)
    -- Quake application
    s.quake = lain.util.quake({ app = awful.util.terminal })

    -- If wallpaper is a function, call it with the screen
    local wallpaper = theme.wallpaper
    if type(wallpaper) == "function" then
        wallpaper = wallpaper(s)
    end
    gears.wallpaper.maximized(wallpaper, s, true)

    -- Tags
    awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(my_table.join(
                           awful.button({}, 1, function () awful.layout.inc( 1) end),
                           awful.button({}, 2, function () awful.layout.set( awful.layout.layouts[1] ) end),
                           awful.button({}, 3, function () awful.layout.inc(-1) end),
                           awful.button({}, 4, function () awful.layout.inc( 1) end),
                           awful.button({}, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

    -- Create the wibox
    s.mywibox = awful.wibar({ position = "top", screen = s, height = dpi(19), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the wibox
    s.mywibox:setup {
        { -- Left widgets
            layout = wibox.layout.fixed.horizontal,
            s.mylayoutbox,
            s.mytaglist,
            s.mypromptbox,
            mpdicon,
            theme.mpd.widget,
            wibox.widget.systray(),
        },
        {
            layout = wibox.layout.fixed.horizontal,
            centerclock,
        },
        --s.mytasklist, -- Middle widget
       -- { -- Middle Widgets
       --     centerclock,
       --     layout = wibox.layout.align.horizontal(nil, centerclock, nil),
       --  },
--        nil,
        { -- Right widgets
            layout = wibox.layout.fixed.horizontal,
            --mailicon,
            --theme.mail.widget,
            spotify_widget({
                font = "Terminus 10",
                dim_when_paused = true,
               dim_opacity = 0.5,
                max_artist_length = 21,
                max_song_length = 25,
                max_album_length = 20,
               show_tooltip = true,
            }),
            netdownicon,
            netdowninfo,
            netupicon,
            netupinfo.widget,
            volicon,
            --theme.volume.widget,
            volumewidget,
            memicon,
            memory.widget,
            --cpuicon,
            --cpu.widget,
            --fsicon,
            --theme.fs.widget,
           -- weathericon,
           theme.weather.widget,
           -- tempicon,
           -- temp.widget,
            --baticon,
            --bat.widget,
            --clockicon,
            --mytextclock,
        },
        layout = wibox.layout.align.horizontal,
        expand="none",
        opacity=0.9,
    }

    -- Create the bottom wibox
--    s.mybottomwibox = awful.wibar({ position = "bottom", screen = s, border_width = 0, height = dpi(20), bg = theme.bg_normal, fg = theme.fg_normal })

    -- Add widgets to the bottom wibox
  --  s.mybottomwibox:setup {
    --    layout = wibox.layout.align.horizontal,
     --   { -- Left widgets
      --      layout = wibox.layout.fixed.horizontal,
       -- },
  --      s.mytasklist, -- Middle widget
   --     { -- Right widgets
    --        layout = wibox.layout.fixed.horizontal,
     --       s.mylayoutbox,
      --  },
   -- }
end

return theme

