## CountRx

```swift

plusButton.rx.tap.asObservable().subscribe { [weak self] event in

    guard let `self` = self else {

        return
    }
    self.number += 1
    self.label.text = "\(self.number)"
}.disposed(by: disposeBag)
```
