#集合类型

Swift有两种集合类型 arrays 和 dictionaries。

##可变集合

如果你用 let 声明一个数组或字典，则它是不可变的。如果用 var 声明一个数组或字典，则他是可变的。

##数组

Swift数组和OC中的NSArray和NSMutableArray有区别，OC中你可以在数组中插入任意类型的对象而不用告知对象类型。在Swift中，数组能储存的值的类型是明确定义的，或是能推断出来的。如果你创建一个数组指定 Int 值，则你不能插入除Int类型外的其他值。

###数组类型简写

Swift中数组的写法是这样 `Array<SomeType>`，SomeType为数组可插入的值的类型。
你也可以简写成`[SomeType]`，这是推荐写法。

###数组文字

你能使用数组文字的方式初始化一个数组。

	[value 1, value 2, value 3]

下面是创建了一个名叫 shoppingList 的字符串数组。

	​var​ ​shoppingList​: [​String​] = [​"Eggs"​, ​"Milk"​]
	​// shoppingList has been initialized with two initial items
	
	// 类型可推断出来，不用指定类型
	var​ ​shoppingList​ = [​"Eggs"​, ​"Milk"​]

###数组指定或改变

获取数组元素个数

	println​(​"The shopping list contains ​\(​shoppingList​.​count​)​ items."​)
	​// prints "The shopping list contains 2 items.”

判断数组是否为空

	if​ ​shoppingList​.​isEmpty​ {
	​    ​println​(​"The shopping list is empty."​)
	​} ​else​ {
	​    ​println​(​"The shopping list is not empty."​)
	​}
	​// prints "The shopping list is not empty.”

添加一个元素或多个元素

	shoppingList​.​append​(​"Flour"​)
	​// shoppingList now contains 3 items, and someone is making pancakes
	
	shoppingList​ += [​"Baking Powder"​]
	​// shoppingList now contains 4 items
	​shoppingList​ += [​"Chocolate Spread"​, ​"Cheese"​, ​"Butter"​]
	​// shoppingList now contains 7 items

获取一个元素

	var​ ​firstItem​ = ​shoppingList​[​0​]
	​// firstItem is equal to "Eggs
	
设置某个位置元素

	shoppingList​[​0​] = ​"Six eggs"
	​// the first item in the list is now equal to "Six eggs" rather than "Eggs”

设置某一段元素的值

	shoppingList​[​4​...​6​] = [​"Bananas"​, ​"Apples"​]
	​// shoppingList now contains 6 items
	
插入

	shoppingList​.​insert​(​"Maple Syrup"​, ​atIndex​: ​0​)
	​// shoppingList now contains 7 items
	​// "Maple Syrup" is now the first item in the list
	
移除，移除之后，后面的元素会提前一位补上。

	let​ ​mapleSyrup​ = ​shoppingList​.​removeAtIndex​(​0​)
	​// the item that was at index 0 has just been removed
	​// shoppingList now contains 6 items, and no Maple Syrup
	​// the mapleSyrup constant is now equal to the removed "Maple Syrup" string
	
移除最后一位

	let​ ​apples​ = ​shoppingList​.​removeLast​()
	​// the last item in the array has just been removed
	​// shoppingList now contains 5 items, and no apples
	​// the apples constant is now equal to the removed "Apples" string
	
###迭代数组

你可以使用 **for-in** 循环体来迭代：

	for​ ​item​ ​in​ ​shoppingList​ {
	​    ​println​(​item​)
	​}
	​// Six eggs
	​// Milk
	​// Flour
	​// Baking Powder
	​// Bananas
	
如果你还需要下标可以使用 enumerate 方法迭代数组

	for​ (​index​, ​value​) ​in​ ​enumerate​(​shoppingList​) {
	​    ​println​(​"Item ​\(​index​ + ​1​)​: ​\(​value​)​"​)
	​}
	​// Item 1: Six eggs
	​// Item 2: Milk
	​// Item 3: Flour
	​// Item 4: Baking Powder
	​// Item 5: Bananas
	
###初始化数组

创建一个空数组

	var​ ​someInts​ = [​Int​]()
	​println​(​"someInts is of type [Int] with ​\(​someInts​.​count​)​ items."​)
	​// prints "someInts is of type [Int] with 0 items.
	
上面创建的数组，只能添加整型值，你可以创建一个没类型的空数组

	someInts​.​append​(​3​)
	​// someInts now contains 1 value of type Int
	​someInts​ = []
	​// someInts is now an empty array, but is still of type [Int]
	
Swift的Array类型也提供了创建一个数组指定长度和默认值。

	var​ ​threeDoubles​ = [​Double​](​count​: ​3​, ​repeatedValue​: ​0.0​)
	​// threeDoubles is of type [Double], and equals [0.0, 0.0, 0.0]
	
