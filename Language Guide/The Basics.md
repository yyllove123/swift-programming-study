#基础

Swift是开发IOS和OS X应用的新语言。尽管如此，你也会对它感到亲切。

Swift提供了自己版本的基础类型，例如 *Int* 是 *integers* , *Double* 和 *Float* 是浮点型值，*Bool* 是Boolean值，*String* 是字符串类型。还有非常强大的 Array 和 Dictionary 类型。

像C一样，Swift用变量存储并指向一个明确的名字，Swift使大部分变量包含的值不能被改变，跟常量一样，但是拥有比C中的常量更强大的功能。常量在Swift中更安全和清晰。

另外，Swift有了一些在OC中不存在的类型，比如tuples，tuples可以创建多参的对象，方法可以返回多个参数。

可选值，

##常量和变量

常量和变量用一个特定类型的名字来表示，常量一旦设置不能改变，变量可以在之后设置不同的值。

###定义常量和变量

let 关键字表示常量，var 关键字表示变量。

	let​ ​maximumNumberOfLoginAttempts​ = ​10 // 常量
	​var​ ​currentLoginAttempt​ = ​0 // 变量
	
	var​ ​x​ = ​0.0​, ​y​ = ​0.0​, ​z​ = ​0.0 // 定义到一行
	
###类型注释

可以提供类型注释来表明定义的常量或变量的值是什么类型。

	var​ ​welcomeMessage​: ​String  // String类型的变量
	welcomeMessage​ = ​"Hello" // 设置字符串类型的值
	
	var​ ​red​, ​green​, ​blue​: ​Double // 定义多个变量为同一个类型
	
###常量变量命名

常量和变量的命名能是任何Unicode字符里的内容。

	let​ ​π​ = ​3.14159
	​let​ ​你好​ = ​"你好世界"
	​let​ ​🐶🐮​ = ​"dogcow”

但是不能包括空白字符、数学字符、箭头、私有字符、Unicode的点、线、方块。不能以数字开头。

###打印常量变量

*println* 可以打印所有的值，输出到控制台上。用反斜线加括号来打印个个变量常量。

	​println​(​"The current value of friendlyWelcome is ​\(​friendlyWelcome​)​"​)
	
	
###注释

	// this is a comment   单行注释
	/* this is also a comment,
	   ​but written over multiple lines */   多行注释
	   
	/* this is the start of the first multiline comment
	​/* this is the second, nested multiline comment */
	this is the end of the first multiline comment */ 注释里包含一个注释

###分号

可以不用分号，但在同一行中有2个语句，需要用分号隔开。

	let​ ​cat​ = ​"🐱"​; ​println​(​cat​)
	​// prints "🐱”

###整数

整数是没有小数部分的。分为有符号的和无符号的。Swift提供了8，16，32，64位的整数。为 UInt8 UInt16 UInt32 Uint64 ; Int8 Int16 Int32 Int64。

### 整数类型范围

你可以使用下面的方法查看范围

	let​ ​minValue​ = ​UInt8​.​min​  ​// minValue is equal to 0, and is of type UInt8
	​let​ ​maxValue​ = ​UInt8​.​max​  ​// maxValue is equal to 255, and is of type UInt8
	
###Int类型 和 UInt

在很多时候你不需要指定整数的范围，Swift提供了 Int 和 UInt 类型：

* 在32位的平台，Int 相当于 Int32 。
* 在64位的平台，Int 相当于 Int64 。

* 在32位的平台，UInt 相当于 UInt32 。
* 在64位的平台，UInt 相当于 UInt64 。

### 浮点型

Double 和 Float

* Double 相当于64位的浮点数，他只用于非常大得数。
* Float 相当于32位的浮点数，它用于非 Double 的地方。

### 类型安全和类型推断

Swift是类型安全的，如果你的代码期望一个String，你不能传一个整型的值。
Swift会根据上下文推断常量变量的类型。

###Numeric Literals

* 10进制不需要前缀
* 2进制，用 0b 做前缀
* 8进制，用 0o 做前缀
* 16进制，用 0x 做前缀

