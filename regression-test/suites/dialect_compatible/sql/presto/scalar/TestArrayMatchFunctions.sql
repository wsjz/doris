set sql_dialect='presto';
set enable_fallback_to_original_planner=false;
set debug_skip_fold_constant=false;
-- SELECT all_match(ARRAY[5, 7, 9], x -> x % 2 = 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[5, 7, 9], x -> x % 2 = 1);	                        ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[true, false, true], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[true, false, true], x -> x);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY['abc', 'ade', 'afg'], x -> substr(x, 1, 1) = 'a'); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY['abc', 'ade', 'afg'], x -> substr...	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[], x -> true); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[], x -> true);	                       ^	Encountered: ]	Expected: IDENTIFIER	
-- SELECT all_match(ARRAY[true, true, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[true, true, NULL], x -> x);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[true, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[true, false, NULL], x -> x);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[NULL, NULL, NULL], x -> x > 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[NULL, NULL, NULL], x -> x > 1);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[NULL, NULL, NULL], x -> x IS NULL); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[NULL, NULL, NULL], x -> x IS NULL);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[1,2,3], ARRAY[3,4,5])], x -> cardinality(x) > 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	...ll_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[TIMESTAMP '2020-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:34:56.123456789'], t -> month(t) = 5); # error: errCode = 2, detailMessage = Syntax error in line 1:	...-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:3...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[5, 8, 10], x -> x % 2 = 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[5, 8, 10], x -> x % 2 = 1);	                        ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[false, false, false], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[false, false, false], x -> x);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY['abc', 'def', 'ghi'], x -> substr(x, 1, 1) = 'a'); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY['abc', 'def', 'ghi'], x -> substr...	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[], x -> true); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[], x -> true);	                       ^	Encountered: ]	Expected: IDENTIFIER	
-- SELECT any_match(ARRAY[false, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[false, false, NULL], x -> x);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[true, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[true, false, NULL], x -> x);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[NULL, NULL, NULL], x -> x > 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[NULL, NULL, NULL], x -> x > 1);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[true, false, NULL], x -> x IS NULL); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[true, false, NULL], x -> x IS NULL);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[1,2,3], ARRAY[3,4,5])], x -> cardinality(x) > 4); # error: errCode = 2, detailMessage = Syntax error in line 1:	...ny_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[TIMESTAMP '2020-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:34:56.123456789'], t -> year(t) = 2020); # error: errCode = 2, detailMessage = Syntax error in line 1:	...-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:3...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[5, 8, 10], x -> x % 2 = 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[5, 8, 10], x -> x % 2 = 1);	                         ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[false, false, false], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[false, false, false], x -> x);	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY['abc', 'def', 'ghi'], x -> substr(x, 1, 1) = 'a'); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY['abc', 'def', 'ghi'], x -> substr...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[], x -> true); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[], x -> true);	                        ^	Encountered: ]	Expected: IDENTIFIER	
-- SELECT none_match(ARRAY[false, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[false, false, NULL], x -> x);	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[true, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[true, false, NULL], x -> x);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[NULL, NULL, NULL], x -> x > 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[NULL, NULL, NULL], x -> x > 1);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[true, false, NULL], x -> x IS NULL); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[true, false, NULL], x -> x IS NULL);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[1,2,3], ARRAY[3,4,5])], x -> cardinality(x) > 4); # error: errCode = 2, detailMessage = Syntax error in line 1:	...ne_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[TIMESTAMP '2020-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:34:56.123456789'], t -> month(t) = 10); # error: errCode = 2, detailMessage = Syntax error in line 1:	...-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:3...	                             ^	Encountered: COMMA	Expected: ||	
set debug_skip_fold_constant=true;
-- SELECT all_match(ARRAY[5, 7, 9], x -> x % 2 = 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[5, 7, 9], x -> x % 2 = 1);	                        ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[true, false, true], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[true, false, true], x -> x);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY['abc', 'ade', 'afg'], x -> substr(x, 1, 1) = 'a'); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY['abc', 'ade', 'afg'], x -> substr...	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[], x -> true); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[], x -> true);	                       ^	Encountered: ]	Expected: IDENTIFIER	
-- SELECT all_match(ARRAY[true, true, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[true, true, NULL], x -> x);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[true, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[true, false, NULL], x -> x);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[NULL, NULL, NULL], x -> x > 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[NULL, NULL, NULL], x -> x > 1);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[NULL, NULL, NULL], x -> x IS NULL); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT all_match(ARRAY[NULL, NULL, NULL], x -> x IS NULL);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[1,2,3], ARRAY[3,4,5])], x -> cardinality(x) > 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	...ll_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT all_match(ARRAY[TIMESTAMP '2020-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:34:56.123456789'], t -> month(t) = 5); # error: errCode = 2, detailMessage = Syntax error in line 1:	...-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:3...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[5, 8, 10], x -> x % 2 = 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[5, 8, 10], x -> x % 2 = 1);	                        ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[false, false, false], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[false, false, false], x -> x);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY['abc', 'def', 'ghi'], x -> substr(x, 1, 1) = 'a'); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY['abc', 'def', 'ghi'], x -> substr...	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[], x -> true); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[], x -> true);	                       ^	Encountered: ]	Expected: IDENTIFIER	
-- SELECT any_match(ARRAY[false, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[false, false, NULL], x -> x);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[true, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[true, false, NULL], x -> x);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[NULL, NULL, NULL], x -> x > 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[NULL, NULL, NULL], x -> x > 1);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[true, false, NULL], x -> x IS NULL); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT any_match(ARRAY[true, false, NULL], x -> x IS NULL);	                           ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[1,2,3], ARRAY[3,4,5])], x -> cardinality(x) > 4); # error: errCode = 2, detailMessage = Syntax error in line 1:	...ny_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT any_match(ARRAY[TIMESTAMP '2020-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:34:56.123456789'], t -> year(t) = 2020); # error: errCode = 2, detailMessage = Syntax error in line 1:	...-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:3...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[5, 8, 10], x -> x % 2 = 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[5, 8, 10], x -> x % 2 = 1);	                         ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[false, false, false], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[false, false, false], x -> x);	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY['abc', 'def', 'ghi'], x -> substr(x, 1, 1) = 'a'); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY['abc', 'def', 'ghi'], x -> substr...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[], x -> true); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[], x -> true);	                        ^	Encountered: ]	Expected: IDENTIFIER	
-- SELECT none_match(ARRAY[false, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[false, false, NULL], x -> x);	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[true, false, NULL], x -> x); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[true, false, NULL], x -> x);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[NULL, NULL, NULL], x -> x > 1); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[NULL, NULL, NULL], x -> x > 1);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[true, false, NULL], x -> x IS NULL); # error: errCode = 2, detailMessage = Syntax error in line 1:	SELECT none_match(ARRAY[true, false, NULL], x -> x IS NULL);	                            ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[1,2,3], ARRAY[3,4,5])], x -> cardinality(x) > 4); # error: errCode = 2, detailMessage = Syntax error in line 1:	...ne_match(ARRAY[MAP(ARRAY[1,2], ARRAY[3,4]), MAP(ARRAY[...	                             ^	Encountered: COMMA	Expected: ||	
-- SELECT none_match(ARRAY[TIMESTAMP '2020-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:34:56.123456789'], t -> month(t) = 10) # error: errCode = 2, detailMessage = Syntax error in line 1:	...-05-10 12:34:56.123456789', TIMESTAMP '1111-05-10 12:3...	                             ^	Encountered: COMMA	Expected: ||	