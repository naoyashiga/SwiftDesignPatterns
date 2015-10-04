# Swift Design Patterns
These design patterns are base on 'Design Patterns: Elements of Reusable Object-Oriented Software'. 

# Inspired
:curry:

# Behavioral

# Creational

## Builder
```swift
protocol Builder {
    var redPepperLevel: Int? { get }
    var cheezeLevel: Int? { get }
    var riceSize: Int? { get }
}

class OriginalCurry {
    var redPepperLevel: Int?
    var cheezeLevel: Int?
    var riceSize: Int?
    
    typealias OriginalCurryBuilderClosure = (OriginalCurry) -> ()
    
    init(originalCurry: OriginalCurryBuilderClosure) {
        originalCurry(self)
    }
}
```

```swift
let originalCurry = OriginalCurry {
    $0.redPepperLevel = 10
    $0.cheezeLevel = 1
    $0.riceSize = 2
}

// rep Pepper:Optional(10)
print("rep Pepper:\(originalCurry.redPepperLevel)")
```
## FactoryMethod

```swift
enum Country {
    case Japan, India, Thai
}

class CurryFactory {
    class func curryForCountry(country: Country) -> Curry {
        let simpleCurry = SimpleCurry()
        
        switch country {
        case .Japan:
            return RiceCurry(decoratedCurry: simpleCurry)
        case .India:
            return ChikenCurry(decoratedCurry: simpleCurry)
        case .Thai:
            return GreenCurry(decoratedCurry: simpleCurry)
        }
    }
}
```

```swift
// Curry:Green Chili
print(CurryFactory.curryForCountry(.Thai).getIngredients())
```

## Singleton

```swift
class SingletonDataManager {
    var value = 0
    static let sharedInstance = SingletonDataManager()
}
```

```swift
SingletonDataManager.sharedInstance.value = 1

// 1
print(SingletonDataManager.sharedInstance.value)
```

# Structural

## Decorator

```swift
protocol Curry {
    func getCost() -> Double
    func getIngredients() -> String
}

class SimpleCurry: Curry {
    func getCost() -> Double {
        return 500
    }
    
    func getIngredients() -> String {
        return "Curry"
    }
}

class CurryDecorator: Curry {
    private let decoratedCurry: Curry
    
    required init(decoratedCurry: Curry) {
        self.decoratedCurry = decoratedCurry
    }
    
    func getCost() -> Double {
        return decoratedCurry.getCost()
    }
    
    func getIngredients() -> String {
        return decoratedCurry.getIngredients()
    }
}

class ChikenCurry: CurryDecorator {
    required init(decoratedCurry: Curry) {
        super.init(decoratedCurry: decoratedCurry)
    }
    
    override func getCost() -> Double {
        return super.getCost() + 100
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + ":Chiken"
    }
}

class RiceCurry: CurryDecorator {
    required init(decoratedCurry: Curry) {
        super.init(decoratedCurry: decoratedCurry)
    }
    
    override func getCost() -> Double {
        return super.getCost() + 150
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + ":Rice"
    }
}

class GreenCurry: CurryDecorator {
    required init(decoratedCurry: Curry) {
        super.init(decoratedCurry: decoratedCurry)
    }
    
    override func getCost() -> Double {
        return super.getCost() + 300
    }
    
    override func getIngredients() -> String {
        return super.getIngredients() + ":Green Chili"
    }
}
```

```swift
var someCurry: Curry = SimpleCurry()

// Cost:500.0 ingredients:Curry
print("Cost:\(someCurry.getCost()) ingredients:\(someCurry.getIngredients())")

someCurry = ChikenCurry(decoratedCurry: someCurry)

// Cost:600.0 ingredients:Curry:Chiken
print("Cost:\(someCurry.getCost()) ingredients:\(someCurry.getIngredients())")
```
