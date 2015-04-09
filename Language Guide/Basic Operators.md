#基本运算

##术语

* 一元：一个参数
* 二元：2个参数
* 三元：3个参数

##赋值运算符

等号

	let​ ​b​ = ​10
	​var​ ​a​ = ​5
	​a​ = ​b
	​// a is now equal to 10
	
tuple

	let​ (​x​, ​y​) = (​1​, ​2​)
	​// x is equal to 1, and y is equal to 2
	
不像C或OC一样，赋值运算符不会返回一个值，所以下面这个代码是错误的

	if​ ​x​ = ​y​ {
	​    ​// this is not valid, because x = y does not return a value
	​}

如果想比较x和y是否相等，则用双等号。

##数学运算符

* 加法（+）
* 减法（-）
* 乘法（*）
* 除法（/）

加法运算符，还用于字符串的连接：

	hello, "​ + ​"world"​  ​// equals "hello, world”

##取余运算符

a % b 这个运算会被解析成 a = （b * some multiplier）+ remainder
some multiplier 是 b 在 a 中最大的倍数。

	9​ % ​4​    ​// equals 1
	// 被转化成 9 = (4 × 2) + 1
	
	-​9​ % ​4​   ​// equals -1
	// 被转化成 -9 = (4 × -2) + -1
	
##浮点型 取余

	8​ % ​2.5​   ​// equals 0.5
	
##自增自减

	var​ ​i​ = ​0
	​++​i​      ​// i now equals 1
	i++
	--i
	i--
	
##一元减号

	let​ ​three​ = ​3
	​let​ ​minusThree​ = -​three​       ​// minusThree equals -3
	​let​ ​plusThree​ = -​minusThree​   ​// plusThree equals 3, or "minus minus three
	
##一元加号

加号不做任何改动

	let​ ​minusSix​ = -​6
	​let​ ​alsoMinusSix​ = +​minusSix​  ​// alsoMinusSix equals -6
	
##复合数学运算符

+=

-=

	var​ ​a​ = ​1
	​a​ += ​2
	​// a is now equal to 3
	
##比较运算符

* 相等（a == b）
* 不等（a != b）
* 大于（a > b）
* 小于（a < b）
* 大于等于（a >= b）
* 小于等于（a <= b）

它们返回一个bool值，常和if条件语句一起使用

##三元条件运算符

question ? answer1 : answer2

##nil合并运算符

(a ?? b) 代表可选值a，如果a有值，则返回a，如果a没有值，则返回b。

它相当于是这段代码的缩写（a​ != ​nil​ ? ​a​! : ​b）

	let​ ​defaultColorName​ = ​"red"
	​var​ ​userDefinedColorName​: ​String​?   ​// defaults to nil
	​ 
	​var​ ​colorNameToUse​ = ​userDefinedColorName​ ?? ​defaultColorName
	​// userDefinedColorName is nil, so colorNameToUse is set to the default of "red”
	
##范围运算符

Swift包括两种范围运算符

###闭合范围

(a...b) 从a到b，包括b。

	for​ ​index​ ​in​ ​1​...​5​ {
	​    ​println​(​"​\(​index​)​ times 5 is ​\(​index​ * ​5​)​"​)
	​}
	​// 1 times 5 is 5
	​// 2 times 5 is 10
	​// 3 times 5 is 15
	​// 4 times 5 is 20
	​// 5 times 5 is 25
	
###半开范围

(a..<b) 从a到b，不包括b。

	let​ ​names​ = [​"Anna"​, ​"Alex"​, ​"Brian"​, ​"Jack"​]
	​let​ ​count​ = ​names​.​count
	​for​ ​i​ ​in​ ​0​..<​count​ {
	​    ​println​(​"Person ​\(​i​ + ​1​)​ is called ​\(​names​[​i​])​"​)
	​}
	​// Person 1 is called Anna
	​// Person 2 is called Alex
	​// Person 3 is called Brian
	​// Person 4 is called Jack
	
##逻辑运算符

* 非运算符（!a）
* 并运算符（a && b）
* 或运算符（a || b）