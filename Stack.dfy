/**********************
    INTEGRANTES
    
    Douglas Dallavale
    Douglas Paz
    João Viera
**********************/

class Stack
{
  var arr: array<int>
  
  constructor(var size: int) requires (size >= 0) ensures (arr.Length == size)
  {
    this.arr = new int[size];
  }
}