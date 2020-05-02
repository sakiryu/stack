/**********************
    INTEGRANTES
    
    Douglas Dallavale
    Douglas Paz
    João Viera
**********************/

class Stack
{
  var arr: array<int>
  
  constructor(size: nat) ensures arr.Length == size
  {
    arr := new int[size];
  }
}

method Main()
{
  
}