## Observable

<hr></hr>

### Observable?

- 사전적 의미 = 식별할 수 있는
- 이벤트가 **비동기적**으로 생성하는 기능
- 계속해서 이벤트를 생성하는 과정 = **Emit**
- 각각의 이벤트들은 숫자나 커스텀한 인스턴스 등과 같은 값을 가질 수 있고 탭과 같은 제스처일 수도 있음



### Oberservable의 생명주기

- **next** 이벤트를 통해 각각의 요소들을 방출
- 이벤트를 방출한 뒤 이벤트들이 다 방출되면 완전 종료 -> **completed**
- 중간에 에러 발생 -> **error**를 통해 종료



### Observable 생성

- **just** - 하나의 파라미터를 받아 하나의 이벤트를 발생 시킴

  ```swift
  let observable = Observable.just(1)
  ```

- **of** - 파라미터의 타입을 전달, 배열이라면 배열 자체를 전달하는 것

  ```swift
  let observable1= Observable.of(1, 2, 3)
  let observable2 = Observable.of([1, 2, 3])
  ```

- **from** - 배열 타입을 전달받아 배열 안에 있는 요소들을 꺼내 squence를 생성

  ```swift
  let observable = Observable.from([1, 2, 3])
  ```



### subscribe

- subscribe( )는 NotificationCenter에서 addObserver( ) 대신 사용되는 것
- NotificationCenter에서는 .default를 이용해 싱글톤을 사용했지만 Rx에서는 Observable은 subscriber가 없다면 발생한 이벤트를 전송하지 않는다

### Disposable

- subscribe()는 Disposable을 리턴함
- Observable의 사용이 끝나면 메모리를 해제해야함 -> 그때 Dispose() 사용

##### DisposeBag

- deinit( )이 실행될 때의 모든 메모리를 해제
- subscribe가 리턴하는 Disposable 인스턴스를 넣어줌

### Create

- create는 클로저를 사용해 subscribe 메서드를 쉽게 구현할 수 있게한다



<hr></hr>

### Hot Observable

- 생성과 동시에 이벤트를 방출하기 시작
- 이후 subscribe 되는 시점과 상관없이 옵저버들에게 이벤트를 중간부터 전송해줌
- 여러 Observer가 하나의 Observable을 공유 가능
- ex) (이벤트 방출 시작) 1 2 3 4 (구독 시작) 5 6 7 -> 1 2 3 4의 이벤트는 받지 못함
- Operator
  - publish
    - Observable을 ConnectableObservable로 변환
  - replay
    - Observable을 ConnectableObservable로 변환
    - 구독을 시작하면 발생했던 아이템을 처음부터 전부 반환

### Cold Observable

- 옵저버가 subscribe 되는 시점부터 이벤트를 생성하여 방출하기 시작
- Hot Observable로 생성하지 않은 것들은 Cold Observable
- Observer마다 별도의 Observable 인스턴스를 가짐
- ex) (구독시작, 이벤트 방출 시작) 1 2 3 4 5 -> 구독 시작 시 이벤트가 오기 시작해서 처음부터 모든 데이터를 받을 수 있음



