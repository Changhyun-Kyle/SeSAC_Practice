//
//  ViewController.swift
//  Swift_ViewDrawingCycle
//
//  Created by 강창현 on 3/11/24.
//

import UIKit

/*
 1. 보기를 부분적으로 가리고 있던 다른 보기를 이동하거나 제거하기
 2. 이전에 숨겨져 있던 뷰의 숨김 속성을 NO로 설정하여 다시 표시되도록 만들기
 3. 뷰를 화면 밖으로 스크롤했다가 다시 화면으로 스크롤하기
 4. 뷰의 setNeedsDisplay 또는 setNeedsDisplayInRect: 메서드를 명시적으로 호출하는 경우
*/

// 순서: setNeedDisplay -> 뷰 생성 ->
final class ViewController: UIViewController {
    private let customView = CustomView()
    
    private let moveButton: UIButton = {
        let button = UIButton()
        button.setTitle("이동", for: .normal)
        return button
    }()
    
    private let removeButton: UIButton = {
        let button = UIButton()
        button.setTitle("삭제", for: .normal)
        return button
    }()
    
    private let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        return button
    }()
    
    private let hideButton: UIButton = {
        let button = UIButton()
        button.setTitle("숨김", for: .normal)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            moveButton,
            removeButton,
            addButton,
            hideButton
        ])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        setUpConstraints()
        setButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}

private extension ViewController {
    func configureUI() {
        view.addSubviews(
            customView,
            buttonStackView
        )
        customView.backgroundColor = .cyan
    }
    
    func setButton() {
        let moveAction = UIAction { [weak self] _ in
            self?.moveCustomView()
        }
        moveButton.addAction(moveAction, for: .touchUpInside)
        
        let removeAction = UIAction { [weak self] _ in
            self?.customView.removeFromSuperview()
        }
        removeButton.addAction(removeAction, for: .touchUpInside)
        
        let addAction = UIAction { _ in
            self.view.addSubview(self.customView)
            self.setUpConstraints()
        }
        addButton.addAction(addAction, for: .touchUpInside)
        
        let hideAction = UIAction { [weak self] _ in
            self?.customView.isHidden.toggle()
        }
        hideButton.addAction(hideAction, for: .touchUpInside)
    }
    
    func setUpConstraints() {
        customView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            customView.widthAnchor.constraint(equalToConstant: 150),
            customView.heightAnchor.constraint(equalToConstant: 150),
            customView.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -10),
            buttonStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        ])
    }
    
    func moveCustomView() {
        customView.constraints.forEach { constraint in
            customView.removeConstraint(constraint)
        }
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            customView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            customView.widthAnchor.constraint(equalToConstant: 150),
            customView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            self.addSubview(view)
        }
    }
}
