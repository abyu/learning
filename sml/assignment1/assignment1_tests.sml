val year_2013_is_older_than_2014 = is_older((2013, 2, 2), (2014, 2, 2)) = true

val month_2_is_older_than_3_on_same_year = is_older((2013, 2, 2), (2013, 3, 2)) = true

val day_2_is_older_than_3_on_same_month_year = is_older((2013, 2, 2), (2013, 2, 3)) = true

val same_dates_have_no_older_date = is_older((2013, 2, 2), (2013, 2, 2)) = false

val one_date_are_present_with_month_5 = number_in_month([(2102, 2, 3), (2123, 2, 4), (2133, 5, 3)], 5) = 1;

val two_dates_are_present_with_month_3 = number_in_month([(2102, 3, 3), (2123, 3, 4), (2133, 5, 3)], 3) = 2;

val no_dates_are_present_with_month_8 =  number_in_month([(2102, 2, 3), (2123, 2, 4), (2133, 5, 3)], 8) = 0;

val three_dates_with_months_5_3_8_are_present = number_in_months([(2102, 3, 3), (2123, 3, 4), (2133, 5, 3)], [5, 3, 8]) = 3;

val two_dates_are_in_month_2 = dates_in_month([(2102, 2, 3), (2123, 2, 4), (2132, 5, 3)], 2) = [(2102, 2, 3), (2123, 2, 4)]

val no_dates_are_in_month_6 = dates_in_month([(2102, 2, 3), (2123, 2, 4), (2132, 5, 3)], 6) = []

val three_dates_are_in_months_3_5_8 = dates_in_months([(2102, 3, 3), (2123, 3, 4), (2133, 5, 3), (2013, 10, 2)], [3, 5, 8]) = [(2102, 3, 3), (2123, 3, 4), (2133, 5, 3)]

val no_dates_are_in_month_8_6_7 =  dates_in_months([(2102, 3, 3), (2123, 3, 4), (2133, 5, 3), (2013, 10, 2)], [8, 6, 7]) = [] 
