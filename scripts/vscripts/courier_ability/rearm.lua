--[[
	Author: kritth
	Date: 7.1.2015.
	Put modifier to override animation on cast
]]
function rearm_start( keys )
	local caster = keys.caster
	local ability = keys.ability
	local abilityLevel = ability:GetLevel()
	ability:ApplyDataDrivenModifier( caster, caster, "modifier_rearm_datadriven", {} )
end

--[[
	Author: kritth
	Date: 7.1.2015.
	Refresh cooldown
]]
function rearm_refresh_cooldown( keys )
	local caster = keys.caster
	
	-- Reset cooldown for abilities that is not rearm
	for i = 0, caster:GetAbilityCount() - 1 do
		local ability = caster:GetAbilityByIndex( i )
		if ability and ability ~= keys.ability then
			ability:EndCooldown()
		end
	end
	
	for i = 0, 5 do
		local item = caster:GetItemInSlot( i )
		if item then
			item:EndCooldown()
		end
	end
end
