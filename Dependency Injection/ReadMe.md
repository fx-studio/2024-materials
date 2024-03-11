# Dependency Injection in Swift

## Dependency Injection (DI) là gì?

**Dependency Injection (DI)** là một kỹ thuật thiết kế phần mềm mà ở đó các đối tượng nhận các dependencies của chúng (các đối tượng mà chúng phụ thuộc vào) từ bên ngoài thay vì tạo chúng bên trong. Trong Swift, có nhiều cách để thực hiện DI, nhưng dưới đây là một ví dụ cơ bản:

```swift
protocol Service {
    func doSomething()
}

class RealService: Service {
    func doSomething() {
        print("Doing something...")
    }
}

class Client {
    let service: Service

    init(service: Service) {
        self.service = service
    }

    func start() {
        service.doSomething()
    }
}

let realService = RealService()
let client = Client(service: realService)
client.start()
```

Trong ví dụ trên, `Client` phụ thuộc vào một đối tượng tuân thủ protocol `Service`. Thay vì Client tạo ra một instance của RealService (hoặc bất kỳ lớp nào khác tuân thủ Service), chúng ta chuyển một instance của Service vào Client thông qua hàm khởi tạo. Điều này cho phép chúng ta thay đổi đối tượng Service mà Client sử dụng mà không cần thay đổi code của Client, giúp tăng tính linh hoạt và dễ kiểm tra của code.

## Dependency Injection Patterns

Có một số mẫu thiết kế (patterns) phổ biến được sử dụng để áp dụng Dependency Injection:

- Constructor Injection: Đây là mẫu thiết kế Dependency Injection phổ biến nhất. Trong mẫu này, dependencies được chuyển vào qua hàm khởi tạo (constructor) của lớp. Điều này đảm bảo rằng tất cả các dependencies đều được cung cấp trước khi đối tượng được sử dụng.
- Property Injection: Trong mẫu này, dependencies được gán vào các thuộc tính (property) của lớp. Điều này thường được sử dụng khi không thể sử dụng Constructor Injection, ví dụ khi sử dụng Storyboards trong iOS.
- Method Injection: Trong mẫu này, dependencies được chuyển vào qua các phương thức (method) của lớp. Điều này hữu ích khi chỉ một số phương thức cần sử dụng dependency, hoặc khi dependency có thể thay đổi sau mỗi lần gọi phương thức.
- Ambient Context: Đây là một mẫu thiết kế cho phép bạn đặt một "context" mà tất cả các đối tượng trong ứng dụng của bạn có thể truy cập. Điều này có thể hữu ích khi bạn có một số dependencies mà hầu hết các phần của ứng dụng của bạn cần truy cập.
- Service Locator: Đây là một mẫu thiết kế cho phép bạn tìm kiếm các dịch vụ (services) mà bạn cần, thay vì chúng được chuyển vào qua hàm khởi tạo hoặc thuộc tính. Tuy nhiên, mẫu này có thể làm cho việc kiểm soát dependencies trở nên khó khăn hơn, vì vậy nó nên được sử dụng một cách cẩn thận.

## Thực hiện Dependency Injection cơ bản

### Constructor Injection

#### Khái niệm

Đây là phương pháp phổ biến nhất. Dependency được chuyển vào qua hàm khởi tạo (constructor) của lớp hoặc cấu trúc.

```swift
class SomeClass {
    let dependency: SomeDependency

    init(dependency: SomeDependency) {
        self.dependency = dependency
    }
}
```

- Ưu điểm: Rõ ràng và dễ hiểu. Đảm bảo rằng đối tượng luôn có sẵn các dependencies cần thiết để hoạt động. Điều này giúp tránh lỗi runtime do thiếu dependencies.
- Nhược điểm: Nếu một lớp có quá nhiều dependencies, hàm khởi tạo có thể trở nên phức tạp và khó đọc. Điều này cũng có thể là dấu hiệu của mùi mã (code smell) - quá nhiều trách nhiệm trong một lớp.

#### Áp dụng

