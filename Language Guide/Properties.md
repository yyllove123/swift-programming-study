#属性

##储存属性

	struct​ ​FixedLengthRange​ {
	​    ​var​ ​firstValue​: ​Int
	​    ​let​ ​length​: ​Int
	​}
	​var​ ​rangeOfThreeItems​ = ​FixedLengthRange​(​firstValue​: ​0​, ​length​: ​3​)
	​// the range represents integer values 0, 1, and 2
	​rangeOfThreeItems​.​firstValue​ = ​6
	​// the range now represents integer values 6, 7, and 8
	
##常量结构体实例的储存属性

如果你用常量的方式在结构体中定义属性，则这个属性是不可改变的。

	let​ ​rangeOfFourItems​ = ​FixedLengthRange​(​firstValue​: ​0​, ​length​: ​4​)
	​// this range represents integer values 0, 1, 2, and 3
	​rangeOfFourItems​.​firstValue​ = ​6
	​// this will report an error, even though firstValue is a variable property
	
##懒储存属性

lazy stored property就是这个属性不被初始化，直到它第一次使用的时候。使用 **lazy** 关键字定义。

下面的例子

	class​ ​DataImporter​ {
	​    ​/*
	​    DataImporter is a class to import data from an external file.
	​    The class is assumed to take a non-trivial amount of time to initialize.
	​    */
	​    ​var​ ​fileName​ = ​"data.txt"
	​    ​// the DataImporter class would provide data importing functionality here
	​}
	​ 
	​class​ ​DataManager​ {
	​    ​lazy​ ​var​ ​importer​ = ​DataImporter​()
	​    ​var​ ​data​ = [​String​]()
	​    ​// the DataManager class would provide data management functionality here
	​}
	​ 
	​let​ ​manager​ = ​DataManager​()
	​manager​.​data​.​append​(​"Some data"​)
	​manager​.​data​.​append​(​"Some more data"​)
	​// the DataImporter instance for the importer property has not yet been created
	
这个时候 importer 成员还没有被初始化，直到下面这句话。

	println​(​manager​.​importer​.​fileName​)
	​// the DataImporter instance for the importer property has now been created
	​// prints "data.txt”

##Stored Properties and Instance Variables

##计算属性

属性，类，结构体，枚举都可以定义成计算属性，就是它不储存任何的值，他通过重写get和set方法来重新计算值。

	struct​ ​Point​ {
	​    ​var​ ​x​ = ​0.0​, ​y​ = ​0.0
	​}
	​struct​ ​Size​ {
	​    ​var​ ​width​ = ​0.0​, ​height​ = ​0.0
	​}
	​struct​ ​Rect​ {
	​    ​var​ ​origin​ = ​Point​()
	​    ​var​ ​size​ = ​Size​()
	​    ​var​ ​center​: ​Point​ {
	​        ​get​ {
	​            ​let​ ​centerX​ = ​origin​.​x​ + (​size​.​width​ / ​2​)
	​            ​let​ ​centerY​ = ​origin​.​y​ + (​size​.​height​ / ​2​)
	​            ​return​ ​Point​(​x​: ​centerX​, ​y​: ​centerY​)
	​        }
	​        ​set​(​newCenter​) {
	​            ​origin​.​x​ = ​newCenter​.​x​ - (​size​.​width​ / ​2​)
	​            ​origin​.​y​ = ​newCenter​.​y​ - (​size​.​height​ / ​2​)
	​        }
	​    }
	​}
	​var​ ​square​ = ​Rect​(​origin​: ​Point​(​x​: ​0.0​, ​y​: ​0.0​),
	​    ​size​: ​Size​(​width​: ​10.0​, ​height​: ​10.0​))
	​let​ ​initialSquareCenter​ = ​square​.​center
	​square​.​center​ = ​Point​(​x​: ​15.0​, ​y​: ​15.0​)
	​println​(​"square.origin is now at (​\(​square​.​origin​.​x​)​, ​\(​square​.​origin​.​y​)​)"​)
	​// prints "square.origin is now at (10.0, 10.0)”

###简写set定义

一个默认的参数叫 **newValue** 提供给set方法，所以set方法不用写参数
	
	struct​ ​AlternativeRect​ {
	​    ​var​ ​origin​ = ​Point​()
	​    ​var​ ​size​ = ​Size​()
	​    ​var​ ​center​: ​Point​ {
	​        ​get​ {
	​            ​let​ ​centerX​ = ​origin​.​x​ + (​size​.​width​ / ​2​)
	​            ​let​ ​centerY​ = ​origin​.​y​ + (​size​.​height​ / ​2​)
	​            ​return​ ​Point​(​x​: ​centerX​, ​y​: ​centerY​)
	​        }
	​        ​set​ {
	​            ​origin​.​x​ = ​newValue​.​x​ - (​size​.​width​ / ​2​)
	​            ​origin​.​y​ = ​newValue​.​y​ - (​size​.​height​ / ​2​)
	​        }
	​    }
	​}
	
