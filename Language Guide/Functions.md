#函数方法

##定义和调用方法

声明一个方法

	func​ ​sayHello​(​personName​: ​String​) -> ​String​ {
	​    ​let​ ​greeting​ = ​"Hello, "​ + ​personName​ + ​"!"
	​    ​return​ ​greeting
	​}

* sayHello 方法名
* personName 参数名
* String 参数类型
* -> String 返回值类型

##方法参数和返回值

Swift中方法是非常灵活的

###多个参数

	func​ ​halfOpenRangeLength​(​start​: ​Int​, ​end​: ​Int​) -> ​Int​ {
	​    ​return​ ​end​ - ​start
	​}
	​println​(​halfOpenRangeLength​(​1​, ​10​))
	​// prints "9”
	
###没有参数

	func​ ​sayHelloWorld​() -> ​String​ {
	​    ​return​ ​"hello, world"
	​}
	​println​(​sayHelloWorld​())
	​// prints "hello, world”

###没有返回值

	func​ ​sayGoodbye​(​personName​: ​String​) {
	​    ​println​(​"Goodbye, ​\(​personName​)​!"​)
	​}
	​sayGoodbye​(​"Dave"​)
	​// prints "Goodbye, Dave!”

返回值也可以被忽略

	func​ ​printAndCount​(​stringToPrint​: ​String​) -> ​Int​ {
	​    ​println​(​stringToPrint​)
	​    ​return​ ​countElements​(​stringToPrint​)
	​}
	​func​ ​printWithoutCounting​(​stringToPrint​: ​String​) {
	​    ​printAndCount​(​stringToPrint​)
	​}
	​printAndCount​(​"hello, world"​)
	​// prints "hello, world" and returns a value of 12
	​printWithoutCounting​(​"hello, world"​)
	​// prints "hello, world" but does not return a value”
	
###返回值有多个

	func​ ​minMax​(​array​: [​Int​]) -> (​min​: ​Int​, ​max​: ​Int​) {
	​    ​var​ ​currentMin​ = ​array​[​0​]
	​    ​var​ ​currentMax​ = ​array​[​0​]
	​    ​for​ ​value​ ​in​ ​array​[​1​..<​array​.​count​] {
	​        ​if​ ​value​ < ​currentMin​ {
	​            ​currentMin​ = ​value
	​        } ​else​ ​if​ ​value​ > ​currentMax​ {
	​            ​currentMax​ = ​value
	​        }
	​    }
	​    ​return​ (​currentMin​, ​currentMax​)
	​}

这个的返回值是一个tuple，可以通过下标获取值。

	let​ ​bounds​ = ​minMax​([​8​, -​6​, ​2​, ​109​, ​3​, ​71​])
	​println​(​"min is ​\(​bounds​.​min​)​ and max is ​\(​bounds​.​max​)​"​)
	
###返回可选类型的tuple

如果返的tuple可能是空的，则用可选值 **(Int,Int)?** 

	func​ ​minMax​(​array​: [​Int​]) -> (​min​: ​Int​, ​max​: ​Int​)? {
	​    ​if​ ​array​.​isEmpty​ { ​return​ ​nil​ }
	​    ​var​ ​currentMin​ = ​array​[​0​]
	​    ​var​ ​currentMax​ = ​array​[​0​]
	​    ​for​ ​value​ ​in​ ​array​[​1​..<​array​.​count​] {
	​        ​if​ ​value​ < ​currentMin​ {
	​            ​currentMin​ = ​value
	​        } ​else​ ​if​ ​value​ > ​currentMax​ {
	​            ​currentMax​ = ​value
	​        }
	​    }
	​    ​return​ (​currentMin​, ​currentMax​)
	​}

可以使用可选绑定来判断返回是否为nil

	if​ ​let​ ​bounds​ = ​minMax​([​8​, -​6​, ​2​, ​109​, ​3​, ​71​]) {
	​    ​println​(​"min is ​\(​bounds​.​min​)​ and max is ​\(​bounds​.​max​)​"​)
	​}
	​// prints "min is -6 and max is 109”

##方法参数名

上面说的方法都是像这样定义的

	func​ ​someFunction​(​parameterName​: ​Int​) {
	​    ​// function body goes here, and can use parameterName
	​    ​// to refer to the argument value for that parameter
	​}

可是，这些参数都只能用在方法体内部，这种参数叫本地参数名。

###扩展参数名

一些时候，你需要指明这个参数的作用在调用方法的时候。

想下面这样定义一个扩展参数名

	func​ ​someFunction​(​externalParameterName​ ​localParameterName​: ​Int​) {
	​    ​// function body goes here, and can use localParameterName
	​    ​// to refer to the argument value for that parameter
	​}
	
