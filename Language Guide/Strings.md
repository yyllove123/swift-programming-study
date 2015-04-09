# 字符

双引号直接表示一个字符串

	let​ ​someString​ = ​"Some string literal value”

初始化一个空的字符串

	“var​ ​emptyString​ = ​""​               ​// empty string literal
	​var​ ​anotherEmptyString​ = ​String​()  ​// initializer syntax
	​// these two strings are both empty, and are equivalent to each other
	
判断一个字符串是否为空

	if​ ​emptyString​.​isEmpty​ {
	​    ​println​(​"Nothing to see here"​)
	​}
	​// prints "Nothing to see here”
	
字符改变 用加号，常量字符不能改变

	var​ ​variableString​ = ​"Horse"
	​variableString​ += ​" and carriage"
	​// variableString is now "Horse and carriage"
	​ 
	​let​ ​constantString​ = ​"Highlander"
	​constantString​ += ​" and another Highlander"
	​// this reports a compile-time error - a constant string cannot be modified
	
##String类型值

当String值被传给一个方法或函数是，String值是被复制一封传递的，不是原始的值，

Swift默认复制行为，确保了函数方法接收到得值是确为此方法所有，不用考虑它从哪里来。

##使用Characters

String类型相当于Character类型的集合，你可以使用 for-in循环来获取每一个字符。

	​for​ ​character​ ​in​ ​"Dog!🐶"​ {
	​    ​println​(​character​)
	​}
	​// D
	​// o
	​// g
	​// !
	​// 🐶
	
创建一个Character

	let​ ​yenSign​: ​Character​ = ​"¥"
	
##String和Character一起使用

String通过加号连接两个String，生成一个新的String

	let​ ​string1​ = ​"hello"
	​let​ ​string2​ = ​" there"
	​var​ ​welcome​ = ​string1​ + ​string2
	​// welcome now equals "hello there”
	
可以使用 += 来做到append的功能

	var​ ​instruction​ = ​"look over"
	​instruction​ += ​string2
	​// instruction now equals "look over there”

你可以将一个Character值 添加到String边上上，通过append方法

	let​ ​exclamationMark​: ​Character​ = ​"!"
	​welcome​.​append​(​exclamationMark​)
	​// welcome now equals "hello there!”

##String插入器

String插入器是将变量、常量构建成一个新String的方法

	let​ ​multiplier​ = ​3
	​let​ ​message​ = ​"​\(​multiplier​)​ times 2.5 is ​\(​Double​(​multiplier​) * ​2.5​)​"
	​// message is "3 times 2.5 is 7.5”
	
##Unicode

Swift包含了所有的Unicode字符

###Unicode纯量

Swift的原始String类型是Unicode scalar编译的，Unicode纯量就是一个21位的字符串。比如 U+0061 就代表 “a”，U+1F425代表"🐥"。

###特殊符号

String literals可以包含以下特殊字符

* \0 结束符
* \\ 反斜线
* \t 制表符
* \n 回车
* \r 换行
* \“ 双引号
* \' 单引号

* Unicode scalar表示，写法为 **\u{n}** n是16进制数

下面是4个例子

	let​ ​wiseWords​ = ​"\"Imagination is more important than knowledge\" - Einstein"
	​// "Imagination is more important than knowledge" - Einstein
	​let​ ​dollarSign​ = ​"\u{24}"​        ​// $,  Unicode scalar U+0024
	​let​ ​blackHeart​ = ​"\u{2665}"​      ​// ♥,  Unicode scalar U+2665
	​let​ ​sparklingHeart​ = ​"\u{1F496}"​ ​// 💖, Unicode scalar U+1F496”

###组合扩展字符

所有的Character类型都是一个组合扩展字符，它们可以组合使用。比如 符号 é 的Unicode是 U+00E9， ́ 的Unicode是U+0301，e 的Unicode是 U+0065。那么é 可以是  ́ 和 e 组合起来的Unicode。

	let​ ​eAcute​: ​Character​ = ​"\u{E9}"​                         ​// é
	​let​ ​combinedEAcute​: ​Character​ = ​"\u{65}\u{301}"​          ​// e followed by ́
	​// eAcute is é, combinedEAcute is é
	
	let​ ​precomposed​: ​Character​ = ​"\u{D55C}"​                  ​// 한
	​let​ ​decomposed​: ​Character​ = ​"\u{1112}\u{1161}\u{11AB}"​   ​// ᄒ, ᅡ, ᆫ
	​// precomposed is 한, decomposed is 한
	
	let​ ​enclosedEAcute​: ​Character​ = ​"\u{E9}\u{20DD}"
	​// enclosedEAcute is é⃝
	
	let​ ​regionalIndicatorForUS​: ​Character​ = ​"\u{1F1FA}\u{1F1F8}"
	​// regionalIndicatorForUS is 🇺🇸

##字符数

可以调用全局函数 **countElements** 传一个字符串来获取字符数。

	let​ ​unusualMenagerie​ = ​"Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
	​println​(​"unusualMenagerie has ​\(​countElements​(​unusualMenagerie​))​ characters"​)
	​// prints "unusualMenagerie has 40 characters”
	
