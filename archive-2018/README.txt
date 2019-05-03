# haskell
Learn Haskell
-> Haskell is a purely functional, lazy, statically typed programming language.
	-> Purely Functional
		-> functions are values 
		-> values 'never' change
	
	-> Lazy
		-> just means, it's non-strict -> not going to run unless you are deliberate
		-> helps to write some amazingly clean algorithms

	-> Statically Typed 
	

-> Why should you learn it?
	-> Its not really hard, just different 
	-> C-Engineering (language of OS(es) and low-level programming) -> bare metal|machine
	-> Java/C# (language of businesses) 
	-> Haskell (Mathematics) 
		-> Patient development 
		-> Strong theoretical roots (strong mathematical roots) 
			-> monads 
		-> Fosters innovation 
			-> crypto, cloud-computing
		-> Industrial strength 
		-> High Permomance
		-> Libraries 
		-> 3D Graphics

-> History 
	-> 1980s - many functional programming languages 
	-> 1987 - standardization committee formed
	-> 1990 - Haskell 1.0
	-> 1997 - Haskell 98 
	-> 2009 - Haskell 2010 
	-> Many compilers died -> but Glorious Glasgow Haskell Compiliation System (GHC) survived and emerged as the defacto compiler

-> Tools 
	-> Haskell Platform (install -> sudo apt-get install haskell-platform) 
	-> www.haskell.org 
	-> ghci 

-> Editor
	-> Text Editors:
		-> Sublime
		-> Vim
		-> Emacs 
		-> vscode
		-> atom
	-> IDE
		-> EclipseFP (supports Haskell projects)
		-> Leksah (Haskell IDE written in Haskell) 

-> File Endings

	-> Haskell file ending(s) is:
		-> '.hs'


<ex1> 
nvim hello.hs 

	string1 = "howdy"
	string2 = "yes howdy to you too"
	greeting = string1 ++ " " ++ string2 

	then run it:
		ghci hello.hs
		greeting


-> Pure Functions 
	-> ALL Haskell functions are 'pure':
		-> Cannot modify state (global or local state, writing to a file or command line) 
		-> Cannot depend on state (can't read a file or receive user input) 
		-> Given the same arguments, always returns the same output  

	-> Examples:
		Pure function?	
		-> print in a string to the console: no -> modifies external state (what appears on the console) 
		-> reads file: no -> depends on external state at different times
		-> compute the length of string: yes - no state 
		-> get the current time: no, depends on the state of the clock and will change based upon 'time'
		-> get a random number: no, returns different value each time it is called 

-> Recursion: 
	-> a function which 'calls' itself:

	 -- pow2 n = 2 to the power of n
	 pow2 n =
	    if n == 0
	    then 1
	    else 2 * (pow2 (n-1)) 
		
	-> how would this look in an imperative language like java?: 

		 int pow2(int n) {
		    int x = 1;
		    for (int i = 0; i < n; ++i)
		    	x *= 2;
		    return x;
		   } 

Recursion is used ALL the time in Haskell, because it does NOT have Loops.. 

Haskell:
repeatString str n = 
	if n == 0 
	then "" 
	else str ++ (repeatString str (n-1)) // lol  


in java it would be:
int repeatString(String str, int n) {
	String result = ""; 
	for (int i = 0; i < n; ++i)
		result += str;
	return result; 
} 
		 

	-> Every loop can be re-written as recursion in haskell, because recursion replaces loops

	For example in Java:
		int pow2(int n) {
			int x = 1; 
			for (int i = 0; i < n; ++i)
				x *= 2;
			return x;
		} 

		
	the same in Haskell:
	        pow2 n = pow2loop n 1 0 
		pow2loop n x i = 
			if i < n
			then pow2loop n (x*2) (i+1)
			else x


-> Lists 
 	x = [1,2,3] 

	empty = [] 

	y = 0 : x -- [0,1,2,3] as the colon is used to append an element to an empty list (cons operator) 
		note: this does not modify the list x 

	x' = 1 : (2 : (3 : [])) 

	x'' = 1 : 2 : 3 : [] 


-> Strings 
	str = "abcde" -- strings in haskell are really just lists of characters 
		shorthand for ->: 
	str' = 'a' : 'b' : 'c' : 'd' : 'e' : [] 

-> Concatenating Lists 
	[1,2,3] ++ [4,5]
	results -> [1,2,3,4,5]

	"hello " ++ "world" 
	results -> "hello world" 
	

	Note: Lists must be homogeneous 

		error = [1,"hello",2] // there are no list of object 


	Accessing Elements in a list 

		head [1,2,3] -- returns the first element of the list 
		tail [1,2,3] -- returns everything but the first element 

	-> so what happens when you take the head of the tail lol

		head (tail [1,2,3]) -- returns 2 

	null [] -- tests if the list is empty (true) 
	null [1,2] -- tests false

-> List Functions 
	double nums = 
	if null nums
	then [] 
	else (2 * (head nums)) : (double (tail nums)) 


	another slightly more difficult program:
	
	removeOdd nums =
	   if null nums
	   then [] 
	   else
	     if (mod (head nums) 2) == 0 -- even? 
	     then (head nums) : (removeOdd (tails num)) 
	     else removeOdd (tail nums) 


-> Tuples 
	x = (1, "hello") -- can take many different types 
	y = ("pi", 3.14159, [1,2,3], "four")

	tuples (..) -> lists [..] 

	tuples -> different types, fixed length
	lists -> same type, unbounded length 

	-> returning tuples 
		headAndLength list = (head list, length list) 

	-> Accessing Tuple Elements
		fst (1, "hello") 
		snd (1, "hello") 

		Big tuples (you can create problems if they are more than 3 or 4 elements long) 


-> Pattern Matching