具个例子：

如果这样定义一个方法

	func​ ​join​(​s1​: ​String​, ​s2​: ​String​, ​joiner​: ​String​) -> ​String​ {
	​    ​return​ ​s1​ + ​joiner​ + ​s2
	​}
	
那么你需要这样调用它。你不知道这几个参数都是干嘛的。

	join​(​"hello"​, ​"world"​, ​", "​)
	​// returns "hello, world”
	
如果你这样使用扩展名定义一个方法：

	func​ ​join​(​string​ ​s1​: ​String​, ​toString​ ​s2​: ​String​, ​withJoiner​ ​joiner​: ​String​)
	​    -> ​String​ {
	​        ​return​ ​s1​ + ​joiner​ + ​s2
	​}
	
就可以这样调用

	join​(​string​: ​"hello"​, ​toString​: ​"world"​, ​withJoiner​: ​", "​)
	​// returns "hello, world”
	
###快速的扩展参数名

如果你觉得本地参数名已经表达了参数的意义，你可以使用（#）号在本地参数名前，代表它也是一个扩展参数名。

这样定义

	​func​ ​containsCharacter​(#​string​: ​String​, #​characterToFind​: ​Character​) -> ​Bool​ {
	​    ​for​ ​character​ ​in​ ​string​ {
	​        ​if​ ​character​ == ​characterToFind​ {
	​            ​return​ ​true
	​        }
	​    }
	​    ​return​ ​false
	​}
	
这样调用

	let​ ​containsAVee​ = ​containsCharacter​(​string​: ​"aardvark"​, ​characterToFind​: ​"v"​)
	​// containsAVee equals true, because "aardvark" contains a "v”

###默认参数值

能给参数定义一个默认值，一旦定义了默认值，在调用参数时你可以忽略这个参数。

例如：定义如下

	func​ ​join​(​string​ ​s1​: ​String​, ​toString​ ​s2​: ​String​,
	​    ​withJoiner​ ​joiner​: ​String​ = ​" "​) -> ​String​ {
	​        ​return​ ​s1​ + ​joiner​ + ​s2
	​}
	
可以这样调用

	join​(​string​: ​"hello"​, ​toString​: ​"world"​, ​withJoiner​: ​"-"​)
	​// returns "hello-world”

也可以这样调用

	join​(​string​: ​"hello"​, ​toString​: ​"world"​)
	​// returns "hello world”

###默认值的扩展名

Swift给有默认值的参数提供了扩展名，就是本地扩展名

	func​ ​join​(​s1​: ​String​, ​s2​: ​String​, ​joiner​: ​String​ = ​" "​) -> ​String​ {
	​    ​return​ ​s1​ + ​joiner​ + ​s2
	​}

这样调用

	join​(​"hello"​, ​"world"​, ​joiner​: ​"-"​)
	​// returns "hello-world”

###长度可变参数

可以传0个或多个值的特殊类型

在参数类型后添加（...）三个点来定义这个特殊类型。这样定义的特殊类型就相当于这个类型的一个数组。

	func​ ​arithmeticMean​(​numbers​: ​Double​...) -> ​Double​ {
	​    ​var​ ​total​: ​Double​ = ​0
	​    ​for​ ​number​ ​in​ ​numbers​ {
	​        ​total​ += ​number
	​    }
	​    ​return​ ​total​ / ​Double​(​numbers​.​count​)
	​}
	​arithmeticMean​(​1​, ​2​, ​3​, ​4​, ​5​)
	​// returns 3.0, which is the arithmetic mean of these five numbers
	​arithmeticMean​(​3​, ​8.25​, ​18.75​)
	​// returns 10.0, which is the arithmetic mean of these three numbers
	
###常量和变量的参数

参数默认是常量，在方法体中改变参数值会报错。可以在参数名前添加 **var** 来表明这个参数是变量，可以改变。

	func​ ​alignRight​(​var​ ​string​: ​String​, ​count​: ​Int​, ​pad​: ​Character​) -> ​String​ {
	​    ​let​ ​amountToPad​ = ​count​ - ​countElements​(​string​)
	​    ​if​ ​amountToPad​ < ​1​ {
	​        ​return​ ​string
	​    }
	​    ​let​ ​padString​ = ​String​(​pad​)
	​    ​for​ ​_​ ​in​ ​1​...​amountToPad​ {
	​        ​string​ = ​padString​ + ​string
	​    }
	​    ​return​ ​string
	​}
	​let​ ​originalString​ = ​"hello"
	​let​ ​paddedString​ = ​alignRight​(​originalString​, ​10​, ​"-"​)
	​// paddedString is equal to "-----hello"
	​// originalString is still equal to "hello”

###In-Out参数