下面是17的几种表示法：

	let​ ​decimalInteger​ = ​17
	let​ ​binaryInteger​ = ​0b10001​       ​// 17 in binary notation
	​let​ ​octalInteger​ = ​0o21​           ​// 17 in octal notation
	​let​ ​hexadecimalInteger​ = ​0x11​     ​// 17 in hexadecimal notation
	
浮点型可以是十进制或十六进制，它们有一个可选的指数，10进制用大写或小写的 e ，16进制用大写或小写的 p 。

10进制的 e ，代表10的n次方

* 1.25e2 表示 1.25 乘10的2次方，或125.0 。
* 1.25e-2 表示 1.25 乘10的-2次方，或0.0125

16进制的 p ， 代表2的N次方

* 0xFp2 表示 15 乘2的2次方，60.0
* 0xFp-2 表示 15 成2的-2次方，3.75

下面是几个值为 12.1875 的表示法：

	let​ ​decimalDouble​ = ​12.1875
	​let​ ​exponentDouble​ = ​1.21875e1
	​let​ ​hexadecimalDouble​ = ​0xC.3p0
	
Numeric literals能包含扩展格式使它们更容易阅读。整型和浮点型可以扩展零和下划线让它们更容易阅读

	let​ ​paddedDouble​ = ​000123.456
	​let​ ​oneMillion​ = ​1_000_000
	​let​ ​justOverOneMillion​ = ​1_000_000.000_000_1
	
###类型转换

**SomeType(ofInitialValue)** 是Swift提供的类型转换方法。

合并是需要是同类型

	let​ ​twoThousand​: ​UInt16​ = ​2_000
	​let​ ​one​: ​UInt8​ = ​1
	​let​ ​twoThousandAndOne​ = ​twoThousand​ + ​UInt16​(​one​)
	
	let​ ​three​ = ​3
	​let​ ​pointOneFourOneFiveNine​ = ​0.14159
	​let​ ​pi​ = ​Double​(​three​) + ​pointOneFourOneFiveNine
	​// pi equals 3.14159, and is inferred to be of type Double
	
	let​ ​integerPi​ = ​Int​(​pi​)
	​// integerPi equals 3, and is inferred to be of type Int
	
###类型化名

可以使用 **typealias** 给一个存在的类型取一个别名。

	typealias​ ​AudioSample​ = ​UInt16
	
	​var​ ​maxAmplitudeFound​ = ​AudioSample​.​min
	​// maxAmplitudeFound is now 0
	
###Booleans

	let​ ​orangesAreOrange​ = ​true
	​let​ ​turnipsAreDelicious​ = ​false
	
	if​ ​turnipsAreDelicious​ {
	​    ​println​(​"Mmm, tasty turnips!"​)
	​} ​else​ {
	​    ​println​(​"Eww, turnips are horrible."​)
	​}

Swift是类型安全的，如果if语句中间不是bool类型，则将会发生错误。

	let​ ​i​ = ​1
	​if​ ​i​ {
	​    ​// this example will not compile, and will report an error
	​}
	
	let​ ​i​ = ​1
	​if​ ​i​ == ​1​ {
	​    ​// this example will compile successfully
	​}
	
###Tuples

（400，“Not Found”） 是一个HTTP状态码的tuple。

	let​ ​http404Error​ = (​404​, ​"Not Found"​)
	​// http404Error is of type (Int, String), and equals (404, "Not Found")
	
像这样定义一个tuple (Int, Int, Int)、(String, Bool)

你能分别使用tuple中的常量或变量。

	let​ (​statusCode​, ​statusMessage​) = ​http404Error
	​println​(​"The status code is ​\(​statusCode​)​"​)
	​// prints "The status code is 404"
	​println​(​"The status message is ​\(​statusMessage​)​"​)
	​// prints "The status message is Not Found
	
如果你只想使用tuple中的某一个值，则其它部分用(_)代替。

	let​ (​justTheStatusCode​, ​_​) = ​http404Error
	​println​(​"The status code is ​\(​justTheStatusCode​)​"​)
	
