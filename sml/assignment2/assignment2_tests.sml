val delete_given_str_from_list = delete_from_list("b", ["a", "b", "c"])  = 
["a", "c"]

val nothing_is_deleting_when_str_is_not_in_list = delete_from_list("k", ["a", "b", "c"]) = ["a", "b", "c"]

val return_true_when_a_str_is_present_in_list = contains_str("b", ["a", "b", "c"]) = true (* for consistency, doing a boolean comparision *)

val return_false_when_a_str_is_not_present_in_list = contains_str("r", ["a", "b", "c"]) = false

val some_of_strings_ignoring_the_present_given_str_is_returned = all_except_option("r", ["s", "r",  "k", "k"]) = SOME ["s", "k", "k"]

val none_is_returned_when_given_str_is_not_present_in_list = all_except_option("o", ["s", "r", "k", "k"]) = NONE

val substitution_strings = [["Fred", "Fredrick"], ["Freddie", "Fred", "F"], ["Elizabeth", "Betty"]] 

val all_the_substitutions_ignoring_orign_string_is_returned = get_substitutions1(substitution_strings, "Fred") = ["Fredrick", "Freddie", "F"]

val empty_list_when_no_substitutions_found = get_substitutions1(substitution_strings, "Me") = []

val tr_all_the_substitutions_ignoring_orign_string_is_returned = get_substitutions2(substitution_strings, "Fred") = ["Fredrick", "Freddie", "F"]

val tr_empty_list_when_no_substitutions_found = get_substitutions2(substitution_strings, "Me") = []

val names_list_with_substituted_first_names_is_returned = similar_names(substitution_strings, {first="Fred", last="Smith", middle="W"}) = [{first="Fred", last="Smith", middle="W"},
                    {first="Fredrick", last="Smith", middle="W"},
                    {first="Freddie", last="Smith", middle="W"},
                    {first="F", last="Smith", middle="W"}]

val spades_are_black = card_color (Spades, Num 1)

val hearts_are_red = card_color (Hearts, Num 2)

val card_with_num_2_has_value_2 = card_value (Clubs, Num 2) = 2

val ace_has_value_11 = card_value (Diamonds, Ace) = 11

val jack_has_value_10 = card_value (Spades, Jack) = 10

exception Dummy
val cards = [(Spades, Num 2), (Spades, Ace), (Spades, Num 3), (Diamonds, Ace), (Hearts, Jack), (Spades, Ace), (Spades, King)]
val remove_card_from_list_only_once_eventhough_when_present_lots = remove_card (cards, (Spades, Ace), Dummy) = [(Spades, Num 2), (Spades, Num 3), (Diamonds, Ace), (Hearts, Jack), (Spades, Ace), (Spades, King)] 

val raise_exception_when_card_is_not_present = (remove_card(cards, (Clubs, Ace), Dummy); false) handle Dummy => true

val all_cards_have_dont_have_same_color = all_same_color cards = false

val same_colored_cards = [(Spades, Num 2), (Spades, Ace), (Spades, Num 3), (Spades, Jack), (Spades, Ace), (Spades, King)]

val all_card_have_same_color = all_same_color same_colored_cards

val cards_have_total_sum_of_58 = sum_cards cards = 58

val held_cards = [(Spades, Num 2), (Spades, Ace), (Diamonds, Num 3)]
val score_is_3_times_the_diff_when_not_same_colored_cards_value_is_more_than_goal = score(held_cards, 14) = 6
val score_is_just_the_diff_when_not_same_colored_cards_value_is_less_than_goal = score(held_cards, 18) = 2

val held_cards = [(Spades, Num 2), (Spades, Ace), (Spades, Num 3)]
val score_is_1_with_same_colored_held_cards_with_value_one_more_than_goal = score(held_cards, 15) = 1 
val score_is_1_when_not_same_colored = score((Diamonds, Num 2)::held_cards, 17) = 3

val cards = [(Spades, Num 2), (Hearts, Ace), (Spades, Num 3), (Diamonds, Num 2), (Spades, Ace), (Spades, Num 3)]
val moves = [Draw, Draw, Discard (Spades, Num 2), Draw]
val game_play_scoring_3 = officiate(cards, moves, 13) = 3