变量参数，只能在方法体内改变。不过如果你还想在方法外部使用这个参数，可以定义为in-out参数。

定义如下方法

	func​ ​swapTwoInts​(​inout​ ​a​: ​Int​, ​inout​ ​b​: ​Int​) {
	​    ​let​ ​temporaryA​ = ​a
	​    ​a​ = ​b
	​    ​b​ = ​temporaryA
	​}
	
可以这样使用

	var​ ​someInt​ = ​3
	​var​ ​anotherInt​ = ​107
	​swapTwoInts​(&​someInt​, &​anotherInt​)
	​println​(​"someInt is now ​\(​someInt​)​, and anotherInt is now ​\(​anotherInt​)​"​)
	​// prints "someInt is now 107, and anotherInt is now 3”
	
##函数类型

每个函数都有一个类型。例如：

	func​ ​addTwoInts​(​a​: ​Int​, ​b​: ​Int​) -> ​Int​ {
	​    ​return​ ​a​ + ​b
	​}
	​func​ ​multiplyTwoInts​(​a​: ​Int​, ​b​: ​Int​) -> ​Int​ {
	​    ​return​ ​a​ * ​b
	​}

这两个方法都传2个整型参数，并返回一个整型值。所以它们的类型就是 **(Int, Int) -> Int** 

而这个方法

	func​ ​printHelloWorld​() {
	​    ​println​(​"hello, world"​)
	​}

它的类型就是 **() -> ()**

###使用方法类型

你能使用方法类型，像其他类型参数一样。

	var​ ​mathFunction​: (​Int​, ​Int​) -> ​Int​ = ​addTwoInts
	
然后这样调用

	println​(​"Result: ​\(​mathFunction​(​2​, ​3​))​"​)
	​// prints "Result: 5

	mathFunction​ = ​multiplyTwoInts
	​println​(​"Result: ​\(​mathFunction​(​2​, ​3​))​"​)
	​// prints "Result: 6”
	
	let​ ​anotherMathFunction​ = ​addTwoInts
	​// anotherMathFunction is inferred to be of type (Int, Int) -> Int

###函数类型作为参数

可以将函数类型作为参数传递

	func​ ​printMathResult​(​mathFunction​: (​Int​, ​Int​) -> ​Int​, ​a​: ​Int​, ​b​: ​Int​) {
	​    ​println​(​"Result: ​\(​mathFunction​(​a​, ​b​))​"​)
	​}
	​printMathResult​(​addTwoInts​, ​3​, ​5​)
	​// prints "Result: 8”

###函数类型作为返回值

	func​ ​stepForward​(​input​: ​Int​) -> ​Int​ {
	​    ​return​ ​input​ + ​1
	​}
	​func​ ​stepBackward​(​input​: ​Int​) -> ​Int​ {
	​    ​return​ ​input​ - ​1
	​}
	
	func​ ​chooseStepFunction​(​backwards​: ​Bool​) -> (​Int​) -> ​Int​ {
	​    ​return​ ​backwards​ ? ​stepBackward​ : ​stepForward
	​}
	
	var​ ​currentValue​ = ​3
	​let​ ​moveNearerToZero​ = ​chooseStepFunction​(​currentValue​ > ​0​)
	​// moveNearerToZero now refers to the stepBackward() function
	
	println​(​"Counting to zero:"​)
	​// Counting to zero:
	​while​ ​currentValue​ != ​0​ {
	​    ​println​(​"​\(​currentValue​)​... "​)
	​    ​currentValue​ = ​moveNearerToZero​(​currentValue​)
	​}
	​println​(​"zero!"​)
	​// 3...
	​// 2...
	​// 1...
	​// zero!
	
##嵌套方法

可以在方法内定义方法

	func​ ​chooseStepFunction​(​backwards​: ​Bool​) -> (​Int​) -> ​Int​ {
	​    ​func​ ​stepForward​(​input​: ​Int​) -> ​Int​ { ​return​ ​input​ + ​1​ }
	​    ​func​ ​stepBackward​(​input​: ​Int​) -> ​Int​ { ​return​ ​input​ - ​1​ }
	​    ​return​ ​backwards​ ? ​stepBackward​ : ​stepForward
	​}
	​var​ ​currentValue​ = -​4
	​let​ ​moveNearerToZero​ = ​chooseStepFunction​(​currentValue​ > ​0​)
	​// moveNearerToZero now refers to the nested stepForward() function
	​while​ ​currentValue​ != ​0​ {
	​    ​println​(​"​\(​currentValue​)​... "​)
	​    ​currentValue​ = ​moveNearerToZero​(​currentValue​)
	​}
	​println​(​"zero!"​)
	​// -4...
	​// -3...
	​// -2...
	​// -1...
	​// zero!