###只读计算属性

如果没有set方法，表明这个属性是只读属性。

下面是一个省去了get关键字的定义

	struct​ ​Cuboid​ {
	​    ​var​ ​width​ = ​0.0​, ​height​ = ​0.0​, ​depth​ = ​0.0
	​    ​var​ ​volume​: ​Double​ {
	​        ​return​ ​width​ * ​height​ * ​depth
	​    }
	​}
	​let​ ​fourByFiveByTwo​ = ​Cuboid​(​width​: ​4.0​, ​height​: ​5.0​, ​depth​: ​2.0​)
	​println​(​"the volume of fourByFiveByTwo is ​\(​fourByFiveByTwo​.​volume​)​"​)
	​// prints "the volume of fourByFiveByTwo is 40.0”

##属性观察者

属性观察者在属性改变的时候响应。你能给任意一个属性添加观察者，除了lazy属性。

* **willSet** 在值设置之前
* **didSet** 在值设置之后

---- 

	class​ ​StepCounter​ {
	​    ​var​ ​totalSteps​: ​Int​ = ​0​ {
	​        ​willSet​(​newTotalSteps​) {
	​            ​println​(​"About to set totalSteps to ​\(​newTotalSteps​)​"​)
	​        }
	​        ​didSet​ {
	​            ​if​ ​totalSteps​ > ​oldValue​  {
	​                ​println​(​"Added ​\(​totalSteps​ - ​oldValue​)​ steps"​)
	​            }
	​        }
	​    }
	​}
	​let​ ​stepCounter​ = ​StepCounter​()
	​stepCounter​.​totalSteps​ = ​200
	​// About to set totalSteps to 200
	​// Added 200 steps
	​stepCounter​.​totalSteps​ = ​360
	​// About to set totalSteps to 360
	​// Added 160 steps
	​stepCounter​.​totalSteps​ = ​896
	​// About to set totalSteps to 896
	​// Added 536 steps
	
##全局和本地变量

全局变量是定义在function，method，closure和类型外的变量；本地变量就是定义在他们内的变量。

##类型属性

###类型属性语法

在值类型对象可以定义一个属性用 **static** 关键字来定义全局变量；在类类型中使用 **class** ，这样就可以使用结构体名直接调用方法和变量。跟OC中的类方法一样。

	struct​ ​SomeStructure​ {
	​    ​static​ ​var​ ​storedTypeProperty​ = ​"Some value."
	​    ​static​ ​var​ ​computedTypeProperty​: ​Int​ {
	​        ​// return an Int value here
	​    }
	​}
	​enum​ ​SomeEnumeration​ {
	​    ​static​ ​var​ ​storedTypeProperty​ = ​"Some value."
	​    ​static​ ​var​ ​computedTypeProperty​: ​Int​ {
	​        ​// return an Int value here
	​    }
	​}
	​class​ ​SomeClass​ {
	​    ​class​ ​var​ ​computedTypeProperty​: ​Int​ {
	​        ​// return an Int value here
	​    }
	​}
	
###获取和设置类型属性

用 点 语法

	println​(​SomeClass​.​computedTypeProperty​)
	​// prints "42"
	​ 
	​println​(​SomeStructure​.​storedTypeProperty​)
	​// prints "Some value."
	​SomeStructure​.​storedTypeProperty​ = ​"Another value."
	​println​(​SomeStructure​.​storedTypeProperty​)
	​// prints "Another value.”

下面是一个音量大小的例子

	struct​ ​AudioChannel​ {
	​    ​static​ ​let​ ​thresholdLevel​ = ​10
	​    ​static​ ​var​ ​maxInputLevelForAllChannels​ = ​0
	​    ​var​ ​currentLevel​: ​Int​ = ​0​ {
	​        ​didSet​ {
	​            ​if​ ​currentLevel​ > ​AudioChannel​.​thresholdLevel​ {
	​                ​// cap the new audio level to the threshold level
	​                ​currentLevel​ = ​AudioChannel​.​thresholdLevel
	​            }
	​            ​if​ ​currentLevel​ > ​AudioChannel​.​maxInputLevelForAllChannels​ {
	​                ​// store this as the new overall maximum input level
	​                ​AudioChannel​.​maxInputLevelForAllChannels​ = ​currentLevel
	​            }
	​        }
	​    }
	​}
	
定义两个变量

	var​ ​leftChannel​ = ​AudioChannel​()
	​var​ ​rightChannel​ = ​AudioChannel​()
	
	leftChannel​.​currentLevel​ = ​7
	​println​(​leftChannel​.​currentLevel​)
	​// prints "7"
	​println​(​AudioChannel​.​maxInputLevelForAllChannels​)
	​// prints "7”

	rightChannel​.​currentLevel​ = ​11
	​println​(​rightChannel​.​currentLevel​)
	​// prints "10"
	​println​(​AudioChannel​.​maxInputLevelForAllChannels​)
	​// prints "10”
