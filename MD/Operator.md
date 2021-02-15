## Operator

### Operator란?

- Observable에 의해 방출되는 이벤트를 변환하고 처리할 수 있음

<hr></hr>

### Create Operator

- Just

  - 하나의 이벤트를 방출하는 Observable을 생성하는데 이용

  ```swift
  let disposeBag = DisposeBag()
  
  Observable.just("Hello")
      .subscribe(onNext: { print($0)})
      .disposed(by: disposeBag)
  ```

  - Just 연산자는 두 개의 종류가 제공됨
    - 방출할 이벤트만 전달하여 생성
    - 방출할 어느 이벤트와 어느 스케줄러로 전송할 지에 대한 스케줄러를 함께 전달하여 생성

- of

  - 가변할 수 있는 개수만큼의 요소를 방출하기 위한 Observable을 생성하기 위한 연산자
  - 방출하고자 하는 이벤트의 개수가 1~N개인 경우에 사용 가능

  ```swift
  let disposeBag = DisposeBag()
  
  let dog = "dog"
  let cat = "cat"
  let tiger = "tiger"
  
  Observable.of(dog, cat, tiger)
      .subscribe(onNext: { print($0, terminator: " ")})
      .disposed(by: disposeBag)
  ```

- from

  - 배열 형태의 element를 전달받아 내부 요소를 순차적으로 방출하는 Observable 생성

  ```swift
  let disposeBag = DisposeBag()
  
  let arr = ["dog", "cat", "tiger"]
  
  Observable.from(arr)
      .subscribe(onNext: { print($0)})
      .disposed(by: disposeBag)
  ```

<hr></hr>

### Filtering Operator

- filter

  - 조건식에 부합하는 이벤트만 방출
  - 요소들을 필터링 하기 위한 기준 predicate를 클로저로 받아서 해당 결과를 true 값으로 반환하는 이벤트 방출

  ```swift
  let disposeBag = DisposeBag()
  
  let arr = [1,2,3,4,5]
  
  //짝수 출력
  Observable.from(arr)
      .filter{ $0 % 2 == 0}
      .subscribe(onNext: { print($0)})
      .disposed(by: disposeBag)
  ```

- take

  - 정수값을 파라미터로 전달 받음
  - 해당 숫자만큼의 요소만 방출

  ```swift
  let disposeBag = DisposeBag()
  
  let arr = [1,2,3,4,5]
  
  //앞에서부터 3개
  Observable.from(arr)
      .take(3)
      .subscribe(onNext: { print($0)})
      .disposed(by: disposeBag)
  ```

<hr></hr>

### Transforming

- map

  - 고차함수 map과 동일한 기능
  - Observable을 리턴함

  ```swift
  let disposeBag = DisposeBag()
  
  let arr = ["dog", "cat", "tiger"]
  
  Observable.from(arr)
      .map { "Hello, \($0)"}
      .subscribe(onNext: { print($0)})
      .disposed(by: disposeBag)
  ```

<hr></hr>

### Combining

- CombineLatest

  ![img](https://t1.daumcdn.net/cfile/tistory/99361F4A5B47841627)

  - 두개의 시퀀스가 CombineLatest를 만나 하나의 시퀀스가 됨
  - 이 합쳐진 시퀀스는 서브 시퀀스(left, right)에서 이벤트가 발생할 때마다 이벤트 발생
  - 합쳐진 시퀀스는 두 서브 시퀀스의 element를 조합하여 새로운 element 전달

  ```swift
  let disposeBag = DisposeBag()
  
  let platforms = PublishSubject<String>()
  let languages = PublishSubject<String>()
  
  Observable.combineLatest(platforms, languages) { "Hi \($0 + " " + $1)"}
      .subscribe(onNext: { print($0)})
      .disposed(by: disposeBag)
  
  platforms.onNext("ios")
  languages.onNext("Swift")
  ```

