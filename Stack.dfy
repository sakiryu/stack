class Stack {
  var arr : array<nat>;
  var index : int;
  ghost var repr: set<object>;
  ghost var elements: seq<int>;

  predicate Valid()
    reads this, repr
  {
    arr in repr
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
    ensures elements == []
    ensures fresh(arr)
    ensures arr.Length == size
  {
    arr := new nat[size];
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

  method Push(element : nat)
    returns (result: bool)
    modifies arr, `index
    requires Valid()
    ensures !Full() ==> index == old(index) + 1
    ensures !Full() ==> result == true
    //ensures Full() ==> result == false
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
    ensures elem == arr[old(index)]
  {
      elem := arr[index];
      //remover elemento arr[index] ?

      index := index - 1;
  }
}


method Main()
{
  var stack := new Stack(4);
  assert stack.index == -1;
  assert stack.arr.Length == 4;
  assert stack.Empty();
  assert !stack.Full();

  //var a := stack.Push(7);

  print(stack.arr[0]);
  //assert stack.arr[0] == 7;

// /  var b := stack.Pop();
 //s assert 7 == b;

  // a := stack.IsFull();
  // a := stack.Push(2);

  //result := stack.Push(5);
  //result := stack.Push(5);

  //result := stack.Push(5);
}