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

--updated 7:33 PM 1/28/2010

local Talents = require("engine.interface.ActorTalents")

newEntity{
	define_as = "BASE_NPC_INSECT",
	type = "insect", subtype = "swarms",
	display = "I", color=colors.WHITE,
	can_multiply = 2,
	desc = _t"Buzzzzzzzzzzzzzzzzzzzzzzzzzzz.",
	body = { INVEN = 1 },
	autolevel = "warrior",
	sound_moam = {"creatures/swarm/mswarm_%d", 1, 4},
	sound_die = "creatures/swarm/mswarm_die",
	sound_random = {"creatures/swarm/mswarm_%d", 1, 4},
	combat = {sound={"creatures/swarm/mswarm_%d", 1, 4}, sound_miss={"creatures/swarm/mswarm_%d", 1, 4}},
	ai = "dumb_talented_simple", ai_state = { ai_move="move_complex", talent_in=1, },
	stats = { str=1, dex=20, mag=3 },
	global_speed_base = 2,
	rnd_boss_init = function(self, data)
		self.inc_damage.all = (self.inc_damage.all or 0) - 30  -- Compensate for high global speed
	end,
	infravision = 10,
	combat_armor = 1, combat_def = 10,
	rank = 1,
	size_category = 1,
	cut_immune = 1,
	levitation = 1,
	not_power_source = {arcane=true, technique_ranged=true},
}

newEntity{ base = "BASE_NPC_INSECT",
	name = "midge swarm", color=colors.UMBER, image="npc/midge_swarm.png",
	desc = _t"A swarm of midges; they want blood.",
	level_range = {1, 25}, exp_worth = 1,
	rarity = 1,
	max_life = resolvers.rngavg(1,2),
	combat = { dam=1, atk=0, apr=20 },
	resolvers.talents{
		[Talents.T_HEIGHTENED_REFLEXES]={base=0, every=5, max=5},
	},
}

newEntity{ base = "BASE_NPC_INSECT",
	name = "bee swarm", color=colors.GOLD, image="npc/bee_swarm.png",
	desc = _t"They buzz at you threateningly, as you have gotten too close to their hive.",
	level_range = {2, 25}, exp_worth = 1,
	rarity = 1,
	max_life = resolvers.rngavg(1,3),
	combat = { dam=2, atk=0, apr=20 },

	resolvers.talents{
		[Talents.T_BITE_POISON]={base=1, every=5, max=8},
		[Talents.T_HEIGHTENED_REFLEXES]={base=0, every=5, max=5},
	},
}

newEntity{ base = "BASE_NPC_INSECT",
	name = "hornet swarm", color=colors.YELLOW, image="npc/hornet_swarm.png",
	desc = _t"You have intruded on their ground, and they will defend it at all costs.",
	sound_moam = {"creatures/bee/bee_%d", 1, 4},
	sound_die = "creatures/bee/bee_die",
	sound_random = {"creatures/bee/bee_%d", 1, 4},
	level_range = {3, 25}, exp_worth = 1,
	rarity = 1,
	max_life = resolvers.rngavg(3,5),
	combat = { dam=5, atk=5, apr=20 },

	resolvers.talents{
		[Talents.T_BITE_POISON]={base=2, every=5, max=8},
		[Talents.T_HEIGHTENED_REFLEXES]={base=0, every=5, max=5},
	},
}

newEntity{ base = "BASE_NPC_INSECT",
	name = "hummerhorn", color=colors.YELLOW, image="npc/hummerhorn.png",
	desc = _t"A giant buzzing wasp, its stinger dripping venom.",
	sound_moam = {"creatures/bee/bee_%d", 1, 4},
	sound_die = "creatures/bee/bee_die",
	sound_random = {"creatures/bee/bee_%d", 1, 4},
	level_range = {16, nil}, exp_worth = 1,
	rarity = 4,
	max_life = resolvers.rngavg(5,7),
	combat = { dam=10, atk=15, apr=20 },
	can_multiply = 4,

	resolvers.talents{
		[Talents.T_BITE_POISON]={base=3, every=10, max=8},
		[Talents.T_HEIGHTENED_REFLEXES]={base=0, every=5, max=5},
		[Talents.T_POISONOUS_SPORES]={base=0, every=15, max=2},
	},
	ingredient_on_death = "HUMMERHORN_WING",
}
