//
//  Observable.swift
//  Tabling
//
//  Created by Jihee hwang on 2023/01/05.
//

import Foundation

final class Observable<T> {
    typealias EventHandler = (T) -> Void

    struct Observer {
        weak var observer: AnyObject?
        var handler: EventHandler
    }

    private var observers = [Observer]()

    var value: T {
        didSet {
            notifyObservers()
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func observe(on observer: AnyObject, with eventHandler: @escaping EventHandler) {
        observers.append(Observer(observer: observer, handler: eventHandler))
        eventHandler(value)
    }

    func remove(observer: AnyObject) {
        observers = observers.filter { $0.observer !== observer }
    }

    func notifyObservers() {
        observers.forEach { observer in
            DispatchQueue.main.async { observer.handler(self.value) }
        }
    }
}
