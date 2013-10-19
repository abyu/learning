(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun delete_from_list(str, strings)=
    case strings of
	[] => []
      | x::xs' => if(same_string(str, x))
		  then delete_from_list(str, xs')
		  else x::delete_from_list(str, xs')

fun contains_str(str , strings) =
    case strings of
	[] => false
     | x::xs' => same_string(str, x) orelse contains_str(str, xs')

(* put your solutions for problem 1 here *)
fun all_except_option(str , strings) =
    if(contains_str(str, strings))
    then SOME (delete_from_list(str, strings))
    else NONE

fun get_substitutions1(substitutions, str) =
    let
	fun to_list(ol) =
	    case ol of
		NONE => []
	     | SOME x => x
    in
	case substitutions of
	    [] => []
	  | x::xs' => to_list(all_except_option(str, x)) @ get_substitutions1(xs', str)
    end

fun get_substitutions2(substitutions, str) =
    let
	fun to_list(ol) =
	    case ol of
		NONE => []
	     | SOME x => x
	fun aux(substitutions, str, acc) =
	    case substitutions of
		[] => acc
	      | x::xs' => aux(xs', str, acc @ to_list(all_except_option(str, x)))

    in
	aux(substitutions, str, [])
    end


fun substitute_first(substitutes, {first=f, middle=m, last=l}) =
    case substitutes of
	[] => []
      | x::xs' => {first=x, middle=m, last=l}::substitute_first(xs', {first=f, middle=m, last=l})

fun similar_names(substitutions, {first=f, middle=m, last=l}) =
    let
	val substitutes = get_substitutions2(substitutions, f)
    in
	{first=f, middle=m, last=l}::substitute_first(substitutes , {first=f, middle=m, last=l})
    end

(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw

exception IllegalMove

(* put your solutions for problem 2 here *)

fun card_color acard =
    case acard of
	(Hearts, _) => Red
     | (Diamonds, _) => Red
     | (Clubs, _) => Black
     | (Spades, _) => Black
 
fun card_value acard =
    case acard of
	(_, Num x) => x
     | (_, Ace) => 11
     | _ => 10

fun remove_card(cards, c, e) =
    case cards of
	[] => raise e
     | x::xs' => if c=x then xs' else x::remove_card(xs', c, e)

fun all_same_color cards =
    case cards of
	[] => true
     | c::[] => true
     | c1::c2::xs' => card_color(c1) = card_color(c2) andalso all_same_color(c2::xs')

fun sum_cards cards =
    let
	fun sum_with_accum(cards, acc) =
	    case cards of
		[] => acc
	     | x::xs' => sum_with_accum(xs', card_value(x) + acc)
    in
	sum_with_accum(cards, 0)
    end
