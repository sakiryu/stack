class Stack {
  var arr : array<int>;
  var index : nat;
  ghost var elements: seq<int>;
  predicate Valid() reads this
  {
    0 <= index < arr.Length
  }

  predicate Empty() reads this
  {
    index == 0
  }
  predicate Full() reads this
  {
    index == arr.Length
  }

  constructor(size: nat) 
    requires size > 0 
    ensures Valid()
    ensures Empty()
    ensures fresh(arr)
    ensures arr.Length == size
  {
    arr := new int[size];
    elements := [];
    index := 0;
  }

  method IsEmpty() returns (result : bool)
    requires Empty()
  {
      return true;
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

  method Push(element : int) 
    modifies arr, `index
    requires Valid()
    requires !Full()
    ensures index == old(index) + 1
  {
      arr[index] := element;
      index := index+1;
  }

  method Pop() returns (elem : int)
  {
  }
}


method Main()
{
  var stack := new Stack(4);
  stack.Push(1);
  stack.Push(2);
  stack.Push(3);
  stack.Push(3);

  //result := stack.Push(5);
  //result := stack.Push(5);

  //result := stack.Push(5);
}