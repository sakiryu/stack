class Stack {
  var arr : array<int>;
  var index : int;
  ghost var repr: set<object>;
  ghost var elements: seq<int>;

  predicate Valid()
    reads this, repr
  {
    arr in repr
    && arr.Length > 0
    && index < arr.Length
   // && elements == arr[0..index]
  }

  predicate Empty() reads this
  {
    index == -1
  }
  predicate Full() reads this
  {
    index >= arr.Length
  }

  constructor(size: nat)
    requires size > 0
    ensures !Full()
    ensures Empty()
    ensures elements == []
    ensures fresh(arr)
    ensures arr.Length == size
  {
    arr := new int[size];
    elements := [];
    index := -1;
    repr := { arr };
  }

  method Top()
    returns (element: int)
    requires Valid()
    requires !Empty()
    requires index >= 0
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
    ensures -1 <= index < (arr.Length - 1) ==> index == old(index) + 1
  {
    if(-1 <= index < (arr.Length - 1))
    {
      index := index+1;

      arr[index] := element;
      return true;
    } else {
      return false;
    }
  }

  method Pop() returns (elem : int)
    modifies arr,`index
    //requires Valid()
    //requires !Empty()
    decreases index
    ensures 0 <= index < arr.Length ==> index == old(index) - 1
    ensures 0 <= index < arr.Length ==> elem == arr[old(index)]
  {
    if(0 <= index < arr.Length)
    {
      elem := arr[index];
      //remove elemento arr[index]

      index := index - 1;
    } else {
      elem :=  -9999;
    }

  }
}


method Main()
{
  var stack := new Stack(4);
  var a := stack.Push(7);

  var b := stack.Pop();
  assert 7 == b;

  // a := stack.IsFull();
  // a := stack.Push(2);

  //result := stack.Push(5);
  //result := stack.Push(5);

  //result := stack.Push(5);
}