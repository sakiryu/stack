/**********************
    INTEGRANTES
    
    Douglas Dallavale
    Douglas Paz
    João Viera
**********************/

class Stack
{
  var arr: array<int>
  
  constructor(size: int) requires size >= 0 ensures arr.Length == size 
  {
    arr := new int[size];
  }
}

method Main()
{
  
}