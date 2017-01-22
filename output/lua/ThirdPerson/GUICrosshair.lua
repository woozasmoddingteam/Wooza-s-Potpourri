local originalUpdate = GUICrosshair.Updatefunction GUICrosshair:Update(deltaTime)        PROFILE("GUICrosshair:Update")        GUIAnimatedScript.Update(self, deltaTime)    self.updateInterval = kUpdateIntervalFull        -- Update crosshair image.    local xCoord = PlayerUI_GetCrosshairX()    local yCoord = PlayerUI_GetCrosshairY()        local showCrossHair = not PlayerUI_GetIsDead() and PlayerUI_GetIsPlaying() and PlayerUI_NeedsCrosshair() and not PlayerUI_IsACommander() and not PlayerUI_GetBuyMenuDisplaying() and not MainMenu_GetIsOpened()                          --and not PlayerUI_GetIsConstructing() and not PlayerUI_GetIsRepairing()        self.crosshairs:SetIsVisible(showCrossHair)        if showCrossHair then        if xCoord and yCoord then                    self.crosshairs:SetTexturePixelCoordinates(xCoord, yCoord,                                                       xCoord + PlayerUI_GetCrosshairWidth(), yCoord + PlayerUI_GetCrosshairHeight())                        self.damageIndicator:SetTexturePixelCoordinates(xCoord, yCoord,                                                       xCoord + PlayerUI_GetCrosshairWidth(), yCoord + PlayerUI_GetCrosshairHeight())        end    end            -- Update give damage indicator.    local indicatorVisible, timePassedPercent = PlayerUI_GetShowGiveDamageIndicator()    self.damageIndicator:SetIsVisible(indicatorVisible and showCrossHair)    self.damageIndicator:SetColor(Color(1, 1, 1, 1 - timePassedPercent))end