Đây là phương pháp nên được sử dụng trong hầu hết các trường hợp. Nó đảm bảo rằng tất cả các dependencies đều được cung cấp trước khi đối tượng được sử dụng. Ví dụ, nếu bạn có một lớp DatabaseManager mà cần một DatabaseConnection để hoạt động, bạn nên chuyển DatabaseConnection vào qua hàm khởi tạo của DatabaseManager.

Ví dụ code khác:

```swift
// Define a protocol that represents what actions a printer can do
protocol Printer {
    func printDocument(_ document: String)
}

// Implement a concrete class that conforms to the Printer protocol
class InkjetPrinter: Printer {
    func printDocument(_ document: String) {
        print("Printing document with InkjetPrinter: \(document)")
    }
}

// SomeClass depends on a Printer to do its work
class SomeClass {
    let printer: Printer

    init(printer: Printer) {
        self.printer = printer
    }

    func performTask() {
        printer.printDocument("Hello, world!")
    }
}

// Usage
let printer = InkjetPrinter()
let someObject = SomeClass(printer: printer)
someObject.performTask()  // Outputs: Printing document with InkjetPrinter: Hello, world!
```

Trong ví dụ trên, SomeClass phụ thuộc vào một đối tượng tuân thủ protocol Printer. Thay vì SomeClass tạo ra một instance của InkjetPrinter (hoặc bất kỳ lớp nào khác tuân thủ Printer), chúng ta chuyển một instance của Printer vào SomeClass thông qua hàm khởi tạo. Điều này cho phép chúng ta thay đổi đối tượng Printer mà SomeClass sử dụng mà không cần thay đổi code của SomeClass, giúp tăng tính linh hoạt và dễ kiểm tra của code.

### Property (setter) Injection

#### Khái niệm

Dependency được gán vào một thuộc tính công khai. Điều này thường được sử dụng khi không thể sử dụng constructor injection (ví dụ, khi sử dụng Storyboards).

```swift
class SomeClass {
    var dependency: SomeDependency?

    func doSomething() {
        dependency?.performAction()
    }
}
```

- Ưu điểm: Đơn giản để sử dụng, đặc biệt khi không thể sử dụng constructor injection (ví dụ, khi sử dụng Storyboards).
- Nhược điểm: Không đảm bảo rằng dependency sẽ có sẵn khi cần. Điều này có thể dẫn đến lỗi runtime nếu bạn quên cung cấp dependency trước khi sử dụng nó.

#### Áp dụng

Phương pháp này thường được sử dụng khi bạn không thể sử dụng constructor injection, ví dụ khi sử dụng Storyboards trong iOS. Trong trường hợp này, bạn không thể chuyển dependencies vào qua hàm khởi tạo của View Controller, vì vậy bạn phải gán chúng vào một thuộc tính sau khi View Controller được khởi tạo.

Ví dụ code:

```swift
// Define a protocol that represents what actions a printer can do
protocol Printer {
    func printDocument(_ document: String)
}

// Implement a concrete class that conforms to the Printer protocol
class InkjetPrinter: Printer {
    func printDocument(_ document: String) {
        print("Printing document with InkjetPrinter: \(document)")
    }
}

// SomeClass depends on a Printer to do its work
class SomeClass {
    var printer: Printer?

    func performTask() {
        printer?.printDocument("Hello, world!")
    }
}

// Usage
let someObject = SomeClass()
someObject.printer = InkjetPrinter()
someObject.performTask()  // Outputs: Printing document with InkjetPrinter: Hello, world!
```

Trong ví dụ trên, SomeClass phụ thuộc vào một đối tượng tuân thủ protocol Printer. Thay vì SomeClass tạo ra một instance của InkjetPrinter (hoặc bất kỳ lớp nào khác tuân thủ Printer), chúng ta gán một instance của Printer vào SomeClass thông qua thuộc tính printer. Điều này cho phép chúng ta thay đổi đối tượng Printer mà SomeClass sử dụng mà không cần thay đổi code của SomeClass, giúp tăng tính linh hoạt và dễ kiểm tra của code.

### Method (interface) Injection

