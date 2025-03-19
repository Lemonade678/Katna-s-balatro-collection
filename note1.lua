#splash + tsunami
SMODS.Joker {
	key = "raft",
	name = "Raft",
	rarity = "fusion",
	unlocked = true,
	discovered = true,
	blueprint_compat = true,
	atlas = "Tsunami",
	pos = { x = 0, y = 11 },
	cost = 8,
	config = { extra = 5 },
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra } }
	end,
	ability_name = "raft",
	calculate = function(self, card, context)
		if context.individual and context.cardarea == G.play then
			context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
			context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra
			card_eval_status_text(context.other_card, 'extra', nil, nil, nil,
				{ message = localize('k_upgrade_ex'), colour = G.C.CHIPS })

			if card_is_splashed(context.other_card) == true then
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
				context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + card.ability.extra
				return {
					extra = { message = "Raft!", colour = G.C.CHIPS },
					colour = G.C.CHIPS,
					card = card
				}
			end
		end
	end
}

FusionJokers.fusions:add_fusion("j_splash", nil, false, "j_hiker", nil, false, "j_tsun_raft", 10)