可以将两个类型一样的数组合并成一个，使用加号。

	var​ ​anotherThreeDoubles​ = [​Double​](​count​: ​3​, ​repeatedValue​: ​2.5​)
	​// anotherThreeDoubles is inferred as [Double], and equals [2.5, 2.5, 2.5]
	​ 
	​var​ ​sixDoubles​ = ​threeDoubles​ + ​anotherThreeDoubles
	​// sixDoubles is inferred as [Double], and equals [0.0, 0.0, 0.0, 2.5, 2.5, 2.5]
	
##字典

字典是可以储存多个值的容器，每个值有一个唯一的key

###字典类型简写

全定义：`Dictionary<Key, Value>`。

简写：`[Key: Value]`。

###字面字典定义

[key 1: value 1, key 2: value 2, key 3: value 3]

	var​ ​airports​: [​String​: ​String​] = [​"YYZ"​: ​"Toronto Pearson"​, ​"DUB"​: ​"Dublin"​]
	var​ ​airports​ = [​"YYZ"​: ​"Toronto Pearson"​, ​"DUB"​: ​"Dublin"​]
	
###字典方法

获取元素数量

	println​(​"The airports dictionary contains ​\(​airports​.​count​)​ items."​)
	​// prints "The airports dictionary contains 2 items.”
	
判断是否为空

	if​ ​airports​.​isEmpty​ {
	​    ​println​(​"The airports dictionary is empty."​)
	​} ​else​ {
	​    ​println​(​"The airports dictionary is not empty."​)
	​}
	​// prints "The airports dictionary is not empty.”

设置一个新值

	airports​[​"LHR"​] = ​"London"
	​// the airports dictionary now contains 3 items

改变一个旧值

	airports​[​"LHR"​] = ​"London Heathrow"
	​// the value for "LHR" has been changed to "London Heathrow”
	
可以用下标更新一个旧值，返回旧值。可选值，如果没有旧值，则返回nil

	if​ ​let​ ​oldValue​ = ​airports​.​updateValue​(​"Dublin Airport"​, ​forKey​: ​"DUB"​) {
	​    ​println​(​"The old value for DUB was ​\(​oldValue​)​."​)
	​}
	​// prints "The old value for DUB was Dublin.”

可以通过下标返回值，可选值，如果没有，则返回nil

	if​ ​let​ ​airportName​ = ​airports​[​"DUB"​] {
	​    ​println​(​"The name of the airport is ​\(​airportName​)​."​)
	​} ​else​ {
	​    ​println​(​"That airport is not in the airports dictionary."​)
	​}
	​// prints "The name of the airport is Dublin Airport.”
	
移除一个值

	​airports​[​"APL"​] = ​"Apple International"
	​// "Apple International" is not the real airport for APL, so delete it
	​airports​[​"APL"​] = ​nil
	​// APL has now been removed from the dictionary
	
可使用下标方法移除某个值，返回被移除的值，可选值。

	if​ ​let​ ​removedValue​ = ​airports​.​removeValueForKey​(​"DUB"​) {
	​    ​println​(​"The removed airport's name is ​\(​removedValue​)​."​)
	​} ​else​ {
	​    ​println​(​"The airports dictionary does not contain a value for DUB."​)
	​}
	​// prints "The removed airport's name is Dublin Airport.”

###迭代字典

使用**for-in**，他返回 (key, value) 的tuple。

	for​ (​airportCode​, ​airportName​) ​in​ ​airports​ {
	​    ​println​(​"​\(​airportCode​)​: ​\(​airportName​)​"​)
	​}
	​// LHR: London Heathrow
	​// YYZ: Toronto Pearson
	
字典有 keys 和 values 属性

	for​ ​airportCode​ ​in​ ​airports​.​keys​ {
	​    ​println​(​"Airport code: ​\(​airportCode​)​"​)
	​}
	​// Airport code: LHR
	​// Airport code: YYZ
	​ 
	​for​ ​airportName​ ​in​ ​airports​.​values​ {
	​    ​println​(​"Airport name: ​\(​airportName​)​"​)
	​}
	​// Airport name: London Heathrow
	​// Airport name: Toronto Pearson
	
###创建空字典

	var​ ​namesOfIntegers​ = [​Int​: ​String​]()
	​// namesOfIntegers is an empty [Int: String] dictionary

可以不用指定类型

	namesOfIntegers​[​16​] = ​"sixteen"
	​// namesOfIntegers now contains 1 key-value pair
	​namesOfIntegers​ = [:]
	​// namesOfIntegers is once again an empty dictionary of type [Int: String]