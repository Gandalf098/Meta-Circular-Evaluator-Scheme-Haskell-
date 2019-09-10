Here we see two versions of case of statement i haskell 

I wrote this specifically because:

	1. most haskell tuts doesn't show simple haskell constructs like these
	2. it makes lots of errors with beginners

in case_of_test.hs:
	you see simple case of (pattern matching) x on y
	in other words
		GHC matches x forms on the possible patterns (forms: types or values or other things)
	also the '_' means '*' like matches anything

in case_left.hs:
	we see another quitely popular (usually error handling) pattern matching 
	
	First line defines check type like this
	check [is a function] :: [of type] Int [takes Int] -> [produces] Either String [or] Int
	pretty straightforward huh LoL

anyway, some people maybe from python realm may think hah, this case of at main is used to correct;y print a vaule that might be a string or an integer

in fact to print either string or int in python:
	print (i)
	\#assuming i is the thing
but when you run actual code that manipulates i it is of vital important to have the correct type
so although this code may seem more work for the same or cumbersome in fact it is because a program that types what you give to it is useless
and whatever you right to python or haskell or else is always represented as [char] (charachter array)

lastly print function already checks the type of it's arg before printing (it transforms integer to ascii representation) so the argument is that python has a function that does your work means python has more lib but not better programming expressions

to conclude writing print function in haskell is way easier than in python

because of that expressive power 'Either' data constructor uses in it's definition
the type classes and data constructors along with kinds and etc.. in haskell allows for concise more disciplined better programming
