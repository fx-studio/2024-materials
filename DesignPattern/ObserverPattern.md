# Observer Pattern trong Swift

> *Đọc bài viết trên [Fx Studio](https://fxstudio.dev/observer-pattern-trong-10-phut/)*

## Observer Pattern là gì?

### Khái niệm

Observer Pattern là một mẫu thiết kế hành vi (behavioral design pattern) trong lập trình hướng đối tượng. Mẫu thiết kế này xác định một phụ thuộc một-nhiều giữa các đối tượng sao cho khi một đối tượng thay đổi trạng thái, tất cả các đối tượng phụ thuộc của nó đều được thông báo và cập nhật tự động.

Trong Observer Pattern, đối tượng thay đổi trạng thái được gọi là Subject, và các đối tượng phụ thuộc được gọi là Observers. Subject duy trì một danh sách các Observers và thông báo cho chúng khi có thay đổi trạng thái.

Mẫu thiết kế này thường được sử dụng trong các trường hợp mà một hệ thống cần duy trì sự nhất quán giữa các đối tượng liên quan.

### Thành phần

Mẫu thiết kế Observer Pattern bao gồm hai thành phần chính: Subject và Observer.

1. **Subject**: Đây là đối tượng mà trạng thái của nó cần được theo dõi. Nó duy trì một danh sách các Observer và cung cấp các phương thức để thêm, xóa và thông báo cho các Observer.

2. **Observer**: Đây là các đối tượng cần được thông báo khi trạng thái của Subject thay đổi. Tất cả các Observer đều phải tuân theo một giao diện chung (hoặc lớp trừu tượng) mà Subject sử dụng để cập nhật trạng thái.

Khi trạng thái của Subject thay đổi, nó sẽ thông báo cho tất cả các Observer bằng cách gọi phương thức cập nhật của chúng. Phương thức cập nhật này thường là một phần của giao diện Observer mà tất cả các Observer đều phải tuân theo.

### Giá trị

Trong mẫu thiết kế Observer, "Value" không phải là một thành phần chính như Subject và Observer. Tuy nhiên, "Value" có thể được hiểu là dữ liệu hoặc trạng thái mà Subject thông báo cho các Observer khi có sự thay đổi.

Khi trạng thái của Subject thay đổi, nó sẽ thông báo cho tất cả các Observer đã đăng ký. Thông tin về sự thay đổi trạng thái - thường được gọi là "Value" - có thể được truyền như một tham số của phương thức cập nhật mà Subject gọi trên mỗi Observer.

Ví dụ, nếu bạn có một đối tượng Subject là một cảm biến nhiệt độ, "Value" có thể là giá trị nhiệt độ mới mà cảm biến đo được. Khi nhiệt độ thay đổi, Subject sẽ thông báo cho tất cả các Observer về giá trị nhiệt độ mới này.

## Ví dụ

Dưới đây là một ví dụ về Observer Pattern trong Swift, với một đối tượng `WeatherStation` (Subject) và một đối tượng `WeatherApp` (Observer). `WeatherStation` sẽ thông báo cho `WeatherApp` mỗi khi nhiệt độ thay đổi.

```swift
// Define the Observer protocol
protocol WeatherObserver {
    func update(temperature: Float)
}

// Define the Subject
class WeatherStation {
    private var temperature: Float = 0.0
    private var observers = [WeatherObserver]()

    func add(observer: WeatherObserver) {
        observers.append(observer)
    }

    func remove(observer: WeatherObserver) {
        if let index = observers.firstIndex(where: { $0 === observer }) {
            observers.remove(at: index)
        }
    }

    func set(temperature: Float) {
        self.temperature = temperature
        notify()
    }

    private func notify() {
        observers.forEach { $0.update(temperature: temperature) }
    }
}

// Define the Observer
class WeatherApp: WeatherObserver {
    private var temperature: Float = 0.0

    func update(temperature: Float) {
        self.temperature = temperature
        print("WeatherApp: The temperature is now \(temperature) degrees")
    }
}

// Usage
let weatherStation = WeatherStation()
let weatherApp = WeatherApp()

weatherStation.add(observer: weatherApp)
weatherStation.set(temperature: 25.0)

// Output: "WeatherApp: The temperature is now 25.0 degrees"
```

Trong ví dụ này,

- `WeatherStation` là Subject, nó duy trì một danh sách các Observer (`WeatherApp`).
- Khi nhiệt độ thay đổi (`set(temperature:)`), `WeatherStation` sẽ thông báo cho tất cả các Observer bằng cách gọi phương thức `update(temperature:)` của chúng.

## Cách hoạt động

Mẫu thiết kế Observer hoạt động theo các bước sau:

1. **Đăng ký Observer**: Các đối tượng Observer đăng ký với đối tượng Subject để nhận thông báo về sự thay đổi trạng thái. Đối tượng Subject duy trì một danh sách các đối tượng Observer đã đăng ký.

2. **Thay đổi trạng thái**: Khi trạng thái của đối tượng Subject thay đổi, nó sẽ thông báo cho tất cả các đối tượng Observer đã đăng ký bằng cách gọi phương thức cập nhật của chúng.

3. **Cập nhật trạng thái**: Mỗi đối tượng Observer sẽ cập nhật trạng thái của mình dựa trên thông tin nhận được từ đối tượng Subject.

4. **Hủy đăng ký**: Nếu một đối tượng Observer không muốn nhận thông báo nữa, nó có thể hủy đăng ký với đối tượng Subject.

Qua cách hoạt động này, mẫu thiết kế Observer cho phép duy trì sự nhất quán giữa các đối tượng liên quan mà không cần chúng biết lẫn nhau.

### Ví dụ

Dưới đây là ví dụ đơn giản về việc triển khai mô hình Observer Pattern trong Swift:

```swift
// Định nghĩa giao thức mà các observer phải tuân theo
protocol Observer: class {
    func notify(with value: Int)
}

// Định nghĩa Model
class Model {
    // Khi giá trị thay đổi, thông báo cho tất cả các observer
    var value: Int {
        didSet {
            notifyObservers()
        }
    }
    // Danh sách các observer
    private var observers = [Observer]()

    init(value: Int) {
        self.value = value
    }

    // Thêm observer vào danh sách
    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }

    // Thông báo cho tất cả các observer khi giá trị thay đổi
    private func notifyObservers() {
        observers.forEach { $0.notify(with: value) }
    }
}

// Định nghĩa Controller
class Controller: Observer {
    private let model: Model
    private let view: View

    init(model: Model, view: View) {
        self.model = model
        self.view = view
        // Controller đăng ký làm observer của Model
        model.addObserver(self)
    }

    // Khi nhận được thông báo, cập nhật View
    func notify(with value: Int) {
        view.update(with: value)
    }
}

// Định nghĩa View
class View {
    // Cập nhật View với giá trị mới
    func update(with value: Int) {
        print("Đang cập nhật View với giá trị: \(value)")
    }
}

// Sử dụng
let model = Model(value: 0)
let view = View()
let controller = Controller(model: model, view: view)

// Khi giá trị của Model thay đổi, View sẽ được cập nhật
model.value = 5  // "Đang cập nhật View với giá trị: 5"
```

Trong ví dụ này,

- `Model` giữ một danh sách các `Observer` (trong trường hợp này là `Controller`) và thông báo cho chúng mỗi khi giá trị của nó thay đổi
- `Controller` sau đó cập nhật `View` tương ứng.

## Sử dụng

Observer Pattern thường được sử dụng trong các trường hợp sau:

1. **Khi một sự thay đổi trong một đối tượng cần phải được phản ánh trong một hoặc nhiều đối tượng khác, mà không cần biết chúng là đối tượng nào.** Điều này thường xảy ra khi bạn có một mô hình dữ liệu mà nhiều thành phần giao diện người dùng (UI) cần phản ánh những thay đổi.

2. **Khi một đối tượng cần thông báo cho các đối tượng khác mà không cần phụ thuộc vào chúng.** Trong trường hợp này, Observer Pattern giúp giảm sự phụ thuộc giữa các đối tượng, giúp mã nguồn dễ dàng thay đổi và mở rộng hơn.

3. **Khi bạn muốn tạo một kiến trúc plug-in.** Observer Pattern cho phép các thành phần plug-in đăng ký và nhận thông báo từ các thành phần khác mà không cần biết chi tiết về chúng.

Ví dụ, trong một ứng dụng tin tức, khi có tin tức mới, hệ thống (Subject) sẽ tự động gửi thông báo cho tất cả người dùng đã đăng ký (Observers) mà không cần biết họ là ai.

## So sánh với các APIs tương đồng

### Notifications APIs

Observer Pattern và các lớp Notification trong Swift hoặc iOS đều cung cấp cơ chế để thông báo cho một hoặc nhiều đối tượng về sự thay đổi trạng thái của một đối tượng khác. Tuy nhiên, có một số khác biệt quan trọng:

1. **Phạm vi**: Observer Pattern là một mẫu thiết kế tổng quát có thể được sử dụng trong bất kỳ ngôn ngữ lập trình nào. Trong khi đó, các lớp Notification trong Swift hoặc iOS là các lớp cụ thể được cung cấp bởi Apple cho việc phát và nhận thông báo trong các ứng dụng Swift hoặc iOS.

2. **Cách sử dụng**: Khi sử dụng Observer Pattern, bạn cần tự định nghĩa các lớp Subject và Observer và quản lý việc đăng ký và hủy đăng ký các Observer. Trong khi đó, khi sử dụng các lớp Notification, bạn chỉ cần sử dụng các API có sẵn để gửi và nhận thông báo.

3. **Thông tin được truyền đi**: Trong Observer Pattern, thông tin được truyền từ Subject đến Observer thường là một phần của trạng thái của Subject. Trong khi đó, với các lớp Notification, thông tin được truyền đi có thể là bất kỳ dữ liệu nào được đóng gói trong một đối tượng Notification.

4. **Sự phụ thuộc**: Observer Pattern giảm sự phụ thuộc giữa các đối tượng bằng cách sử dụng giao diện hoặc lớp trừu tượng. Trong khi đó, với các lớp Notification, các đối tượng không cần biết về nhau, giúp giảm sự phụ thuộc hơn nữa.

### Combine Framework

Combine là một framework phản ứng lập trình được Apple giới thiệu trong Swift. Nó cung cấp các công cụ để xử lý các sự kiện, dữ liệu và các hoạt động không đồng bộ trong ứng dụng của bạn. Dưới đây là một số điểm so sánh giữa Observer Pattern và Combine:

1. **Phạm vi**: Observer Pattern là một mẫu thiết kế tổng quát có thể được sử dụng trong bất kỳ ngôn ngữ lập trình nào. Trong khi đó, Combine là một framework cụ thể của Swift, được cung cấp bởi Apple.

2. **Cách sử dụng**: Khi sử dụng Observer Pattern, bạn cần tự định nghĩa các lớp Subject và Observer và quản lý việc đăng ký và hủy đăng ký các Observer. Trong khi đó, Combine cung cấp các API để tạo và quản lý các luồng dữ liệu và sự kiện.

3. **Xử lý lỗi**: Combine cung cấp một cơ chế mạnh mẽ để xử lý lỗi. Bạn có thể định nghĩa cách xử lý lỗi ngay trong chuỗi xử lý dữ liệu. Trong khi đó, Observer Pattern không có cơ chế xử lý lỗi tích hợp.

4. **Xử lý không đồng bộ**: Combine được thiết kế để xử lý các hoạt động không đồng bộ và có thể dễ dàng kết hợp nhiều luồng dữ liệu và sự kiện. Trong khi đó, Observer Pattern không có cơ chế tích hợp để xử lý không đồng bộ.

5. **Sự phụ thuộc**: Cả Observer Pattern và Combine đều giúp giảm sự phụ thuộc giữa các đối tượng. Tuy nhiên, Combine cung cấp một mô hình lập trình phản ứng mạnh mẽ hơn, cho phép bạn tạo ra các luồng dữ liệu và sự kiện phức tạp hơn.

### RxSwift

RxSwift là một thư viện lập trình phản ứng cho Swift, dựa trên ReactiveX. Giống như Combine, nó cung cấp các công cụ để xử lý các sự kiện, dữ liệu và các hoạt động không đồng bộ trong ứng dụng của bạn. Dưới đây là một số điểm so sánh giữa Observer Pattern và RxSwift:

1. **Phạm vi**: Observer Pattern là một mẫu thiết kế tổng quát có thể được sử dụng trong bất kỳ ngôn ngữ lập trình nào. Trong khi đó, RxSwift là một thư viện cụ thể của Swift, không phụ thuộc vào Apple.

2. **Cách sử dụng**: Khi sử dụng Observer Pattern, bạn cần tự định nghĩa các lớp Subject và Observer và quản lý việc đăng ký và hủy đăng ký các Observer. Trong khi đó, RxSwift cung cấp các API để tạo và quản lý các luồng dữ liệu và sự kiện.

3. **Xử lý lỗi**: RxSwift cung cấp một cơ chế mạnh mẽ để xử lý lỗi. Bạn có thể định nghĩa cách xử lý lỗi ngay trong chuỗi xử lý dữ liệu. Trong khi đó, Observer Pattern không có cơ chế xử lý lỗi tích hợp.

4. **Xử lý không đồng bộ**: RxSwift được thiết kế để xử lý các hoạt động không đồng bộ và có thể dễ dàng kết hợp nhiều luồng dữ liệu và sự kiện. Trong khi đó, Observer Pattern không có cơ chế tích hợp để xử lý không đồng bộ.

5. **Sự phụ thuộc**: Cả Observer Pattern và RxSwift đều giúp giảm sự phụ thuộc giữa các đối tượng. Tuy nhiên, RxSwift cung cấp một mô hình lập trình phản ứng mạnh mẽ hơn, cho phép bạn tạo ra các luồng dữ liệu và sự kiện phức tạp hơn.

6. **Tính tương thích**: RxSwift có thể tương thích với các phiên bản Swift cũ hơn, trong khi Combine chỉ hỗ trợ Swift 5 trở lên và iOS 13 trở lên.

### KVO

Key-Value Observing (KVO) là một mô hình lập trình được Apple cung cấp trong Cocoa để quan sát và thông báo về sự thay đổi của thuộc tính và trạng thái của đối tượng. Dưới đây là một số điểm so sánh giữa Observer Pattern, RxSwift, Combine và KVO:

1. **Phạm vi**: KVO là một mô hình cụ thể của Objective-C và Swift, được cung cấp bởi Apple. Trong khi đó, Observer Pattern là một mẫu thiết kế tổng quát có thể được sử dụng trong bất kỳ ngôn ngữ lập trình nào. RxSwift và Combine là các thư viện/framework lập trình phản ứng cho Swift.

2. **Cách sử dụng**: Khi sử dụng KVO, bạn không cần phải định nghĩa các lớp Subject và Observer. Thay vào đó, bạn chỉ cần đăng ký quan sát viên cho các thuộc tính cụ thể của đối tượng. Trong khi đó, khi sử dụng Observer Pattern, RxSwift, hoặc Combine, bạn cần tự định nghĩa các lớp Subject và Observer (hoặc tương đương) và quản lý việc đăng ký và hủy đăng ký các Observer.

3. **Xử lý lỗi**: KVO không cung cấp một cơ chế mạnh mẽ để xử lý lỗi như RxSwift và Combine. Trong khi đó, Observer Pattern cũng không có cơ chế xử lý lỗi tích hợp.

4. **Xử lý không đồng bộ**: KVO không được thiết kế để xử lý các hoạt động không đồng bộ như RxSwift và Combine. Trong khi đó, Observer Pattern cũng không có cơ chế tích hợp để xử lý không đồng bộ.

5. **Sự phụ thuộc**: Cả KVO, Observer Pattern, RxSwift và Combine đều giúp giảm sự phụ thuộc giữa các đối tượng. Tuy nhiên, RxSwift và Combine cung cấp một mô hình lập trình phản ứng mạnh mẽ hơn, cho phép bạn tạo ra các luồng dữ liệu và sự kiện phức tạp hơn.

6. **Tính tương thích**: KVO hoạt động tốt với Objective-C và các phiên bản Swift cũ hơn. Trong khi đó, RxSwift cũng tương thích với các phiên bản Swift cũ hơn, nhưng Combine chỉ hỗ trợ Swift 5 trở lên và iOS 13 trở lên.

## Hỗ trợ MVC & MVVM

Observer Pattern có thể được sử dụng trong cả hai mô hình kiến trúc MVC (Model-View-Controller) và MVVM (Model-View-ViewModel). Dưới đây là cách nó được sử dụng trong mỗi mô hình:

1. **MVC**: Trong mô hình MVC, Observer Pattern thường được sử dụng để thông báo cho View về sự thay đổi trạng thái của Model. Khi Model thay đổi, nó sẽ thông báo cho Controller, và Controller sau đó sẽ cập nhật View. Điều này giúp đảm bảo rằng View luôn phản ánh đúng trạng thái hiện tại của Model.

2. **MVVM**: Trong mô hình MVVM, Observer Pattern thường được sử dụng để liên kết giữa ViewModel và View. Khi dữ liệu trong ViewModel thay đổi, View sẽ được tự động cập nhật để phản ánh sự thay đổi này. Điều này giúp giảm bớt trách nhiệm của View trong việc theo dõi sự thay đổi trạng thái và giúp tách biệt giữa logic ứng dụng (trong ViewModel) và logic giao diện người dùng (trong View).

Trong cả hai mô hình, Observer Pattern giúp giảm sự phụ thuộc giữa các thành phần và làm cho mã nguồn dễ dàng thay đổi và mở rộng hơn.

### Ví dụ code trong MVC với Observer Pattern

Dưới đây là một ví dụ về việc sử dụng Observer Pattern trong mô hình MVC với Swift, bao gồm các lớp `UIViewController`, `Model`, và `View`.

```swift
import UIKit

// Define the protocol that observers must adhere to
protocol Observer: class {
    func update(with value: Int)
}

// Define the Model
class Model {
    var value: Int {
        didSet {
            notifyObservers()
        }
    }
    private var observers = [Observer]()

    init(value: Int) {
        self.value = value
    }

    func addObserver(_ observer: Observer) {
        observers.append(observer)
    }

    private func notifyObservers() {
        observers.forEach { $0.update(with: value) }
    }
}

// Define the View
class CustomView: UIView {
    private let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        label.frame = bounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with value: Int) {
        label.text = "Value: \(value)"
    }
}

// Define the Controller
class ViewController: UIViewController, Observer {
    private let model: Model
    private let customView = CustomView()

    init(model: Model) {
        self.model = model
        super.init(nibName: nil, bundle: nil)
        model.addObserver(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = customView
    }

    func update(with value: Int) {
        customView.update(with: value)
    }
}

// Usage
let model = Model(value: 0)
let viewController = ViewController(model: model)

model.value = 5  // The label in the view controller's view will update to "Value: 5"
```

Trong ví dụ này,

- `Model` giữ một danh sách các `Observer` (trong trường hợp này là `ViewController`) và thông báo cho chúng mỗi khi giá trị của nó thay đổi
- `ViewController` sau đó cập nhật `CustomView` tương ứng.

## Tạm kết

- Tìm hiểu khái niệm & các thành phần cơ bản của Observer Pattern
- Cách hoạt động cơ bản và sử dụng mẫu thiết kế nào vào dự án
- Phân tích so sánh với các APIs tương đương khác

---

_Cám ơn bạn đã đọc bài viết!_
