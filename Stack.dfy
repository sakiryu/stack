/**********************
    INTEGRANTES
    
    Douglas Dallavale
    Douglas Paz
    João Viera
**********************/

class Stack
{
  var arr: array<int>
  var top: int
  
  constructor(size: nat) ensures arr.Length == size && top == -1;
  {
    arr := new int[size];
    top := -1;
  }

 method push ( element: int ) returns ( inserted: bool )
  modifies this
  {
    print(arr.Length);
    arr[1] := element;
   /* var isFull: bool := full();

    if (isFull) {
      inserted := false;
    } else {
      top := top + 1;
      print(top);
      print(element);
      print(arr.Length);
      //arr[top] := element;

      inserted := true;
    }
    */
  }
}

method Main()
{
  var size: int := 3;

  var stack: Stack := new Stack(size);

  var inserted: bool := stack.push(3);
}