还可以用数字下标获取tuple的值。

	println​(​"The status code is ​\(​http404Error​.​0​)​"​)
	​// prints "The status code is 404"
	​println​(​"The status message is ​\(​http404Error​.​1​)​"​)
	
你能给单独的元素命名：

	let​ ​http200Status​ = (​statusCode​: ​200​, ​description​: ​"OK"​)
	
	println​(​"The status code is ​\(​http200Status​.​statusCode​)​"​)
	​// prints "The status code is 200"
	​println​(​"The status message is ​\(​http200Status​.​description​)​"​)
	​// prints "The status message is OK
	
###Optionals

你可以使用optionals在值为空的情况下。

optional 就是说，这里有值 或者 这里没有值。

一个例子，Swift的 String 类型有个方法叫做 toInt，可以把一个字符串转换为Int类型。可是，不是所有的字符串都能转换成整型值。“123”可以转换，但 “Hello， world”不能转换。

代码如下

	let​ ​possibleNumber​ = ​"123"
	​let​ ​convertedNumber​ = ​possibleNumber​.​toInt​()
	​// convertedNumber is inferred to be of type "Int?", or "optional Int”

最后一句会报错，因为转换有可能失败，toInt 返回的是一个可选值，Int的可选值可以写成 **Int?** 它就表示，它可能是一个Int值，也有可能没有值。

###nil

你可以将一个可选值设置为nil

	var​ ​serverResponseCode​: ​Int​? = ​404
	​// serverResponseCode contains an actual Int value of 404
	​serverResponseCode​ = ​nil
	​// serverResponseCode now contains no value
	
nil不能赋给一个不是可选的变量。

###if语句和强制使用

可选值的判断可以和nil进行判断。

	if​ ​convertedNumber​ != ​nil​ {
	​    ​println​(​"convertedNumber contains some integer value."​)
	​}
	​// prints "convertedNumber contains some integer value.”

如果你可以确定可选值是有值的，你可以在后面加入叹号。就是说这个值肯定是有的，用它吧。

	“if​ ​convertedNumber​ != ​nil​ {
	​    ​println​(​"convertedNumber has an integer value of ​\(​convertedNumber​!)​."​)
	​}
	​// prints "convertedNumber has an integer value of 123.”

###可选绑定

你可以使用可选绑定来接收一个可选值，如果成功，则创建一个临时的变量。可选绑定可以用在if语句和while语句中，用来检查可选值，并创建常量或变量。

	if let constantName = someOptional {
	    // statements
	}
	if​ ​let​ ​actualNumber​ = ​possibleNumber​.​toInt​() {
	​    ​println​(​"\'​\(​possibleNumber​)​\' has an integer value of ​\(​actualNumber​)​"​)
	​} ​else​ {
	​    ​println​(​"\'​\(​possibleNumber​)​\' could not be converted to an integer"​)
	​}
	​// prints "'123' has an integer value of 123”

	
###隐式的 unwrapped optional

（String​?）常用于类的初始化器，创建一个可选值。

	let​ ​possibleString​: ​String​? = ​"An optional string."
	​let​ ​forcedString​: ​String​ = ​possibleString​! ​// requires an exclamation mark
	​ 
	​let​ ​assumedString​: ​String​! = ​"An implicitly unwrapped optional string."
	​let​ ​implicitString​: ​String​ = ​assumedString​ ​// no need for an exclamation mark
	
	if​ ​assumedString​ != ​nil​ {
	​    ​println​(​assumedString​)
	​}
	​// prints "An implicitly unwrapped optional string.”

##断言

你可以使用断言来提供一个调试异常的机会，如果有个可选值是nil。

###调试和断言

	let​ ​age​ = -​3
	​assert​(​age​ >= ​0​, ​"A person's age cannot be less than zero"​)
	​// this causes the assertion to trigger, because age is not >= 0
	
###什么时候使用断言

* 在获取数组对象时，下标可能太高或太低。可以使用。
* 一个函数被传了一个参数，但是这个值不是函数需要的值。
* 一个可选值是nil，但是必须要一个非空的值。