class Stack {
  var arr : array<int>;
  var index : nat;
  ghost var repr: set<object>;
  ghost var elements: seq<int>;

  predicate Valid() 
    reads this, repr
  {
    arr in repr 
    && arr.Length > 0 
    && 0 <= index < arr.Length 
    && elements == arr[0..index]
  }

  predicate Empty() reads this
  {
    index == 0
  }
  predicate Full() reads this
  {
    index >= arr.Length
  }

  constructor(size: nat) 
    requires size > 0 
    ensures Valid()
    ensures Empty()
    ensures elements == []
    ensures fresh(arr)
    ensures arr.Length == size
  {
    arr := new int[size];
    elements := [];
    index := 0;
    repr := { arr };
  }

  method Top()
    returns (element: int) 
    requires Valid()
    requires !Empty()
    ensures element == arr[index]
    ensures index == old(index)
  {
    element := arr[index];
  }

  method Elements()
    returns (element: int)
    requires !Empty()
    requires Valid()
  {
    return index;
  }

  method Push(element : int) 
    returns (result: bool)
    modifies arr, `index
    //requires Valid()
    //requires !Full()
   // ensures index == old(index) + 1
  {
    if(0 <= index < arr.Length)
    {
      arr[index] := element;
      index := index+1;
      return true;
    }
    return false;
  }

  method Pop() returns (elem : int)
    modifies this
    requires Valid()
    requires !Empty()
    decreases index
  {
    elem := arr[index];
    index := index - 1;
  }
}


method Main()
{
  var stack := new Stack(4);
  var a := stack.Push(1);

 // a := stack.IsFull();
  a := stack.Push(2);
  a := stack.Push(3);
  a := stack.Push(3);
  a := stack.Push(3);
  a := stack.Push(3);

  //result := stack.Push(5);
  //result := stack.Push(5);

  //result := stack.Push(5);
}