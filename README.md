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

在 *perimeter* 的set方法中，新的值用 *newValue* 来表示，你也可以提供一个set参数来代表。

*EquilateralTriangle* 类的初始化器有3个不同的步骤：

1. 设置了父类的一个参数。
2. 调用了父类的初始化器。
3. 改变父类的属性值。

如果你不想计算，但是需要在运行前或者运行后设置一些新值，可以使用 *willSet* 和 *didSet* 。例如下面的类，确保了三角形的边长始终等于正方形的边长。

	class​ ​TriangleAndSquare​ {
	​    ​var​ ​triangle​: ​EquilateralTriangle​ {
	​        ​willSet​ {
	​            ​square​.​sideLength​ = ​newValue​.​sideLength
	​        }
	​    }
	​    ​var​ ​square​: ​Square​ {
	​        ​willSet​ {
	​            ​triangle​.​sideLength​ = ​newValue​.​sideLength
	​        }
	​    }
	​    ​init​(​size​: ​Double​, ​name​: ​String​) {
	​        ​square​ = ​Square​(​sideLength​: ​size​, ​name​: ​name​)
	​        ​triangle​ = ​EquilateralTriangle​(​sideLength​: ​size​, ​name​: ​name​)
	​    }
	​}
	​var​ ​triangleAndSquare​ = ​TriangleAndSquare​(​size​: ​10​, ​name​: ​"another test shape"​)
	​triangleAndSquare​.​square​.​sideLength
	​triangleAndSquare​.​triangle​.​sideLength
	​triangleAndSquare​.​square​ = ​Square​(​sideLength​: ​50​, ​name​: ​"larger square"​)
	​triangleAndSquare​.​triangle​.​sideLength

可以给参数设置一个名字：

	class​ ​Counter​ {
	​    ​var​ ​count​: ​Int​ = ​0
	​    ​func​ ​incrementBy​(​amount​: ​Int​, ​numberOfTimes​ ​times​: ​Int​) {
	​        ​count​ += ​amount​ * ​times
	​    }
	​}
	​var​ ​counter​ = ​Counter​()
	​counter​.​incrementBy​(​2​, ​numberOfTimes​: ​7​)

当接收一个可选值时，你可以使用问号（？）在方法属性前，如果返回的值是 nil, 则所有的这个值存在的地方将会被忽略。

	let​ ​optionalSquare​: ​Square​? = ​Square​(​sideLength​: ​2.5​, ​name​: ​"optional square"​)
	​let​ ​sideLength​ = ​optionalSquare​?.​sideLength

###枚举和结构体

使用 *enum* 来创建一个枚举。像类和其他名字类型一样，枚举可以拥有方法

	enum​ ​Rank​: ​Int​ {
	​    ​case​ ​Ace​ = ​1
	​    ​case​ ​Two​, ​Three​, ​Four​, ​Five​, ​Six​, ​Seven​, ​Eight​, ​Nine​, ​Ten
	​    ​case​ ​Jack​, ​Queen​, ​King
	​    ​func​ ​simpleDescription​() -> ​String​ {
	​        ​switch​ ​self​ {
	​        ​case​ .​Ace​:
	​            ​return​ ​"ace"
	​        ​case​ .​Jack​:
	​            ​return​ ​"jack"
	​        ​case​ .​Queen​:
	​            ​return​ ​"queen"
	​        ​case​ .​King​:
	​            ​return​ ​"king"
	​        ​default​:
	​            ​return​ ​String​(​self​.​rawValue​)
	​        }
	​    }
	​}
	​let​ ​ace​ = ​Rank​.​Ace
	​let​ ​aceRawValue​ = ​ace​.​rawValue

上面的例子它的枚举值是 Int 类型，所以你只需要具体说明第一个值就可以了，它的值按顺序自动设置。如果你用一个字符串或者浮点型的类型，使用 *rawValue* 属性来指定枚举成员的值。

使用 *init?（rawValue:）* 初始化器来创建一个枚举值。

	if​ ​let​ ​convertedRank​ = ​Rank​(​rawValue​: ​3​) {
	​    ​let​ ​threeDescription​ = ​convertedRank​.​simpleDescription​()
	​}

声明枚举的时候，可以不指定类型。

	enum​ ​Suit​ {
	​    ​case​ ​Spades​, ​Hearts​, ​Diamonds​, ​Clubs
	​    ​func​ ​simpleDescription​() -> ​String​ {
	​        ​switch​ ​self​ {
	​        ​case​ .​Spades​:
	​            ​return​ ​"spades"
	​        ​case​ .​Hearts​:
	​            ​return​ ​"hearts"
	​        ​case​ .​Diamonds​:
	​            ​return​ ​"diamonds"
	​        ​case​ .​Clubs​:
	​            ​return​ ​"clubs"
	​        }
	​    }
	​}
	​let​ ​hearts​ = ​Suit​.​Hearts
	​let​ ​heartsDescription​ = ​hearts​.​simpleDescription​()


使用 *struct* 创建一个结构体，它支持类的行为，可以包括方法的初始化器。它和类的区别在于，它在作为参数时总是被复制的，类只是传递引用。

	struct​ ​Card​ {
	​    ​var​ ​rank​: ​Rank
	​    ​var​ ​suit​: ​Suit
	​    ​func​ ​simpleDescription​() -> ​String​ {
	​        ​return​ ​"The ​\(​rank​.​simpleDescription​())​ of ​\(​suit​.​simpleDescription​())​"
	​    }
	​}
	​let​ ​threeOfSpades​ = ​Card​(​rank​: .​Three​, ​suit​: .​Spades​)
	​let​ ​threeOfSpadesDescription​ = ​threeOfSpades​.​simpleDescription​()

