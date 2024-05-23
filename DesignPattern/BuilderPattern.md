# Builder Pattern

## Builder Pattern là gì?

### Khái niệm

Builder Pattern là một mẫu thiết kế phần mềm thuộc nhóm Creational Design Pattern, giúp giải quyết vấn đề tạo ra các đối tượng phức tạp. Mẫu thiết kế này cho phép bạn xây dựng các đối tượng từng bước, sử dụng các phương thức khác nhau để thiết lập các thuộc tính khác nhau của đối tượng. Điều này giúp mã nguồn dễ đọc hơn và dễ bảo dưỡng hơn, do không cần phải tạo ra một số lượng lớn các hàm khởi tạo khác nhau với các tham số khác nhau.

### Thành phần

Các thành phần chính trong Builder Pattern bao gồm:

1. **Product**: Đây là đối tượng mà Builder Pattern sẽ tạo ra.

2. **Builder**: Đây là interface định nghĩa các bước để tạo ra một Product.

3. **Concrete Builder**: Đây là lớp cụ thể thực hiện interface Builder. Nó cung cấp cách thực hiện cho các bước tạo ra Product.

4. **Director**: Đây là lớp điều khiển quá trình tạo ra Product. Nó sẽ sử dụng Builder để tạo ra Product theo các bước đã định.

### Ví dụ

Dưới đây là một ví dụ về Builder Pattern trong Swift. Trong ví dụ này, chúng ta sẽ tạo một `Pizza` với các thành phần như `size`, `cheese`, `pepperoni`, và `pineapple`.

```swift
// Product
class Pizza {
    var size: String?
    var cheese: Bool?
    var pepperoni: Bool?
    var pineapple: Bool?
}

// Builder
protocol PizzaBuilder {
    func set(size: String)
    func add(cheese: Bool)
    func add(pepperoni: Bool)
    func add(pineapple: Bool)
    func build() -> Pizza
}

// Concrete Builder
class HawaiianPizzaBuilder: PizzaBuilder {
    private var pizza: Pizza

    init() {
        self.pizza = Pizza()
    }

    func set(size: String) {
        self.pizza.size = size
    }

    func add(cheese: Bool) {
        self.pizza.cheese = cheese
    }

    func add(pepperoni: Bool) {
        self.pizza.pepperoni = pepperoni
    }

    func add(pineapple: Bool) {
        self.pizza.pineapple = pineapple
    }

    func build() -> Pizza {
        return self.pizza
    }
}

// Director
class Pizzaiolo {
    func makePizza(builder: PizzaBuilder) -> Pizza {
        builder.set(size: "large")
        builder.add(cheese: true)
        builder.add(pepperoni: false)
        builder.add(pineapple: true)
        return builder.build()
    }
}

// Usage
let pizzaiolo = Pizzaiolo()
let pizza = pizzaiolo.makePizza(builder: HawaiianPizzaBuilder())
```

Mô tả Builder Pattern và cách nó hoạt động trong ngữ cảnh của việc tạo ra một đối tượng `Pizza`. Các thành phần chính của Builder Pattern trong ví dụ này bao gồm:

1. **Product (Pizza)**: Đây là đối tượng mà Builder Pattern sẽ tạo ra. Trong trường hợp này, đó là một `Pizza` với các thuộc tính như `size`, `cheese`, `pepperoni`, và `pineapple`.

2. **Builder (PizzaBuilder)**: Đây là interface định nghĩa các bước để tạo ra một `Pizza`. Nó bao gồm các phương thức như `set(size: String)`, `add(cheese: Bool)`, `add(pepperoni: Bool)`, `add(pineapple: Bool)`, và `build() -> Pizza`.

3. **Concrete Builder (HawaiianPizzaBuilder)**: Đây là lớp cụ thể thực hiện interface `PizzaBuilder`. Nó cung cấp cách thực hiện cho các bước tạo ra `Pizza`. Trong trường hợp này, `HawaiianPizzaBuilder` sẽ tạo ra một `Pizza` theo cách cụ thể của nó.