#### Khái niệm

Dependency được chuyển vào qua một phương thức. Điều này hữu ích khi chỉ một số phương thức cần sử dụng dependency, hoặc khi dependency có thể thay đổi sau mỗi lần gọi phương thức.

```swift
class SomeClass {
    func performAction(with dependency: SomeDependency) {
        dependency.performAction()
    }
}
```

- Ưu điểm: Linh hoạt, cho phép bạn cung cấp một dependency chỉ khi cần thiết. Điều này hữu ích khi dependency có thể thay đổi sau mỗi lần gọi phương thức.
- Nhược điểm: Có thể gây rối rắm nếu có quá nhiều phương thức cần cùng một dependency. Trong trường hợp đó, việc sử dụng constructor hoặc property injection có thể tốt hơn.

#### Áp dụng

Phương pháp này hữu ích khi chỉ một số phương thức cần sử dụng dependency, hoặc khi dependency có thể thay đổi sau mỗi lần gọi phương thức. Ví dụ, nếu bạn có một lớp ReportGenerator mà cần một ReportData để tạo ra một báo cáo, nhưng ReportData có thể thay đổi sau mỗi lần tạo báo cáo, bạn có thể chuyển ReportData vào qua phương thức tạo báo cáo thay vì qua hàm khởi tạo của ReportGenerator.

Ví dụ code:

```swift
// Define a protocol that represents what actions a printer can do
protocol Printer {
    func printDocument(_ document: String)
}

// Implement a concrete class that conforms to the Printer protocol
class InkjetPrinter: Printer {
    func printDocument(_ document: String) {
        print("Printing document with InkjetPrinter: \(document)")
    }
}

// SomeClass depends on a Printer to do its work
class SomeClass {
    func performTask(with printer: Printer) {
        printer.printDocument("Hello, world!")
    }
}

// Usage
let someObject = SomeClass()
let printer = InkjetPrinter()
someObject.performTask(with: printer)  // Outputs: Printing document with InkjetPrinter: Hello, world!
```

Trong ví dụ trên, SomeClass phụ thuộc vào một đối tượng tuân thủ protocol Printer. Thay vì SomeClass tạo ra một instance của InkjetPrinter (hoặc bất kỳ lớp nào khác tuân thủ Printer), chúng ta chuyển một instance của Printer vào SomeClass thông qua phương thức performTask(with:). Điều này cho phép chúng ta thay đổi đối tượng Printer mà SomeClass sử dụng mà không cần thay đổi code của SomeClass, giúp tăng tính linh hoạt và dễ kiểm tra của code.

### Ambient Context

Ambient Context là một mẫu thiết kế phần mềm liên quan đến Dependency Injection. Nó cho phép bạn đặt một "context" mà tất cả các đối tượng trong ứng dụng của bạn có thể truy cập. Điều này có thể hữu ích khi bạn có một số dependencies mà hầu hết các phần của ứng dụng của bạn cần truy cập.

> Tương tự với mẫu Singleton nhóe!

Dưới đây là một ví dụ về việc sử dụng Ambient Context trong Swift:

```swift
// Define a protocol that represents what actions a logger can do
protocol Logger {
    func log(_ message: String)
}

// Implement a concrete class that conforms to the Logger protocol
class ConsoleLogger: Logger {
    func log(_ message: String) {
        print("Log: \(message)")
    }
}

// Define the ambient context
struct AmbientContext {
    static var logger: Logger = ConsoleLogger()
}

// SomeClass uses the logger from the ambient context
class SomeClass {
    func performTask() {
        AmbientContext.logger.log("Performing a task")
    }
}

// Usage
let someObject = SomeClass()
someObject.performTask()  // Outputs: Log: Performing a task
```

Trong ví dụ trên, SomeClass sử dụng Logger từ AmbientContext để ghi log. Điều này cho phép chúng ta thay đổi Logger mà SomeClass sử dụng mà không cần thay đổi code của SomeClass, giúp tăng tính linh hoạt và dễ kiểm tra của code.

