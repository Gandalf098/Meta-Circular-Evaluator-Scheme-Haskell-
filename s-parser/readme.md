Here we have simple parser (ehm very simple):

but first things first:
For further reference:
"The Dragon Book" Compilers: Principles, Techniques, and Tools is the most theoritical coverage of the subject

For custom language Parsers use Flex and Bison or Lex and Yacc

for more realted to our discussion reference:

See MIT 6.001 lectures on interpretation
or 6.184 lecture 4

or WYS 48 wikibook

for more friendly with still more details see crenshaw's tutorial let's build a compiler or the art of disassembly articles on Parsing

let's begin......


Parsers used every where loading anyfile -> Parsers
Rendering webpage -> Parsers
Syntax analysis using text editors -> Parsers
language compiling of course (you guessed it!) Parsers

so what is this mess about , simply when the computer deals with data (that is processing it) it needs this data to be in specific format usually it is numbers (or strings represented in numbers ascii or utf)

but that is not awesome for useful applications

webpages for an example needs a language to specify it's content and to support as much as possible altering with that content (and by necessity that language)
imagine list of numbers or just plain single sized strings in front of you ?!

so parsers are used everywhere and usually source of error or bugs

another example is with videos or sounds , while people think of these as continous numbers representing colors or sound amplitude, they in fact are not, instead they are organized in chunks of different 'quality' (in other words precision) a 5 seconds blank screen is way smaller than football scene for an example
how to know these data about that chunk , parsing


so what is parsing , parsing transforms a series of identical [in type] (in computer eyes) to more meaningful representation, since for computer 'a' or 'x' is the same just a char , but depends on it's position in a sentence it may has a meaning, so an algorithm that may try to deduce that meaning needs this stream of chars to be identified like wheter it is a word or punctuation , that word is verb noun or preposition ..etc, even punctuation like '?','!' is nearly the same to computer untill some algorithm assigns a meaning to it ! (that meaning is based on how that algorithm acts so no actuall notion of meaning, meaning only means how computer reacts differently ACTING like if there were a meaning or if it actually understood something)

in most of programs parsing (as a concept) maybe used but not clearly

so understanding it well will give you a good intuition about coding in general

Note: most powerful or real parses tends to be as general as possible
Example is the parsec library

we will give an example of parser used in WYS 48 book [Write yourself A scheme in 48 hours] and it's usage of parsec library, it is supposed to make you able to build any kind of parser except for implementing parsec library it self

we will write a language compiler in the end of this series
so first of all we get as input a stream of strings, a simple limited parser (called lexer)[1] is used to parse words you input into 'separated words'

example '(define x (1 + 1) )' would be 'lexed' into ['(','define','x','(','1','+','1',')',')']
almost only removing spaces like split(' ')

so in fact a single split ( ' ' ) line of code uses parsing so do actuall 'split'ing code

however understanding the semantics or how parsing works in theory is supposed to help you 'predicte' how a 'split ( msg )' code will act on different 'msg's

[1](it is disputed whether a lexer is a parser too or not in fact in CS lexer is quite different than a parser, but IMHO both uses BNF to assign 'meaning' to stream of text, but parsers checks for the correctness of specific syntax (in fact lexers check for correctness too but in its own scope example the parser will complain about 'x Int' instead of 'Int x' while a lexer will complain about 'Int 1x' because variable name doesn't start with numbers (in C language)  ) )

a compiler/interpreter needs both lexer and parser to compile/interpret source code

after a lexer converts the stream of chars (or char array) to array of strings [2] (or whatever the representation in CS it is called 'token')

the parser takes these tokens and builds another notion of 'meaning' like say an AST (abstract syntax tree) 

   --> 'define' -+
                 |
                 v
                '+ plus symbol'--> '1'
                 |
                 +---------------> '1'
                 
so as you can see the actual representation of the sequence has changed
the lexer was linear stream of tokens but the AST is not
example the '+' points to two tokens rather than pointing only to the next item

the kind of new representation actually has in it implicit meaning, and it is that meaning parsers leverage and gives it it's power

now I personally thought (why all of this complexity)

but imagine or try to think of your own about making even a simple calculator without parsers 

and once we introduce lambda calculus you will see how parsing may simplify that complex task of compiling or interpreting programs in really innovative ways

if that calculator accepts on operation at a time it may be simple and you can do it without real parsers (although you used the concept of parsing maybe without you knew)

but if that calcualtor is supposed to take any long list of operations (it mays till be easy) but that is actually parsing ( however problems like especially operator precedence will make the code gets complicated )

and it is almost impossible to build good performing compilers without concise understanding of parsers

[2](not necessarily because the language may define the word 'define' in internal representation as 'd' in general it is called 'token')


finally s-parser.hs: is a (very) simple parser, what it does, it reads a single charachter as arg and it should be one of the specified chars 

Fun note: try to send to it a char that isn't in the list like 'a' ,you will get a complaining similar to the one you get when you write wrong code
