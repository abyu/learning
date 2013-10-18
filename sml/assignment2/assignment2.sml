(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun delete_from_list(str : string, strings : string list)=
    case strings of
	[] => []
      | x::xs' => if(same_string(str, x)) 
		  then delete_from_list(str, xs')
		  else x::delete_from_list(str, xs') 

fun contains_str(str : string, strings : string list) = 
    case strings of
	[] => false
     | x::xs' => same_string(str, x) orelse contains_str(str, xs')  
    

(* put your solutions for problem 1 here *)
fun all_except_option(str : string, strings : string list) =
    if(contains_str(str, strings)) 
    then SOME (delete_from_list(str, strings))
    else NONE


(* you may assume that Num is always used with values 2, 3, ..., 10
   though it will not really come up *)
datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove

(* put your solutions for problem 2 here *)
