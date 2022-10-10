//
//  ViewController.swift
//  FitnessTracker
//
//  Created by Админ on 05.10.2022.
//

import UIKit

class MainViewController: UIViewController {
    private let userPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 0.8044032454, green: 0.8044223189, blue: 0.8044120669, alpha: 1)
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 5
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let userNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Your name"
        label.adjustsFontSizeToFitWidth = true //сжимает текст чтобы он влез в контейнер
        label.minimumScaleFactor = 0.7
        //label.numberOfLines = 2 //перенос строки, если ноль - то неограниченное число строк
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let addWorkoutButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9963216186, green: 0.8627745509, blue: 0.4291383028, alpha: 1) //#colorLiteral( -выбор цвета
        button.layer.cornerRadius = 10
        button.setTitle("Add workout", for: .normal)
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.imageEdgeInsets = .init(top: 0,
                                       left: 20,
                                       bottom: 15,
                                       right: 0)
        button.titleEdgeInsets = .init(top: 50,
                                       left: -40,
                                       bottom: 0,
                                       right: 0)


        button.tintColor = #colorLiteral(red: 0.1807115376, green: 0.3627874255, blue: 0.332313329, alpha: 1)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()


    private let calendarView = CalendarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }

    private func setupViews() { // настройки view
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9294117647, blue: 0.8862745098, alpha: 1)

        view.addSubview(calendarView)
        view.addSubview(userPhotoImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)

    }
}
extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            userPhotoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userPhotoImageView.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImageView.widthAnchor.constraint(equalToConstant: 100),


            calendarView.topAnchor.constraint(equalTo: userPhotoImageView.centerYAnchor), // почему по центру У?
            calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant : 10),
            calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            calendarView.heightAnchor.constraint(equalToConstant: 70),

            userNameLabel.bottomAnchor.constraint(equalTo: calendarView.topAnchor, constant: -10),
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImageView.trailingAnchor, constant: 5),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),

            addWorkoutButton.topAnchor.constraint(equalTo: calendarView.bottomAnchor, constant: 5),
            addWorkoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            addWorkoutButton.widthAnchor.constraint(equalToConstant: 80),
            addWorkoutButton.heightAnchor.constraint(equalToConstant: 80)
        ])

    }
}

