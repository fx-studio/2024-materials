# Memento Pattern trong Swift

> *Đọc bài viết trên [Fx Studio](https://fxstudio.dev/memento-pattern-trong-10-phut/)*

## Memento Pattern là gì?

## Khái niệm

Memento Pattern là một mẫu thiết kế hành vi (behavioral design pattern) trong lập trình hướng đối tượng, nó cung cấp khả năng khôi phục trạng thái của một đối tượng về một thời điểm trước đó mà không vi phạm nguyên tắc đóng gói của đối tượng.

Memento Pattern thường được sử dụng trong các trường hợp cần thực hiện và hoàn tác các thao tác, ví dụ như trong một trình soạn thảo văn bản, bạn có thể "undo" (hoàn tác) các thao tác chỉnh sửa gần nhất.

### Thành phần

Mô hình này bao gồm ba loại đối tượng chính:

1. **Originator**: Đối tượng cần lưu trữ trạng thái hiện tại.
2. **Memento**: Đối tượng lưu trữ trạng thái đã lưu của Originator.
3. **Caretaker**: Đối tượng kiểm soát khi và làm thế nào Originator tương tác với Memento, nhưng không thao tác trực tiếp với trạng thái đã lưu.

### Ví dụ

Một ví dụ về việc sử dụng Memento Pattern trong iOS có thể là việc lưu trạng thái của một ứng dụng khi nó chuyển sang chế độ nền và sau đó khôi phục trạng thái đó khi ứng dụng trở lại chế độ tiền cảnh.

Dưới đây là một ví dụ đơn giản về cách sử dụng Memento Pattern trong Swift:

```swift
class Memento {
    let state: String

    init(state: String) {
        self.state = state
    }
}

class Originator {
    var state: String = ""

    func createMemento() -> Memento {
        return Memento(state: state)
    }
    func restore(memento: Memento) {
        state = memento.state
    }
}

class Caretaker {
    var mementos = [Memento]()
    var originator: Originator

    init(originator: Originator) {
        self.originator = originator
    }

    func backup() {
        mementos.append(originator.createMemento())
    }

    func undo() {
        guard let memento = mementos.popLast() else { return }
        originator.restore(memento: memento)
    }
}

let originator = Originator()
let caretaker = Caretaker(originator: originator)

originator.state = "State1"
caretaker.backup()

originator.state = "State2"
caretaker.backup()

originator.state = "State3"
caretaker.backup()

caretaker.undo()
print(originator.state) // Prints: "State2"

caretaker.undo()
print(originator.state) // Prints: "State1"
```

Trong ví dụ này, `Originator` lưu trữ trạng thái hiện tại, `Memento` lưu trữ trạng thái đã lưu của `Originator`, và `Caretaker` quản lý việc lưu và khôi phục các trạng thái từ `Memento`.

## So sánh với hàng đợi & mảng

Memento không giống như một hàng đợi hay một mảng. Memento là một mẫu thiết kế trong lập trình hướng đối tượng, nó không phải là một cấu trúc dữ liệu như hàng đợi hay mảng.

Memento Pattern được sử dụng để lưu trữ trạng thái của một đối tượng (được gọi là Originator) vào một đối tượng khác (được gọi là Memento). Một đối tượng thứ ba (được gọi là Caretaker) sau đó có thể sử dụng Memento để khôi phục trạng thái của Originator.

Tuy nhiên, bạn có thể sử dụng một mảng hoặc một hàng đợi để lưu trữ nhiều Memento, cho phép bạn khôi phục nhiều trạng thái trước đó của Originator. Trong trường hợp này, mảng hoặc hàng đợi đóng vai trò như một danh sách lịch sử các trạng thái đã lưu.

## Ưu & nhược

Mẫu thiết kế Memento có một số ưu điểm và nhược điểm như sau:

**Ưu điểm:**

1. **Khôi phục trạng thái**: Memento Pattern cho phép bạn lưu lại và khôi phục trạng thái của một đối tượng mà không vi phạm nguyên tắc đóng gói của đối tượng.

2. **Simplifying Originator**: Bằng cách giữ trạng thái bên ngoài đối tượng gốc, Memento Pattern giúp giảm bớt trách nhiệm của đối tượng gốc, giúp mã nguồn dễ đọc và dễ bảo dưỡng hơn.

3. **Chức năng "undo"**: Memento Pattern thường được sử dụng để cung cấp chức năng "undo" trong các ứng dụng.

**Nhược điểm:**

1. **Tốn bộ nhớ**: Memento Pattern có thể tốn kém về mặt bộ nhớ, đặc biệt nếu bạn lưu lại nhiều trạng thái hoặc trạng thái của các đối tượng lớn.

2. **Overhead**: Việc tạo và lưu trữ mementos có thể tạo ra một lượng công việc đáng kể, đặc biệt nếu trạng thái của đối tượng phức tạp hoặc nếu bạn cần lưu trữ nhiều mementos.

3. **Cần cẩn thận với trạng thái đối tượng**: Nếu đối tượng gốc được thay đổi trong quá trình tạo memento, có thể dẫn đến trạng thái không nhất quán hoặc không hợp lệ khi khôi phục.

## Sử dụng

Memento Pattern thường được sử dụng trong các trường hợp sau:

1. **Khi bạn muốn lưu lại và khôi phục trạng thái của một đối tượng**: Memento Pattern cho phép bạn lưu lại trạng thái hiện tại của một đối tượng và sau đó khôi phục lại trạng thái đó mà không vi phạm nguyên tắc đóng gói của đối tượng.

```swift
class Originator {
    var state: String
    init(state: String) {
        self.state = state
    }
    func createMemento() -> Memento {
        return Memento(state: state)
    }
    func restore(memento: Memento) {
        state = memento.state
    }
}

class Memento {
    let state: String
    init(state: String) {
        self.state = state
    }
}

let originator = Originator(state: "State1")
let memento = originator.createMemento()

originator.state = "State2"
originator.restore(memento: memento)
print(originator.state) // Prints: "State1"
```

2. **Khi bạn muốn cung cấp chức năng "undo"**: Memento Pattern thường được sử dụng để cung cấp chức năng "undo" trong các ứng dụng. Ví dụ, trong một trình soạn thảo văn bản, bạn có thể sử dụng Memento Pattern để lưu lại trạng thái của văn bản sau mỗi thao tác chỉnh sửa, cho phép người dùng "undo" các thao tác chỉnh sửa gần nhất.

```swift
class Caretaker {
    private var mementos = [Memento]()
    private var originator: Originator
    init(originator: Originator) {
        self.originator = originator
    }
    func backup() {
        mementos.append(originator.createMemento())
    }
    func undo() {
        guard let memento = mementos.popLast() else { return }
        originator.restore(memento: memento)
    }
}

let originator = Originator(state: "State1")
let caretaker = Caretaker(originator: originator)

originator.state = "State2"
caretaker.backup()

originator.state = "State3"
caretaker.backup()

caretaker.undo()
print(originator.state) // Prints: "State2"

caretaker.undo()
print(originator.state) // Prints: "State1"
```

3. **Khi bạn muốn lưu lại lịch sử của một đối tượng**: Memento Pattern cũng có thể được sử dụng để lưu lại lịch sử của một đối tượng, cho phép bạn xem lại các trạng thái trước đó của đối tượng.

```swift
class Caretaker {
    private var mementos = [Memento]()
    private var originator: Originator
    init(originator: Originator) {
        self.originator = originator
    }
    func backup() {
        mementos.append(originator.createMemento())
    }
    func showHistory() {
        for (index, memento) in mementos.enumerated() {
            print("Memento \(index): \(memento.state)")
        }
    }
}

let originator = Originator(state: "State1")
let caretaker = Caretaker(originator: originator)

originator.state = "State2"
caretaker.backup()

originator.state = "State3"
caretaker.backup()

caretaker.showHistory() // Prints: "Memento 0: State2", "Memento 1: State3"
```

Tuy nhiên, cần lưu ý rằng việc sử dụng Memento Pattern có thể tốn kém về mặt bộ nhớ, đặc biệt nếu bạn lưu lại nhiều trạng thái hoặc trạng thái của các đối tượng lớn.

## Mã hóa & giải mã

Memento Pattern có thể được sử dụng trong việc mã hóa và giải mã dữ liệu. Dưới đây là một ví dụ về việc sử dụng Memento Pattern để mã hóa và giải mã một đối tượng trong Swift:

```swift
import Foundation

class Memento {
    let state: Data
    init(state: Data) {
        self.state = state
    }
}

class Originator {
    var state: Any
    init(state: Any) {
        self.state = state
    }
    func createMemento() -> Memento {
        let data = try! NSKeyedArchiver.archivedData(withRootObject: state, requiringSecureCoding: false)
        return Memento(state: data)
    }
    func restore(memento: Memento) {
        state = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(memento.state)!
    }
}

class Caretaker {
    var mementos = [Memento]()
    var originator: Originator
    init(originator: Originator) {
        self.originator = originator
    }
    func backup() {
        mementos.append(originator.createMemento())
    }
    func undo() {
        guard let memento = mementos.popLast() else { return }
        originator.restore(memento: memento)
    }
}

let originator = Originator(state: ["Hello", "World"])
let caretaker = Caretaker(originator: originator)

caretaker.backup()

originator.state = ["Hello", "Swift"]
caretaker.backup()

caretaker.undo()
print(originator.state) // Prints: ["Hello", "World"]
```

Trong ví dụ này,

- `Originator` lưu trữ trạng thái hiện tại dưới dạng một đối tượng bất kỳ
- `Memento` lưu trữ trạng thái đã lưu của `Originator` dưới dạng dữ liệu
- `Caretaker` quản lý việc lưu và khôi phục các trạng thái từ `Memento`
- `NSKeyedArchiver` và `NSKeyedUnarchiver` được sử dụng để mã hóa và giải mã trạng thái của `Originator`.

Lưu ý: Trong iOS, bạn có thể sử dụng các lớp như `NSKeyedArchiver` và `NSKeyedUnarchiver` (hoặc `Codable` protocol với `JSONEncoder` và `JSONDecoder` cho các đối tượng có thể mã hóa) để mã hóa và giải mã trạng thái của Originator. Tuy nhiên, đây không phải là một phần cốt lõi của mẫu thiết kế Memento, mà chỉ là một cách thực hiện cụ thể trong iOS.

## Tạm kết

- Giới thiệu và giải thích mẫu thiết kế Memento trong lập trình.
- Mẫu thiết kế này cho phép lưu lại và khôi phục trạng thái của một đối tượng mà không vi phạm nguyên tắc đóng gói của đối tượng.
- Thành phần của mẫu thiết kế Memento
- Các cách dùng cơ bản & áp dụng thực tế trong dự án iOS

---

_Cảm ơn bạn đã đọc bài viết này!_
