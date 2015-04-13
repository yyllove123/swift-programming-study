#控制流

##for循环

提供了两种

* **for-in** 循环
* **for** 循环

###for-in 循环

for-in 循环迭代集合中的所有元素。

	for​ ​index​ ​in​ ​1​...​5​ {
	​    ​println​(​"​\(​index​)​ times 5 is ​\(​index​ * ​5​)​"​)
	​}
	​// 1 times 5 is 5
	​// 2 times 5 is 10
	​// 3 times 5 is 15
	​// 4 times 5 is 20
	​// 5 times 5 is 25
	
（...）是闭合区间的符号，它的左右两边可以是一个let定义的常量，如果你不需要获取闭合区间里的值，你可以用下滑线代替index。

	let​ ​base​ = ​3
	​let​ ​power​ = ​10
	​var​ ​answer​ = ​1
	​for​ ​_​ ​in​ ​1​...​power​ {
	​    ​answer​ *= ​base
	​}
	​println​(​"​\(​base​)​ to the power of ​\(​power​)​ is ​\(​answer​)​"​)
	​// prints "3 to the power of 10 is 59049”
	
可循环数组

	let​ ​names​ = [​"Anna"​, ​"Alex"​, ​"Brian"​, ​"Jack"​]
	​for​ ​name​ ​in​ ​names​ {
	​    ​println​(​"Hello, ​\(​name​)​!"​)
	​}
	​// Hello, Anna!
	​// Hello, Alex!
	​// Hello, Brian!
	​// Hello, Jack!
	
可以使用 **for-in** 迭代字典，它会返回一个**(key, value)**的tuple，

	let​ ​numberOfLegs​ = [​"spider"​: ​8​, ​"ant"​: ​6​, ​"cat"​: ​4​]
	​for​ (​animalName​, ​legCount​) ​in​ ​numberOfLegs​ {
	​    ​println​(​"​\(​animalName​)​s have ​\(​legCount​)​ legs"​)
	​}
	​// ants have 6 legs
	​// cats have 4 legs
	​// spiders have 8 legs
	
可迭代一个字符串中的字符

	for​ ​character​ ​in​ ​"Hello"​ {
	​    ​println​(​character​)
	​}
	​// H
	​// e
	​// l
	​// l
	​// o
	
###For循环

Swift也支持C风格的for循环

	for​ ​var​ ​index​ = ​0​; ​index​ < ​3​; ++​index​ {
	​    ​println​(​"index is ​\(​index​)​"​)
	​}
	​// index is 0
	​// index is 1
	​// index is 2
	
##While循环

提供了两种

* **while**
* **do-while**

###While

	while condition {
	    statements
	}
	
下面是个例子

	let​ ​finalSquare​ = ​25
	​var​ ​board​ = [​Int​](​count​: ​finalSquare​ + ​1​, ​repeatedValue​: ​0​)
	
	board​[​03​] = +​08​; ​board​[​06​] = +​11​; ​board​[​09​] = +​09​; ​board​[​10​] = +​02
	​board​[​14​] = -​10​; ​board​[​19​] = -​11​; ​board​[​22​] = -​02​; ​board​[​24​] = -​08
	
	var​ ​square​ = ​0
	​var​ ​diceRoll​ = ​0
	​while​ ​square​ < ​finalSquare​ {
	​    ​// roll the dice
	​    ​if​ ++​diceRoll​ == ​7​ { ​diceRoll​ = ​1​ }
	​    ​// move by the rolled amount
	​    ​square​ += ​diceRoll
	​    ​if​ ​square​ < ​board​.​count​ {
	​        ​// if we're still on the board, move up or down for a snake or a ladder
	​        ​square​ += ​board​[​square​]
	​    }
	​}
	​println​(​"Game over!"​)
	
###do-while循环

	do {
	    statements
	} while condition
	
