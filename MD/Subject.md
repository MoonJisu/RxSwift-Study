## Subject

- observable과 observer의 역할을 모두 할 수 있음
- Subject는 Observable Type 프로토콜을 채택하고 있는 Observable 상속
- ObserverTpye 프로토콜 채택
- 데이터를 넣어줄 수 있고 subscribe 할 수도 있음

### 종류

1. PublishSubject
   - 빈상태로 시작
   - 새로운 elements만 subscribers에게 emit
   - Oberservable이 오류 때문에 종료되면 PublishSubject는 아무런 항목도 배출 하지 않고 Observable에서 발생한 오류 그대로 전달
   
2. BehaviorSubject
   - 초기값을 가지고 시작한다
   - 그 초기값을 방출하거나 가장 새로운 최신 값을 subscriber에게 방출
   - Observable이 오류 때문에 종료되면 BehaviorSubject는 아무런 항목도 배출 하지 않고 Observable에서 발생한 오류 그대로 전달
   
3. ReplaySubject
   - Buffer size로 시작
   - 그 사이즈까지 버퍼의 원소들을 유지하며 그것들을 새로운 subscriber에게  방출
   - Observable이 오류 때문에 종료되면 ReplaySubject는 아무런 항목도 배출 하지 않고 Observable에서 발생한 오류 그대로 전달 -> 기존 구독자들에게만
   - subject.onError후에 새로 구독한 구독자들에게는 버퍼에 있는 값들 + error를 전달
   
4. AsyncSubject

   - Subject가 completed 되면 가장 마지막 데이터를 그때서야 새로운 subscriber에게 넘겨줌

   - Observable이 오류로 인해 종료될 경우 AsyncSubject는 아무 항목도 배출하지 않고 발생한 오류를 그대로 전달

     

 