#类和结构体

类和结构体是常用的

##类和结构体的比较

相同点

* 定义属性
* 定义方法
* 定义下标
* 定义初始化器
* 扩展功能
* 遵从协议

类可以，结构体不可以

* 继承
* 类型描述，能在运行时解释类
* 定义释放器
* 引用计数

##语法

类用 **class** 关键字，结构体用 **struct** 关键字。

	class​ ​SomeClass​ {
	​    ​// class definition goes here
	​}
	​struct​ ​SomeStructure​ {
	​    ​// structure definition goes here
	​}

例子：

	struct​ ​Resolution​ {
	​    ​var​ ​width​ = ​0
	​    ​var​ ​height​ = ​0
	​}
	​class​ ​VideoMode​ {
	​    ​var​ ​resolution​ = ​Resolution​()
	​    ​var​ ​interlaced​ = ​false
	​    ​var​ ​frameRate​ = ​0.0
	​    ​var​ ​name​: ​String​?
	​}
	
##类和结构体 实例

	let​ ​someResolution​ = ​Resolution​()
	​let​ ​someVideoMode​ = ​VideoMode​()

类和结构体名加小括号，是最简单的实例化方法。

##存取属性

用 点 运算符来存取属性。

获取属性

	println​(​"The width of someResolution is ​\(​someResolution​.​width​)​"​)
	​// prints "The width of someResolution is 0”
	
	println​(​"The width of someVideoMode is ​\(​someVideoMode​.​resolution​.​width​)​"​)
	​// prints "The width of someVideoMode is 0”

设置属性

	someVideoMode​.​resolution​.​width​ = ​1280
	​println​(​"The width of someVideoMode is now ​\(​someVideoMode​.​resolution​.​width​)​"​)
	​// prints "The width of someVideoMode is now 1280”
	
##结构体的逐个成员初始化

结构体默认提供了一个初始化器来逐个初始化成员，但是类没有

	let​ ​vga​ = ​Resolution​(​width​: ​640​, ​height​: ​480​)

##结构体和枚举是类型值

类型值的意思是当你将它赋值给一个变量或常量时，它是一copy的形式传递的。

Swift所有的基础类型也是类型值。

如果这样像下面这样定义了一个Resolution

	let​ ​hd​ = ​Resolution​(​width​: ​1920​, ​height​: ​1080​)
	​var​ ​cinema​ = ​hd
	
这样，hd和cinema是两个不同的实例，如果改变cinema

	cinema​.​width​ = ​2048
	
他们的数值就会不一样

	println​(​"cinema is now ​\(​cinema​.​width​)​ pixels wide"​)
	​// prints "cinema is now 2048 pixels wide”
	
	​println​(​"hd is still ​\(​hd​.​width​)​ pixels wide"​)
	​// prints "hd is still 1920 pixels wide”
	
同样的行为也出现在枚举类型上

	enum​ ​CompassPoint​ {
	​    ​case​ ​North​, ​South​, ​East​, ​West
	​}
	​var​ ​currentDirection​ = ​CompassPoint​.​West
	​let​ ​rememberedDirection​ = ​currentDirection
	​currentDirection​ = .​East
	​if​ ​rememberedDirection​ == .​West​ {
	​    ​println​(​"The remembered direction is still .West"​)
	​}
	​// prints "The remembered direction is still .West”

##类是引用类型的

引用类型不会被copy当作为参数传递时，当改变时都会改变。

	let​ ​tenEighty​ = ​VideoMode​()
	​tenEighty​.​resolution​ = ​hd
	​tenEighty​.​interlaced​ = ​true
	​tenEighty​.​name​ = ​"1080i"
	​tenEighty​.​frameRate​ = ​25.0
	
	let​ ​alsoTenEighty​ = ​tenEighty
	​alsoTenEighty​.​frameRate​ = ​30.0
	
	​println​(​"The frameRate property of tenEighty is now ​\(​tenEighty​.​frameRate​)​"​)
	​// prints "The frameRate property of tenEighty is now 30.0”

##身份运算符

可以用身份运算符来判断两个变量是否为同一个实例，身份运算符有两个 

* (===) 相等
* (!==) 不等

--- 

	if​ ​tenEighty​ === ​alsoTenEighty​ {
	​    ​println​(​"tenEighty and alsoTenEighty refer to the same VideoMode instance."​)
	​}
	​// prints "tenEighty and alsoTenEighty refer to the same VideoMode instance.”

##指针

Swift直接使用常量和变量来表示指针引用，不需要写 (*)

##类和结构体的选择

适合结构体的情况

* 结构体的目的是保存几个简单的数据值
* 在传递的时候，成员值应该是被copy的情况
* 所有属性是自己的类型值，以及它们希望被copy
* 结构不需要从其它类型集成属性或行为

下面是结构体的几个常用情况

* 几个图型类
* range范围的结构体
* 3D坐标的一个点

##数组，字符，字典的分配和复制

如果String，Array，Dictionary类型被定义在结构体中，那么它们在传递的时候是被复制的。如果定义在类中，则是传递引用。