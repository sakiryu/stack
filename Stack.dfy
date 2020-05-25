/*
  T1

  Integrantes:
  Douglas Dallavale, Douglas Paz e João Vieira
*/

class Stack {
  var arr : array<nat>;
  var index : int;
  ghost var repr: set<object>;

  predicate Valid()
    reads this, repr
  {
    this in repr
    && arr.Length > 0
    && -1 <= index < arr.Length
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
    ensures fresh(arr)
    ensures arr.Length == size
  {
    arr := new nat[size];
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

  method MaxElementsAmount() returns (amount : int)
  requires Valid()
  modifies arr
  ensures amount == arr.Length
  ensures unchanged(arr)
  {
    amount := arr.Length;
  }

  predicate Reversed (response: array<nat>)
  reads this, arr, response
  {
    forall k :: 0 <= k <= arr.Length-1 && response.Length == arr.Length ==> response[k] == arr[( arr.Length-1-k)]
  }

  method Reverse() returns (response : array<nat>)
  requires Valid()
  requires !Empty()
  ensures Reversed(response)
  {
    var i:= 0;
    var j:= arr.Length-1;
    response := new nat[arr.Length];
    response[0] := arr[j];
    i := i+1;
    j := j-1;
    while i<=arr.Length-1 && 0<=j<=arr.Length-1
    invariant 0<=i<=arr.Length
    invariant j == arr.Length - 1 - i
    invariant forall k | 0 <= k < i :: response[k] == arr[arr.Length-1-k]
    decreases arr.Length-i, j
    {
      response[i] := arr[j];
      i:=i+1;
      j:=j-1;
    }
    return response;
  }

}

method Main()
{
  var stackSize := 3;

  var stack := new Stack(stackSize);

  var b := stack.MaxElementsAmount();
  assert b == stackSize;
  assert stack.Empty();
  assert !stack.Full();

  var a := stack.Push(7);
  assert a == true;
  assert stack.arr[0] == 7;
  assert stack.index == 0;
  assert !stack.Empty();

  b := stack.Pop();
  assert b == 7;
  assert stack.Empty();

  a := stack.Push(8);
  a := stack.Push(9);
  a := stack.Push(10);
  assert stack.Full();

  a := stack.Push(11);
  assert a == false;

  var reverse := stack.Reverse();
  assert stack.Reversed(reverse);

  print reverse[..];
  print stack.arr[..];

  b := stack.ElementsAmount();
  assert b == stackSize;
}
