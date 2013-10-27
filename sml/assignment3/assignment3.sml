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
