val strings_with_first_letter_capital_case = only_capitals ["Hello", "hi", "World", "home", "good"] = ["Hello", "World"]

val return_longest_string_in_given_list = longest_string1 ["123456", "12345678", "1244"] = "12345678"

val return_first_longest_string_in_given_list = longest_string1 ["123", "123455", "12312", "123456"] = "123455"

val return_last_longest_string_in_given_list = longest_string2 ["123", "123455", "12312", "123456"] = "123456"

val return_first_longest_string_in_given_list_v2 = longest_string3 ["123", "123455", "12312", "123456"] = "123455"

val return_last_longest_string_in_given_list_v2 = longest_string4 ["123", "123455", "12312", "123456"] = "123456"

val return_longest_capitalized = longest_capitalized ["Hello", "hi", "World", "home", "Good"] = "Hello"

val return_empty_when_no_capitalized_strings_found = longest_capitalized ["hello", "hi", "world", "home"] = ""

val reverse_a_string = rev_string "abcde" = "edcba"
