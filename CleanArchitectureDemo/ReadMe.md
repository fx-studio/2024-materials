# Clean Architecture

> *Tham khảo bài viết đầy đủ trên [Fx Studio](https://fxstudio.dev/clean-architecture-trong-ios/). Cảm ơn!*

## Khái niệm

Clean Architecture là một mô hình thiết kế phần mềm được đề xuất bởi Robert C. Martin (còn được gọi là Uncle Bob). Mô hình này nhằm tạo ra một hệ thống phần mềm có khả năng duy trì và mở rộng dễ dàng.

Mô hình này phân tách phần mềm thành các lớp với các trách nhiệm rõ ràng, giúp giảm sự phụ thuộc giữa các thành phần và tăng khả năng thử nghiệm và tái sử dụng. Trong Clean Architecture, các lớp ở mức độ cao hơn (chứa logic nghiệp vụ cốt lõi) không phụ thuộc vào các lớp ở mức độ thấp hơn (chứa chi tiết cụ thể về cơ sở dữ liệu, giao diện người dùng, v.v.). Thay vào đó, các lớp ở mức độ thấp hơn phụ thuộc vào các giao diện được định nghĩa bởi các lớp ở mức độ cao hơn, theo nguyên tắc phụ thuộc đảo ngược.

## Nguyên tắc cơ bản

### Nguyên tắc

Các nguyên tắc cốt lõi của Kiến trúc sạch (Clean Architecture) theo cách diễn giải của Robert C. Martin. Các nguyên tắc này bao gồm:

1. **Độc lập với Khung công việc (Independence from Frameworks)**: Kiến trúc không nên bị ràng buộc bởi các khung công việc cụ thể. Điều này cho phép hệ thống dễ dàng thay đổi và không bị phụ thuộc vào một khung công việc cụ thể.

2. **Có thể kiểm tra (Testability)**: Hệ thống nên được thiết kế để dễ dàng kiểm tra, không phụ thuộc vào UI, cơ sở dữ liệu, web server, hoặc bất kỳ thành phần bên ngoài nào khác.

3. **Độc lập với Giao diện người dùng (UI Independence)**: Giao diện người dùng nên có thể thay đổi mà không ảnh hưởng đến phần còn lại của hệ thống.

4. **Độc lập với Cơ sở dữ liệu (Database Independence)**: Hệ thống không nên phụ thuộc vào một cơ sở dữ liệu cụ thể. Điều này cho phép dễ dàng thay đổi cơ sở dữ liệu nếu cần.

5. **Độc lập với bất kỳ cơ quan bên ngoài nào (Independence from any external agency)**: Các quy tắc kinh doanh cốt lõi của hệ thống không nên biết hoặc phụ thuộc vào bất kỳ chi tiết cụ thể nào về thế giới bên ngoài.

### Quy tắc cần tuân thủ

Việc thực hiện Clean Architecture tuân theo một số nguyên tắc thêm như sau:

1. **Nguyên tắc phụ thuộc đảo ngược (The Dependency Rule)**: Các lớp ngoài cùng phụ thuộc vào các lớp bên trong, nhưng không ngược lại. Điều này có nghĩa là các chi tiết cụ thể (như cơ sở dữ liệu, giao diện người dùng) phụ thuộc vào các quy tắc kinh doanh cốt lõi, nhưng các quy tắc kinh doanh cốt lõi không phụ thuộc vào các chi tiết cụ thể.
2. **Nguyên tắc phân tách quan tâm (Separation of Concerns)**: Mỗi lớp trong Clean Architecture có một trách nhiệm rõ ràng. Điều này giúp giữ cho code dễ bảo dưỡng và mở rộng.
3. **Nguyên tắc không lặp lại (DRY - Don't Repeat Yourself)**: Mỗi phần thông tin nên được biểu diễn trong hệ thống một cách đơn nhất, không có sự trùng lặp.
4. **Nguyên tắc YAGNI (You Aren't Gonna Need It)**: Tránh việc thêm vào các tính năng, lớp, phương thức, v.v. cho đến khi bạn thực sự cần chúng. Điều này giúp giữ cho hệ thống đơn giản và dễ quản lý.
5. **Nguyên tắc SOLID**: Đây là một tập hợp các nguyên tắc thiết kế hướng đối tượng, bao gồm: Nguyên tắc đơn trách nhiệm (Single Responsibility Principle), Nguyên tắc mở/đóng (Open/Closed Principle), Nguyên tắc Liskov Substitution, Nguyên tắc Segregation Interface, và Nguyên tắc Dependency Inversion.

## Thành phần cơ bản

![img1](https://fxstudio.dev/wp-content/uploads/2024/03/clean_03-768x553.png)

Mô hình Clean Architecture bao gồm bốn thành phần (hay lớp, layer) chính:

1. **Entities**: Đây là các đối tượng cốt lõi của hệ thống, chúng chứa các quy tắc kinh doanh cốt lõi. Entities có thể là những thực thể trong thế giới thực mà hệ thống cần phản ánh (như "Sản phẩm", "Người dùng", v.v.).

2. **Use Cases**: Đây là lớp chứa các quy tắc kinh doanh cụ thể cho một hệ thống. Mỗi use case đại diện cho một hành động cụ thể mà hệ thống có thể thực hiện. Use cases phụ thuộc vào entities nhưng không phụ thuộc vào các lớp bên ngoài như giao diện người dùng, cơ sở dữ liệu, v.v.

3. **Interface Adapters**: Lớp này chứa code để chuyển đổi dữ liệu từ các định dạng mà use cases và entities có thể làm việc với những định dạng mà các Frameworks and Drivers (như cơ sở dữ liệu, web server) có thể hiểu và ngược lại. Như là: cơ sở dữ liệu, web, UI, v.v.

4. **Frameworks and Drivers**: Đây là lớp ngoài cùng và chứa các chi tiết cụ thể như cơ sở dữ liệu, web server, UI, v.v. Code trong lớp này nên ít nhất có thể và chỉ bao gồm những thứ cần thiết để chạy ứng dụng của bạn.

## Vai trò của các thành phần

Vai trò của 4 thành phần chính trong mô hình Clean Architecture.

### Entities

Trong Kiến trúc sạch (Clean Architecture), **Entities** đóng một vai trò rất quan trọng:

Entities là các đối tượng cốt lõi của hệ thống và chúng chứa các quy tắc kinh doanh cốt lõi. Đây là những đối tượng mà hệ thống được xây dựng để hỗ trợ và làm việc với.

Entities thường đại diện cho những thực thể nghiệp vụ quan trọng, như "User", "Order", "Product", v.v. Chúng chứa các thuộc tính và phương thức liên quan đến thực thể đó.

Entities được thiết kế để độc lập với các chi tiết cụ thể về cơ sở dữ liệu, giao diện người dùng, hoặc bất kỳ khung công việc nào. Điều này có nghĩa là chúng không biết hoặc quan tâm đến cách chúng được lưu trữ, hiển thị hoặc được sử dụng trong bất kỳ khung công việc nào.

Vai trò chính của Entities là chứa và bảo vệ các quy tắc kinh doanh cốt lõi, đảm bảo rằng chúng được tuân thủ trong suốt quá trình hoạt động của hệ thống.

### Use Cases

Trong Kiến trúc sạch (Clean Architecture), **Use Cases** đóng vai trò quan trọng như sau:

Use Cases đại diện cho các hoạt động cụ thể mà hệ thống của bạn cần thực hiện để đáp ứng yêu cầu của người dùng hoặc các hệ thống khác. Mỗi Use Case chứa một tập hợp các quy tắc kinh doanh cụ thể mà hệ thống phải tuân theo khi thực hiện hoạt động đó.

Use Cases tương tác trực tiếp với Entities để thực hiện các quy tắc kinh doanh. Chúng nhận dữ liệu đầu vào, xử lý dữ liệu đó theo các quy tắc kinh doanh cụ thể, và sau đó tạo ra kết quả.

Use Cases cũng được thiết kế để độc lập với các chi tiết cụ thể về cơ sở dữ liệu, giao diện người dùng, hoặc bất kỳ khung công việc nào. Điều này có nghĩa là chúng không biết hoặc quan tâm đến cách chúng được lưu trữ, hiển thị hoặc được sử dụng trong bất kỳ khung công việc nào.

Vai trò chính của Use Cases là định rõ và thực hiện các quy tắc kinh doanh cụ thể của hệ thống, đảm bảo rằng mọi hoạt động đều tuân theo những quy tắc này.

### Interface Adapters

Trong Kiến trúc sạch (Clean Architecture), **Interface Adapters** đóng vai trò như sau:

Interface Adapters chịu trách nhiệm chuyển đổi dữ liệu từ định dạng mà lớp bên trong (Entities và Use Cases) có thể làm việc với, sang định dạng phù hợp với các thành phần bên ngoài như cơ sở dữ liệu, giao diện người dùng, hoặc các hệ thống bên ngoài khác.

Ví dụ, một Interface Adapter có thể chuyển đổi dữ liệu từ một Entity thành định dạng JSON để gửi qua mạng, hoặc từ định dạng SQL được trả về từ một cơ sở dữ liệu thành đối tượng Entity mà Use Case có thể làm việc với.

Interface Adapters cũng có thể bao gồm các adapter cụ thể cho các khung công việc hoặc thư viện, cho phép Use Cases và Entities sử dụng chúng mà không cần biết chi tiết cụ thể về cách chúng hoạt động.

Vai trò chính của Interface Adapters là "dịch" dữ liệu giữa các lớp bên trong và bên ngoài, cho phép chúng hoạt động một cách độc lập với nhau.

### Frameworks and Drivers

Trong Kiến trúc sạch (Clean Architecture), **Frameworks and Drivers** đóng vai trò như sau:

Frameworks and Drivers là lớp ngoài cùng của kiến trúc và chứa các chi tiết cụ thể về việc sử dụng một cơ sở dữ liệu cụ thể, việc hiển thị trên một giao diện người dùng cụ thể, hoặc việc giao tiếp với các hệ thống bên ngoài.

Frameworks là các thư viện hoặc khung công việc mà bạn sử dụng để xây dựng ứng dụng của mình. Chúng có thể bao gồm các thư viện để xây dựng giao diện người dùng, thao tác với cơ sở dữ liệu, giao tiếp qua mạng, v.v.

Drivers là các thành phần mà điều khiển cách thức hoạt động của ứng dụng, như web server, cơ sở dữ liệu, hoặc thậm chí là chính ứng dụng của bạn.

Vai trò chính của Frameworks and Drivers là cung cấp các chi tiết cụ thể về cách thức hoạt động của hệ thống và làm "điểm kết nối" giữa hệ thống của bạn và thế giới bên ngoài. Chúng cho phép hệ thống của bạn tương tác với môi trường xung quanh mà không ảnh hưởng đến các lớp bên trong của kiến trúc.

### Các thành phần nhỏ hơn trong Interface Adapters

#### Gateway**, **Controllers và Presenters

Trong Kiến trúc sạch (Clean Architecture), các thành phần như **Gateway**, **Controllers** và **Presenters** đóng các vai trò sau:

1. **Gateways**: Gateways đại diện cho các cổng giao tiếp với các hệ thống bên ngoài như cơ sở dữ liệu hoặc các dịch vụ web. Chúng thực hiện các chi tiết cụ thể về việc truy cập và lưu trữ dữ liệu. Gateways thường được định nghĩa bởi một interface được sử dụng bởi Use Cases và được triển khai bởi lớp Adapter.
2. **Controllers**: Controllers là một phần của lớp Adapter. Chúng nhận các yêu cầu từ giao diện người dùng (hoặc bất kỳ hệ thống bên ngoài nào khác), chuyển đổi yêu cầu đó thành một dạng mà Use Case có thể hiểu và sau đó gọi Use Case thích hợp.
3. **Presenters**: Presenters cũng là một phần của lớp Adapter. Sau khi Use Case xử lý xong yêu cầu, nó sẽ trả về kết quả cho Presenter. Presenter sau đó chuyển đổi kết quả từ dạng mà Use Case trả về, thành dạng mà giao diện người dùng (hoặc hệ thống bên ngoài) có thể hiểu và hiển thị.

Như vậy, Gateways, Controllers và Presenters đều là một phần của lớp Adapter trong Clean Architecture, đóng vai trò như những "dịch giả" giữa các lớp bên trong (Entities và Use Cases) và các lớp bên ngoài (Frameworks and Drivers).

#### Router

Trong mô hình Clean Architecture, Router (còn được gọi là Presenter trong một số biến thể) đóng một vai trò quan trọng trong việc điều hướng giữa các màn hình hoặc các phần khác nhau của ứng dụng.

1. **Điều hướng giữa các màn hình**: Router chịu trách nhiệm cho việc quyết định màn hình nào sẽ được hiển thị tiếp theo dựa trên các sự kiện hoặc hành động của người dùng. Ví dụ, khi người dùng nhấp vào một mục trong danh sách, Router có thể quyết định màn hình chi tiết sẽ được hiển thị tiếp theo.
2. **Chuyển đổi dữ liệu**: Router cũng có thể chịu trách nhiệm cho việc chuyển đổi dữ liệu từ mô hình sang định dạng mà View có thể hiển thị. Điều này đôi khi được gọi là "mapping" dữ liệu.
3. **Xử lý sự kiện**: Trong một số trường hợp, Router cũng có thể chịu trách nhiệm xử lý các sự kiện từ View, như các hành động của người dùng, và chuyển chúng thành các yêu cầu hợp lệ đến Use Cases hoặc Interactors.

Tóm lại, Router đóng vai trò là một cầu nối giữa các thành phần khác nhau trong Clean Architecture, giúp điều hướng, chuyển đổi dữ liệu và xử lý sự kiện.

> Luyện tập thử xem nào!

## Luyện tập

Dưới đây là một ví dụ về cách bạn có thể áp dụng Clean Architecture trong một ứng dụng Swift. Chúng ta sẽ tạo một ứng dụng đơn giản để lấy danh sách người dùng từ một API.

### Enity

Định nghĩa một struct User để đại diện cho một người dùng.

```swift
struct User {
    let id: Int
    let name: String
    let email: String
}
```

### Use Case

Định nghĩa một protocol GetUsersUseCase để lấy danh sách người dùng.

```swift
protocol GetUsersUseCase {
    func execute(completion: @escaping (Result<[User], Error>) -> Void)
}
```

Ta có thể triển khai một Use Case thành một lớp để thực hiện việc sử lý nghiệp vụ. Lúc này, Use Case có thể sử dụng 1 hoặc nhiều repository phục vụ cho việc xử lý nghiệp vụ đó. Ví dụ code với protocol trên khi triển khai.

```swift
class GetUsersUseCaseImplementation: GetUsersUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func execute(completion: @escaping (Result<[User], Error>) -> Void) {
        userRepository.getUsers { result in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
```

Trong ví dụ trên, ta giả sử đã có một lớp `UserRepository` trước đó rồi. Lớp đó sẽ thực hiện việc tương tác với API hay Database để lấy dữ liệu.

### Repository

Bạn sẽ bắt gặp khái niệm này khá nhiều từ nhiều bài viết về Clean Architecture. Mình sẽ tạo thêm ví dụ về Repository để bạn có cái nhìn quen thuộc hơn mà thôi. Chứ đúng về bản chất thì chúng ta phải quy về một mối là Gateway, vì ta cần xử lý phụ thuộc từ nhiều nguồn dữ liệu khác nhau.

Về ví dụ trên, ta sẽ cần tạo ra một protocol `UserRepository`. Và từ đó, ta triển khai các lớp cụ thể với protocol đó. Mục đích chính vẫn là để áp dụng Dependency Injection cho các lớp thuộc các thành phần khác. Ví dụ code như sau:

```swift
protocol UserRepository {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
    func getUser(id: Int, completion: @escaping (Result<User, Error>) -> Void)
}


class UserRepositoryImplementation: UserRepository {

    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        // Giả lập việc lấy dữ liệu từ cơ sở dữ liệu hoặc API
        let users = [User(id: 1, name: "User 1", email: "user1@mail.com"),
                     User(id: 2, name: "User 2", email: "user1@mail.com")]
        completion(.success(users))
    }

    func getUser(id: Int, completion: @escaping (Result<User, Error>) -> Void) {
        // Giả lập việc lấy dữ liệu từ cơ sở dữ liệu hoặc API
        let user = User(id: id, name: "User \(id)", email: "user_xx@mail.com")
        completion(.success(user))
    }
}
```

Trong đó, ta có 2 function `getUsers` & `getUser` để thực hiện việc lấy dữ liệu với 2 mục đích khác nhau. Bạn có thể liên tưởng tới việc gọi 2 API khác nhau.

### Gateway

Trong ví dụ trên, `UserRepository` đóng vai trò như một **Gateway** vì nó tương tác trực tiếp với `APIClient` để lấy dữ liệu từ API.

Dưới đây là một ví dụ về cách bạn có thể sử dụng một **Gateway** để lấy dữ liệu từ nhiều nguồn trong Swift. Trong ví dụ này, chúng ta sẽ mở rộng `UserRepository` để lấy dữ liệu từ cả một API và một cơ sở dữ liệu cục bộ.

Đầu tiên, chúng ta định nghĩa một protocol `UserDataSource` để đại diện cho một nguồn dữ liệu người dùng:

```swift
protocol UserDataSource {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void)
}
```

Tiếp theo, chúng ta tạo hai lớp thực thi `UserDataSource`: một để lấy dữ liệu từ API và một để lấy dữ liệu từ cơ sở dữ liệu cục bộ:

```swift
class APIClient: UserDataSource {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        // Call API and parse the response into User objects
    }
}

class LocalDatabase: UserDataSource {
    func getUsers(completion: @escaping (Result<[User], Error>) -> Void) {
        // Fetch users from local database
    }
}
```

> Đây chính là phần **Framework & Driver**

Cuối cùng, chúng ta cập nhật `UserRepository` để nó sử dụng cả hai nguồn dữ liệu. Nó sẽ thử lấy dữ liệu từ API trước, và nếu không thành công, nó sẽ lấy dữ liệu từ cơ sở dữ liệu cục bộ:

```swift
class UserRepository: GetUsersUseCase {
    private let apiClient: UserDataSource
    private let localDatabase: UserDataSource

    init(apiClient: UserDataSource, localDatabase: UserDataSource) {
        self.apiClient = apiClient
        self.localDatabase = localDatabase
    }

    func execute(completion: @escaping (Result<[User], Error>) -> Void) {
        apiClient.getUsers { result in
            switch result {
            case .success(let users):
                completion(.success(users))
            case .failure:
                self.localDatabase.getUsers(completion: completion)
            }
        }
    }
}
```

Trong ví dụ này, `UserRepository` đóng vai trò như một **Gateway**. Nó tương tác với hai nguồn dữ liệu khác nhau (`APIClient` và `LocalDatabase`) để lấy dữ liệu người dùng.

> Đây là một cách triển khai khác, khi bạn tập trung vào Gateway (Repository) đóng vai trò triển khai một logic nghiệp vụ. Gateway có thêm nhiệm vụ triển khai Use Case.

### Controller

Trước tiên, bạn cần tạo một Presenter cơ bản như sau. để thực hiện xử lý dữ liệu hiển thị danh sách Users và hiển thị lỗi.

```swift
protocol UsersPresenter {
    func presentUsers(_ users: [User])
    func presentError(_ error: Error)
}

class UsersPresenterImpl: UsersPresenter {
    weak var viewController: UsersController?

    func presentUsers(_ users: [User]) {
        // Update UI with users
    }

    func presentError(_ error: Error) {
        // Show error
    }
}
```

Sẽ chứa Use Case và Presenter (đây là 2 đại diện của Interface Adapter) và Controller. Lúc này, Controller đóng vai trò điều khiển các thành phần.

```swift
class UsersController: UIViewController {
    private let getUsersUseCase: GetUsersUseCase
    private let usersPresenter: UsersPresenter

    init(getUsersUseCase: GetUsersUseCase, usersPresenter: UsersPresenter) {
        self.getUsersUseCase = getUsersUseCase
        self.usersPresenter = usersPresenter
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        getUsersUseCase.execute { result in
            switch result {
            case .success(let users):
                self.usersPresenter.presentUsers(users)
            case .failure(let error):
                self.usersPresenter.presentError(error)
            }
        }
    }
}
```

Trong ví dụ này, `UserRepository` đóng vai trò như một **Gateway** và `UsersPresenterImpl` đóng vai trò như một **Presenter**. `UserRepository` được inject vào `UsersController` thông qua constructor, và `UsersPresenterImpl` cũng được inject vào `UsersController` theo cùng một cách, tuân thủ nguyên tắc Dependency Injection.

### Presenter

Nhưng trong một ứng dụng thực tế, bạn có thể muốn tách phần xử lý kết quả từ **Use Case** ra khỏi `UsersController` và đặt nó vào một **Presenter** riêng biệt. Và theo nguyên tắc Dependency Injection. Để tuân thủ nguyên tắc này, chúng ta nên tách `UsersPresenter` ra khỏi `UsersController` và inject nó vào `UsersController`. Dưới đây là cách chúng ta có thể làm điều đó:

```swift
protocol UsersView {
    func displayUsers(_ users: [User])
    func displayError(_ error: Error)
}

// Presenter
class UsersPresenter {
    private weak var view: UsersView?
    private let getUsersUseCase: GetUsersUseCase

    init(getUsersUseCase: GetUsersUseCase) {
        self.getUsersUseCase = getUsersUseCase
    }

    func setView(_ view: UsersView) {
        self.view = view
    }

    func didTapRefreshButton() {
        getUsersUseCase.execute { result in
            switch result {
            case .success(let users):
                self.view?.displayUsers(users)
            case .failure(let error):
                self.view?.displayError(error)
            }
        }
    }
}
```

Mình sẽ dụng tiếp **UsersPresenter** cho các phần triển khai dưới, liên quan tới việc xử lý thao tác người dùng & phản hồi lại giao diện.

### Request

Trong kiến trúc phần mềm, Presenter thường không xử lý tương tác của người dùng trực tiếp. Thay vào đó, nó nhận dữ liệu từ Use Cases (hoặc Interactors), chuyển đổi dữ liệu đó thành một định dạng mà View có thể hiểu và sau đó cập nhật View.

Tương tác của người dùng thường được xử lý bởi Controllers (trong kiến trúc MVC) hoặc View Models (trong kiến trúc MVVM). Khi người dùng tương tác với giao diện người dùng (như nhấp vào một nút), Controller hoặc View Model sẽ nhận sự kiện này và gọi phương thức thích hợp trên Use Case. Use Case sau đó sẽ thực hiện logic kinh doanh và trả về kết quả cho Presenter để cập nhật View.

Dưới đây là một ví dụ về cách điều này có thể hoạt động trong Swift:

```swift
class UsersController: UIViewController {
    private let getUsersUseCase: GetUsersUseCase
    private let usersPresenter: UsersPresenter

    init(getUsersUseCase: GetUsersUseCase, usersPresenter: UsersPresenter) {
        self.getUsersUseCase = getUsersUseCase
        self.usersPresenter = usersPresenter
        super.init(nibName: nil, bundle: nil)
    }

    @IBAction func didTapRefreshButton(_ sender: Any) {
        getUsersUseCase.execute { result in
            switch result {
            case .success(let users):
                self.usersPresenter.presentUsers(users)
            case .failure(let error):
                self.usersPresenter.presentError(error)
            }
        }
    }
}
```

Trong ví dụ này, `UsersController` xử lý sự kiện người dùng nhấp vào nút "Refresh" bằng cách gọi phương thức `execute` trên `getUsersUseCase`. Kết quả sau đó được truyền đến `usersPresenter` để cập nhật giao diện người dùng.

> Ví dụ trên thì ta vẫn sử dụng Controller là trung tâm điều khiển cho Use Case & Presenter. Bạn hãy bình tĩnh đọc và tránh liên hệ với ví dụ trước đó.

### Update

Để cập nhập thông tin dữ liệu nhận được từ Use Case, thì Presenter sẽ phản hồi lại View. Điều này thường được thực hiện thông qua một interface hoặc protocol mà View cung cấp. Presenter sẽ sử dụng interface này để cập nhật View mà không cần biết chi tiết cụ thể về cách View được triển khai.

Dưới đây là một ví dụ về cách điều này có thể hoạt động trong Swift:

```swift
protocol UsersView {
    func displayUsers(_ users: [User])
    func displayError(_ error: Error)
}

// Presenter
class UsersPresenter {
    private weak var view: UsersView?
    private let getUsersUseCase: GetUsersUseCase

    init(getUsersUseCase: GetUsersUseCase) {
        self.getUsersUseCase = getUsersUseCase
    }

    func setView(_ view: UsersView) {
        self.view = view
    }

    func didTapRefreshButton() {
        getUsersUseCase.execute { result in
            switch result {
            case .success(let users):
                self.view?.displayUsers(users)
            case .failure(let error):
                self.view?.displayError(error)
            }
        }
    }
}

// Controler
class UsersController: UIViewController, UsersView {
    private var usersPresenter: UsersPresenter

    init(usersPresenter: UsersPresenter) {
        self.usersPresenter = usersPresenter
        super.init(nibName: nil, bundle: nil)
        self.usersPresenter.setView(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func displayUsers(_ users: [User]) {
        // Update the UI with the users
    }

    func displayError(_ error: Error) {
        // Show an error message
    }

    @IBAction func didTapRefreshButton(_ sender: Any) {
        usersPresenter.didTapRefreshButton()
    }
}
```

Trong ví dụ này, `UsersPresenter` có một tham chiếu đến `UsersView` thông qua protocol `UsersView`. Khi `didTapRefreshButton` được gọi, `UsersPresenter` sẽ yêu cầu dữ liệu từ `getUsersUseCase`. Khi dữ liệu được trả về, `UsersPresenter` sẽ cập nhật `UsersView` thông qua các phương thức `displayUsers` hoặc `displayError` của nó.

### View #1

`UsersController` thực sự đóng cả hai vai trò là `UsersView` và `UsersController`. Nó là `UsersView` trong ngữ cảnh của MVP/MVVM ... vì nó cập nhật giao diện người dùng, và nó là `UsersController` trong ngữ cảnh của UIKit vì nó xử lý sự kiện người dùng.

Tuy nhiên, việc sử dụng một protocol như `UsersView` giúp tách biệt các vai trò này và làm cho mã nguồn dễ đọc và bảo dưỡng hơn. Nó cũng giúp việc kiểm tra đơn vị trở nên dễ dàng hơn, vì bạn có thể tạo một đối tượng giả mạo (mock) của `UsersView` để kiểm tra `UsersPresenter`.

Dưới đây là cách bạn có thể cập nhật `UsersController` để nó chỉ đóng vai trò là `UsersView`:

```swift
class UsersController: UIViewController, UsersView {
    private var usersPresenter: UsersPresenter

    init(usersPresenter: UsersPresenter) {
        self.usersPresenter = usersPresenter
        super.init(nibName: nil, bundle: nil)
        self.usersPresenter.setView(self)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func displayUsers(_ users: [User]) {
        // Update the UI with the users
    }

    func displayError(_ error: Error) {
        // Show an error message
    }

    @IBAction func didTapRefreshButton(_ sender: Any) {
        usersPresenter.didTapRefreshButton()
    }
}
```

Trong ví dụ này, `UsersController` chỉ đóng vai trò là `UsersView`. Nó nhận `UsersPresenter` thông qua hàm khởi tạo và sử dụng nó để xử lý sự kiện người dùng.

### View #2

Để tách `UsersView` ra khỏi `UsersController`, bạn có thể tạo một lớp hoặc cấu trúc riêng biệt để triển khai `UsersView`. Lớp hoặc cấu trúc này sau đó có thể được sử dụng bởi `UsersController` để cập nhật giao diện người dùng.

Dưới đây là một ví dụ về cách bạn có thể làm điều này trong Swift:

```swift
protocol UsersView {
    func displayUsers(_ users: [User])
    func displayError(_ error: Error)
}

class UsersViewImpl: UsersView {
    weak var controller: UsersController?

    func displayUsers(_ users: [User]) {
        // Update the UI with the users
        controller?.updateUsers(users)
    }

    func displayError(_ error: Error) {
        // Show an error message
        controller?.showError(error)
    }
}

class UsersController: UIViewController {
    private var usersPresenter: UsersPresenter
    private var usersView: UsersView

    init(usersPresenter: UsersPresenter, usersView: UsersView) {
        self.usersPresenter = usersPresenter
        self.usersView = usersView
        super.init(nibName: nil, bundle: nil)
        if let usersViewImpl = usersView as? UsersViewImpl {
            usersViewImpl.controller = self
        }
        self.usersPresenter.setView(usersView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateUsers(_ users: [User]) {
        // Update the UI with the users
    }

    func showError(_ error: Error) {
        // Show an error message
    }

    @IBAction func didTapRefreshButton(_ sender: Any) {
        usersPresenter.didTapRefreshButton()
    }
}
```

Trong ví dụ này, `UsersViewImpl` là một lớp mới triển khai `UsersView`. Nó có một tham chiếu yếu đến `UsersController` và sử dụng nó để cập nhật giao diện người dùng. `UsersController` sau đó sử dụng `UsersViewImpl` để cập nhật giao diện người dùng thay vì làm việc đó trực tiếp.

> Tùy thuộc vào ngữ cảnh mà bạn sẽ lựa chọn các triển khai View như thế nào là hợp lý. Vì cách thứ 2 này sẽ giảm đi sự phụ thuộc, nhưng lại tăng thêm rắc rối.

### Router

Trong mô hình Clean Architecture, Router (còn được gọi là Navigator hoặc Coordinator) chịu trách nhiệm điều hướng giữa các màn hình hoặc các phần khác nhau của ứng dụng. Router không nên chứa bất kỳ logic nghiệp vụ nào, nó chỉ đơn giản là xử lý việc chuyển đổi giữa các màn hình.

Dưới đây là một ví dụ về cách bạn có thể triển khai một Router trong Swift:

```swift
protocol UsersRouter {
    func navigateToUserDetail(user: User)
}

class UsersRouterImpl: UsersRouter {
    weak var viewController: UIViewController?

    func navigateToUserDetail(user: User) {
        let userDetailViewController = UserDetailViewController(user: user)
        viewController?.navigationController?.pushViewController(userDetailViewController, animated: true)
    }
}
```

Trong ví dụ này, `UsersRouter` là một protocol định nghĩa phương thức `navigateToUserDetail`, và `UsersRouterImpl` là một lớp triển khai protocol này. `UsersRouterImpl` sử dụng một `UIViewController` để thực hiện việc điều hướng.

Trong mô hình Clean Architecture, việc sử dụng `UsersRouter` có thể phụ thuộc vào cách bạn tổ chức mã của mình. Tuy nhiên, một cách phổ biến là sử dụng `UsersRouter` trong `Presenter`.

Khi một sự kiện người dùng xảy ra (ví dụ: người dùng nhấp vào một mục trong danh sách), `Controller` sẽ thông báo cho `Presenter`. `Presenter` sau đó sẽ xử lý sự kiện này, có thể bao gồm việc lấy dữ liệu cần thiết từ `Use Cases` hoặc `Entities`, và sau đó sử dụng `UsersRouter` để điều hướng đến màn hình tiếp theo.

Dưới đây là một ví dụ về cách `Presenter` có thể sử dụng `UsersRouter`:

```swift
class UsersPresenter {
    private let getUsersUseCase: GetUsersUseCase
    private let usersRouter: UsersRouter

    init(getUsersUseCase: GetUsersUseCase, usersRouter: UsersRouter) {
        self.getUsersUseCase = getUsersUseCase
        self.usersRouter = usersRouter
    }

    func didSelectUser(user: User) {
        usersRouter.navigateToUserDetail(user: user)
    }
}
```

Trong ví dụ này, khi `didSelectUser` được gọi, `UsersPresenter` sẽ sử dụng `UsersRouter` để điều hướng đến màn hình chi tiết người dùng.

### Dependency Config

Để sử dụng được một Controller theo như các ví dụ trên, ta có nhiều thứ cần phải khởi tạo kèm theo. Ví dụ khi bạn sử dụng `UsersViewController` như sau:

```swift
let vc = UsersViewController()
let uc = GetUsersUseCaseImplementation(userRepository: UserRepositoryImplementation())
let rt = UsersRouterImplement()
rt.viewController = vc
let pr = UsersPresenterImplementation(view: vc, getUsersUseCase: uc, router: rt)
        
vc.usersPresenter = pr
        
let navi = UINavigationController(rootViewController: vc)
```

Một số đối tượng liên quan đến `UsersViewController` được tạo:

- `vc` là một thể hiện của `UsersViewController`.
- `uc` là một thể hiện của `GetUsersUseCaseImplementation`, được khởi tạo với `UserRepositoryImplementation`. Điều này cho thấy `GetUsersUseCaseImplementation` là một đối tượng use case xử lý việc lấy người dùng, và nó sử dụng một repository để làm việc này.
- `rt` là một thể hiện của `UsersRouterImplement`, có thể chịu trách nhiệm cho việc điều hướng liên quan đến `UsersViewController`. Thuộc tính `viewController` của `rt` được đặt thành `vc`.
- `pr` là một thể hiện của `UsersPresenterImplementation`, được khởi tạo với `vc`, `uc`, và `rt`. Điều này cho thấy `UsersPresenterImplementation` là một đối tượng presenter xử lý logic cho `UsersViewController`.

Sau khi những đối tượng này được tạo, thuộc tính `usersPresenter` của `vc` được đặt thành `pr`.

Một `UINavigationController` sau đó được tạo với `vc` làm root view controller. Navigation controller này cho phép điều hướng giữa các view controller khác nhau.

Mục đích cuối cùng là có được một đối tượng `UsersViewController`. Nên để tránh việc sai sót do quá nhiều thứ cần tạo, ta sẽ tạo một function Factory. 

```swift
func createUserViewController() -> UsersViewController {
    let userRepository = UserRepositoryImplementation()
    let getUsersUseCase = GetUsersUseCaseImplementation(userRepository: userRepository)
    let router = UsersRouterImplement()
    let viewController = UsersViewController()
    let presenter = UsersPresenterImplementation(view: viewController, getUsersUseCase: getUsersUseCase, router: router)

    router.viewController = viewController
    viewController.usersPresenter = presenter

    return viewController
}
```

Để sử dụng chính `UserController` là `root` hiển thị, ta sẽ đặt function trên trong `SceneDelegate` và gọi thực thi.

```sw
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
  
        let vc = createUserViewController()
        let navi = UINavigationController(rootViewController: vc)
        
        window.rootViewController = navi
        self.window = window
        window.makeKeyAndVisible()
    }
```

### Factory

Phương thức `createUserViewController()` nên được đặt trong một lớp hoặc cấu trúc chuyên trách cho việc tạo và cấu hình các view controller. Điều này giúp tách biệt trách nhiệm của việc tạo và cấu hình view controller ra khỏi `SceneDelegate`.

Bạn có thể tạo một lớp hoặc cấu trúc mới có tên `ViewControllerFactory` hoặc `AppCoordinator` và đặt phương thức `createUserViewController()` trong đó. Dưới đây là một ví dụ:

```swift
class ViewControllerFactory {
    static func createUserViewController() -> UsersViewController {
        let userRepository = UserRepositoryImplementation()
        let getUsersUseCase = GetUsersUseCaseImplementation(userRepository: userRepository)
        let router = UsersRouterImplement()
        let viewController = UsersViewController()
        let presenter = UsersPresenterImplementation(view: viewController, getUsersUseCase: getUsersUseCase, router: router)

        router.viewController = viewController
        viewController.usersPresenter = presenter

        return viewController
    }
}
```

Sau đó, bạn có thể sử dụng phương thức này trong `SceneDelegate` như sau:

```swift
let vc = ViewControllerFactory.createUserViewController()
```

Điều này giúp giữ cho `SceneDelegate` gọn gàng và dễ đọc hơn, trong khi vẫn giữ được khả năng tạo và cấu hình `UsersViewController`.

Trong một dự án sử dụng Clean Architecture, `ViewControllerFactory` có thể được đặt trong thư mục `Factories` hoặc `Services` tại cấp độ gốc của dự án. Điều này giúp tổ chức mã nguồn một cách rõ ràng và dễ dàng tìm kiếm.

Tuy nhiên, việc tổ chức thư mục không cố định và phụ thuộc vào quy ước của từng dự án. Một số dự án có thể chọn để đặt `ViewControllerFactory` trong thư mục `Helpers` hoặc thậm chí là `Factories/ViewControllerFactories`.

Quan trọng nhất là việc tổ chức thư mục nên giúp cho việc tìm kiếm và hiểu mã nguồn dễ dàng hơn.

## Cây thư mục

```
.
├── Entities
│   └── User.swift
├── UseCases
│   ├── GetUsersUseCase.swift
│   └── GetUsersUseCaseImpl.swift
├── InterfaceAdapters
│   ├── Repositories
|   |   ├── UserRepository.swift
|   |   └── UserRepositoryImpl.swift
│   ├── Presenters
│   │   └── UserPresenter.swift
│   ├── Routers
│       └── UsersRouter.swift
|   └── Views
│       └── UsersViewImpl.swift
└── FrameworksAndDrivers
    ├── Factories
    |   └── ViewControllerFactory.swift
    ├── Database
    │   └── DatabaseImpl.swift
    └── UI
        ├── ViewController.swift
        └── Main.storyboard
```

Mỗi thành phần của ứng dụng được phân loại rõ ràng theo vai trò của nó:

- `Entities`: Chứa các đối tượng cốt lõi của ứng dụng, không phụ thuộc vào bất kỳ thành phần cụ thể nào khác.
- `UseCases`: Chứa các lớp thực hiện logic nghiệp vụ cốt lõi.
- `InterfaceAdapters`: Chứa các lớp chịu trách nhiệm chuyển đổi dữ liệu giữa các lớp nghiệp vụ và các lớp giao diện người dùng hoặc cơ sở dữ liệu.
- `FrameworksAndDrivers`: Chứa các lớp tương tác với hệ thống ngoại vi, như giao diện người dụng hoặc cơ sở dữ liệu.

Điều này giúp đảm bảo rằng mã của bạn tuân theo nguyên tắc phụ thuộc đảo ngược: các thành phần ở mức độ cao hơn (như `UseCases` và `Entities`) không phụ thuộc vào các thành phần ở mức độ thấp hơn (như `InterfaceAdapters` và `FrameworksAndDrivers`). Thay vào đó, các thành phần ở mức độ thấp hơn phụ thuộc vào các giao diện (protocols) được định nghĩa bởi các thành phần ở mức độ cao hơn.

## Khó khăn

Áp dụng mô hình Clean Architecture có thể mang lại nhiều lợi ích, nhưng cũng có thể gặp một số khó khăn:

1. **Độ phức tạp tăng lên**: Mô hình này yêu cầu phân chia rõ ràng giữa các lớp và thành phần, điều này có thể làm tăng độ phức tạp của mã nguồn, đặc biệt là trong giai đoạn ban đầu của dự án.

2. **Thời gian phát triển lâu hơn**: Do yêu cầu phân chia rõ ràng, việc phát triển có thể mất thời gian lâu hơn so với một số mô hình khác.

3. **Khó khăn trong việc quyết định phụ thuộc**: Việc xác định đúng các phụ thuộc giữa các lớp và thành phần có thể là một thách thức.

4. **Cần hiểu rõ về mô hình**: Để áp dụng mô hình này một cách hiệu quả, cả nhóm phát triển cần phải hiểu rõ về nó, điều này có thể đòi hỏi thời gian và nỗ lực đào tạo.

5. **Over-engineering**: Đối với các dự án nhỏ, việc áp dụng mô hình Clean Architecture có thể dẫn đến over-engineering, khiến cho việc phát triển trở nên phức tạp hơn cần thiết.

Nếu bạn cảm thấy rằng việc quản lý số lượng lớn các file, class và protocol trở nên quá khó khăn, có một số cách để giảm bớt sự phức tạp:

1. **Sử dụng các thư mục để tổ chức code**: Bạn có thể sắp xếp các file theo chức năng, tính năng hoặc theo lớp (models, views, controllers, etc.).
2. **Sử dụng các công cụ quản lý code**: Các công cụ như Xcode có các tính năng giúp bạn quản lý và tìm kiếm code dễ dàng hơn.
3. **Giảm bớt số lượng protocol**: Nếu một protocol chỉ được sử dụng bởi một class, hãy xem xét việc hợp nhất chúng.
4. **Sử dụng các mẫu thiết kế**: Các mẫu thiết kế như Factory, Singleton, hoặc Dependency Injection có thể giúp giảm bớt sự phức tạp khi khởi tạo và quản lý các đối tượng.

Tuy nhiên, lợi ích mà Clean Architecture mang lại thường xứng đáng với những khó khăn này, đặc biệt là đối với các dự án lớn và phức tạp.

## Một số lưu ý

- Use Cases chính là Interactor. Và Có thể được triển khai bởi 1 hoặc nhiều repository
- Gateway là repository.
- Use Cases vs. Gateway
  - Use Case thực hiện business logic
  - Gateway tương tác với các nguồn cung cấp dữ liệu
- Presenter chịu trách nhiệm chuyển đổi dữ liệu từ định dạng sử dụng trong Use Cases và Entities thành định dạng phù hợp cho View.
- Gateway và Presenter đều là Interface Adapter
  - Gateway tập trung vào dữ liệu
  - Presenter tập trung vào điều khiển
  - Cả 2 có thể ngang cấp hoặc Presenter có thể chứa Gateway (Repository)
- .v.v.

> Đó là vài điều lưu ý để tránh nhầm lẫn cơ bản khi bạn bạn đọc nhiều bài viết về mô hình Clean Architecture.

## Tạm kết

Clean Architecture là một mô hình thiết kế phần mềm được đề xuất bởi Robert C. Martin (còn được gọi là Uncle Bob). Nó không chỉ là một mô hình thiết kế, mà còn là một triết lý thiết kế với mục tiêu tạo ra một hệ thống phần mềm có khả năng duy trì và mở rộng dễ dàng.

Có nhiều cách để tổ chức các thành phần trong mô hình Clean Architecture, và cách tổ chức cụ thể có thể phụ thuộc vào yêu cầu và ngữ cảnh cụ thể của dự án phần mềm của bạn.

Một số nguồn tham khảo tốt về cách tổ chức Clean Architecture bao gồm:

1. **Clean Architecture: A Craftsman's Guide to Software Structure and Design** - Cuốn sách này được viết bởi Robert C. Martin, người đã đề xuất mô hình Clean Architecture. Nó cung cấp một cái nhìn sâu sắc về cách tổ chức và thiết kế phần mềm theo mô hình này.
2. **The Clean Architecture** - Bài viết trên blog của Robert C. Martin cung cấp một cái nhìn tổng quan về Clean Architecture và cách nó có thể được tổ chức.
3. **Implementing Clean Architecture - Case Study** - Video này cung cấp một ví dụ thực tế về cách áp dụng Clean Architecture trong một dự án phần mềm.
4. **Clean Architecture Solution Template** - Một mẫu giải pháp trên GitHub cho việc triển khai Clean Architecture trong .NET Core.

Hãy nhớ rằng, mục tiêu chính của Clean Architecture là tạo ra một hệ thống phần mềm dễ bảo dưỡng, dễ mở rộng, và dễ kiểm tra. Cách cụ thể để đạt được mục tiêu này có thể khác nhau tùy thuộc vào yêu cầu cụ thể của dự án của bạn.

---

Cảm ơn bạn đã đọc!