一个实例的枚举成员能关联这个实例。各个实例中的相同枚举成员能有不同的值。你能提供一个相关值在创建实例的时候。相关值和原始值是不一样的：原始值在所有的实例中是一样的，你提供这个原始值在定义枚举的时候。
*(An instance of an enumeration member can have values associated with the instance. Instances of the same enumeration member can have different values associated with them. You provide the associated values when you create the instance. Associated values and raw values are different: The raw value of an enumeration member is the same for all of its instances, and you provide the raw value when you define the enumeration.)*

例如：从服务器请求日出日落时间。服务器将会返回正确的信息或者错误的信息。

	enum​ ​ServerResponse​ {
	​    ​case​ ​Result​(​String​, ​String​)
	​    ​case​ ​Error​(​String​)
	​}
	​ 
	​let​ ​success​ = ​ServerResponse​.​Result​(​"6:00 am"​, ​"8:09 pm"​)
	​let​ ​failure​ = ​ServerResponse​.​Error​(​"Out of cheese."​)
	​ 
	​switch​ ​success​ {
	​case​ ​let​ .​Result​(​sunrise​, ​sunset​):
	​    ​let​ ​serverResponse​ = ​"Sunrise is at ​\(​sunrise​)​ and sunset is at ​\(​sunset​)​."
	​case​ ​let​ .​Error​(​error​):
	​    ​let​ ​serverResponse​ = ​"Failure...  ​\(​error​)​"
	​}

Notice how the sunrise and sunset times are extracted from the ServerResponse value as part of matching the value against the switch cases.

###协议和扩展

用 *protocol* 定义一个协议

	protocol​ ​ExampleProtocol​ {
	​    ​var​ ​simpleDescription​: ​String​ { ​get​ }
	​    ​mutating​ ​func​ ​adjust​()
	​}

类、枚举、结构体 均可使用协议。

	class​ ​SimpleClass​: ​ExampleProtocol​ {
	​    ​var​ ​simpleDescription​: ​String​ = ​"A very simple class."
	​    ​var​ ​anotherProperty​: ​Int​ = ​69105
	​    ​func​ ​adjust​() {
	​        ​simpleDescription​ += ​"  Now 100% adjusted."
	​    }
	​}
	​var​ ​a​ = ​SimpleClass​()
	​a​.​adjust​()
	​let​ ​aDescription​ = ​a​.​simpleDescription
	​ 
	​struct​ ​SimpleStructure​: ​ExampleProtocol​ {
	​    ​var​ ​simpleDescription​: ​String​ = ​"A simple structure"
	​    ​mutating​ ​func​ ​adjust​() {
	​        ​simpleDescription​ += ​" (adjusted)"
	​    }
	​}
	​var​ ​b​ = ​SimpleStructure​()
	​b​.​adjust​()
	​let​ ​bDescription​ = ​b​.​simpleDescription

*mutating*关键字，表示会改变当前的结构体. 类不用，因为类方法总是可以改变类。

使用 *extension* 给一个存在的类型添加功能。比如一个新的方法和属性。你可以用扩展给一个自定义类型或系统类型添加一个协议方法。

	extension​ ​Int​: ​ExampleProtocol​ {
	​    ​var​ ​simpleDescription​: ​String​ {
	​        ​return​ ​"The number ​\(​self​)​"
	​    }
	​    ​mutating​ ​func​ ​adjust​() {
	​        ​self​ += ​42
	​    }
	​}
	​7​.​simpleDescription

你可以像其他类型名一样使用协议名，比如，创建 实现了一个协议的不同类型对象的集合，当你的一个值类型是一个协议类型，协议外的其他方法是不可用的。

	let​ ​protocolValue​: ​ExampleProtocol​ = ​a
	​protocolValue​.​simpleDescription
	​// protocolValue.anotherProperty  // Uncomment to see the error

###泛型

用一个尖括号包括名字创建一个泛型的方法或类型

	func​ ​repeat​<​Item​>(​item​: ​Item​, ​times​: ​Int​) -> [​Item​] {
	​    ​var​ ​result​ = [​Item​]()
	​    ​for​ ​i​ ​in​ ​0​..<​times​ {
	​        ​result​.​append​(​item​)
	​    }
	​    ​return​ ​result
	​}
	​repeat​(​"knock"​, ​4​)

你能创建泛型表单在方法和函数中，也可以在类，枚举，结构体中。

	// Reimplement the Swift standard library's optional type
	​enum​ ​OptionalValue​<​T​> {
	​    ​case​ ​None
	​    ​case​ ​Some​(​T​)
	​}
	​var​ ​possibleInteger​: ​OptionalValue​<​Int​> = .​None
	​possibleInteger​ = .​Some​(​100​)

在类型名后面用 *where* 来具体说明要求的列表-- 例如，要求这个类型实现一个协议，要求两个类型一样，要求一个类必须有一个指定的父类。

	func​ ​anyCommonElements​ <​T​, ​U​ ​where​ ​T​: ​SequenceType​, ​U​: ​SequenceType​, ​T​.​Generator​.​Element​: ​Equatable​, ​T​.​Generator​.​Element​ == ​U​.​Generator​.​Element​> (​lhs​: ​T​, ​rhs​: ​U​) -> ​Bool​ {
	​    ​for​ ​lhsItem​ ​in​ ​lhs​ {
	​        ​for​ ​rhsItem​ ​in​ ​rhs​ {
	​            ​if​ ​lhsItem​ == ​rhsItem​ {
	​                ​return​ ​true
	​            }
	​        }
	​    }
	​    ​return​ ​false
	​}
	​anyCommonElements​([​1​, ​2​, ​3​], [​3​])

在一些简单的例子中，你可以删除 *where* 并且提供一个协议或类名在冒号后面。*<T: Equatable>* 和 *<T where T: Equatable>* 是一样的







	