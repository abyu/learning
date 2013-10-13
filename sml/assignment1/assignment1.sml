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

fun number_before_reaching_sum(sum : int, values : int list) = 
    if sum <= hd values
    then 0
    else 1 + number_before_reaching_sum(sum - hd values, tl values)
			      
fun what_month(day : int) = 
    let 
	val month_days = [31, 28, 31, 30, 31,  30, 31, 31, 30, 31, 30, 31];						     
    in 
	number_before_reaching_sum(day, month_days) + 1
    end

fun month_range(day1 : int, day2 : int) = 
    if day1 > day2 
    then []
    else
	what_month(day1) :: month_range(day1 + 1, day2)

fun oldest(dates : (int*int*int) list) = 
    if null dates
    then NONE
    else
	let val oldest_tl = oldest(tl dates)
	in
	    if isSome oldest_tl andalso (not (is_older(hd dates, valOf oldest_tl))) 
	    then oldest_tl 
	    else SOME (hd dates)
	end

fun contains(number : int, numbers : int list) =
    if null numbers 
    then false 
    else 
	if number = hd numbers
	then true
	else contains(number, tl numbers)

fun remove_duplicates(numbers : int list) =
    if null numbers then []
    else 
	if contains(hd numbers, tl numbers) 
	then remove_duplicates (tl numbers)
	else hd numbers :: remove_duplicates (tl numbers)
	    
fun number_in_months_challenge(dates : (int*int*int) list, months : int list) =
    number_in_months(dates, remove_duplicates months)

fun dates_in_months_challenge(dates : (int*int*int) list, months : int list) = 
    dates_in_months(dates, remove_duplicates months)


fun resonable_date(date : (int*int*int)) = 
    let
	val leap_and_nonleap_years_months = ([31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31],  [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]);
	val year = #1 date;
	val month = #2 date;
	val day = #3 date;
	fun get_nth(values : int list, n : int) =
	    if null values
	    then 0
	    else
		(if n = 1
		then hd values
		else get_nth(tl values, n - 1))	    
	
	fun year_type() =
	    if year < 0 then NONE
	    else 
		if ((year mod 400) = 0 orelse ((year mod 4) = 0 andalso (not ((year mod 100) = 0)))) 
		then SOME 1 
		else SOME 2
	
	fun months() = 
	    if (isSome (year_type())) 
	    then SOME (if (valOf (year_type())) = 1 then #1 leap_and_nonleap_years_months else #2 leap_and_nonleap_years_months) 
	    else NONE			     
	
    in
	if (isSome (months())) andalso day <= get_nth((valOf (months())), month)
	then true  
	else false
    end	
