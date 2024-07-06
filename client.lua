ESX = exports["es_extended"]:getSharedObject()


local originalSettingsSaved = false


local function saveOriginalSettings()
    if not originalSettingsSaved then
        
        originalSettingsSaved = true
    end
end


lib.registerContext({
    id = 'vs_fps_menu',
    title = 'Boost FPS',
    options = {
        {
            title = 'FPS',
            description = 'Poprawia Optymalizację',
            icon = 'person-running',
            onSelect = function()
                SetTimecycleModifier('yell_tunnel_nodirect')
                ESX.ShowNotification('Ustawienia zoptymalizowane pod FPS')
            end,
        },
        {
            title = 'GRAFIKA',
            description = 'Poprawia Grafikę',
            icon = 'tree-city',
            onSelect = function()
                SetTimecycleModifier('MP_Powerplay_blend')
                SetExtraTimecycleModifier('reflection_correct_ambient')
                SetVisualSettingFloat('Grass', 0.25)  
                SetVisualSettingFloat('VehicleDensity', 0.5)  -- 
                ESX.ShowNotification('Zwiększono jakość grafiki')
            end,
        },
        {
            title = 'Domyślne',
            description = 'Przywraca ustawienia domyślne',
            icon = 'house',
            onSelect = function()
                ClearTimecycleModifier()
                ClearExtraTimecycleModifier()
                ResetVisualSetting('Grass')  
                ResetVisualSetting('VehicleDensity')  
                ESX.ShowNotification('Przywrócono ustawienia domyślne')
            end,
        },
    }
})


RegisterCommand('fps', function()
    saveOriginalSettings()
    lib.showContext('vs_fps_menu')
end)
