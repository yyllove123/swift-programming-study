# swift-programming-study
The Swift Programming Language

##Swift概览

第一个程序，hello world！。如下

	println("Hello, world!")
	
如果你写过C，那么这个语法你一定非常熟悉。在Swift中，这一行是一个完整的程序。你不用谢main函数，也不用在后面加分号。

这个概览能够帮你开始书写Swift代码，给你展示如何完成一些程序任务。


###简单的值
*let*代表常量，*var*代表变量。

	let​ ​implicitInteger​ = ​70
	​let​ ​implicitDouble​ = ​70.0
	​let​ ​explicitDouble​: ​Double​ = ​70
可以用冒号来规定一个值的类型。

值不能自己转换成其它的类型，如果你想合并两个不同类型的值，明确设置期望的类型。

	let​ ​label​ = ​"The width is "
	​let​ ​width​ = ​94
	​let​ ​widthLabel​ = ​label​ + ​String​(​width​)
	
还有一种更加简单的办法，将这些值放到括号里并在前面加入(\)符号：

	​let​ ​apples​ = ​3
	​let​ ​oranges​ = ​5
	​let​ ​appleSummary​ = ​"I have ​\(​apples​)​ apples."
	​let​ ​fruitSummary​ = ​"I have ​\(​apples​ + ​oranges​)​ pieces of fruit.
	
创建数组和字典使用中括号：

	var​ ​shoppingList​ = [​"catfish"​, ​"water"​, ​"tulips"​, ​"blue paint"​]
	​shoppingList​[​1​] = ​"bottle of water"
	​ 
	​var​ ​occupations​ = [
	​    ​"Malcolm"​: ​"Captain"​,
	​    ​"Kaylee"​: ​"Mechanic"​,
	​]
	​occupations​[​"Jayne"​] = ​"Public Relations”
	
创建一个空的数组或字典用初始化器语法。

	let​ ​emptyArray​ = [​String​]()
	​let​ ​emptyDictionary​ = [​String​: ​Float​]()
	let emptyArray = [] //类型能推理确定
	let emptyDictionary = [:] //类型能推理确定

###控制流
使用*if*和*switch*来做判断逻辑。
用*for-in*，*for*，*while*，*do-while*来做循环。
小括号是可选的，大括号是必须的。

	let​ ​individualScores​ = [​75​, ​43​, ​103​, ​87​, ​12​]
	​var​ ​teamScore​ = ​0
	​for​ ​score​ ​in​ ​individualScores​ {
	​    ​if​ ​score​ > ​50​ {
	​        ​teamScore​ += ​3
	​    } ​else​ {
	​        ​teamScore​ += ​1
	​    }
	​}
	​teamScore

对于*if*声明，它的条件必须是一个boolean类型的，不然会发生错误。

可以将*if*和*let*一起使用来针对那些可能是missing的值，就是这些值是可选的，一个可选的值可能是有值或者值是nil。使用问号来表明一个值是可选的。就是使用（?）来接收一个有可能是nil的对象。

	var​ ​optionalString​: ​String​? = ​"Hello"
	​optionalString​ == ​nil
	​ 
	​var​ ​optionalName​: ​String​? = ​"John Appleseed"
	​var​ ​greeting​ = ​"Hello!"
	​if​ ​let​ ​name​ = ​optionalName​ {
	​    ​greeting​ = ​"Hello, ​\(​name​)​"
	​}

如果可选值是nil，程序会跳过它。另外，the optional value is unwrapped and assigned to the constant after let, which makes the unwrapped value available inside the block of code.
	
switches支持多样化的参数了，不仅仅值支持integer了。

	let​ ​vegetable​ = ​"red pepper"
	​switch​ ​vegetable​ {
	​case​ ​"celery"​:
	​    ​let​ ​vegetableComment​ = ​"Add some raisins and make ants on a log."
	​case​ ​"cucumber"​, ​"watercress"​:
	​    ​let​ ​vegetableComment​ = ​"That would make a good tea sandwich."
	​case​ ​let​ ​x​ ​where​ ​x​.​hasSuffix​(​"pepper"​):
	​    ​let​ ​vegetableComment​ = ​"Is it a spicy ​\(​x​)​?"
	​default​:
	​    ​let​ ​vegetableComment​ = ​"Everything tastes good in soup."
	​}
在switch中不需要使用break来跳出switch。

