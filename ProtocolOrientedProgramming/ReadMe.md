# Protocol-oriented programming in Swift

> Tham khảo thêm bài viết đầy đủ trên [Fx Studio](https://fxstudio.dev/lap-trinh-huong-giao-thuc-pop-voi-swift/).

## Protocol-oriented programming (POP) là gì?

### Khái niệm chung

Lập trình hướng giao thức (Protocol-oriented programming - POP) trong Swift là một phương pháp lập trình mà ở đó bạn xây dựng chương trình dựa trên "giao thức" (protocols) hơn là dựa trên lớp (classes) hoặc cấu trúc (structures). Trong đó các giao thức (protocols) đóng vai trò chính. 

> *Đây là một khái niệm phổ biến trong ngôn ngữ lập trình Swift của Apple.*

Trong lập trình hướng giao thức, thay vì xác định lớp cơ sở và kế thừa từ nó (như trong lập trình hướng đối tượng), bạn xác định một giao thức mà các đối tượng hoặc cấu trúc phải tuân theo. Giao thức định nghĩa một "hợp đồng" mà các lớp, cấu trúc hoặc kiểu liệt kê phải thực hiện.

Điều này cho phép bạn tạo ra các đối tượng có thể tương tác với nhau mà không cần biết chi tiết cụ thể về cách chúng được thực hiện. Điều này giúp tăng tính linh hoạt và tái sử dụng của mã nguồn.

### Tính chất

Lập trình hướng giao thức (Protocol-oriented programming - POP) trong Swift có một số tính chất đặc trưng sau:

1. **Tính linh hoạt và tái sử dụng cao:** Giao thức có thể được tuân thủ bởi nhiều lớp, cấu trúc hoặc kiểu liệt kê, giúp tăng tính tái sử dụng và linh hoạt của mã nguồn.
2. **Triển khai mặc định:** Swift cho phép bạn mở rộng giao thức để cung cấp một triển khai mặc định cho các phương thức, thuộc tính tính toán, và các yêu cầu chỉ mục.
3. **Thừa kế giao thức:** Một giao thức có thể thừa kế từ một hoặc nhiều giao thức khác và có thể thêm các yêu cầu mới.
4. **Kiểu giao thức:** Bạn có thể sử dụng giao thức như một kiểu đầy đủ trong Swift.
5. **Kiểm tra và ép kiểu giao thức:** Swift cung cấp các toán tử để kiểm tra xem một thể hiện có tuân thủ một giao thức cụ thể hay không, và để ép kiểu giữa các giao thức.
6. **Giao thức với yêu cầu chỉ mục:** Các giao thức có thể định nghĩa các yêu cầu chỉ mục, tạo ra một khái niệm về "giao thức chung".
7. **Giao thức như một yêu cầu chung:** Bạn có thể sử dụng giao thức như một ràng buộc chung trong các hàm và kiểu chung.
8. **Giao thức với các yêu cầu Self:** Một số giao thức yêu cầu các phương thức hoặc thuộc tính trả về kiểu của chính đối tượng thực hiện giao thức, được biểu thị bằng từ khóa `Self`.
9. **Giao thức với các yêu cầu khởi tạo:** Các giao thức có thể yêu cầu các lớp tuân thủ phải cung cấp một hoặc nhiều khởi tạo cụ thể.

### Các tương tác với POP

Đây là một số điểm quan trọng bạn cần tìm hiểu:

1. **Giao thức (Protocols):** Đây là khái niệm cốt lõi của POP. Một giao thức định nghĩa một "hợp đồng" mà các lớp, cấu trúc hoặc kiểu liệt kê phải tuân theo.
2. **Mở rộng giao thức (Protocol Extensions):** Swift cho phép bạn mở rộng giao thức để cung cấp một triển khai mặc định cho các phương thức, thuộc tính tính toán, và các yêu cầu chỉ mục.
3. **Kiểu liệt kê với các giá trị liên kết (Enumerations with Associated Values):** Swift cho phép bạn định nghĩa các kiểu liệt kê có thể lưu trữ các giá trị khác nhau và các kiểu dữ liệu khác nhau.
4. **Kiểu liệt kê như một thay thế cho lớp (Enumerations as a Replacement for Classes):** Trong một số trường hợp, bạn có thể sử dụng kiểu liệt kê thay vì lớp để tạo ra các đối tượng có trạng thái và hành vi.
5. **Thừa kế giao thức (Protocol Inheritance):** Một giao thức có thể thừa kế từ một hoặc nhiều giao thức khác và có thể thêm các yêu cầu mới.
6. **Kiểu giao thức (Protocol Types):** Bạn có thể sử dụng giao thức như một kiểu đầy đủ trong Swift.
7. **Kiểm tra và ép kiểu giao thức (Protocol Checking and Casting):** Swift cung cấp các toán tử để kiểm tra xem một thể hiện có tuân thủ một giao thức cụ thể hay không, và để ép kiểu giữa các giao thức.
8. **Giao thức với yêu cầu chỉ mục (Protocols with Associated Types):** Các giao thức có thể định nghĩa các yêu cầu chỉ mục, tạo ra một khái niệm về "giao thức chung".
9. **Giao thức như một yêu cầu chung (Protocols as Generic Constraints):** Bạn có thể sử dụng giao thức như một ràng buộc chung trong các hàm và kiểu chung.
10. **Giao thức với các yêu cầu Self (Protocols with Self Requirements):** Một số giao thức yêu cầu các phương thức hoặc thuộc tính trả về kiểu của chính đối tượng thực hiện giao thức, được biểu thị bằng từ khóa `Self`.
11. **Giao thức với các yêu cầu khởi tạo (Protocols with Initializer Requirements):** Các giao thức có thể yêu cầu các lớp tuân thủ phải cung cấp một hoặc nhiều khởi tạo cụ thể.

### Ví dụ

Dưới đây là một ví dụ về lập trình hướng giao thức trong Swift:

```swift
// Định nghĩa một giao thức
protocol Flyable {
    var airspeedVelocity: Double { get }
}

// Mở rộng giao thức để cung cấp một triển khai mặc định
extension Flyable {
    var airspeedVelocity: Double {
        return 1000.0
    }
}

// Định nghĩa một lớp tuân thủ giao thức
class Bird: Flyable {
    var airspeedVelocity: Double {
        return 500.0
    }
}

// Sử dụng giao thức như một kiểu
func race(competitor: Flyable) {
    print("Racing at speed: \(competitor.airspeedVelocity)")
}

let bird = Bird()
race(competitor: bird) // In ra: "Racing at speed: 500.0"
```

Trong ví dụ trên, chúng ta đã định nghĩa một giao thức `Flyable` với một thuộc tính `airspeedVelocity`. Chúng ta sau đó mở rộng giao thức này để cung cấp một triển khai mặc định cho `airspeedVelocity`. Lớp `Bird` tuân thủ giao thức `Flyable` và cung cấp một triển khai riêng của `airspeedVelocity`. Cuối cùng, chúng ta định nghĩa một hàm `race` nhận một đối số kiểu `Flyable`, cho phép chúng ta sử dụng giao thức như một kiểu đầy đủ.

> So sánh thử giữ Lập trình hướng đối tượng (OOP) & Lập trình hướng giao thức (POP) như thế nào nhóe!

## OOP vs. POP

### So sánh

Lập trình hướng đối tượng (OOP) và lập trình hướng giao thức (POP) là hai phương pháp lập trình khác nhau với những ưu và nhược điểm riêng.

**OOP:**

1. **Tính đóng gói:** Dữ liệu và phương thức được gói gọn trong các đối tượng. Điều này giúp giảm sự phức tạp và tăng tính tái sử dụng.
2. **Tính kế thừa:** Cho phép lớp con kế thừa các thuộc tính và phương thức của lớp cha. Tuy nhiên, điều này có thể dẫn đến "vấn đề kim cương" (Diamond Problem) khi một lớp kế thừa từ nhiều lớp có phương thức giống nhau.
3. **Tính đa hình:** Cho phép một đối tượng được xem như một đối tượng của lớp khác.

**POP:**

1. **Tính linh hoạt và tái sử dụng cao:** Giao thức có thể được tuân thủ bởi nhiều lớp, cấu trúc hoặc kiểu liệt kê, giúp tăng tính tái sử dụng và linh hoạt của mã nguồn.
2. **Triển khai mặc định:** Swift cho phép bạn mở rộng giao thức để cung cấp một triển khai mặc định cho các phương thức, thuộc tính tính toán, và các yêu cầu chỉ mục.
3. **Thừa kế giao thức:** Một giao thức có thể thừa kế từ một hoặc nhiều giao thức khác và có thể thêm các yêu cầu mới.
4. **Không có "vấn đề kim cương":** Vì Swift không hỗ trợ đa kế thừa cho lớp, nên "vấn đề kim cương" không tồn tại trong POP.

Tóm lại, POP có thể giúp giải quyết một số vấn đề của OOP như "vấn đề kim cương" và cung cấp một cấu trúc linh hoạt hơn cho mã nguồn của bạn. Tuy nhiên, lựa chọn giữa OOP và POP phụ thuộc vào yêu cầu cụ thể của dự án của bạn.

### Diamond Problem

Trong lập trình hướng đối tượng, Diamond Problem là một vấn đề phát sinh khi một lớp kế thừa từ hai lớp khác và cả hai lớp đó lại kế thừa từ một lớp chung. Điều này dẫn đến một mô hình thừa kế hình kim cương (diamond-shaped), gây ra nhầm lẫn về việc phương thức hoặc thuộc tính nào nên được kế thừa khi có sự trùng lặp.

Tuy nhiên, trong Swift, Diamond Problem không phải là vấn đề bởi vì Swift không hỗ trợ đa thừa kế cho lớp. Thay vào đó, Swift sử dụng thừa kế giao thức (Protocol Inheritance) và mở rộng giao thức (Protocol Extensions) để cung cấp tính năng tương tự như đa thừa kế mà không gặp phải Diamond Problem.

Khi một kiểu tuân thủ nhiều giao thức hoặc một giao thức kế thừa từ nhiều giao thức khác, nếu có sự trùng lặp về phương thức hoặc thuộc tính, Swift sẽ tuân theo quy tắc: nếu kiểu cung cấp triển khai của riêng nó, triển khai đó sẽ được sử dụng. Nếu không, Swift sẽ chọn triển khai từ giao thức mở rộng mà kiểu tuân thủ cuối cùng.

```swift
protocol A {
    func foo()
}

extension A {
    func foo() {
        print("A foo")
    }
}

protocol B: A {
    func foo()
}

extension B {
    func foo() {
        print("B foo")
    }
}

protocol C: A {
    func foo()
}

extension C {
    func foo() {
        print("C foo")
    }
}

struct D: B, C {}

let d = D()
d.foo() // What will this print?
```

Ví dụ nhóe!

### OOP to POP

Chuyển đổi từ lập trình hướng đối tượng (OOP) sang lập trình hướng giao thức (POP) trong Swift có thể được thực hiện theo các bước sau:

1. **Xác định các giao thức:** Xác định các giao thức mà các lớp của bạn sẽ tuân thủ. Các giao thức này nên đại diện cho các hành vi mà bạn muốn các đối tượng của bạn có.
2. **Triển khai giao thức:** Đối với mỗi lớp, hãy thay thế các thuộc tính và phương thức cụ thể của lớp bằng các yêu cầu giao thức tương ứng.
3. **Sử dụng triển khai mặc định:** Nếu có các phương thức hoặc thuộc tính mà nhiều lớp có cùng cách triển khai, hãy xem xét việc sử dụng triển khai mặc định trong giao thức.
4. **Sử dụng thừa kế giao thức:** Nếu có các giao thức chia sẻ các yêu cầu tương tự, hãy xem xét việc sử dụng thừa kế giao thức để giảm bớt sự trùng lặp.
5. **Sử dụng kiểu giao thức:** Thay thế các tham chiếu cụ thể đến lớp bằng các tham chiếu đến giao thức, nếu có thể.
6. **Kiểm tra và ép kiểu giao thức:** Sử dụng kiểm tra kiểu và ép kiểu giao thức khi cần xử lý các đối tượng như là thể hiện của giao thức cụ thể.
7. **Sử dụng giao thức như một yêu cầu chung:** Khi làm việc với các hàm và kiểu chung, hãy xem xét việc sử dụng giao thức như một ràng buộc chung.

Lưu ý rằng việc chuyển đổi từ OOP sang POP có thể đòi hỏi một số thay đổi lớn đối với cấu trúc của mã nguồn của bạn, và có thể không phải lúc nào cũng là lựa chọn tốt nhất tùy thuộc vào yêu cầu cụ thể của dự án của bạn.

### Ví dụ

Dưới đây là một ví dụ về cách chuyển đổi một lớp của lập trình hướng đối tượng sang lập trình hướng giao thức trong Swift.

Giả sử chúng ta có một lớp `Bird` trong lập trình hướng đối tượng như sau:

```swift
class Bird {
    var name: String
    var canFly: Bool

    init(name: String, canFly: Bool) {
        self.name = name
        self.canFly = canFly
    }

    func fly() {
        if canFly {
            print("\(name) can fly")
        } else {
            print("\(name) can't fly")
        }
    }
}

let penguin = Bird(name: "Penguin", canFly: false)
penguin.fly() // Prints "Penguin can't fly"
```

Chúng ta có thể chuyển đổi nó sang lập trình hướng giao thức như sau:

```swift
protocol Bird {
    var name: String { get set }
    var canFly: Bool { get }
}

protocol Flyable {
    func fly()
}

extension Bird where Self: Flyable {
    func fly() {
        print("\(name) can fly")
    }
}

struct Penguin: Bird {
    var name: String
    var canFly: Bool {
        return false
    }
}

struct Eagle: Bird, Flyable {
    var name: String
    var canFly: Bool {
        return true
    }
}

let penguin = Penguin(name: "Penguin")
let eagle = Eagle(name: "Eagle")
eagle.fly() // Prints "Eagle can fly"
```

Trong ví dụ trên, chúng ta đã tạo ra hai giao thức `Bird` và `Flyable`. `Bird` định nghĩa các thuộc tính cơ bản của một con chim, trong khi `Flyable` định nghĩa hành vi bay. Chúng ta sau đó tạo ra hai cấu trúc `Penguin` và `Eagle` tuân theo các giao thức này. `Eagle` còn tuân theo thêm giao thức `Flyable` nữa, cho phép nó bay.

> Dưới đây là phần trình bày những gì bạn làm được với POP.

## Protocol Conform

Trong Swift, khi một kiểu tuân thủ một giao thức, nó phải cung cấp triển khai cho tất cả các yêu cầu mà giao thức đó định nghĩa. Điều này được gọi là "conform" đến giao thức. Dưới đây là một ví dụ về việc sử dụng giao thức trong Swift:

```swift
// Định nghĩa một giao thức
protocol CanMakeNoise {
    func makeNoise()
}

// Định nghĩa một lớp tuân thủ giao thức
class Human: CanMakeNoise {
    func makeNoise() {
        print("Hello!")
    }
}

// Định nghĩa một cấu trúc tuân thủ giao thức
struct Cat: CanMakeNoise {
    func makeNoise() {
        print("Meow!")
    }
}

// Định nghĩa một kiểu liệt kê tuân thủ giao thức
enum Dog: CanMakeNoise {
    case small, big

    func makeNoise() {
        switch self {
        case .small:
            print("Woof!")
        case .big:
            print("WOOF!")
        }
    }
}

let human = Human()
let cat = Cat()
let dog = Dog.big

human.makeNoise() // In ra: "Hello!"
cat.makeNoise()   // In ra: "Meow!"
dog.makeNoise()   // In ra: "WOOF!"
```

Trong ví dụ trên, chúng ta đã định nghĩa một giao thức `CanMakeNoise` với một phương thức `makeNoise`. Chúng ta sau đó định nghĩa một lớp `Human`, một cấu trúc `Cat`, và một kiểu liệt kê `Dog`, tất cả đều tuân thủ giao thức `CanMakeNoise` và cung cấp một triển khai riêng của phương thức `makeNoise`.

## Enum, Struct & Class with Protocol

Trong Swift, bạn có thể áp dụng lập trình hướng giao thức vào Enum, Struct và Class. Dưới đây là một ví dụ:

```swift
// Định nghĩa giao thức
protocol CanFly {
    func fly()
}

// Tạo Enum Bird tuân theo giao thức CanFly
enum Bird: CanFly {
    case eagle, penguin, swift

    func fly() {
        switch self {
        case .eagle:
            print("The eagle is flying")
        case .penguin:
            print("Penguins can't fly!")
        case .swift:
            print("The swift bird is flying")
        }
    }
}

// Tạo Struct Airplane tuân theo giao thức CanFly
struct Airplane: CanFly {
    func fly() {
        print("The airplane is flying")
    }
}

// Tạo Class Helicopter tuân theo giao thức CanFly
class Helicopter: CanFly {
    func fly() {
        print("The helicopter is flying")
    }
}

// Tạo một hàm để thử nghiệm
func letItFly(flyer: CanFly) {
    flyer.fly()
}

// Tạo một đối tượng Bird, Airplane và Helicopter
let eagle = Bird.eagle
let airplane = Airplane()
let helicopter = Helicopter()

// Gọi hàm letItFly với eagle, airplane và helicopter
letItFly(flyer: eagle)
letItFly(flyer: airplane)
letItFly(flyer: helicopter)
```

Trong ví dụ trên, chúng ta đã tạo ra một giao thức `CanFly` và một Enum `Bird`, một Struct `Airplane` và một Class `Helicopter` tuân theo giao thức này. Hàm `letItFly` nhận vào một đối tượng tuân theo giao thức `CanFly` và gọi phương thức `fly` của đối tượng đó. Khi chúng ta gọi hàm `letItFly` với `eagle`, `airplane` và `helicopter`, chúng ta thấy rằng cả ba đều có thể "bay", mặc dù chúng được thực hiện theo cách khác nhau.

## Protocol Extensions

Mở rộng giao thức (Protocol Extensions) là một tính năng mạnh mẽ của Swift. Nó cho phép bạn mở rộng một giao thức để cung cấp một triển khai mặc định cho các phương thức, thuộc tính tính toán, và các yêu cầu chỉ mục. Điều này có nghĩa là bạn có thể định nghĩa một giao thức với các phương thức và thuộc tính, sau đó cung cấp một triển khai mặc định cho chúng trong một mở rộng giao thức. Các lớp, cấu trúc, hoặc kiểu liệt kê tuân thủ giao thức có thể sử dụng triển khai mặc định hoặc cung cấp triển khai riêng của chúng.

Dưới đây là một ví dụ về việc sử dụng mở rộng giao thức trong Swift:

```swift
// Định nghĩa một giao thức
protocol CanFly {
    var altitude: Double { get }
    func ascend()
}

// Mở rộng giao thức để cung cấp một triển khai mặc định
extension CanFly {
    var altitude: Double {
        return 1000.0
    }

    func ascend() {
        print("Ascending to \(altitude) feet.")
    }
}

// Định nghĩa một lớp tuân thủ giao thức
class Bird: CanFly {
    // Không cần cung cấp triển khai cho 'altitude' và 'ascend' vì đã có triển khai mặc định từ giao thức
}

let bird = Bird()
bird.ascend() // In ra: "Ascending to 1000.0 feet."
```

Trong ví dụ trên, chúng ta đã định nghĩa một giao thức `CanFly` với một thuộc tính `altitude` và một phương thức `ascend`. Chúng ta sau đó mở rộng giao thức này để cung cấp một triển khai mặc định cho `altitude` và `ascend`. Lớp `Bird` tuân thủ giao thức `CanFly` nhưng không cần cung cấp triển khai cho `altitude` và `ascend` vì đã có triển khai mặc định từ giao thức.

## Enumerations with Associated Values

Kiểu liệt kê với các giá trị liên kết (Enumerations with Associated Values) trong Swift là một cách mạnh mẽ để mô hình hóa các loại dữ liệu. Trong lập trình hướng giao thức, chúng có thể được sử dụng để tạo ra các kiểu dữ liệu mà mỗi trường hợp của nó có thể chứa các giá trị khác nhau.

Trong Swift, `associatedtype` được sử dụng trong giao thức để khai báo một kiểu placeholder. Kiểu thực tế sẽ được xác định bởi lớp, cấu trúc hoặc kiểu liệt kê cụ thể tuân thủ giao thức đó.

Khi một giao thức chứa một hoặc nhiều định nghĩa `associatedtype`, nó sẽ trở thành giao thức có kiểu liên kết. Giao thức này không thể được sử dụng như một kiểu đầy đủ. Thay vào đó, nó chỉ có thể được sử dụng như một kiểu giao thức (protocol type) khi các `associatedtype` đã được xác định. Ví dụ code

```swift
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
```

Triển khai giao thức với một cấu trúc như sau.

```swift
struct IntContainer: Container {
    typealias Item = Int
    var items = [Int]()
    
    mutating func append(_ item: Int) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

var container = IntContainer()
container.append(12)
print(container.count) // Prints "1"
print(container[0]) // Prints "12"
```

Dưới đây là một ví dụ về việc sử dụng kiểu liệt kê (Enumerations) với kiểu liên kết (Associated Types) và tuân thủ một giao thức trong Swift:

```swift
enum Stack<Element>: Container {
    case empty
    indirect case node(Element, next: Stack<Element>)

    mutating func append(_ item: Element) {
        self = .node(item, next: self)
    }

    var count: Int {
        switch self {
        case .empty: return 0
        case let .node(_, next): return next.count + 1
        }
    }

    subscript(i: Int) -> Element {
        switch self {
        case .empty: fatalError("Index out of range")
        case let .node(x, next):
            if i == 0 {
                return x
            } else {
                return next[i - 1]
            }
        }
    }
}

var stack = Stack<Int>.empty
stack.append(10)
stack.append(20)
print(stack.count) // Prints "2"
print(stack[1]) // Prints "10"
```

Trong ví dụ trên, `ItemRepresentable` là một giao thức có một `associatedtype` được gọi là `Item` và một phương thức `represent`. `IntOrString` là một kiểu liệt kê với hai trường hợp: `intItem` và `stringItem`, mỗi trường hợp có một giá trị liên kết khác nhau và tuân thủ giao thức `ItemRepresentable`.

## Enumerations as a Replacement for Classes

Kiểu liệt kê như một thay thế cho lớp (Enumerations as a Replacement for Classes) là một khái niệm trong lập trình hướng giao thức (Protocol-oriented programming - POP) của Swift.

Trong Swift, kiểu liệt kê (enumerations) không chỉ là một danh sách các giá trị. Chúng cũng có thể có các phương thức và có thể tuân thủ các giao thức, giống như lớp (classes) và cấu trúc (structures). Điều này cho phép chúng được sử dụng như một thay thế linh hoạt cho lớp trong một số trường hợp.

Ví dụ, bạn có thể sử dụng kiểu liệt kê để mô tả các đối tượng có một số lượng cố định các trạng thái có thể xảy ra. Mỗi trạng thái có thể được biểu diễn bởi một giá trị của kiểu liệt kê, và các hành vi liên quan đến trạng thái có thể được định nghĩa bằng các phương thức của kiểu liệt kê.

Điều này tạo ra một cách tiếp cận mạnh mẽ và linh hoạt để mô tả trạng thái và hành vi trong mã của bạn, mà không cần phải sử dụng lớp và kế thừa.

Dưới đây là một ví dụ về việc sử dụng kiểu liệt kê như một thay thế cho lớp trong Swift:

```swift
protocol CanMakeNoise {
    func makeNoise()
}

enum Animal: CanMakeNoise {
    case cat, dog, cow

    func makeNoise() {
        switch self {
        case .cat:
            print("Meow!")
        case .dog:
            print("Woof!")
        case .cow:
            print("Moo!")
        }
    }
}

let animals: [CanMakeNoise] = [Animal.cat, Animal.dog, Animal.cow]
animals.forEach { $0.makeNoise() }
```

Trong ví dụ này, `Animal` là một kiểu liệt kê tuân thủ giao thức `CanMakeNoise`. Mỗi trường hợp của `Animal` biểu diễn một loại động vật khác nhau và cách chúng phát ra tiếng ồn. Khi chúng ta gọi phương thức `makeNoise()` trên một đối tượng `Animal`, nó sẽ in ra tiếng ồn phù hợp với loại động vật đó.

## Protocol Inheritance

Thừa kế giao thức (Protocol Inheritance) trong Swift cho phép một giao thức có thể thừa kế từ một hoặc nhiều giao thức khác. Điều này giống như thừa kế lớp trong OOP, nhưng cho giao thức.

Dưới đây là một ví dụ về thừa kế giao thức:

```swift
protocol Printable {
    func printDetails()
}

protocol Loggable {
    func logDetails()
}

// Protocol Inheritance
protocol Item: Printable, Loggable {
    var name: String { get set }
}

class Product: Item {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func printDetails() {
        print("Printing Details for Item: \(name)")
    }
    
    func logDetails() {
        print("Logging Details for Item: \(name)")
    }
}

let item: Item = Product(name: "Apple")
item.printDetails() // In ra: Printing Details for Item: Apple
item.logDetails() // In ra: Logging Details for Item: Apple
```

Trong ví dụ trên, `Item` là một giao thức kế thừa từ hai giao thức khác là `Printable` và `Loggable`. Lớp `Product` tuân thủ giao thức `Item` và triển khai các phương thức yêu cầu.

## Protocol Types

Trong Swift, bạn có thể sử dụng giao thức như một kiểu đầy đủ. Điều này có nghĩa là bạn có thể tạo ra các biến hoặc hàm mà kiểu của chúng là một giao thức. Điều này rất hữu ích khi bạn muốn viết mã linh hoạt và tái sử dụng được.

Dưới đây là một ví dụ về việc sử dụng giao thức như một kiểu đầy đủ:

```swift
protocol CanFly {
    func fly()
}

class Bird: CanFly {
    func fly() {
        print("The bird flies")
    }
}

class Airplane: CanFly {
    func fly() {
        print("The airplane flies")
    }
}

func makeItFly(flyer: CanFly) {
    flyer.fly()
}

let bird = Bird()
let airplane = Airplane()

makeItFly(flyer: bird) // Outputs: The bird flies
makeItFly(flyer: airplane) // Outputs: The airplane flies
```

Trong ví dụ trên, `CanFly` được sử dụng như một kiểu đầy đủ trong hàm `makeItFly(flyer: CanFly)`. Hàm này có thể nhận bất kỳ đối tượng nào tuân thủ giao thức `CanFly`.

## Protocol Checking and Casting

Trong Swift, bạn có thể kiểm tra xem một thể hiện có tuân thủ một giao thức cụ thể hay không, và bạn cũng có thể ép kiểu giữa các giao thức. Điều này được thực hiện thông qua việc sử dụng các toán tử `is` và `as`.

Dưới đây là một ví dụ về việc kiểm tra và ép kiểu giao thức:

```swift
protocol CanFly {
    func fly()
}

class Bird: CanFly {
    func fly() {
        print("The bird flies")
    }
}

class Airplane: CanFly {
    func fly() {
        print("The airplane flies")
    }
}

let bird: CanFly = Bird()
let airplane: CanFly = Airplane()

if bird is Bird {
    print("This flyer is a bird")
}

if let birdAsBird = bird as? Bird {
    birdAsBird.fly() // Outputs: The bird flies
}

if let airplaneAsAirplane = airplane as? Airplane {
    airplaneAsAirplane.fly() // Outputs: The airplane flies
}
```

Trong ví dụ trên, `bird` và `airplane` đều là kiểu `CanFly`, nhưng chúng được khởi tạo bằng `Bird` và `Airplane` tương ứng. Toán tử `is` được sử dụng để kiểm tra xem `bird` có phải là một thể hiện của `Bird` hay không. Toán tử `as?` được sử dụng để ép kiểu `bird` và `airplane` về `Bird` và `Airplane` tương ứng, cho phép chúng ta gọi phương thức `fly()` của chúng.

## Protocols with Associated Types

Giao thức với yêu cầu chỉ mục (Protocols with Associated Types) trong Swift cho phép bạn tạo ra các giao thức mà một phần của định nghĩa của chúng phụ thuộc vào kiểu cụ thể được cung cấp khi giao thức được tuân thủ. Điều này tạo ra một khái niệm về "giao thức chung".

Dưới đây là một ví dụ về việc sử dụng giao thức với yêu cầu chỉ mục:

```swift
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct IntContainer: Container {
    var items = [Int]()
    
    mutating func append(_ item: Int) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}

var container = IntContainer()
container.append(12)
print(container.count) // Outputs: 1
print(container[0]) // Outputs: 12
```

Trong ví dụ trên, `Container` là một giao thức có một yêu cầu chỉ mục `Item`. `IntContainer` tuân thủ `Container` và định nghĩa `Item` là `Int`.

## Protocols as Generic Constraints

Trong Swift, bạn có thể sử dụng giao thức như một ràng buộc chung trong các hàm và kiểu chung. Điều này cho phép bạn viết các hàm và kiểu chung mà yêu cầu các đối số hoặc kiểu chung phải tuân thủ một giao thức cụ thể.

Dưới đây là một ví dụ về việc sử dụng giao thức như một ràng buộc chung:

```swift
protocol CanFly {
    func fly()
}

class Bird: CanFly {
    func fly() {
        print("The bird flies")
    }
}

class Airplane: CanFly {
    func fly() {
        print("The airplane flies")
    }
}

func makeItFly<T: CanFly>(flyer: T) {
    flyer.fly()
}

let bird = Bird()
let airplane = Airplane()

makeItFly(flyer: bird) // Outputs: The bird flies
makeItFly(flyer: airplane) // Outputs: The airplane flies
```

Trong ví dụ trên, hàm `makeItFly(flyer: T)` có một ràng buộc chung `T: CanFly`, yêu cầu `T` phải tuân thủ giao thức `CanFly`. Điều này có nghĩa là bạn chỉ có thể truyền vào hàm `makeItFly(flyer: T)` các đối tượng của các kiểu tuân thủ giao thức `CanFly`.

## Protocols with Self Requirements

Trong Swift, một số giao thức có thể yêu cầu các phương thức hoặc thuộc tính trả về kiểu của chính đối tượng thực hiện giao thức. Điều này được biểu thị bằng từ khóa `Self`.

Dưới đây là một ví dụ về việc sử dụng giao thức với các yêu cầu `Self`:

```swift
protocol Copyable {
    func copy() -> Self
}

class MyClass: Copyable {
    var num = 1

    func copy() -> Self {
        let result = type(of: self).init()
        result.num = num
        return result
    }
    
    required init() {
    }
}

let object = MyClass()
object.num = 5

let newObject = object.copy()
print(newObject.num) // Outputs: 5
```

Trong ví dụ trên, `Copyable` là một giao thức có một yêu cầu `Self` trong phương thức `copy()`. `MyClass` tuân thủ `Copyable` và triển khai phương thức `copy()`, trả về một thể hiện mới của chính nó. Lưu ý rằng chúng ta cần phải thêm một khởi tạo yêu cầu `required init()` để có thể tạo một thể hiện mới của `Self`.

## Protocols with Initializer Requirements

Trong Swift, các giao thức có thể yêu cầu các lớp tuân thủ phải cung cấp một hoặc nhiều khởi tạo cụ thể. Điều này được thực hiện bằng cách định nghĩa các khởi tạo trong phần định nghĩa giao thức.

Dưới đây là một ví dụ về việc sử dụng giao thức với các yêu cầu khởi tạo:

```swift
protocol Initializable {
    init(value: Int)
}

class MyClass: Initializable {
    var value: Int
    
    required init(value: Int) {
        self.value = value
    }
}

let object = MyClass(value: 5)
print(object.value) // Outputs: 5
```

Trong ví dụ trên, `Initializable` là một giao thức có một yêu cầu khởi tạo `init(value: Int)`. `MyClass` tuân thủ `Initializable` và triển khai khởi tạo yêu cầu. Lưu ý rằng chúng ta cần phải sử dụng từ khóa `required` khi triển khai khởi tạo yêu cầu trong lớp.

## Tạm kết

* Giới thiệu về Lập trình hướng giao thức
* So sánh giữa OOP và POP
* Áp dụng POP vào trong dự án với Swift
* Các tương tác cơ bản khi sử dụng POP

---

*Cảm ơn bạn đã đọc!*