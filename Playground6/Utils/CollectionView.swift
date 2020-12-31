//
//  CollectionView.swift
//  Playground6
//
//  Created by Sebastian Fox on 16.11.20.
//

import SwiftUI
import UIKit

struct CollectionView : UIViewRepresentable {
    
    func makeCoordinator() -> CollectionView.Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UICollectionView {
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: context.coordinator.createCompositionalLayout())
                collectionView.backgroundColor = .red
                collectionView.register(MyCell.self, forCellWithReuseIdentifier: MyCell.reuseId)
           
                collectionView.dataSource = context.coordinator
                collectionView.delegate = context.coordinator
                collectionView.alwaysBounceVertical = true
                collectionView.showsVerticalScrollIndicator = false

        return collectionView
        
        
//        let collectionView = UICollectionView(frame: .zero,
//                                              collectionViewLayout: UICollectionViewFlowLayout())
//
//        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.scrollDirection = .horizontal
//            layout.minimumLineSpacing = 0
//            layout.minimumInteritemSpacing = 0
//        }
//
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
//        collectionView.dataSource = context.coordinator
//        collectionView.register(MyCell.self, forCellWithReuseIdentifier: "myCell")
//        collectionView.backgroundColor = .red
//
//        return collectionView
    }
    
    func updateUIView(_ uiView: UICollectionView, context: Context) {
        //        let dataSource = context.coordinator.dataSource
    }
    
    //    func populate(dataSource: UICollectionViewDiffableDataSource<MySection, MyModelObject>) {
    //        var snapshot = NSDiffableDataSourceSnapshot<MySection, MyModelObject>()
    //        snapshot.appendSections([.main])
    //        snapshot.appendItems([MyModelObject(), MyModelObject(), MyModelObject()])
    //        dataSource.apply(snapshot)
    //    }
    
    
    
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
        
        var parent: CollectionView
        
        init(_ parent: CollectionView) {
            self.parent = parent
        }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCell.reuseId, for: indexPath) as? MyCell{
                    cell.backgroundColor = .green
//                    cell.movie = parent.allItems[.NowPlaying]?[indexPath.item]
                    return cell
                }
            
            return UICollectionViewCell()
        }
        
        func createCompositionalLayout() -> UICollectionViewLayout {
              return UICollectionViewFlowLayout()

        }
        
        
    }
    
    class MyCell: UICollectionViewCell {
        
        static let reuseId: String = "PopularCell"
        
         var appUser: AppUser?{
              didSet{
                  if let appUser = self.appUser {
//                      imageView.kf.setImage(with: movie.posterUrl)
                    
                    usernameLabel.text = appUser.username
                  }
              }
          }
        
        
        lazy var imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.image = UIImage(named: "basti3.jpg")
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.backgroundColor = .clear
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = 10
            return imageView
        }()
        
        lazy var usernameLabel: UILabel = {
            let label = UILabel()
            label.text = "Sebastian"
            label.textColor = UIColor(named: "textColor")
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 2
            label.textColor = .secondaryLabel
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            contentView.addSubview(self.imageView)
            //                      self.imageView.addSubview(gradientView)
            NSLayoutConstraint.activate([
                imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
                imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1)
            ])
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError()
        }
    }
    
    //    func makeCoordinator() -> MyCoordinator {
    //        MyCoordinator()
    //    }
}

struct TestUICollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView()
    }
}
