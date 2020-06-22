local ThirdPersonRef = gui.Reference('Visuals','Local','Camera')

local NewThirdPersonDist = gui.Slider(ThirdPersonRef, 'ongrenadedist', 'Third Person Distance' , 0,0,500)

local FirstPersonOnGrenade = gui.Checkbox(ThirdPersonRef, 'ongrenade','First Person On Grenade',0)

local LocalChams = gui.GetValue('esp.chams.local.visible')

client.AllowListener('item_equip')
callbacks.Register('FireGameEvent', function(Event)
	if not gui.GetValue('esp.master') or not FirstPersonOnGrenade:GetValue() or Event:GetName() ~= 'item_equip' then
		return
    end
	
local LocalPlayerIndex = client.GetLocalPlayerIndex()
local PlayerIndex = client.GetPlayerIndexByUserID( Event:GetInt('userid') )
local WeaponType = Event:GetInt('weptype')


	if LocalPlayerIndex == PlayerIndex then
		if WeaponType == 9 then
			gui.SetValue('esp.local.thirdpersondist',0)
			gui.SetValue('esp.chams.local.visible' , 8)
		else
			gui.SetValue('esp.local.thirdpersondist',NewThirdPersonDist:GetValue())
			gui.SetValue('esp.chams.local.visible' ,LocalChams) 
		end	
	end
	
	if gui.GetValue('esp.chams.local.visible') ~= 8 and gui.GetValue('esp.chams.local.visible') ~=LocalChams then
		LocalChams = gui.GetValue('esp.chams.local.visible')
	end	
	
end)