可以使用*for-in*来迭代字典，字典是一个无需的集合，所以它的迭代是顺序来的。

	let​ ​interestingNumbers​ = [
	​    ​"Prime"​: [​2​, ​3​, ​5​, ​7​, ​11​, ​13​],
	​    ​"Fibonacci"​: [​1​, ​1​, ​2​, ​3​, ​5​, ​8​],
	​    ​"Square"​: [​1​, ​4​, ​9​, ​16​, ​25​],
	​]
	​var​ ​largest​ = ​0
	​for​ (​kind​, ​numbers​) ​in​ ​interestingNumbers​ {
	​    ​for​ ​number​ ​in​ ​numbers​ {
	​        ​if​ ​number​ > ​largest​ {
	​            ​largest​ = ​number
	​        }
	​    }
	​}
	​largest	
	
while用法和一般用法一样，

	var​ ​n​ = ​2
	​while​ ​n​ < ​100​ {
	​    ​n​ = ​n​ * ​2
	​}
	​n
	​ 
	​var​ ​m​ = ​2
	​do​ {
	​    ​m​ = ​m​ * ​2
	​} ​while​ ​m​ < ​100
	​m

你能使用*..<*来表示一个范围，但不包括最大值，*...*包括最大值，下面两种写法代表同样的事：

	var​ ​firstForLoop​ = ​0
	​for​ ​i​ ​in​ ​0​..<​4​ {
	​    ​firstForLoop​ += ​i
	​}
	​firstForLoop
	​ 
	​var​ ​secondForLoop​ = ​0
	​for​ ​var​ ​i​ = ​0​; ​i​ < ​4​; ++​i​ {
	​    ​secondForLoop​ += ​i
	​}
	​secondForLoop

###方法和closures
	
用*func*定义一个函数，用*->*来表示函数需要返回的参数类型。

	func​ ​greet​(​name​: ​String​, ​day​: ​String​) -> ​String​ {
	​    ​return​ ​"Hello ​\(​name​)​, today is ​\(​day​)​."
	​}
	​greet​(​"Bob"​, ​"Tuesday"​)
	
用tuple表示组合值，如一个函数可以返回多个值，tuple可以是名字或数字。

	func​ ​calculateStatistics​(​scores​: [​Int​]) -> (​min​: ​Int​, ​max​: ​Int​, ​sum​: ​Int​) {
	​    ​var​ ​min​ = ​scores​[​0​]
	​    ​var​ ​max​ = ​scores​[​0​]
	​    ​var​ ​sum​ = ​0
	​    
	​    ​for​ ​score​ ​in​ ​scores​ {
	​        ​if​ ​score​ > ​max​ {
	​            ​max​ = ​score
	​        } ​else​ ​if​ ​score​ < ​min​ {
	​            ​min​ = ​score
	​        }
	​        ​sum​ += ​score
	​    }
	​    
	​    ​return​ (​min​, ​max​, ​sum​)
	​}
	​let​ ​statistics​ = ​calculateStatistics​([​5​, ​3​, ​100​, ​3​, ​9​])
	​statistics​.​sum
	​statistics​.​2

参数可以是一个可变数组。集合

	func​ ​sumOf​(​numbers​: ​Int​...) -> ​Int​ {
	​    ​var​ ​sum​ = ​0
	​    ​for​ ​number​ ​in​ ​numbers​ {
	​        ​sum​ += ​number
	​    }
	​    ​return​ ​sum
	​}
	​sumOf​()
	​sumOf​(​42​, ​597​, ​12​)

函数可以被嵌套。

	func​ ​returnFifteen​() -> ​Int​ {
	​    ​var​ ​y​ = ​10
	​    ​func​ ​add​() {
	​        ​y​ += ​5
	​    }
	​    ​add​()
	​    ​return​ ​y
	​}
	​returnFifteen​()

函数可以当做返回值

	func​ ​makeIncrementer​() -> (​Int​ -> ​Int​) {
	​    ​func​ ​addOne​(​number​: ​Int​) -> ​Int​ {
	​        ​return​ ​1​ + ​number
	​    }
	​    ​return​ ​addOne
	​}
	​var​ ​increment​ = ​makeIncrementer​()
	​increment​(​7​)

函数可以当做参数

	func​ ​hasAnyMatches​(​list​: [​Int​], ​condition​: ​Int​ -> ​Bool​) -> ​Bool​ {
	​    ​for​ ​item​ ​in​ ​list​ {
	​        ​if​ ​condition​(​item​) {
	​            ​return​ ​true
	​        }
	​    }
	​    ​return​ ​false
	​}
	​func​ ​lessThanTen​(​number​: ​Int​) -> ​Bool​ {
	​    ​return​ ​number​ < ​10
	​}
	​var​ ​numbers​ = [​20​, ​19​, ​7​, ​12​]
	​hasAnyMatches​(​numbers​, ​lessThanTen​)

