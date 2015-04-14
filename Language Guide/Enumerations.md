#枚举类型

枚举类型是一个公共类型，并是类型安全的。

如果你熟悉C，你肯定知道C的枚举值只能是整型值。枚举类型在Swift中是非常灵活的。类型可以是string、char、整型或浮点型

##枚举语法

你可以使用 **enum** 关键字定义一个枚举

	enum​ ​SomeEnumeration​ {
	​    ​// enumeration definition goes here
	​}
	
下面是一个定义指南针方向的例子

	enum​ ​CompassPoint​ {
	​    ​case​ ​North
	​    ​case​ ​South
	​    ​case​ ​East
	​    ​case​ ​West
	​}
	
多个成员值可以写在一行

	enum​ ​Planet​ {
	​    ​case​ ​Mercury​, ​Venus​, ​Earth​, ​Mars​, ​Jupiter​, ​Saturn​, ​Uranus​, ​Neptune
	​}
	
一个枚举类型的变量在定义时已经确定了它的类型

	var​ ​directionToHead​ = ​CompassPoint​.​West
	
所以你可以用更加简短的语法来改变它

	directionToHead​ = .​East
	
##Switch匹配枚举值

	directionToHead​ = .​South
	​switch​ ​directionToHead​ {
	​case​ .​North​:
	​    ​println​(​"Lots of planets have a north"​)
	​case​ .​South​:
	​    ​println​(​"Watch out for penguins"​)
	​case​ .​East​:
	​    ​println​(​"Where the sun rises"​)
	​case​ .​West​:
	​    ​println​(​"Where the skies are blue"​)
	​}
	​// prints "Watch out for penguins”

注意一定要将枚举值列举完全，不然需要用default来表示。

	let​ ​somePlanet​ = ​Planet​.​Earth
	​switch​ ​somePlanet​ {
	​case​ .​Earth​:
	​    ​println​(​"Mostly harmless"​)
	​default​:
	​    ​println​(​"Not a safe place for humans"​)
	​}
	​// prints "Mostly harmless”
	
##相关值

case中的值可以接纳任何类型，两个case中的类型还可能不一样。

下面是枚举扫描二维码和条形码两个方法的例子：

	enum​ ​Barcode​ {
	​    ​case​ ​UPCA​(​Int​, ​Int​, ​Int​, ​Int​)
	​    ​case​ ​QRCode​(​String​)
	​}

你可以定义一个变量使用它们

	var​ ​productBarcode​ = ​Barcode​.​UPCA​(​8​, ​85909​, ​51226​, ​3​)
	
	productBarcode​ = .​QRCode​(​"ABCDEFGHIJKLMNOP"​)
	
用于switch是这样的

	switch​ ​productBarcode​ {
	​case​ .​UPCA​(​let​ ​numberSystem​, ​let​ ​manufacturer​, ​let​ ​product​, ​let​ ​check​):
	​    ​println​(​"UPC-A: ​\(​numberSystem​)​, ​\(​manufacturer​)​, ​\(​product​)​, ​\(​check​)​."​)
	​case​ .​QRCode​(​let​ ​productCode​):
	​    ​println​(​"QR code: ​\(​productCode​)​."​)
	​}
	​// prints "QR code: ABCDEFGHIJKLMNOP.”

如果所有的枚举成员相关值都是常量或是变量，可以用一个符号表示它

	switch​ ​productBarcode​ {
	​case​ ​let​ .​UPCA​(​numberSystem​, ​manufacturer​, ​product​, ​check​):
	​    ​println​(​"UPC-A: ​\(​numberSystem​)​, ​\(​manufacturer​)​, ​\(​product​)​, ​\(​check​)​."​)
	​case​ ​let​ .​QRCode​(​productCode​):
	​    ​println​(​"QR code: ​\(​productCode​)​."​)
	​}
	​// prints "QR code: ABCDEFGHIJKLMNOP.”

##原始值

可以给枚举的成员设置原始值

	enum​ ​ASCIIControlCharacter​: ​Character​ {
	​    ​case​ ​Tab​ = ​"\t"
	​    ​case​ ​LineFeed​ = ​"\n"
	​    ​case​ ​CarriageReturn​ = ​"\r"
	​}
	
整型的值会自动添加

	enum​ ​Planet​: ​Int​ {
	​    ​case​ ​Mercury​ = ​1​, ​Venus​, ​Earth​, ​Mars​, ​Jupiter​, ​Saturn​, ​Uranus​, ​Neptune
	​}
	
可以取到原始值

	let​ ​earthsOrder​ = ​Planet​.​Earth​.​rawValue
	​// earthsOrder is 3
	
##通过原始值初始化

如果你定义了一个原始值类型，可用原始值初始化枚举值

	let​ ​possiblePlanet​ = ​Planet​(​rawValue​: ​7​)
	​// possiblePlanet is of type Planet? and equals Planet.Uranus
	
它有可能没有这个值，所以它返回的是一个可选值，如果你传9，则它返回的就是nil

	let​ ​positionToFind​ = ​9
	​if​ ​let​ ​somePlanet​ = ​Planet​(​rawValue​: ​positionToFind​) {
	​    ​switch​ ​somePlanet​ {
	​    ​case​ .​Earth​:
	​        ​println​(​"Mostly harmless"​)
	​    ​default​:
	​        ​println​(​"Not a safe place for humans"​)
	​    }
	​} ​else​ {
	​    ​println​(​"There isn't a planet at position ​\(​positionToFind​)​"​)
	​}
	​// prints "There isn't a planet at position 9”

