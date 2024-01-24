//
//  ViewController.swift
//  SeSSAC_POP_OOP
//
//  Created by 강창현 on 1/24/24.
//

import UIKit

final class DataManager {
    func save(data text: String?, completionHandler: (_ isSucceed: Bool) -> Void) {
        completionHandler(true)
    }
}

protocol MainViewDelegate: AnyObject {
    func mainViewSaveButtonTouched(_ view: MainView, text: String?)
}

final class MainView: UIView {
    @IBOutlet private weak var inputField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    weak var delegate: MainViewDelegate?
    
    func changeResultLabelText(_ text: String?) {
        resultLabel.text = text
    }
    
    @IBAction private func touchUpSaveButton(_ sender: UIButton) {
        delegate?.mainViewSaveButtonTouched(self, text: inputField.text)
    }
}

final class ViewController: UIViewController, MainViewDelegate {
    private let dataManager: DataManager = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let view = view as? MainView else { return }
        view.delegate = self
    }

    func mainViewSaveButtonTouched(_ view: MainView, text: String?) {
        dataManager.save(data: text) { _ in
            view.changeResultLabelText("성공했습니다.")
        }
    }
}

/*
 객체지향 생활 체조 원칙
 1. 한 메서드에 오직 한 단계의 들여쓰기만 합니다
 2. else 표현을 사용하지 않습니다 / switch-case 포함
 3. 모든 원시 값과 문자열을 포장합니다
 4. 한 줄에 점을 하나만 사용합니다 / 디미터 법칙 / 예외: DTO
 5. 이름을 줄여 쓰지 않습니다(축약 금지).
 6. 모든 엔티티를 작게 유지합니다
 7. 3개 이상의 스위프트 기본 데이터타입(Int, String, Double 등) 프로퍼티를 가진 타입을 구현하지 않습니다
 8. 일급 콜렉션을 사용합니다
 9. getter/setter를 구현하지 않습니다 / 캡슐화, 은닉화를 잘하자 / 예외: DTO
 */

// 2. else 표현을 사용하지 않습니다 / switch-case 포함
enum Discount {
    case none, vip, coupon
    var strategy: DiscountStrategy {
        switch self {
        case .none:
            return NoDiscountStrategy()
        case .vip:
            return VIPDiscountStrategy()
        case .coupon:
            return CouponDiscountStrategy()
        }
    }
}

protocol DiscountStrategy {
    func discountedPrice(of price: Double) -> Double
}

struct NoDiscountStrategy: DiscountStrategy {
    func discountedPrice(of price: Double) -> Double {
        return price
    }
}

struct VIPDiscountStrategy: DiscountStrategy {
    func discountedPrice(of price: Double) -> Double {
        return price * 0.9
    }
}

struct CouponDiscountStrategy: DiscountStrategy {
    func discountedPrice(of price: Double) -> Double {
        return price * 0.5
    }
}

class Play {
    func bill(with discount: Discount) {
        let price: Double = 1000
        let discountedPrice: Double = discount.strategy.discountedPrice(of: price)
        
        // 결제 진행...
        
    }
}

// 3. 모든 원시 값과 문자열을 포장합니다
//var age: Int = 30
var name: String = "홍길동"

struct Age {
    private(set) var value: Int
    init?(value: Int) {
        guard 0...200 ~= value else {
            return nil
        }
        self.value = value
    }
}

var age: Age? = .init(value: -22324)

enum LottoGame {
    static let correctInputNumberCount: Int = 6
}

//if lottoInputCount < LottoGame.correctInputNumberCount {
//    
//}

// 7. 3개 이상의 스위프트 기본 데이터타입(Int, String, Double 등) 프로퍼티를 가진 타입을 구현하지 않습니다
struct Person {
    let name: String
    var age: Age
    var bio: Bio
//    var height: Double
//    var weight: Double
    struct Bio {
        var height: Double
        var weight: Double
    }
}

// 8. 일급 콜렉션을 사용합니다
// 일급 콜렉션: 프로퍼티가 단 하나인 타입이며, 그 프로퍼티가 콜렉션인 타입
var discountPercentage: [Discount: Double] = [
    .none : 0,
    .vip : 0.1,
    .coupon : 0.5,
]

discountPercentage[.none] = 1000
discountPercentage.removeValue(forKey: .coupon)

class DiscountPercentage {
    private var dictionary: [Discount: Double] = [
        .none : 0,
        .vip : 0.1,
        .coupon : 0.5,
    ]
    
    func setDiscountPercentage(of: Discount, amount: Double) throws {
        guard 0...1 ~= amount else {
            throw NSError() as Error
        }
    }
    
    func discountPercentage(of: Discount) -> Double {
        return dictionary[of, default: 0]
    }
}
