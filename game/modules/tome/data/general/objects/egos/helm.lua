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

local Stats = require "engine.interface.ActorStats"
local Talents = require "engine.interface.ActorTalents"
local DamageType = require "engine.DamageType"

--load("/data/general/objects/egos/charged-attack.lua")
--load("/data/general/objects/egos/charged-defensive.lua")
--load("/data/general/objects/egos/charged-utility.lua")


newEntity{
	power_source = {technique=true},
	name = " of strength (#STATBONUS#)", suffix=true, instant_resolve=true,
	keywords = {strength=true},
	level_range = {1, 50},
	rarity = 6,
	cost = 4,
	wielder = {
		inc_stats = { [Stats.STAT_STR] = resolvers.mbonus_material(8, 2) },
	},
}
newEntity{
	power_source = {technique=true},
	name = " of constitution (#STATBONUS#)", suffix=true, instant_resolve=true,
	keywords = {con=true},
	level_range = {1, 50},
	rarity = 6,
	cost = 4,
	wielder = {
		inc_stats = { [Stats.STAT_CON] = resolvers.mbonus_material(8, 2) },
	},
}
newEntity{
	power_source = {technique=true},
	name = " of dexterity (#STATBONUS#)", suffix=true, instant_resolve=true,
	keywords = {dex=true},
	level_range = {1, 50},
	rarity = 6,
	cost = 4,
	wielder = {
		inc_stats = { [Stats.STAT_DEX] = resolvers.mbonus_material(8, 2) },
	},
}


newEntity{
	power_source = {technique=true},
	name = "thaloren ", prefix=true, instant_resolve=true,
	keywords = {thaloren=true},
	level_range = {25, 50},
	greater_ego = 1,
	rarity = 10,
	cost = 10,
	wielder = {
		inc_stats = { [Stats.STAT_WIL] = resolvers.mbonus_material(8, 2) },
		combat_mentalresist = resolvers.mbonus_material(10, 5),
		resists={
			[DamageType.BLIGHT] = resolvers.mbonus_material(10, 5),
		},
	},
}
newEntity{
	power_source = {nature=true},
	name = "prismatic ", prefix=true, instant_resolve=true,
	keywords = {prismatic=true},
	level_range = {10, 50},
	rarity = 10,
	cost = 7,
	wielder = {
		resists={
			[DamageType.LIGHT] = resolvers.mbonus_material(10, 10),
			[DamageType.DARKNESS] = resolvers.mbonus_material(10, 10),
		},
	},
}

