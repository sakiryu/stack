/**********************
    INTEGRANTES
    
    Douglas Dallavale
    Douglas Paz
    João Viera
**********************/

class Stack
{
  var elements: array<nat>;
  ghost var Elements: array<nat>;

  var top: nat;
  var size: nat;
  
  constructor(s: nat) requires s >= 0 
  ensures size == s
  ensures top == 0
  {
    size := s;
    top := 0;
  }

  predicate Valid() reads this
  {
    0 <= size < elements.Length
  }

  predicate IsEmpty() reads this
  {
    top == 0
  }

  method Size()
  {
  }
}

method Main()
{
  
}