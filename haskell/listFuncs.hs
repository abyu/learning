myMap [] fn = [] 
myMap (x:xs) fn = fn x : myMap xs fn
myReduce i [] fn = i
myReduce i (a:as) fn = myReduce (fn i a) as fn
myFilter fn [] = []
myFilter fn (x:xs) = if fn x then x : myFilter fn xs else myFilter fn xs
myTake 0 xs = []
myTake n [] = []
myTake n (x:xs) = x : myTake (n-1) xs
myTakeWhile fn [] = []
myTakeWhile fn (x:xs) = if fn x then x : myTakeWhile fn xs else []
myDrop 0 xs = xs
myDrop n (x:xs) = myDrop (n-1) xs

myZip fn xs [] = []
myZip fn [] ys =[]
myZip fn (x:xs) (y:ys) = fn x y : myZip fn xs ys

flatmap fn [] = []
flatmap fn (x:xs) = fn x ++ flatmap fn xs
flatten [] = []
flatten (xs:xss) = xs ++ (flatten xss)

data MyBox a = MyBox a
mmap fn (MyBox a) = MyBox (fn a)
join (MyBox (MyBox(x))) = MyBox x
mflatmap fn x = join (mmap fn x)
