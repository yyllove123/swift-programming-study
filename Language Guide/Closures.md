#Closures

closures和OC中的blocks是非常相似的

###Closure表达

内嵌的函数是一个有名字的独立定义的闭合代码。但有时候函数不需要定义全部的名字。

###排序方法

Swift的标准库提供了一个方法叫 **sorted** ，它可以将一个数组进行排序。

**sorted** 方法有两个参数，第一个是数组，第二个是一个closure，有两个相同类型的参数，返回bool类型，表明第一个参数是否应该在第二个参数前面。

	let​ ​names​ = [​"Chris"​, ​"Alex"​, ​"Ewa"​, ​"Barry"​, ​"Daniella"​]

	func​ ​backwards​(​s1​: ​String​, ​s2​: ​String​) -> ​Bool​ {
	​    ​return​ ​s1​ > ​s2
	​}
	​var​ ​reversed​ = ​sorted​(​names​, ​backwards​)
	​// reversed is equal to ["Ewa", "Daniella", "Chris", "Barry", "Alex"]
	
###Closure语法

这样定义一个Closure

	{ (parameters) -> return type in
	    statements
	}
	
参数可以是常量、变量、inout参数，但是不能有默认值，长度可变参数可用在最后一个参数。tuples可以作为参数。

下面这个是sorted的一种写法

	reversed​ = ​sorted​(​names​, { (​s1​: ​String​, ​s2​: ​String​) -> ​Bool​ ​in
	​    ​return​ ​s1​ > ​s2
	​})
	
你可以将它们写在一行

	reversed​ = ​sorted​(​names​, { (​s1​: ​String​, ​s2​: ​String​) -> ​Bool​ ​in​ ​return​ ​s1​ > ​s2​ } )
	
###从上下文推断类型

在上面的例子中 函数类型可以推断出来，是 **(String, String) -> Bool**所以**(String, String)** 和 **Bool** 都可以不用写出来。所有的类型都能推断出来 **->** 也可以省略掉。

	reversed​ = ​sorted​(​names​, { ​s1​, ​s2​ ​in​ ​return​ ​s1​ > ​s2​ } )
	
###隐藏返回

可以隐藏return关键字，因为返回类型已经非常明确了。

	reversed​ = ​sorted​(​names​, { ​s1​, ​s2​ ​in​ ​s1​ > ​s2​ } )
	
###简写参数名

Swift在内联的Closures中自动提供了简写的参数名，是可以用 **$0,$2,$3**来表示第一个参数，第二个参数，第三个参数。

如果你用了这种参数名，你可以删除参数列表的代码。将代码简化成这样：

	reversed​ = ​sorted​(​names​, { ​$0​ > ​$1​ } )

###运算符方法

这里还有更加简便的写法，String类型提供了一个方法一个比较方法（>）来比较两个字符串的大小，返回一个bool类型。

	reversed​ = ​sorted​(​names​, >)

swift会推断出你使用的运算符方法

##尾部Closure

如果你将要传一个closure参数，并且这个参数是在所有参数的末尾，你可以将代码放到小括号外。

	func​ ​someFunctionThatTakesAClosure​(​closure​: () -> ()) {
	​    ​// function body goes here
	​}
	​ 
	​// here's how you call this function without using a trailing closure:
	​ 
	​someFunctionThatTakesAClosure​({
	​    ​// closure's body goes here
	​})
	​ 
	​// here's how you call this function with a trailing closure instead:
	​ 
	​someFunctionThatTakesAClosure​() {
	​    ​// trailing closure's body goes here
	​}

这个常常用在Closure非常的长，写在一行不方便的情况下。

一个例子，Array类型有一个map方法，是传一个closure参数。就可以把代码放到小括号外面。

	“let​ ​digitNames​ = [
	​    ​0​: ​"Zero"​, ​1​: ​"One"​, ​2​: ​"Two"​,   ​3​: ​"Three"​, ​4​: ​"Four"​,
	​    ​5​: ​"Five"​, ​6​: ​"Six"​, ​7​: ​"Seven"​, ​8​: ​"Eight"​, ​9​: ​"Nine"
	​]
	​let​ ​numbers​ = [​16​, ​58​, ​510​]
	
	let​ ​strings​ = ​numbers​.​map​ {
	​    (​var​ ​number​) -> ​String​ ​in
	​    ​var​ ​output​ = ​""
	​    ​while​ ​number​ > ​0​ {
	​        ​output​ = ​digitNames​[​number​ % ​10​]! + ​output
	​        ​number​ /= ​10
	​    }
	​    ​return​ ​output
	​}
	​// strings is inferred to be of type [String]
	​// its value is ["OneSix", "FiveEight", "FiveOneZero"]
	
## 捕获值

closure能捕获上下文的变量和常量，

	func​ ​makeIncrementor​(​forIncrement​ ​amount​: ​Int​) -> () -> ​Int​ {
	​    ​var​ ​runningTotal​ = ​0
	​    ​func​ ​incrementor​() -> ​Int​ {
	​        ​runningTotal​ += ​amount
	​        ​return​ ​runningTotal
	​    }
	​    ​return​ ​incrementor
	​}
	
这样调用

	let​ ​incrementByTen​ = ​makeIncrementor​(​forIncrement​: ​10​)

它的值是这样的

	incrementByTen​()
	​// returns a value of 10
	​incrementByTen​()
	​// returns a value of 20
	​incrementByTen​()
	​// returns a value of 30
	
##Closure是引用类型

上面的方法虽然是常量定义的，但是他们可以改变参数 runningTotal的值，说明它是引用类型。

如果你将一个closure赋给两个不同的常量，但它们还是占用的同一个closure

	let​ ​alsoIncrementByTen​ = ​incrementByTen
	​alsoIncrementByTen​()
	​// returns a value of 50