4. **Director**: Đây là lớp điều khiển quá trình tạo ra `Pizza`. Nó sẽ sử dụng `PizzaBuilder` để tạo ra `Pizza` theo các bước đã định. Trong đoạn văn trên, `Director` không được đề cập đến nhưng nó sẽ là đối tượng sử dụng `PizzaBuilder` để tạo ra `Pizza`.

Cách hoạt động của Builder Pattern trong ví dụ này là:

- `Director` sẽ sử dụng `PizzaBuilder` để thiết lập các thuộc tính cho `Pizza` từng bước một.
- Khi tất cả các thuộc tính đã được thiết lập, `Director` sẽ gọi phương thức `build()` để nhận về đối tượng `Pizza` đã hoàn thiện.

## Sử dụng

Chúng ta nên sử dụng Builder Pattern khi:

1. Cần tạo ra một đối tượng phức tạp có nhiều thuộc tính hoặc cấu trúc phức tạp. Builder Pattern giúp tạo ra các đối tượng từng bước một, giúp mã nguồn dễ đọc và dễ bảo dưỡng hơn.

2. Các thuộc tính của đối tượng có thể thay đổi theo thời gian hoặc trong các ngữ cảnh khác nhau. Builder Pattern cho phép bạn thay đổi các thuộc tính của đối tượng mà không cần tạo ra một đối tượng mới.

3. Cần tạo ra các biến thể khác nhau của một đối tượng mà không cần tạo ra nhiều lớp con. Builder Pattern cho phép bạn tạo ra các biến thể của một đối tượng mà không cần tạo ra nhiều lớp con.

4. Cần tạo ra các đối tượng có thể thay đổi trạng thái sau khi được tạo ra. Builder Pattern cho phép bạn tạo ra các đối tượng có thể thay đổi trạng thái sau khi được tạo ra.

## Ưu & nhược

Ưu điểm của Builder Pattern:

1. **Tách biệt mã xây dựng và biểu diễn**: Builder Pattern tách biệt mã xây dựng đối tượng khỏi biểu diễn của nó. Điều này giúp mã nguồn dễ đọc và dễ bảo dưỡng hơn.

2. **Tạo đối tượng phức tạp dễ dàng hơn**: Builder Pattern giúp tạo ra các đối tượng phức tạp từng bước một, giúp mã nguồn dễ đọc và dễ bảo dưỡng hơn.

3. **Tạo biến thể của một đối tượng mà không cần tạo lớp con**: Builder Pattern cho phép bạn tạo ra các biến thể của một đối tượng mà không cần tạo ra nhiều lớp con.

Nhược điểm của Builder Pattern:

1. **Tăng độ phức tạp của mã nguồn**: Builder Pattern có thể làm tăng độ phức tạp của mã nguồn nếu sử dụng cho các đối tượng không phức tạp.

2. **Tạo thêm nhiều lớp và giao diện**: Để sử dụng Builder Pattern, bạn cần tạo thêm nhiều lớp và giao diện, điều này có thể làm tăng độ phức tạp của mã nguồn.

3. **Khó khăn trong việc quản lý trạng thái**: Nếu đối tượng được xây dựng có nhiều trạng thái phụ thuộc vào nhau, việc quản lý chúng có thể trở nên khó khăn.

## Chaining methods

Trong Swift và iOS, không có API nào cụ thể cung cấp Builder Pattern như một phần của ngôn ngữ hoặc framework. Tuy nhiên, có một số cách mà các lập trình viên Swift thường sử dụng để tạo ra một hiệu ứng tương tự như Builder Pattern.

Một ví dụ phổ biến là sử dụng các phương thức chuỗi (chaining methods) để thiết lập các thuộc tính cho một đối tượng. Đây là một kỹ thuật thường được sử dụng trong việc xây dựng UI trong Swift và SwiftUI.