函数的一个特殊案例是closures：闭合的代码。
Functions are actually a special case of closures: blocks of code that can be called later. The code in a closure has access to things like variables and functions that were available in the scope where the closure was created, even if the closure is in a different scope when it is executed—you saw an example of this already with nested functions. You can write a closure without a name by surrounding code with braces ({}). Use in to separate the arguments and return type from the body.

	numbers​.​map​({
	​    (​number​: ​Int​) -> ​Int​ ​in
	​    ​let​ ​result​ = ​3​ * ​number
	​    ​return​ ​result
	​})
	
你还有几个可选项可以让代码更为简洁。当一个closure的类型已经清楚的时候，比如一个回调是一个代理，你可以省去这些参数的类型和返回的类型

	let​ ​mappedNumbers​ = ​numbers​.​map​({ ​number​ ​in​ ​3​ * ​number​ })
	​mappedNumbers

可以使用参数的位置而不是名字，这种在简短的closures特别有用。closure可以出现在小括号的后面。

	let​ ​sortedNumbers​ = ​sorted​(​numbers​) { ​$0​ > ​$1​ }
	​sortedNumbers


###对象和类

下面是创建一个类，声明一个变量，创建一个函数。

	class​ ​Shape​ {
	​    ​var​ ​numberOfSides​ = ​0
	​    ​func​ ​simpleDescription​() -> ​String​ {
	​        ​return​ ​"A shape with ​\(​numberOfSides​)​ sides."
	​    }
	​}

调用方法如下：

	var​ ​shape​ = ​Shape​()
	​shape​.​numberOfSides​ = ​7
	​var​ ​shapeDescription​ = ​shape​.​simpleDescription​()

这个Shape类缺少了一个重要的东西，初始化器，使用 *init* 创建一个。

	class​ ​NamedShape​ {
	​    ​var​ ​numberOfSides​: ​Int​ = ​0
	​    ​var​ ​name​: ​String
	​    
	​    ​init​(​name​: ​String​) {
	​        ​self​.​name​ = ​name
	​    }
	​    
	​    ​func​ ​simpleDescription​() -> ​String​ {
	​        ​return​ ​"A shape with ​\(​numberOfSides​)​ sides."
	​    }
	​}
	
在初始化器中，使用 *self* 关键字来区分内部变量还是参数，一个内的成员变量必须设置有值，在初始化器中设置或者在声明的时候设置。

用 *deinit* 来声明释放器，如果你需要清理一些东西在dealloc之前。

子类包含父类的名字和属性，使用名字加冒号可以获取到父类的属性。

可以使用 *override* 重写函数。

	class​ ​Square​: ​NamedShape​ {
	​    ​var​ ​sideLength​: ​Double
	​    
	​    ​init​(​sideLength​: ​Double​, ​name​: ​String​) {
	​        ​self​.​sideLength​ = ​sideLength
	​        ​super​.​init​(​name​: ​name​)
	​        ​numberOfSides​ = ​4
	​    }
	​    
	​    ​func​ ​area​() ->  ​Double​ {
	​        ​return​ ​sideLength​ * ​sideLength
	​    }
	​    
	​    ​override​ ​func​ ​simpleDescription​() -> ​String​ {
	​        ​return​ ​"A square with sides of length ​\(​sideLength​)​."
	​    }
	​}
	​let​ ​test​ = ​Square​(​sideLength​: ​5.2​, ​name​: ​"my test square"​)
	​test​.​area​()
	​test​.​simpleDescription​()

可以给参数设置get或set方法

	class​ ​EquilateralTriangle​: ​NamedShape​ {
	​    ​var​ ​sideLength​: ​Double​ = ​0.0
	​    
	​    ​init​(​sideLength​: ​Double​, ​name​: ​String​) {
	​        ​self​.​sideLength​ = ​sideLength
	​        ​super​.​init​(​name​: ​name​)
	​        ​numberOfSides​ = ​3
	​    }
	​    
	​    ​var​ ​perimeter​: ​Double​ {
	​        ​get​ {
	​            ​return​ ​3.0​ * ​sideLength
	​        }
	​        ​set​ {
	​            ​sideLength​ = ​newValue​ / ​3.0
	​        }
	​    }
	​    
	​    ​override​ ​func​ ​simpleDescription​() -> ​String​ {
	​        ​return​ ​"An equilateral triangle with sides of length ​\(​sideLength​)​."
	​    }
	​}
	​var​ ​triangle​ = ​EquilateralTriangle​(​sideLength​: ​3.1​, ​name​: ​"a triangle"​)
	​triangle​.​perimeter
	​triangle​.​perimeter​ = ​9.9
	​triangle​.​sideLength


























	