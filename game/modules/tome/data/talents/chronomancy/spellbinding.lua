-- ToME - Tales of Maj'Eyal
-- Copyright (C) 2009 - 2019 Nicolas Casalini
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--
-- Nicolas Casalini "DarkGod"
-- darkgod@te4.org

-- EDGE TODO: Particles, Timed Effect Particles

newTalent{
	name = "Empower",
	type = {"chronomancy/spellbinding", 1},
	require = chrono_req_high1,
	points = 5,
	sustain_paradox = 24,
	mode = "sustained",
	no_sustain_autoreset = true,
	cooldown = 10,
	no_npc_use = true,
	allow_temporal_clones = true,
	getPower = function(self, t) return self:combatTalentLimit(t, 1, 0.125, 0.55) end,
	on_pre_use = function(self, t, silent) if self ~= game.player and not self:isTalentActive(t) then return false end return true end,  -- but don't let them cast it
	activate = function(self, t)
		local talent = self:talentDialog(require("mod.dialogs.talents.ChronomancyEmpower").new(self))
		if not talent then return nil end
		
		game:playSoundNear(self, "talents/spell_generic")

		return {
			talent = talent, rest_count = 0
		}
	end,
	deactivate = function(self, t, p)
		return true
	end,
	info = function(self, t)
		local power = t.getPower(self, t) * 100
		local talent = self:isTalentActive(t.id) and self:getTalentFromId(self:isTalentActive(t.id).talent).name or _t"None"
		return ([[Empowers the selected chronomancy spell, increasing spellpower when casting it by %d%%.
		Each spell can only be spellbound in one way at a time.
		
		Current Empowered Spell: %s]]):
		tformat(power, talent)
	end,
}

newTalent{
	name = "Extension",
	type = {"chronomancy/spellbinding", 1},
	require = chrono_req_high1,
	points = 5,
	sustain_paradox = 24,
	mode = "sustained",
	no_sustain_autoreset = true,
	cooldown = 10,
	no_npc_use = true,
	allow_temporal_clones = true,
	getPower = function(self, t) return self:combatTalentLimit(t, 0.5, 0.07, 0.3) end,
	on_pre_use = function(self, t, silent) if self ~= game.player and not self:isTalentActive(t) then return false end return true end,  -- but don't let them cast it
	activate = function(self, t)
		local talent = self:talentDialog(require("mod.dialogs.talents.ChronomancyExtension").new(self))
		if not talent then return nil end
		
		game:playSoundNear(self, "talents/spell_generic")
				
		return {
			talent = talent, rest_count = 0
		}
	end,
	deactivate = function(self, t, p)
		return true
	end,
	info = function(self, t)
		local power = t.getPower(self, t) * 100
		local talent = self:isTalentActive(t.id) and self:getTalentFromId(self:isTalentActive(t.id).talent).name or _t"None"
		return ([[Extends the duration of the selected chronomancy spell by %d%%.
		Each spell can only be spellbound in one way at a time.
		
		Current Extended Spell: %s]]):
		tformat(power, talent)
	end,
}

newTalent{
	name = "Matrix",
	type = {"chronomancy/spellbinding", 1},
	require = chrono_req_high1,
	points = 5,
	sustain_paradox = 24,
	mode = "sustained",
	no_sustain_autoreset = true,
	cooldown = 10,
	no_npc_use = true,
	allow_temporal_clones = true,
	getPower = function(self, t) return self:combatTalentLimit(t, 0.5, 0.07, 0.3) end,
	on_pre_use = function(self, t, silent) if self ~= game.player and not self:isTalentActive(t) then return false end return true end,  -- but don't let them cast it
	activate = function(self, t)
		local talent = self:talentDialog(require("mod.dialogs.talents.ChronomancyMatrix").new(self))
		if not talent then return nil end
		
		game:playSoundNear(self, "talents/spell_generic")
		
		return {
			talent = talent, rest_count = 0
		}
	end,
	deactivate = function(self, t, p)
		return true
	end,
	info = function(self, t)
		local power = t.getPower(self, t) * 100
		local talent = self:isTalentActive(t.id) and self:getTalentFromId(self:isTalentActive(t.id).talent).name or _t"None"
		return ([[Reduces the cooldown of the selected chronomancy spell by %d%%.
		Each spell can only be spellbound in one way at a time.
		
		Current Matrix Spell: %s]]):
		tformat(power, talent)
	end,
}

newTalent{
	name = "Quicken",
	type = {"chronomancy/spellbinding", 1},
	require = chrono_req_high1,
	points = 5,
	sustain_paradox = 24,
	mode = "sustained",
	no_sustain_autoreset = true,
	cooldown = 10,
	no_npc_use = true,  -- so rares don't learn useless talents
	allow_temporal_clones = true,  -- let clones copy it anyway so they can benefit from the effects
	on_pre_use = function(self, t, silent) if self ~= game.player and not self:isTalentActive(t) then return false end return true end,  -- but don't let them cast it
	getPower = function(self, t) return self:combatTalentLimit(t, 1, 0.125, 0.55) end,
	activate = function(self, t)
		local talent = self:talentDialog(require("mod.dialogs.talents.ChronomancyQuicken").new(self))
		if not talent then return nil end
		
		game:playSoundNear(self, "talents/spell_generic")
				
		return {
			talent = talent, rest_count = 0
		}
	end,
	deactivate = function(self, t, p)
		return true
	end,
	info = function(self, t)
		local power = t.getPower(self, t) * 100
		local talent = self:isTalentActive(t.id) and self:getTalentFromId(self:isTalentActive(t.id).talent).name or _t"None"
		return ([[Reduces the casting speed of the selected chronomancy spell by %d%%.
		Each spell can only be spellbound in one way at a time.
		
		Current Quickened Spell: %s]]):
		tformat(power, talent)
	end,
}
