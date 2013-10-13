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

val get_the_2nd_string_in_3_string_list = get_nth(["string one", "string two", "string three"], 2) = "string two"

val return_empty_string_with_too_few_strings = get_nth(["string one"], 4) = ""

val date_is_displayed_as_string = date_to_string(2012, 12, 21) = "December 21, 2012"

val number_of_items_in_list_summing_to_less_than_given_sum = number_before_reaching_sum(10, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) = 3

val number_of_items_in_list_summing_to_less_than_given_sum_sanity2  = number_before_reaching_sum(10, [5, 5, 3, 4, 5, 6, 7, 8, 9, 10]) = 1

val number_1_is_in_month_1 = what_month(1)  = 1

val number_31_is_in_month_1 = what_month(31) = 1

val number_59_is_in_month_2 = what_month(59) = 2

val number_60_is_in_month_3 = what_month(60) = 3

val number_365_is_in_month_12 = what_month(365) = 12

val months_1_and_2_between_days_31_and_32 = month_range(31, 32) = [1, 2] 

val jan_1_2012_is_older_than_2014_and_2103 = oldest([(2014, 1, 1), (2012, 1, 1), (2013, 1, 1)]) = SOME (2012, 1, 1)

val NONE_is_older_in_empty_date_list = oldest([]) = NONE

val three_dates_with_months_5_3_8_are_present_even_repeated_months = number_in_months_challenge([(2102, 3, 3), (2123, 3, 4), (2133, 5, 3)], [5, 5, 3, 3, 8, 8]) = 3;

val three_dates_are_in_months_3_5_8_even_repeated_months = dates_in_months_challenge([(2102, 3, 3), (2123, 3, 4), (2133, 5, 3), (2013, 10, 2)], [3, 3, 5, 5, 8, 8]) = [(2102, 3, 3), (2123, 3, 4), (2133, 5, 3)]

val feb_3_2013_is_a_resonable_date = resonable_date(2013, 2 ,3) = true;
val feb_29_2013_is_not_a_resonable_date = resonable_date(2013, 2 ,29) = false;
val feb_3_2012_is_a_resonable_date = resonable_date(2012, 2 ,29) = true;
val feb_3_2100_is_not_a_resonable_date = resonable_date(2100, 2 ,29) = false;
val dec_12_2012_is_a_resonable_date = resonable_date(2012, 12, 21) = true;
