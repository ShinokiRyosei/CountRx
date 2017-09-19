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

```swift
plusButton.rx.tap.asObservable().map ({ [weak self] _ -> Int in

    guard let `self` = self else {

        return 0
    }
    self.number = self.number + 1
    return self.number
})
    .map({ String($0) })
    .bind(to: label.rx.text)
    .disposed(by: disposeBag)
```