----

	let​ ​finalSquare​ = ​25
	​var​ ​board​ = [​Int​](​count​: ​finalSquare​ + ​1​, ​repeatedValue​: ​0​)
	​board​[​03​] = +​08​; ​board​[​06​] = +​11​; ​board​[​09​] = +​09​; ​board​[​10​] = +​02
	​board​[​14​] = -​10​; ​board​[​19​] = -​11​; ​board​[​22​] = -​02​; ​board​[​24​] = -​08
	​var​ ​square​ = ​0
	​var​ ​diceRoll​ = ​0
	
	“do​ {
	​    ​// move up or down for a snake or ladder
	​    ​square​ += ​board​[​square​]
	​    ​// roll the dice
	​    ​if​ ++​diceRoll​ == ​7​ { ​diceRoll​ = ​1​ }
	​    ​// move by the rolled amount
	​    ​square​ += ​diceRoll
	​} ​while​ ​square​ < ​finalSquare
	​println​(​"Game over!"​)
	
##条件语句

###if

跟OC的用法差不多，不过不用写小括号

var​ ​temperatureInFahrenheit​ = ​30
​if​ ​temperatureInFahrenheit​ <= ​32​ {
​    ​println​(​"It's very cold. Consider wearing a scarf."​)
​}
​// prints "It's very cold. Consider wearing a scarf.

###switch

switch和OC中很不一样，重点看一下。

	switch some value to consider {
	case value 1:
	    respond to value 1
	case value 2,
	value 3:
	    respond to value 2 or 3
	default:
	    otherwise, do something else
	}

----

	let​ ​someCharacter​: ​Character​ = ​"e"
	​switch​ ​someCharacter​ {
	​case​ ​"a"​, ​"e"​, ​"i"​, ​"o"​, ​"u"​:
	​    ​println​(​"​\(​someCharacter​)​ is a vowel"​)
	​case​ ​"b"​, ​"c"​, ​"d"​, ​"f"​, ​"g"​, ​"h"​, ​"j"​, ​"k"​, ​"l"​, ​"m"​,
	​"n"​, ​"p"​, ​"q"​, ​"r"​, ​"s"​, ​"t"​, ​"v"​, ​"w"​, ​"x"​, ​"y"​, ​"z"​:
	​    ​println​(​"​\(​someCharacter​)​ is a consonant"​)
	​default​:
	​    ​println​(​"​\(​someCharacter​)​ is not a vowel or a consonant"​)
	​}
	​// prints "e is a vowel”
	
###不会全部检验

switch和OC中的不一样，它不会在所有的case中全部检验一遍，它会在某一个case符合条件时，结束switch语句。它不需要写break。

不过 每一个case中至少需要一条执行语句，不然会报错。如下：

	let​ ​anotherCharacter​: ​Character​ = ​"a"
	​switch​ ​anotherCharacter​ {
	​case​ ​"a"​:
	​case​ ​"A"​:
	​    ​println​(​"The letter A"​)
	​default​:
	​    ​println​(​"Not the letter A"​)
	​}
	​// this will report a compile-time error
	
多个判断值，并排写：

	switch some value to consider {
	case value 1, value 2:
	    statements
	}
	
###范围匹配

swift可以让switch检测范围语句：

	let​ ​count​ = ​3_000_000_000_000
	​let​ ​countedThings​ = ​"stars in the Milky Way"
	​var​ ​naturalCount​: ​String
	​switch​ ​count​ {
	​case​ ​0​:
	​    ​naturalCount​ = ​"no"
	​case​ ​1​...​3​:
	​    ​naturalCount​ = ​"a few"
	​case​ ​4​...​9​:
	​    ​naturalCount​ = ​"several"
	​case​ ​10​...​99​:
	​    ​naturalCount​ = ​"tens of"
	​case​ ​100​...​999​:
	​    ​naturalCount​ = ​"hundreds of"
	​case​ ​1000​...​999_999​:
	​    ​naturalCount​ = ​"thousands of"
	​default​:
	​    ​naturalCount​ = ​"millions and millions of"
	​}
	​println​(​"There are ​\(​naturalCount​)​ ​\(​countedThings​)​."​)
	​// prints "There are millions and millions of stars in the Milky Way.”
	
###tuple匹配

