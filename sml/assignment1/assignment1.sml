(* date format (yyyy, mm, dd) *)
fun is_older(date1 : (int*int*int), date2 : (int*int*int)) =
    if((#1 date1) < (#1 date2)) 
    then true
    else if((#1 date1) = (#1 date2) andalso (#2 date1) < (#2 date2)) 
         then true
	 else if((#1 date1) = (#1 date2) andalso (#2 date1) = (#2 date2) andalso (#3 date1) < (#3 date2)) 
         then true
	 else false	  

fun number_in_month(dates : (int*int*int) list, month : int) = 
    if null dates
    then 0
    else (if (#2 (hd dates) = month) 
         then 1
         else 0) + number_in_month(tl dates, month)

fun number_in_months(dates : (int*int*int) list, months : int list) = 
   if null months
   then 0
   else number_in_month(dates, hd months) + number_in_months(dates, tl months)
	 
fun dates_in_month(dates : (int*int*int) list, month : int) = 
    if null dates
    then []
    else if #2 (hd dates) = month then (hd dates)::dates_in_month(tl dates, month) else dates_in_month(tl dates, month)

fun dates_in_months(dates : (int*int*int) list, months : int list) = 
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(strings : string list, n : int) =
    if null strings
    then ""
    else
    if n = 1
    then hd strings
    else get_nth(tl strings, n - 1)

fun date_to_string(date : (int*int*int)) = 
    let
	val month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
	get_nth(month_names, #2 date) ^" "^ Int.toString (#3 date)^", " ^ Int.toString (#1 date)
    end