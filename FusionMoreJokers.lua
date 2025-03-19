--- STEAMODDED HEADER
--- MOD_NAME: Fusion More Jokers
--- MOD_ID: FusionMoreJokers
--- MOD_AUTHOR: [Katna, Lemon]
--- MOD_DESCRIPTION: Adds the ability to fuse jokers into special new jokers!--requires FusionJokers to be loaded
--- BADGE_COLOUR: B26CBB
--- VERSION: 0.1
--- PRIORITY: -10000
----------------------------------------------
------------MOD CODE -------------------------

local FusionMoreJokers = {}
FusionMoreJokers.fusions = {
	{ jokers = {
		{ name = "j_runner", carry_stat = nil, extra_stat = false },
		{ name = "j_shortcut", carry_stat = nil, extra_stat = false }
	}, result_joker = "j_speedrun", cost = 5 },
}
function SMODS.INIT.FusionMoreJokers()
    --requires FusionJokers to be loaded
    if SMODS.INIT.FusionJokers then
    	local mod_id = "FusionMoreJokers"
    	local mod_obj = SMODS.findModByID(mod_id)
    	
    	table.insert(G.P_JOKER_RARITY_POOLS, {})
    	table.insert(G.C.RARITY, HEX("F7D762"))
    
    	loc_colour("mult", nil)
        G.ARGS.LOC_COLOURS["fusion"] = G.C.RARITY[5]
        
        for _, fusion in ipairs(FusionMoreJokers.fusions) do
            table.insert(FusionJokers.fusions, fusion)
        end
    
    	--j_speedrun
    	local speedrun_def = {
    		name = "Speedrun",
    		text = {"Allows {C:attention}Straights{} to be",
            		"made with gaps of {C:attention}1 rank",
                	"Gains {C:red}+#2#{} if played hand contains a Straight",
			"{C:inactive}(Currently {C:red}+#1#{C:inactive} Mult)",
    			"{C:inactive}(#3# + #4#)"
			}
    	}
    	
    	local speedrun = SMODS.Joker:new("Speedrun", "speedrun", {extra = {mult = 15, mult_add = 3, joker1 = "j_runner", joker2 = "j_shortcut"
    	}}, { x = 0, y = 0 }, speedrun_def, 5, 12, true, false, false, true)
    	SMODS.Sprite:new("j_speedrun", mod_obj.path, "j_speedrun.png", 71, 95, "asset_atli"):register();
    	speedrun:register()
    
    	function SMODS.Jokers.j_speedrun.loc_def(card)
    		return {card.ability.mult, card.ability.mult_add,
    		localize{type = 'name_text', key = card.ability.extra.joker1, set = 'Joker'}, 
    		localize{type = 'name_text', key = card.ability.extra.joker2, set = 'Joker'}}
    	end
end

	----------------------------------------------
	----------------------------------------------

end

----------------------------------------------
------------MOD CODE END----------------------
