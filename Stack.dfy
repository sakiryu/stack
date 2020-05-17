class Stack {
  var arr : array<nat>;
  var index : int;
  ghost var repr: set<object>;
  ghost var elements: seq<int>;

  predicate Valid()
    reads this, repr
  {
    this in repr
    && arr.Length > 0
    && -1 <= index < arr.Length
   // && elements == arr[0..index]
  }

  predicate Empty() reads this
  {
    index == -1
  }
  predicate Full() reads this
  {
    index == arr.Length - 1
  }

  constructor(size: nat)
    requires size > 0
    ensures !Full()
    ensures Empty()
    ensures Valid()
    ensures elements == []
    ensures fresh(arr)
    ensures arr.Length == size
  {
    arr := new nat[size];
    elements := [];
    index := -1;
    repr := { this };
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

  method Push(element : nat)
    returns (result: bool)
    modifies arr, `index
    requires Valid()
    ensures old(index) < (old(arr).Length - 1) ==>
      index == old(index) + 1 &&
      result == true &&
      arr[index] == element
    ensures old(index) == (old(arr).Length - 1) ==>
     result == false &&
     unchanged(`index) &&
     unchanged(arr)
  {

    if(index == (arr.Length - 1))
    {
      result := false;
    } else {
      index := index+1;
      arr[index] := element;
      result := true;
    }
  }

    method Pop() returns (elem : nat)
    modifies arr,`index
    requires Valid()
    requires !Empty()
    decreases index
    ensures index == old(index) - 1
    ensures elem == old(arr[index])
  {
      elem := arr[index];
      index := index - 1;
  }

  method ElementsAmount() returns (amount : int)
  requires Valid()
  modifies `index
  ensures amount == index + 1
  ensures unchanged(`index)
  {
    amount := index + 1;
  }
}


method Main()
{
  var stackSize := 3;
  var stack := new Stack(stackSize);
  assert stack.arr.Length == stackSize;
  assert stack.Empty();
  assert !stack.Full();

  var a := stack.Push(7);
  assert a == true;
  assert stack.arr[0] == 7;
  assert stack.index == 0;
  assert !stack.Empty();

  var b := stack.Pop();
  assert b == 7;
  assert stack.Empty();

  a := stack.Push(8);
  a := stack.Push(9);
  a := stack.Push(10);
  assert stack.Full();

  a := stack.Push(11);
  assert a == false;

  b := stack.ElementsAmount();
  assert b == stackSize;
}
