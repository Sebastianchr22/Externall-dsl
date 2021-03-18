# Externall-dsl
The external DSL now supports left-associativity, and proper precedence both for multiplication and division!
All tests clear from T01-T03, not T04 yet.
The fix for left-assoc is to ensure that the expression is read from left to right, this ensures that 10-5-2=3, and is read as (10-5)-2, and not 10-(5-2) which would = 7.
When left associativity was ensured through the language specification in XText, this just worked. 

By putting Atomic(left op right)* I ensured that each section of the expression is seen as a left and a right number with an operator inbetween, where the right value also is an Atomic. As such each combination of left and right are put into parenthesis, and may have more components each in their parenthesis. My language ansures that precedence is kept from high to low, by multiplying or dividing before adding and subtracting. My language specifies that a plusOrMinus expression might be a mulOrDiv expression before considering it a plusOrMinus expression.
