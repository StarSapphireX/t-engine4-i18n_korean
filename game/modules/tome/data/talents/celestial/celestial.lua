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

-- Celestial Spells
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/guardian", name = _t"guardian", min_lev = 10, description = _t"Your devotion grants you additional protection." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/chants", name = _t"chants", generic = true, description = _t"Chant the glory of the Sun." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/chants-chants", name = _t"chants", generic = true, on_mastery_change = function(self, m, tt) if self:knowTalentType("celestial/chants") ~= nil then self.talents_types_mastery[tt] = self.talents_types_mastery["celestial/chants"] end end, description = _t"Chant the glory of the Sun." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/light", name = _t"light", generic = true, description = _t"Invoke the power of the light to heal and mend." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/combat", name = _t"combat", description = _t"Your devotion allows you to combat your foes with indomitable determination." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/radiance", name = _t"radiance", description = _t"You channel the light of the sun through your body." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/crusader", name = _t"crusader", description = _t"Forgo your shield for the chance to crush your foes with a mighty two handed weapon." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/sunlight", name = _t"sunlight", description = _t"Summon the power of the Sun to burn your foes." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/sun", name = _t"sun", description = _t"Summon the power of the Sun to burn your foes." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/glyphs", name = _t"glyphs", min_lev = 10, description = _t"Bind the brilliant powers into glyphs to trap your foes." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/twilight", name = _t"twilight", description = _t"Stand between the darkness and the light, harnessing both." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/star-fury", name = _t"star fury", description = _t"Call the fury of the Stars and the Moon to destroy your foes." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/hymns", name = _t"hymns", generic = true, on_mastery_change = function(self, m, tt) if self:knowTalentType("celestial/hymns") ~= nil then self.talents_types_mastery[tt] = self.talents_types_mastery["celestial/hymns"] end end, description = _t"Chant the glory of the Moon." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/hymns-hymns", name = _t"hymns", generic = true, description = _t"Chant the glory of the Moon." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/circles", name = _t"circles", min_lev = 10, description = _t"Bind the power of the Moon into circles at your feet." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/eclipse", name = _t"eclipse", description = _t"The moment of the Eclipse is the moment of Truth, when Sun and Moon are in tandem and the energies of the world hang in the balance. Intense focus allows the greatest Anorithils to harness these energies to unleash devastating forces..." }
newTalentType{ allow_random=true, no_silence=true, is_spell=true, type="celestial/other", name = _t"other", description = _t"Other celestial powers." }


newTalentType{ no_silence=true, is_spell=true, type="celestial/other", name = _t"other", description = _t"Various celestial talents." }

-- Fallen Class Evolution
newTalentType{ allow_random=false, no_silence=true, is_spell=true, type="celestial/dirges", name = _t"Dirges", description = _t"The songs the Fallen sing." }
newTalentType{ allow_random=false, no_silence=true, is_spell=true, type="celestial/darkside", name = _t"Darkside", description = _t"Signature magics of the Fallen.  The sun shines for the guilty and the innocent alike." }
newTalentType{ allow_random=false, no_silence=true, is_spell=true, type="celestial/black-sun", name = _t"Black Sun", description = _t"Celestial combat techniques inspired by the dark places that are not empty." }
newTalentType{ allow_random=false, no_silence=true, is_spell=true, generic=true, type="celestial/dirge", name = _t"Dirges", description = _t"Sing of death and damnation." }

-- Generic requires for celestial spells based on talent level
divi_req1 = {
	stat = { mag=function(level) return 12 + (level-1) * 2 end },
	level = function(level) return 0 + (level-1)  end,
}
divi_req2 = {
	stat = { mag=function(level) return 20 + (level-1) * 2 end },
	level = function(level) return 4 + (level-1)  end,
}
divi_req3 = {
	stat = { mag=function(level) return 28 + (level-1) * 2 end },
	level = function(level) return 8 + (level-1)  end,
}
divi_req4 = {
	stat = { mag=function(level) return 36 + (level-1) * 2 end },
	level = function(level) return 12 + (level-1)  end,
}
divi_req5 = {
	stat = { mag=function(level) return 44 + (level-1) * 2 end },
	level = function(level) return 16 + (level-1)  end,
}
divi_req_high1 = {
	stat = { mag=function(level) return 22 + (level-1) * 2 end },
	level = function(level) return 10 + (level-1)  end,
}
divi_req_high2 = {
	stat = { mag=function(level) return 30 + (level-1) * 2 end },
	level = function(level) return 14 + (level-1)  end,
}
divi_req_high3 = {
	stat = { mag=function(level) return 38 + (level-1) * 2 end },
	level = function(level) return 18 + (level-1)  end,
}
divi_req_high4 = {
	stat = { mag=function(level) return 46 + (level-1) * 2 end },
	level = function(level) return 22 + (level-1)  end,
}
divi_req_high5 = {
	stat = { mag=function(level) return 54 + (level-1) * 2 end },
	level = function(level) return 26 + (level-1)  end,
}

-- Used by Fallen Black Sun tree
divi_str_req_high1 = {
	stat = { str=function(level) return 22 + (level-1) * 2 end },
	level = function(level) return 10 + (level-1)  end,
}
divi_str_req_high2 = {
	stat = { str=function(level) return 30 + (level-1) * 2 end },
	level = function(level) return 14 + (level-1)  end,
}
divi_str_req_high3 = {
	stat = { str=function(level) return 38 + (level-1) * 2 end },
	level = function(level) return 18 + (level-1)  end,
}
divi_str_req_high4 = {
	stat = { str=function(level) return 46 + (level-1) * 2 end },
	level = function(level) return 22 + (level-1)  end,
}
divi_str_req_high5 = {
	stat = { str=function(level) return 54 + (level-1) * 2 end },
	level = function(level) return 26 + (level-1)  end,
}

load("/data/talents/celestial/chants.lua")
load("/data/talents/celestial/sunlight.lua")
load("/data/talents/celestial/sun.lua")
load("/data/talents/celestial/combat.lua")
load("/data/talents/celestial/light.lua")
load("/data/talents/celestial/glyphs.lua")
load("/data/talents/celestial/guardian.lua")
load("/data/talents/celestial/radiance.lua")
load("/data/talents/celestial/crusader.lua")

load("/data/talents/celestial/twilight.lua")
load("/data/talents/celestial/hymns.lua")
load("/data/talents/celestial/star-fury.lua")
load("/data/talents/celestial/eclipse.lua")
load("/data/talents/celestial/circles.lua")

load("/data/talents/celestial/other.lua")

load("/data/talents/celestial/darkside.lua")
load("/data/talents/celestial/black-sun.lua")
load("/data/talents/celestial/dirge.lua")
