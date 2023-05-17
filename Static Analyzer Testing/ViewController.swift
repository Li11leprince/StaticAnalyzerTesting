//
//  ViewController.swift
//  Static Analyzer Testing
//
//  Created by Effective on 15.05.2023.
//

import UIKit

protocol Prot{
    func prot()
}

class ViewController: UIViewController {
    
    //неинициализированная константа
    let v: UIView
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = zero()
        _ = noReturn()
    }
    
    //Неправильно используем опционал
    var numbers: [Int]?
    
    func usingOptional() {
        print(numbers)
    }

    //неиспользуемая переменная
    var a = 20
    
    //утечка памяти
    class Person {
        var room: Room?
    }

    class Room {
        var person: Person?
    }
    
    var per = Person()
    var room = Room()

    func f() {
        per.room = room
        room.person = per
    }
    
    //бесконечный цикл
    func loop() {
        while true {
            var i = 0
            i += 1
        }
        //неиспользуемая переменная
        var a = 10
    }
    
    //обращение к нулевому указателю
    func nullPointer() {
        let buf: [Int] = [0, 1]
        print(buf[3])
    }
    
    //утечка памяти в замыкании
    class Singer {
        func playSong() {
            print("Shake it off!")
        }
    }
    
    func sing() -> () -> Void {
        let taylor = Singer()

        let singing = {
            taylor.playSong()
            return
        }

        return singing
    }
    
    lazy var singFunction = sing()
    
    //не конформим протокол
    class forProtocol: Prot{
        
    }
    
    //не возвращаем значение
    func noReturn() -> Int {
        let a = 3
        let b = 4
        _ = a + b
    }
    
    //недостижимый код и неизменяемые переменные
    func unreach() {
        var a = 3
        let b = 4
        let bo = true
        if bo {
            _ = a + b
        } else {
            _ = a - b
        }
    }
    
    //неинициализировання переменная
    func foo() {
        let x
        let y = x + 2
    }
    
    //деление на ноль
    func zero() -> Int {
        let x = 0
        let y = 10
        return y / x
    }
    
    //ложно-положительное срабатывание
    func falsePositive() -> Int {
        var x = 0
        let y = 10
        for _ in 1...10 {
            x += 1
        }
        return y / x
    }

}

//объявляем константу в extension
extension ViewController {
    let a = 3
}




