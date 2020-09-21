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

local layout = game.state:alternateZoneTier1(short_name, {"ALT1", 1})

return {
	name = _t"Ruined Dungeon",
	level_range = {10, 30},
	level_scheme = "player",
	max_level = 1,
	actor_adjust_level = function(zone, level, e) return math.floor((zone.base_level + level.level-1) * 1.2) + e:getRankLevelAdjust() + rng.range(-1,2) end,
	width = 50, height = 50,
--	all_remembered = true,
--	all_lited = true,
	persistent = "zone",
	ambient_music = "Far away.ogg",
	min_material_level = 2,
	max_material_level = 3,
	clues_layout = layout,
	generator =  {
		map = {
			class = "engine.generator.map.Static",
			map = "zones/ruined-dungeon",
		},
		actor = {
			class = "mod.class.generator.actor.Random",
			nb_npc = {60, 60},
		},
		object = {
			class = "engine.generator.object.Random",
			nb_object = {6, 6},
		},
		trap = {
			class = "engine.generator.trap.Random",
			nb_trap = {0, 0},
		},
	},
	sequence_failures = 0,
	post_process = function(level)
		-- Everything hates you in the infinite dungeon!
		for uid, e in pairs(level.entities) do e.faction="enemies" end

		level.orbs_touched = {}

		-- Randomly assign portal types
		local types = ({
			DEFAULT = {"wind", "earth", "fire", "water", "arcane", "nature"},
			ALT1    = {"darkness", "blood", "time", "ice", "mind", "blight"},
		})[game.zone.clues_layout]
		local _, portals = level:pickSpot{type="portal", subtype="portal"}
		for i, spot in ipairs(portals) do
			local g = level.map(spot.x, spot.y, engine.Map.TERRAIN)
			g.portal_type = rng.tableRemove(types)
		end

		-- Setup no teleport
		for _, z in ipairs(level.custom_zones) do
			if z.type == "no-teleport" then
				for x = z.x1, z.x2 do for y = z.y1, z.y2 do
					game.level.map.attrs(x, y, "no_teleport", true)
				end end
			end
		end

		-- Pop guardians
		local guardian_filter = {not_properties = {"unique"}, random_elite={name_scheme=_t"#rng# the Guardian", on_die=function(self)
			local spot = game.level:pickSpotRemove{type="portal", subtype="portal"}
			if spot then
				game.level.map(spot.x, spot.y, engine.Map.TERRAIN).orb_allowed = true
				require("engine.ui.Dialog"):simplePopup(_t"Guardian", _t"You can hear a magical trigger firing off.")
			end
		end}, add_levels=5}
		local _, guardians = level:pickSpot{type="spawn", subtype="guardian"}
		for i, spot in ipairs(guardians) do
			while true do
				local m = game.zone:makeEntity(level, "actor", guardian_filter, nil, true)
				if m and not m.can_pass.pass_wall then
					game.zone:addEntity(level, m, "actor", spot.x, spot.y)
					break
				end
			end
		end
	end,
	touch_orb = function(type, sx, sy)
		if game.level.orbs_used then return end

		local Dialog = require("engine.ui.Dialog")
		local order = ({
			DEFAULT = {"water", "earth", "wind", "nature", "arcane", "fire"},
			ALT1    = {"darkness", "blood", "time", "ice", "mind", "blight"},
		})[game.zone.clues_layout]
		local o = game.level.orbs_touched
		o[#o+1] = type
		for i = 1, #o do
			-- Failed!
			if o[i] ~= order[i] then
				game.level.data.sequence_failures = game.level.data.sequence_failures + 1
				local sequence_failures = game.level.data.sequence_failures
				game.level.orbs_touched = {}
				if sequence_failures<4 then Dialog:simplePopup(_t"Strange Orb", _t"The orb seems to react badly to your touch; there is a high shriek!")
				elseif sequence_failures<6 then Dialog:simplePopup(_t"Strange Orb", _t"The orb burns to your touch and a loud shout screams out!")
				else Dialog:simplePopup(_t"Strange Orb", _t"The orb reacts violently to your touch and the walls begin to rumble!") end
				local random_elite = 0
				for i = 1, 4 do
					-- Find space
					local x, y = util.findFreeGrid(sx, sy, 10, true, {[game.level.map.ACTOR]=true})
					if not x then
						break
					end
					
					local filter = {}
					if sequence_failures >= 10 and random_elite < 1 then filter = {random_boss = {power_source = {nature=true, psionic=true, technique=true}, nb_classes=5, rank = 10, loot_quantity=0, no_loot_randart=true}} random_elite = random_elite + 1
					elseif sequence_failures >= 9 and random_elite < 1 then filter = {random_boss = {power_source = {nature=true, psionic=true, technique=true}, nb_classes=4, rank = 5, loot_quantity=0, no_loot_randart=true}} random_elite = random_elite + 1
					elseif sequence_failures >= 7 and random_elite < 1 then filter = {random_boss = {power_source = {nature=true, psionic=true, technique=true}, nb_classes=3, rank = 4, loot_quantity=0, no_loot_randart=true}} random_elite = random_elite + 1
					elseif sequence_failures >= 6 and random_elite < 1 then filter = {random_boss = {power_source = {nature=true, psionic=true, technique=true}, rank = 3.5, loot_quantity=0, no_loot_randart=true}} random_elite = random_elite + 1
					elseif sequence_failures >=4 and random_elite < 2 then filter = {random_elite = {power_source = {nature=true, psionic=true, technique=true}, loot_quantity=0, no_loot_randart=true}} random_elite = random_elite + 1
					end
					filter.add_levels = math.floor(5+1.5*sequence_failures^1.5)

					-- Find an actor with that filter
					local m = game.zone:makeEntity(game.level, "actor", filter)
					if m then
						m.exp_worth = 0
						m:emptyDrops()
						game.zone:addEntity(game.level, m, "actor", x, y)
						game.logSeen(m, "%s appears out of the thin air!", m.name:capitalize())
					end
				end
				return
			end
		end
		-- Success
		if #o == #order then
			Dialog:simplePopup(_t"Strange Orb", _t"The orb glows brightly. There is a loud crack coming from the northern central chamber.")
			local spot = game.level:pickSpot{type="door", subtype="sealed"}
			local g = game.zone:makeEntityByName(game.level, "terrain", "OLD_FLOOR")
			game.zone:addEntity(game.level, g, "terrain", spot.x, spot.y)
			game.level.orbs_used = true
		else
			Dialog:simplePopup(_t"Strange Orb", _t"The orb glows brightly.")
		end
	end,
}