如果用组合扩展字符，string的长度有可能变，也有可能不变

	var​ ​word​ = ​"cafe"
	​println​(​"the number of characters in ​\(​word​)​ is ​\(​countElements​(​word​))​"​)
	​// prints "the number of characters in cafe is 4"
	​ 
	​word​ += ​"\u{301}"​    ​// COMBINING ACUTE ACCENT, U+0301
	​ 
	​println​(​"the number of characters in ​\(​word​)​ is ​\(​countElements​(​word​))​"​)
	​// prints "the number of characters in café is 4”

##字符串比较

Swift提供了3种字符串的比较，字符比较，前缀比较，后缀比较。

###字符相等比较

（==）相等比较，（!=）不等比较；

	let​ ​quotation​ = ​"We're a lot alike, you and I."
	​let​ ​sameQuotation​ = ​"We're a lot alike, you and I."
	​if​ ​quotation​ == ​sameQuotation​ {
	​    ​println​(​"These two strings are considered equal"​)
	​}
	​// prints "These two strings are considered equal”

Swift在比较组合扩展字符时，如果它们代表的内容是一样的，就是相等的。

	// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
	​let​ ​eAcuteQuestion​ = ​"Voulez-vous un caf\u{E9}?"
	​ 
	​// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
	​let​ ​combinedEAcuteQuestion​ = ​"Voulez-vous un caf\u{65}\u{301}?"
	​ 
	​if​ ​eAcuteQuestion​ == ​combinedEAcuteQuestion​ {
	​    ​println​(​"These two strings are considered equal"​)
	​}
	​// prints "These two strings are considered equal”

但是相反地，英文中的“A” U+0041，和俄罗斯用的“A” U+0410，是不等的，虽然它们在视觉上一样，但是有着不同的语言意义。

	let​ ​latinCapitalLetterA​: ​Character​ = ​"\u{41}"
	​ 
	​let​ ​cyrillicCapitalLetterA​: ​Character​ = ​"\u{0410}"
	​ 
	​if​ ​latinCapitalLetterA​ != ​cyrillicCapitalLetterA​ {
	​    ​println​(​"These two characters are not equivalent"​)
	​}
	​// prints "These two characters are not equivalent”

### 浅醉和后缀的比较

获取前缀比较方法：hasPrefix

获取后缀比较方法：hasSuffix

	let​ ​romeoAndJuliet​ = [
	​    ​"Act 1 Scene 1: Verona, A public place"​,
	​    ​"Act 1 Scene 2: Capulet's mansion"​,
	​    ​"Act 1 Scene 3: A room in Capulet's mansion"​,
	​    ​"Act 1 Scene 4: A street outside Capulet's mansion"​,
	​    ​"Act 1 Scene 5: The Great Hall in Capulet's mansion"​,
	​    ​"Act 2 Scene 1: Outside Capulet's mansion"​,
	​    ​"Act 2 Scene 2: Capulet's orchard"​,
	​    ​"Act 2 Scene 3: Outside Friar Lawrence's cell"​,
	​    ​"Act 2 Scene 4: A street in Verona"​,
	​    ​"Act 2 Scene 5: Capulet's mansion"​,
	​    ​"Act 2 Scene 6: Friar Lawrence's cell"
	​]
	
	// 前缀
	​var​ ​act1SceneCount​ = ​0
	​for​ ​scene​ ​in​ ​romeoAndJuliet​ {
	​    ​if​ ​scene​.​hasPrefix​(​"Act 1 "​) {
	​        ++​act1SceneCount
	​    }
	​}
	​println​(​"There are ​\(​act1SceneCount​)​ scenes in Act 1"​)
	​// prints "There are 5 scenes in Act 1”
	
	// 后缀
	var​ ​mansionCount​ = ​0
	​var​ ​cellCount​ = ​0
	​for​ ​scene​ ​in​ ​romeoAndJuliet​ {
	​    ​if​ ​scene​.​hasSuffix​(​"Capulet's mansion"​) {
	​        ++​mansionCount
	​    } ​else​ ​if​ ​scene​.​hasSuffix​(​"Friar Lawrence's cell"​) {
	​        ++​cellCount
	​    }
	​}
	​println​(​"​\(​mansionCount​)​ mansion scenes; ​\(​cellCount​)​ cell scenes"​)
	​// prints "6 mansion scenes; 2 cell scenes”

##Unicode表示的字符

* 用utf-8表示字符串用 utf8属性
* 用utf-16表示字符串用 utf16苏醒
* 用21位的Unicode纯量表示字符串，跟utf-32一样用 unicodeScalars属性

例子

	let​ ​dogString​ = ​"Dog‼🐶"


###UTF-8表示

	for​ ​codeUnit​ ​in​ ​dogString​.​utf8​ {
	​    ​print​(​"​\(​codeUnit​)​ "​)
	​}
	​print​(​"\n"​)
	​// 68 111 103 226 128 188 240 159 144 182”

###UTF-16表示

	for​ ​codeUnit​ ​in​ ​dogString​.​utf16​ {
	​    ​print​(​"​\(​codeUnit​)​ "​)
	​}
	​print​(​"\n"​)
	​// 68 111 103 8252 55357 56374
	
###Unicode纯量表示

	for​ ​scalar​ ​in​ ​dogString​.​unicodeScalars​ {
	​    ​print​(​"​\(​scalar​.​value​)​ "​)
	​}
	​print​(​"\n"​)
	​// 68 111 103 8252 128054