Ví dụ:

```swift
let label = UILabel()
    .text("Hello, World!")
    .font(.systemFont(ofSize: 20))
    .textColor(.black)
```

Trong ví dụ trên, mỗi phương thức trả về đối tượng gốc sau khi thiết lập một thuộc tính, cho phép chúng ta "xây dựng" đối tượng từng bước một giống như Builder Pattern.

Tuy nhiên, cần lưu ý rằng đây không phải là một ví dụ chính xác về Builder Pattern theo định nghĩa truyền thống. Đây chỉ là một cách để đạt được một hiệu ứng tương tự trong Swift và iOS.

## @ViewBuilder

`@ViewBuilder` trong SwiftUI không phải là một ví dụ chính xác của Builder Pattern, nhưng nó cung cấp một cách tiếp cận tương tự để xây dựng các đối tượng phức tạp từ các phần nhỏ hơn.

`@ViewBuilder` là một loại function builder trong Swift. Nó cho phép bạn xây dựng một `View` phức tạp từ nhiều `View` nhỏ hơn bằng cách sử dụng cú pháp khối. Điều này giống với cách Builder Pattern cho phép bạn xây dựng một đối tượng phức tạp từ các phần nhỏ hơn.

Tuy nhiên, có một số khác biệt quan trọng. Trong Builder Pattern, bạn thường xác định một interface Builder với các phương thức để thiết lập các thuộc tính khác nhau của đối tượng. Trong khi đó, `@ViewBuilder` không yêu cầu bạn định nghĩa một interface như vậy. Thay vào đó, bạn chỉ cần viết mã Swift bình thường trong khối `@ViewBuilder`.

Dưới đây là một ví dụ về cách sử dụng `@ViewBuilder` trong SwiftUI:

```swift
struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            Text("This is a second line.")
        }
    }
}
```

Trong ví dụ trên, `@ViewBuilder` cho phép chúng ta xây dựng một `View` phức tạp từ hai `Text` views.

## Separated mutability

Separated mutability là một trong những đặc điểm quan trọng của Builder Pattern. Nó cho phép tạo ra một đối tượng với trạng thái không thay đổi (immutable) sau khi đã được xây dựng xong, trong khi vẫn cho phép thay đổi trạng thái của đối tượng trong quá trình xây dựng.

Trong Builder Pattern, Builder là đối tượng có trạng thái có thể thay đổi (mutable). Nó cho phép bạn thiết lập các thuộc tính cho đối tượng đang được xây dựng một cách tuần tự. Khi tất cả các thuộc tính đã được thiết lập, bạn sẽ gọi phương thức `build()` để tạo ra đối tượng cuối cùng.

Đối tượng cuối cùng này thường là không thay đổi (immutable). Một khi đã được tạo ra, bạn không thể thay đổi trạng thái của nó. Điều này giúp đảm bảo tính nhất quán và an toàn của đối tượng sau khi đã được xây dựng.

Separated mutability giúp tạo ra các đối tượng an toàn và dễ sử dụng hơn, đặc biệt trong các môi trường đa luồng, nơi mà việc thay đổi trạng thái của đối tượng sau khi đã được tạo ra có thể dẫn đến các lỗi khó tìm và khó sửa.

Dưới đây là một ví dụ về Separated mutability trong Builder Pattern sử dụng Swift:

```swift
struct Pizza {
    let size: String // Immutable
    let cheese: Bool // Immutable
    let pepperoni: Bool // Immutable
    let pineapple: Bool // Immutable
}

class PizzaBuilder {
    var size: String? // Mutable
    var cheese: Bool = false // Mutable
    var pepperoni: Bool = false // Mutable
    var pineapple: Bool = false // Mutable

    func setSize(_ size: String) -> PizzaBuilder {
        self.size = size
        return self
    }

    func setCheese(_ cheese: Bool) -> PizzaBuilder {
        self.cheese = cheese
        return self
    }

    func setPepperoni(_ pepperoni: Bool) -> PizzaBuilder {
        self.pepperoni = pepperoni
        return self
    }

    func setPineapple(_ pineapple: Bool) -> PizzaBuilder {
        self.pineapple = pineapple
        return self
    }

    func build() -> Pizza? {
        guard let size = size else {
            return nil
        }
        return Pizza(size: size, cheese: cheese, pepperoni: pepperoni, pineapple: pineapple)
    }
}

// Usage
let pizza = PizzaBuilder()
    .setSize("Large")
    .setCheese(true)
    .setPepperoni(true)
    .setPineapple(false)
    .build()
```

Trong ví dụ này,

- `PizzaBuilder` có trạng thái có thể thay đổi (mutable) và được sử dụng để xây dựng một `Pizza`.
- Mỗi phương thức thiết lập của `PizzaBuilder` trả về `PizzaBuilder` để cho phép gọi tiếp các phương thức khác.
- Khi tất cả các thuộc tính đã được thiết lập, phương thức `build()` được gọi để tạo ra `Pizza` cuối cùng.

`Pizza` cuối cùng này có trạng thái không thay đổi (immutable). Một khi đã được tạo ra, bạn không thể thay đổi trạng thái của nó. Điều này giúp đảm bảo tính nhất quán và an toàn của `Pizza` sau khi đã được xây dựng.

## Hiding complexity

Hiding complexity là một trong những lợi ích chính của Builder Pattern. Nó giúp ẩn đi các chi tiết phức tạp liên quan đến việc tạo và cấu hình một đối tượng. Thay vì phải tạo đối tượng trực tiếp, người dùng chỉ cần tương tác với Builder. Builder sau đó sẽ chịu trách nhiệm tạo và cấu hình đối tượng.

Dưới đây là một ví dụ về cách sử dụng Builder Pattern để ẩn đi sự phức tạp khi tạo một đối tượng `Car` trong Swift:

```swift
struct Car {
    let make: String
    let model: String
    let year: Int
}

class CarBuilder {
    var make: String?
    var model: String?
    var year: Int?

    func setMake(_ make: String) -> CarBuilder {
        self.make = make
        return self
    }

    func setModel(_ model: String) -> CarBuilder {
        self.model = model
        return self
    }

    func setYear(_ year: Int) -> CarBuilder {
        self.year = year
        return self
    }

    func build() -> Car? {
        guard let make = make, let model = model, let year = year else {
            return nil
        }
        return Car(make: make, model: model, year: year)
    }
}

// Usage
let car = CarBuilder()
    .setMake("Toyota")
    .setModel("Corolla")
    .setYear(2020)
    .build()
```

Trong ví dụ này, `CarBuilder` giúp ẩn đi sự phức tạp khi tạo một `Car`. Người dùng không cần phải biết về các chi tiết cụ thể của việc tạo và cấu hình `Car`, họ chỉ cần tương tác với `CarBuilder`.

## Tạm kết

- Builder Pattern là một mẫu thiết kế phần mềm tạo ra các đối tượng phức tạp bằng cách sử dụng các bước tiếp cận tuần tự.
- Nó giúp tạo ra các đối tượng một cách linh hoạt và hiệu quả hơn, đặc biệt khi có nhiều thuộc tính có thể có.
- Mẫu này giúp ẩn đi sự phức tạp liên quan đến việc tạo và cấu hình một đối tượng, giúp mã nguồn dễ đọc và dễ bảo dưỡng hơn.
- Builder Pattern cũng giúp tạo ra các đối tượng không thay đổi (immutable) một cách dễ dàng, giúp đảm bảo tính nhất quán và an toàn của đối tượng sau khi đã được xây dựng.
- Trong Swift, chúng ta có thể sử dụng Builder Pattern để tạo ra các đối tượng phức tạp như `Car` trong ví dụ trên.

---

_Cảm ơn bạn đã đọc bài viết này!_
