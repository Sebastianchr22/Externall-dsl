# Externall-dsl
The external DSL now passes testing up until multiplication and division! YES!
This has been achieved by making the language left-associative (handling the expression from left to right)
Also, the computeExp methods are now dispatch methods (inspired by the video lecture 10), this has resulted in better handling of each individual section of the expression and has allowed for multiple joined expressions like 1+3-2, instead of only allowing 1+3. A HUGE IMPROVEMENT!
The recursive nature of the computeExp methods means that the expression only stops when the returned value breaks the recursion links, this is done when receiving IntConstants.
