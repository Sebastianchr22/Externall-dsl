# Externall-dsl
The external DSL Math compiler works for tests T01_dummy - T02_subtraction.
But it has real difficulties hadling more than one operator. 
It works when testing 80+7==87 => Passed!, but 80+4+3==87 => Not passed, likewise 94-7==87 => Passed!, but 94-3-4==87 => Not passed...
The DSL is made from the book template, which is explicitly specifies that multiple plusOrMinus expressions can appear, but this seems to not work, atleast for me..

I am usure where the issue stems from at this point in time, and I have spent many hours trying to figure it out..
