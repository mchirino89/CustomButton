//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    lazy var tappable: UIButton = {
        // ------- Button Styling ---------
        let tappable = UIButton(type: .custom)
        tappable.translatesAutoresizingMaskIntoConstraints = false
        tappable.backgroundColor = .orange
        tappable.layer.borderColor = UIColor.white.cgColor
        tappable.layer.borderWidth = 2
        tappable.layer.cornerRadius = 8
        // ------ General settings ---------
        tappable.contentMode = .scaleAspectFill
        tappable.clipsToBounds = true
        // ------ Image ------------
//        tappable.setImage(UIImage(named: "backArrow"), for: .normal)
        tappable.imageView?.contentMode = .scaleAspectFit
        tappable.imageEdgeInsets = UIEdgeInsets(top: 30, left: -6, bottom: 30, right: 0)
        tappable.imageView?.backgroundColor = .green
        // ------ Text ----------
        tappable.setTitle("BACK TO\nLOBBY", for: .normal)
        tappable.titleLabel?.font = importedFont()
        tappable.titleLabel?.lineBreakMode = .byClipping
        tappable.titleLabel?.textAlignment = .center
        tappable.titleLabel?.minimumScaleFactor = 0.1
        tappable.titleLabel?.numberOfLines = 0
//        tappable.titleEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        // ------- Text styling ----------
//        tappable.titleLabel?.backgroundColor = .blue
        tappable.setTitleColor(.white, for: .normal)
        tappable.setTitleColor(.gray, for: .highlighted)
        tappable.titleLabel?.shadowOffset = CGSize(width: 0, height: 3)
        tappable.titleLabel?.shadowColor = UIColor.black
        tappable.titleLabel?.layer.shadowOpacity = 0.75
        tappable.titleLabel?.layer.shadowRadius = 3 
        return tappable
    }()

    lazy var icon: UIImageView = {
        let icon = UIImageView(image: UIImage(named: "backArrow"))
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.contentMode = .scaleAspectFit
        icon.backgroundColor = .red
        return icon
    }()
    
    private func importedFont() -> UIFont {
        let cfURL = Bundle.main.url(forResource: "Montserrat-Bold", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        return UIFont(name: "Montserrat-Bold", size: 16) ?? UIFont.systemFont(ofSize: 14)
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .purple
        view.addSubview(tappable)
        view.addSubview(icon)
        self.view = view
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
    }

    func setLayout() {
        tappable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tappable.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tappable.widthAnchor.constraint(greaterThanOrEqualTo: view.widthAnchor, multiplier: 1/3).isActive = true

        icon.topAnchor.constraint(equalTo: tappable.bottomAnchor).isActive = true
        icon.centerXAnchor.constraint(equalTo: tappable.centerXAnchor).isActive = true

        let scalableFactor = tappable.intrinsicContentSize.height * 0.8
        let container = CGSize(width: scalableFactor, height: scalableFactor)
        icon.frame = CGRect(origin: .zero, size: container)
        icon.image = UIImage(named: "arrowBack")
    }

    private func isBiggerThan(parent: UIView, child: UIView) -> Bool {
        return child.frame.height > parent.frame.height * 0.8
    }
}
// Present the view controller in the Live View window
 PlaygroundPage.current.liveView = MyViewController()
