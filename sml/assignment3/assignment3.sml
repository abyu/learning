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

fun longer_string_first(str1,str2) = if String.size str2 >= String.size str1 then str2 else str1	
fun longer_string_last(str1,str2) = longer_string_first(str2,str1)

fun longest_string1(strings) = 	List.foldl longer_string_first "" strings 

fun longest_string2(strings) =	List.foldl longer_string_last "" strings 
    
