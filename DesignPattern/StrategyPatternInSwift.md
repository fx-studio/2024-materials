# Strategy pattern in Swift

> *Đọc bài viết trên [Fx Studio](https://fxstudio.dev/strategy-pattern-trong-10-phut/)*

## Strategy pattern là gì?

**Strategy Pattern** là một mẫu thiết kế hành vi *(Behavioral Design Pattern)* trong lập trình hướng đối tượng. Mẫu này cho phép bạn định nghĩa một họ các thuật toán, đóng gói mỗi một trong chúng và làm cho chúng có thể hoán đổi lẫn nhau. **Strategy** cho phép thuật toán biến đổi độc lập với các clients sử dụng nó.

Strategy Pattern được chia thành 3 thành phần chính:

1. **Strategy**: Đây là interface chung cho tất cả các thuật toán cụ thể. Nó khai báo một phương thức mà tất cả các thuật toán cụ thể phải thực hiện.
2. **Concrete Strategies**: Đây là các lớp cụ thể thực hiện thuật toán được khai báo trong Strategy.
3. **Context**: Đây là lớp sử dụng các Concrete Strategies. Nó chứa một tham chiếu đến một đối tượng Strategy và có thể định nghĩa giao diện cho phép clients cấu hình nó với các đối tượng Strategy khác nhau.

## Ví dụ đơn giản

Dưới đây là một ví dụ về Strategy Pattern trong Swift. Trong ví dụ này, chúng ta sẽ tạo một hệ thống đơn giản để tính toán chi phí vận chuyển dựa trên các phương thức vận chuyển khác nhau.

```swift
// Strategy
protocol ShippingStrategy {
    func calculate(package: Package) -> Double
}

// Concrete Strategies
class FedExShipping: ShippingStrategy {
    func calculate(package: Package) -> Double {
        // Logic for FedEx shipping calculation
        return 5.0
    }
}

class UPSShipping: ShippingStrategy {
    func calculate(package: Package) -> Double {
        // Logic for UPS shipping calculation
        return 4.5
    }
}

// Context
class ShippingCalculator {
    private let strategy: ShippingStrategy

    init(strategy: ShippingStrategy) {
        self.strategy = strategy
    }

    func calculateCost(package: Package) -> Double {
        return strategy.calculate(package: package)
    }
}

// Client code
let package = Package()
let calculator = ShippingCalculator(strategy: FedExShipping())
let cost = calculator.calculateCost(package: package)
```

Trong ví dụ này, 

* `ShippingStrategy` là interface chung cho tất cả các thuật toán cụ thể. 
* `FedExShipping` và `UPSShipping` là các lớp cụ thể thực hiện thuật toán được khai báo trong `ShippingStrategy`.
* `ShippingCalculator` là lớp sử dụng các Concrete Strategies. 
* Nó chứa một tham chiếu đến một đối tượng `ShippingStrategy` và có thể định nghĩa giao diện cho phép clients cấu hình nó với các đối tượng `ShippingStrategy` khác nhau.

## Tính chất cơ bản

- Strategy Pattern cho phép bạn có thể thay đổi hành vi của một đối tượng tại thời gian chạy (*runtime*) bằng cách thay đổi thuật toán mà nó sử dụng.
- Điều này giống với mẫu **Delegation**, cả hai đều dựa trên **protocol** để tăng tính linh hoạt.
- Tuy nhiên, khác với Delegation, Strategy Pattern sử dụng một họ các đối tượng, và các thuật toán (*strategies*) có thể dễ dàng thay đổi tại thời gian chạy, trong khi delegate thường được cố định tại thời gian chạy.

## Strategy Pattern vs. Dependency Injection

### So sánh

Cả Strategy Pattern và Dependency Injection đều có thể sử dụng cả functions và objects, nhưng mục đích sử dụng của chúng khác nhau.

* **Strategy Pattern** tập trung vào việc thay đổi hành vi của một đối tượng tại thời điểm chạy. Đối tượng này thường là một function hoặc một object mà định nghĩa một hành vi cụ thể. 
* **Dependency Injection** tập trung vào việc giảm sự phụ thuộc giữa các lớp bằng cách cung cấp (injecting) các phụ thuộc từ bên ngoài. Phụ thuộc này có thể là một function hoặc một object, nhưng mục đích chính là để làm cho mã dễ dàng hơn để kiểm tra và tái sử dụng, chứ không phải để thay đổi hành vi.

> **Dependency Injection** thì tôi sẽ không quan tới nhiều về thuật toán như thế nào. Còn **Strategy Pattern** thì tôi cần phải quan tâm tới thuật toán tôi muốn sử dụng.

Nếu khó hiểu quá thì bạn có thể đọc qua ví dụ sau:

- **Strategy Pattern** giống như bạn có một chiếc xe và bạn có thể thay đổi cách nó chạy bằng cách thay đổi động cơ. Bạn có thể chọn động cơ xăng, động cơ diesel, hoặc động cơ điện. Mỗi loại động cơ (strategy) sẽ làm cho xe chạy theo cách khác nhau.

- **Dependency Injection** giống như bạn có một chiếc xe và bạn không muốn nó phụ thuộc vào một loại động cơ cụ thể. Thay vào đó, bạn cho phép người khác cung cấp (inject) động cơ cho xe. Điều này giúp xe dễ dàng thay đổi loại động cơ mà không cần phải thay đổi xe.

### Ví dụ code nhóe!

Dưới đây là ví dụ về sự khác biệt giữa Strategy Pattern và Dependency Injection:

**Strategy Pattern**

Giả sử bạn đang xây dựng một ứng dụng vẽ hình. Bạn có nhiều cách để vẽ hình: vẽ bằng bút chì, bút mực, bút sáp màu, v.v. Mỗi cách vẽ này có thể được xem như một "strategy".

```swift
protocol DrawingStrategy {
    func draw()
}

class PencilStrategy: DrawingStrategy {
    func draw() {
        print("Drawing with pencil")
    }
}

class InkStrategy: DrawingStrategy {
    func draw() {
        print("Drawing with ink")
    }
}

class CrayonStrategy: DrawingStrategy {
    func draw() {
        print("Drawing with crayon")
    }
}

class DrawingContext {
    private let strategy: DrawingStrategy

    init(strategy: DrawingStrategy) {
        self.strategy = strategy
    }

    func draw() {
        strategy.draw()
    }
}

let context = DrawingContext(strategy: PencilStrategy())
context.draw() // Output: Drawing with pencil
```

**Dependency Injection**

Giả sử bạn đang xây dựng một ứng dụng mà cần truy cập vào cơ sở dữ liệu. Thay vì cho phép lớp `UserService` tạo ra một instance của `DatabaseService`, bạn có thể "inject" một instance của `DatabaseService` vào `UserService` khi tạo ra nó.

```swift
protocol DatabaseService {
    func fetchUsers()
}

class RealDatabaseService: DatabaseService {
    func fetchUsers() {
        print("Fetching users from real database")
    }
}

class MockDatabaseService: DatabaseService {
    func fetchUsers() {
        print("Fetching users from mock database")
    }
}

class UserService {
    private let databaseService: DatabaseService

    init(databaseService: DatabaseService) {
        self.databaseService = databaseService
    }

    func getUsers() {
        databaseService.fetchUsers()
    }
}

let userService = UserService(databaseService: RealDatabaseService())
userService.getUsers() // Output: Fetching users from real database
```

* Trong ví dụ về Strategy Pattern,
  * Chúng ta thay đổi hành vi của `DrawingContext` bằng cách sử dụng một strategy khác nhau.
* Trong ví dụ về Dependency Injection,
  * Chúng ta giảm sự phụ thuộc của `UserService` vào `RealDatabaseService` bằng cách inject `DatabaseService` vào `UserService`.

## Sử dụng Strategy Pattern

Strategy Pattern thường được sử dụng trong các trường hợp sau:

### Khi bạn muốn cung cấp nhiều cách thực hiện cho một hành động cụ thể

Ví dụ, bạn có thể có một ứng dụng vẽ hình mà cho phép người dùng chọn giữa việc vẽ bằng bút chì, bút mực, hoặc bút sáp màu. Mỗi cách vẽ này có thể được thực hiện bởi một strategy khác nhau.

```swift
protocol DrawingStrategy {
    func draw() -> String
}

class PencilStrategy: DrawingStrategy {
    func draw() -> String {
        return "Drawing with pencil"
    }
}

class InkStrategy: DrawingStrategy {
    func draw() -> String {
        return "Drawing with ink"
    }
}

class CrayonStrategy: DrawingStrategy {
    func draw() -> String {
        return "Drawing with crayon"
    }
}

class DrawingContext {
    private var strategy: DrawingStrategy

    init(strategy: DrawingStrategy) {
        self.strategy = strategy
    }

    func draw() -> String {
        return self.strategy.draw()
    }
}

let context = DrawingContext(strategy: PencilStrategy())
print(context.draw())  // Output: Drawing with pencil
```
### Khi bạn muốn thay đổi hành vi của một đối tượng tại thời điểm chạy

Ví dụ, bạn có thể có một game mà cho phép người chơi thay đổi chiến lược của nhân vật tại thời điểm chơi game.

```swift
protocol FightingStrategy {
    func fight() -> String
}

class AggressiveStrategy: FightingStrategy {
    func fight() -> String {
        return "Fighting aggressively"
    }
}

class DefensiveStrategy: FightingStrategy {
    func fight() -> String {
        return "Fighting defensively"
    }
}

class GameCharacter {
    var fightingStrategy: FightingStrategy

    init(fightingStrategy: FightingStrategy) {
        self.fightingStrategy = fightingStrategy
    }

    func fight() -> String {
        return self.fightingStrategy.fight()
    }
}

var character = GameCharacter(fightingStrategy: AggressiveStrategy())
print(character.fight())  // Output: Fighting aggressively

character.fightingStrategy = DefensiveStrategy()
print(character.fight())  // Output: Fighting defensively
```
### Khi bạn muốn tách biệt các thuật toán phức tạp từ mã chính của bạn.

Ví dụ, bạn có thể có một ứng dụng phân tích dữ liệu mà sử dụng nhiều thuật toán phân tích khác nhau. Bằng cách sử dụng Strategy Pattern, bạn có thể tách biệt các thuật toán này ra khỏi mã chính của ứng dụng, làm cho mã chính dễ đọc và dễ bảo dưỡng hơn.

```swift
protocol SortStrategy {
    func sort(_ dataset: [Int]) -> [Int]
}

class BubbleSortStrategy: SortStrategy {
    func sort(_ dataset: [Int]) -> [Int] {
        // Implement bubble sort
        return dataset
    }
}

class QuickSortStrategy: SortStrategy {
    func sort(_ dataset: [Int]) -> [Int] {
        // Implement quick sort
        return dataset
    }
}

class SortContext {
    private var strategy: SortStrategy

    init(strategy: SortStrategy) {
        self.strategy = strategy
    }

    func sort(_ dataset: [Int]) -> [Int] {
        return self.strategy.sort(dataset)
    }
}
```
### Khi bạn muốn thay thế nhiều câu lệnh điều kiện.

Nếu bạn có nhiều câu lệnh `if` hoặc `switch` để xác định hành vi của một đối tượng, bạn có thể thay thế chúng bằng Strategy Pattern. Mỗi nhánh của câu lệnh điều kiện có thể được thực hiện bởi một strategy khác nhau.

```swift
protocol ShippingStrategy {
    func calculate(_ order: Order) -> String
}

class FedExStrategy: ShippingStrategy {
    func calculate(_ order: Order) -> String {
        return "Calculate shipping cost with FedEx"
    }
}

class UPSStrategy: ShippingStrategy {
    func calculate(_ order: Order) -> String {
        return "Calculate shipping cost with UPS"
    }
}

class PostalStrategy: ShippingStrategy {
    func calculate(_ order: Order) -> String {
        return "Calculate shipping cost with Postal Service"
    }
}

class ShippingContext {
    private var strategy: ShippingStrategy

    init(strategy: ShippingStrategy) {
        self.strategy = strategy
    }

    func calculate(_ order: Order) -> String {
        return self.strategy.calculate(order)
    }
}

let context = ShippingContext(strategy: FedExStrategy())
print(context.calculate(order))  // Output: Calculate shipping cost with FedEx
```
Trong mỗi ví dụ trên, Strategy Pattern giúp mã dễ đọc hơn, dễ bảo dưỡng hơn, và linh hoạt hơn.

## Tạm kết

- Mô hình Strategy Pattern cho phép chúng ta định nghĩa một nhóm các đối tượng có thể thay thế lẫn nhau. Và có thể được thiết lập hoặc thay đổi tại thời gian chạy.
- Gồm ba phần: một đối tượng sử dụng chiến lược, một giao thức chiến lược, và một nhóm các đối tượng chiến lược.
- Mô hình Strategy tương tự như mô hình Delegation. Cả hai mô hình đều sử dụng giao thức để tăng tính linh hoạt. Tuy nhiên, khác với mô hình Delegation, các chiến lược trong mô hình Strategy có thể được thay đổi tại thời gian chạy, trong khi các delegate thường được cố định.

---

_Cảm ơn bạn đã đọc bài viết này!_ 