newEntity{
	power_source = {nature=true},
	name = " of precognition", suffix=true, instant_resolve=true,
	keywords = {precog=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 18,
	cost = 25,
	wielder = {
		combat_atk = resolvers.mbonus_material(8, 4),
		combat_def = resolvers.mbonus_material(8, 4),
		inc_stats = { [Stats.STAT_CUN] = resolvers.mbonus_material(8, 2) },
		on_melee_hit = {
			[DamageType.ITEM_TEMPORAL_ENERGIZE] = resolvers.mbonus_material(10, 10), 
		},
	},
}

newEntity{
	power_source = {nature=true},
	name = " of the depths", suffix=true,
	keywords = {depths=true},
	level_range = {15, 50},
	rarity = 10,
	cost = 10,
	wielder = {
		resists={
			[DamageType.COLD] = resolvers.mbonus_material(20, 5),
		},
		can_breath = {water=1},
	},
}

newEntity{
	power_source = {nature=true},
	name = " of absorption", suffix=true, instant_resolve=true,
	keywords = {absorb=true},
	level_range = {20, 50},
	rarity = 10,
	cost = 20,
	wielder = {
		stamina_regen_when_hit = resolvers.mbonus_material(23, 7, function(e, v) v=v/10 return 0, v end),
		equilibrium_regen_when_hit = resolvers.mbonus_material(23, 7, function(e, v) v=v/10 return 0, v end),
	},
}

newEntity{
	power_source = {technique=true},
	name = "miner's ", prefix=true, instant_resolve=true,
	keywords = {miner=true},
	level_range = {1, 50},
	rarity = 6,
	cost = 5,
	wielder = {
		infravision = resolvers.mbonus_material(3, 1),
		combat_armor = resolvers.mbonus_material(5, 1),
	},
}

newEntity{
	power_source = {technique=true},
	name = "insulating ", prefix=true, instant_resolve=true,
	keywords = {insulate=true},
	level_range = {1, 50},
	rarity = 6,
	cost = 5,
	wielder = {
		resists={
			[DamageType.FIRE] = resolvers.mbonus_material(10, 5),
			[DamageType.COLD] = resolvers.mbonus_material(10, 5),
		},
	},
}

newEntity{
	power_source = {nature=true},
	name = "grounding ", prefix=true, instant_resolve=true,
	keywords = {ground=true},
	level_range = {1, 50},
	rarity = 6,
	cost = 5,
	wielder = {
		resists={
			[DamageType.LIGHTNING] = resolvers.mbonus_material(10, 5),
			[DamageType.TEMPORAL] = resolvers.mbonus_material(10, 5),
		},
	},
}

newEntity{
	power_source = {technique=true},
	name = "stabilizing ", prefix=true, instant_resolve=true,
	keywords = {stabilize=true},
	level_range = {1, 50},
	rarity = 6,
	cost = 5,
	wielder = {
		combat_physresist = resolvers.mbonus_material(15, 10),
	},
}

newEntity{
	power_source = {antimagic=true},
	name = "cleansing ", prefix=true, instant_resolve=true,
	keywords = {cleanse=true},
	level_range = {1, 50},
	rarity = 9,
	cost = 9,
	wielder = {
		resists={
			[DamageType.NATURE] = resolvers.mbonus_material(10, 5),
			[DamageType.BLIGHT] = resolvers.mbonus_material(10, 5),
		},
	},
}

newEntity{
	power_source = {psionic=true},
	name = " of knowledge", suffix=true, instant_resolve=true,
	keywords = {knowledge=true},
	level_range = {15, 50},
	greater_ego = 1,
	rarity = 15,
	cost = 20,
	wielder = {
		combat_mindpower = resolvers.mbonus_material(3, 3),
		inc_stats = {
			[Stats.STAT_CUN] = resolvers.mbonus_material(3, 2),
			[Stats.STAT_WIL] = resolvers.mbonus_material(3, 2),
		},
	},
}

newEntity{
	power_source = {technique=true},
	name = " of might", suffix=true, instant_resolve=true,
	keywords = {might=true},
	level_range = {15, 50},
	greater_ego = 1,
	rarity = 15,
	cost = 20,
	wielder = {
		combat_dam = resolvers.mbonus_material(3, 3),
		inc_stats = {
			[Stats.STAT_STR] = resolvers.mbonus_material(3, 2),
			[Stats.STAT_CON] = resolvers.mbonus_material(3, 2),
		},
	},
}

newEntity{
	power_source = {technique=true},
	name = " of trickery", suffix=true, instant_resolve=true,
	keywords = {trickery=true},
	level_range = {15, 50},
	greater_ego = 1,
	rarity = 13,
	cost = 20,
	wielder = {
		combat_apr = resolvers.mbonus_material(4, 4),
		inc_stats = {
			[Stats.STAT_DEX] = resolvers.mbonus_material(3, 2),
			[Stats.STAT_CUN] = resolvers.mbonus_material(3, 2),
		},
	},
}

newEntity{
	power_source = {nature=true},
	name = "warlord's ", prefix=true, instant_resolve=true,
	keywords = {warlord=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 17,
	cost = 50,
	wielder = {
		combat_dam = resolvers.mbonus_material(6, 6),
		combat_physresist = resolvers.mbonus_material(10, 5),
		inc_stats = {
			[Stats.STAT_STR] = resolvers.mbonus_material(4, 3),
			[Stats.STAT_WIL] = resolvers.mbonus_material(4, 3),
		},
		resists={
			[DamageType.PHYSICAL] = resolvers.mbonus_material(10, 5),
	},
	},
}

newEntity{
	power_source = {technique=true},
	name = "defender's ", prefix=true, instant_resolve=true,
	keywords = {defender=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 17,
	cost = 50,
	wielder = {
		combat_armor = resolvers.mbonus_material(5, 4),
		combat_def = resolvers.mbonus_material(4, 4),
		combat_physresist = resolvers.mbonus_material(10, 5),
		resists={
			all = resolvers.mbonus_material(5, 2),
	},
	},
}

newEntity{
	power_source = {nature=true},
	name = "dragonslayer's ", prefix=true, instant_resolve=true,
	keywords = {dragonslayer=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 17,
	cost = 50,
	wielder = {
		resists={
			[DamageType.ACID] = resolvers.mbonus_material(10, 5),
			[DamageType.LIGHTNING] = resolvers.mbonus_material(10, 5),
			[DamageType.FIRE] = resolvers.mbonus_material(10, 5),
			[DamageType.COLD] = resolvers.mbonus_material(10, 5),
		},
	},
}

newEntity{
	power_source = {nature=true},
	name = "werebeast's ", prefix=true, instant_resolve=true,
	keywords = {werebeast=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 80,
	wielder = {
		inc_stats = {
			[Stats.STAT_STR] = resolvers.mbonus_material(8, 1),
			[Stats.STAT_DEX] = resolvers.mbonus_material(8, 1),
			[Stats.STAT_CON] = resolvers.mbonus_material(8, 1),
			[Stats.STAT_CUN] = resolvers.mbonus_material(8, 1),
		},
	},
}

newEntity{
	power_source = {psionic=true},
	name = "mindcaging ", prefix=true, instant_resolve=true,
	keywords = {mindcage=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 40,
	wielder = {
		resists={
			[DamageType.MIND] = resolvers.mbonus_material(15, 10),
		},
		combat_mentalresist = resolvers.mbonus_material(20, 10),
		confusion_immune = resolvers.mbonus_material(30, 20, function(e, v) v=v/100 return 0, v end),
	},
}

newEntity{
	power_source = {technique=true},
	name = "champion's ", prefix=true, instant_resolve=true,
	keywords = {champion=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 30,
	wielder = {
		inc_stats = {
			[Stats.STAT_STR] = resolvers.mbonus_material(5, 1),
			[Stats.STAT_WIL] = resolvers.mbonus_material(5, 1),
		},
		combat_mentalresist = resolvers.mbonus_material(10, 5),
		lite = resolvers.mbonus_material(1, 1),
	},
}

newEntity{
	power_source = {nature=true},
	name = "leafwalker's ", prefix=true, instant_resolve=true,
	keywords = {learwalker=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 80,
	wielder = {
		resists={
			[DamageType.NATURE] = resolvers.mbonus_material(10, 5),
		},
		combat_spellresist = resolvers.mbonus_material(7, 3),
		max_life = resolvers.mbonus_material(70, 40),
		healing_factor = resolvers.mbonus_material(10, 10, function(e, v) v=v/100 return 0, v end),
	},
}

newEntity{
	power_source = {technique=true},
	name = "catburglar's ", prefix=true, instant_resolve=true,
	keywords = {catburglar=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 20,
	cost = 40,
	wielder = {
		resists={
			[DamageType.DARKNESS] = resolvers.mbonus_material(15, 10),
		},
		inc_stats = {
			[Stats.STAT_DEX] = resolvers.mbonus_material(7, 3),
		},
		infravision = resolvers.mbonus_material(6, 2),
	},
}

newEntity{
	power_source = {arcane=true},
	name = " of blood magic", suffix=true, instant_resolve=true,
	keywords = {blood=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 100,
	wielder = {
		inc_stats = {
			[Stats.STAT_MAG] = resolvers.mbonus_material(5, 3),
			[Stats.STAT_WIL] = resolvers.mbonus_material(5, 3),
		},
		combat_spellcrit = resolvers.mbonus_material(4, 1),
		inc_damage = {
			[DamageType.BLIGHT] = resolvers.mbonus_material(15, 5),
			[DamageType.ARCANE] = resolvers.mbonus_material(15, 5),
		},
	},
}

newEntity{
	power_source = {nature=true},
	name = " of fortune", suffix=true, instant_resolve=true,
	keywords = {fortune=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 40,
	wielder = {
		inc_stats = {
			[Stats.STAT_LCK] = resolvers.mbonus_material(12, 5),
		},
		combat_physcrit = resolvers.mbonus_material(6, 2),
		combat_spellcrit = resolvers.mbonus_material(6, 2),
		combat_mindcrit = resolvers.mbonus_material(6, 2),
	},
}

newEntity{
	power_source = {arcane=true},
	name = " of sanctity", suffix=true, instant_resolve=true,
	keywords = {sanctity=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 30,
	cost = 60,
	resolvers.charmt(Talents.T_CIRCLE_OF_SANCTITY, {2,3,4}, 30),
	wielder = {
		resists={
			[DamageType.BLIGHT] = resolvers.mbonus_material(10, 5),
			[DamageType.DARKNESS] = resolvers.mbonus_material(10, 5),
		},
		combat_spellresist = resolvers.mbonus_material(10, 5),
		combat_mentalresist = resolvers.mbonus_material(10, 5),
	},
}

newEntity{
	power_source = {technique=true},
	name = " of ire", suffix=true, instant_resolve=true,
	keywords = {ire=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 20,
	cost = 40,
	resolvers.charmt(Talents.T_BATTLE_CRY, 2, 28),
	wielder = {
		inc_stats = {
			[Stats.STAT_STR] = resolvers.mbonus_material(5, 1),
			[Stats.STAT_CON] = resolvers.mbonus_material(5, 1),
		},
		combat_mentalresist = resolvers.mbonus_material(10, 5),
		combat_physresist = resolvers.mbonus_material(10, 5),
	},
}

newEntity{
	power_source = {technique=true},
	name = "bladed ", prefix=true, instant_resolve=true,
	keywords = {bladed=true},
	level_range = {15, 50},
	greater_ego = 1,
	rarity = 15,
	cost = 20,
	skullcracker_mult = resolvers.mbonus_material(2, 1),
	resolvers.charmt(Talents.T_SKULLCRACKER, 3, 20),
	wielder = {
		inc_stats = {
			[Stats.STAT_STR] = resolvers.mbonus_material(10, 2),
		},
	},
}

newEntity{
	power_source = {technique=true},
	name = " of the bounder", suffix=true, instant_resolve=true,
	keywords = {bounder=true},
	level_range = {30, 50},
	greater_ego = 1,
	rarity = 17,
	cost = 50,
	skullcracker_mult = resolvers.mbonus_material(2, 1),
	resolvers.charmt(Talents.T_SKULLCRACKER, 3, 20),
	wielder = {
		inc_stats = {
			[Stats.STAT_STR] = resolvers.mbonus_material(4, 5),
			[Stats.STAT_DEX] = resolvers.mbonus_material(4, 5),
		},
	},
}