Tuy nhiên, Ambient Context có thể làm cho việc kiểm soát dependencies trở nên khó khăn hơn, vì vậy nó nên được sử dụng một cách cẩn thận.

## Các mẫu khác áp dụng DI

### Factory

Trong mẫu này, chúng ta tạo một "factory" hoặc lớp tạo đối tượng, mà nhiệm vụ của nó là tạo và trả về các instances của các lớp khác. Điều này cho phép chúng ta tách biệt việc tạo đối tượng ra khỏi lớp sử dụng nó, giúp tăng tính linh hoạt và dễ kiểm tra của code.

```swift
protocol Printer {
    func printDocument(_ document: String)
}

class InkjetPrinter: Printer {
    func printDocument(_ document: String) {
        print("Printing document with InkjetPrinter: \(document)")
    }
}

class PrinterFactory {
    func createPrinter() -> Printer {
        return InkjetPrinter()
    }
}

class SomeClass {
    let printer: Printer

    init(printerFactory: PrinterFactory) {
        self.printer = printerFactory.createPrinter()
    }

    func performTask() {
        printer.printDocument("Hello, world!")
    }
}
```

### Service Locator

Service Locator Pattern là một mẫu thiết kế được sử dụng trong việc quản lý và khám phá các dịch vụ (services). Nó hoạt động như một trung tâm đăng ký nơi các dịch vụ được đăng ký và sau đó có thể được tìm kiếm khi cần.

Dưới đây là một ví dụ về việc sử dụng Service Locator trong Swift:

```swift
protocol Service {}

protocol Printer: Service {
    func printDocument(_ document: String)
}

class InkjetPrinter: Printer {
    func printDocument(_ document: String) {
        print("Printing document with InkjetPrinter: \(document)")
    }
}

class ServiceLocator {
    private var services: [String: Service] = [:]

    func registerService<T: Service>(_ service: T) {
        let key = "\(T.self)"
        services[key] = service
    }

    func getService<T: Service>() -> T? {
        let key = "\(T.self)"
        return services[key] as? T
    }
}

// Usage
let serviceLocator = ServiceLocator()
serviceLocator.registerService(InkjetPrinter())

if let printer: Printer = serviceLocator.getService() {
    printer.printDocument("Hello, world!")  // Outputs: Printing document with InkjetPrinter: Hello, world!
}
```

Trong ví dụ trên, ServiceLocator được sử dụng để đăng ký và lấy các dịch vụ. InkjetPrinter được đăng ký như một dịch vụ Printer, và sau đó có thể được lấy bằng cách sử dụng getService().

Tuy nhiên, Service Locator Pattern có thể làm cho việc kiểm soát dependencies trở nên khó khăn hơn, vì vậy nó nên được sử dụng một cách cẩn thận.

### Dependency injection Container

Đây là một đối tượng đặc biệt được sử dụng để chứa và quản lý dependencies. Khi một lớp cần một dependency, nó sẽ yêu cầu từ container. Container sau đó sẽ tạo ra (hoặc trả về một instance đã tồn tại của) dependency đó.

```swift
class DependencyContainer {
    func makePrinter() -> Printer {
        return InkjetPrinter()
    }
}

class SomeClass {
    let printer: Printer

    init(container: DependencyContainer) {
        self.printer = container.makePrinter()
    }

    func performTask() {
        printer.printDocument("Hello, world!")
    }
}
```

> Đọc vừa thôi chứ loạn não cmnr à! Mình xin tạm hết & hẹn gặp lại các bạn sau nhóe!

## Tạm kết

- Khái niệm về Dependency injection
- Các mẫu thiết kế cơ bản với Dependency injection
- Các cách thực hiện Dependency injection trong code, ưu & nhược điểm của chúng
- Các thường hợp áp dụng vào thực tế tùy theo các mẫu được sử dụng

---

> _Về bản quyền của Repo và mã nguồn trong repo là hoàn toàn miễn phí cho các mục đích phi lợi nhuận và học tập. Tất cả các hành vi sao chép hay sử dụng vì mục đích thương mại thì đều là vi phạm._
