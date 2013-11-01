(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(**** for the challenge problem only ****)

datatype typ = Anything
	     | UnitT
	     | IntT
	     | TupleT of typ list
	     | Datatype of string

(**** you can put all your code here ****)

fun only_capitals(strings) = List.filter(fn s => Char.isUpper(String.sub (s,0))) strings

fun longer_string_first(str1,str2) = if String.size str2 < String.size str1 then str1 else str2	
fun longer_string_last(str1,str2) = longer_string_first(str2,str1)

fun longest_string1 strings = List.foldl longer_string_first "" strings 

fun longest_string2 strings = List.foldl longer_string_last "" strings 
     
fun longest_string_helper f strings =  
    case strings of
	[] => ""
      | x::[] => x 
      | x::y::xs => longest_string_helper f ((if f(String.size y, String.size x) 
		     then y 
		     else x)::xs)

val longest_string3  = longest_string_helper (fn (x,y) => x > y) 
val longest_string4  = longest_string_helper (fn (x,y) => x >= y)

val longest_capitalized = longest_string1 o only_capitals

val rev_string = implode o rev o explode

fun first_answer f xs = 
    case xs of
	[] => raise NoAnswer
      | x::xs => case f x of
		    NONE => first_answer f xs
		  | SOME v => v 

fun all_answers f xs = 
    let
	fun compute f xs acc = 
	    case xs of
		[] => acc
	      | x::xs => case f x of
			     NONE => raise NoAnswer
			   | SOME v => compute f xs (acc @ v)
    in
	SOME (compute f xs []) handle NoAnswer => NONE
    end


fun count_wildcards p = g (fn () => 1) (fn x => 0) p;

fun count_wild_and_variable_lengths p = g (fn () => 1) (fn x => 1) p;

fun count_some_var (str, p) =g (fn () => 0) (fn x => (if str = x then 1 else 0)) check_string_count p;

fun check_pat p =
    let 
	val variables : string list ref = ref [];
	fun dups xs =
	    case xs of
		[] => true
	     | x::xs => not (List.exists (fn y => x=y) xs) andalso dups xs
    in	     
	g (fn () => 0) (fn x => (variables := !variables @ [x]; 0)) p; 
	dups (!variables)
    end
    

	