可以使用tuple匹配有多个值的时候。可以用（_）表示所有值。

	let​ ​somePoint​ = (​1​, ​1​)
	​switch​ ​somePoint​ {
	​case​ (​0​, ​0​):
	​    ​println​(​"(0, 0) is at the origin"​)
	​case​ (​_​, ​0​):
	​    ​println​(​"(​\(​somePoint​.​0​)​, 0) is on the x-axis"​)
	​case​ (​0​, ​_​):
	​    ​println​(​"(0, ​\(​somePoint​.​1​)​) is on the y-axis"​)
	​case​ (-​2​...​2​, -​2​...​2​):
	​    ​println​(​"(​\(​somePoint​.​0​)​, ​\(​somePoint​.​1​)​) is inside the box"​)
	​default​:
	​    ​println​(​"(​\(​somePoint​.​0​)​, ​\(​somePoint​.​1​)​) is outside of the box"​)
	​}
	​// prints "(1, 1) is inside the box”

###绑定值

可以过滤绑定某个值，

	let​ ​anotherPoint​ = (​2​, ​0​)
	​switch​ ​anotherPoint​ {
	​case​ (​let​ ​x​, ​0​):
	​    ​println​(​"on the x-axis with an x value of ​\(​x​)​"​)
	​case​ (​0​, ​let​ ​y​):
	​    ​println​(​"on the y-axis with a y value of ​\(​y​)​"​)
	​case​ ​let​ (​x​, ​y​):
	​    ​println​(​"somewhere else at (​\(​x​)​, ​\(​y​)​)"​)
	​}
	​// prints "on the x-axis with an x value of 2”
	
###where条件

可以用where分句添加判断条件

	let​ ​yetAnotherPoint​ = (​1​, -​1​)
	​switch​ ​yetAnotherPoint​ {
	​case​ ​let​ (​x​, ​y​) ​where​ ​x​ == ​y​:
	​    ​println​(​"(​\(​x​)​, ​\(​y​)​) is on the line x == y"​)
	​case​ ​let​ (​x​, ​y​) ​where​ ​x​ == -​y​:
	​    ​println​(​"(​\(​x​)​, ​\(​y​)​) is on the line x == -y"​)
	​case​ ​let​ (​x​, ​y​):
	​    ​println​(​"(​\(​x​)​, ​\(​y​)​) is just some arbitrary point"​)
	​}
	​// prints "(1, -1) is on the line x == -y”

##控制转换声明

* continue
* break
* fallthrough
* return

###continue

跳出循环

##标签声明

在嵌套使用switch和循环是，它可以方便的描述将要continue或break的switch和循环。

你可以定义标签，然后用continue跳出某个循环。

	label name: while condition {
	    statements
	}
	
----

	let​ ​finalSquare​ = ​25
	​var​ ​board​ = [​Int​](​count​: ​finalSquare​ + ​1​, ​repeatedValue​: ​0​)
	​board​[​03​] = +​08​; ​board​[​06​] = +​11​; ​board​[​09​] = +​09​; ​board​[​10​] = +​02
	​board​[​14​] = -​10​; ​board​[​19​] = -​11​; ​board​[​22​] = -​02​; ​board​[​24​] = -​08
	​var​ ​square​ = ​0
	​var​ ​diceRoll​ = ​0
	
	gameLoop​: ​while​ ​square​ != ​finalSquare​ {
	​    ​if​ ++​diceRoll​ == ​7​ { ​diceRoll​ = ​1​ }
	​    ​switch​ ​square​ + ​diceRoll​ {
	​    ​case​ ​finalSquare​:
	​        ​// diceRoll will move us to the final square, so the game is over
	​        ​break​ ​gameLoop
	​    ​case​ ​let​ ​newSquare​ ​where​ ​newSquare​ > ​finalSquare​:
	​        ​// diceRoll will move us beyond the final square, so roll again
	​        ​continue​ ​gameLoop
	​    ​default​:
	​        ​// this is a valid move, so find out its effect
	​        ​square​ += ​diceRoll
	​        ​square​ += ​board​[​square​]
	​    }
	​}
	​println​(​"Game over!"​)