//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    lazy var tappable: UIButton = {
        // ------ General settings ---------
        let tappable = UIButton(type: .custom)
        tappable.titleLabel?.font = importedFont()
        tappable.titleLabel?.text = ""
        let adjustedPadding = tappable.intrinsicContentSize.height * 0.35
        tappable.translatesAutoresizingMaskIntoConstraints = false
        // ------ Image ------------
        tappable.setBackgroundImage(UIImage(named: "buttonBG"), for: .normal)
        tappable.setImage(UIImage(named: "backButton"), for: .normal)
        tappable.imageView?.contentMode = .scaleAspectFit

        tappable.imageEdgeInsets = UIEdgeInsets(top: adjustedPadding,
                                                left: adjustedPadding / 3,
                                                bottom: adjustedPadding,
                                                right: 0)
        // ------ Text ----------
        tappable.setTitle("BACK TO\nLOBBY", for: .normal)
        tappable.titleLabel?.textAlignment = .center
        tappable.titleLabel?.numberOfLines = 2
        tappable.titleLabel?.adjustsFontSizeToFitWidth = true

        tappable.titleEdgeInsets = UIEdgeInsets(top: 0,
                                                left: 0,
                                                bottom: 0,
                                                right: adjustedPadding)
        // ------- Text styling ----------
        tappable.setTitleColor(.white, for: .normal)
        tappable.setTitleColor(.gray, for: .highlighted)
        tappable.titleLabel?.layer.shadowColor = UIColor.black.cgColor
        tappable.titleLabel?.layer.shadowOpacity = 1
        tappable.titleLabel?.layer.shadowOffset = CGSize(width: 0, height: 1)
        tappable.titleLabel?.layer.shadowRadius = 1
        return tappable
    }()
    
    private func importedFont() -> UIFont {
        let cfURL = Bundle.main.url(forResource: "Montserrat-Bold", withExtension: "ttf") as! CFURL
        CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)
        return UIFont(name: "Montserrat-Bold", size: 18) ?? UIFont.systemFont(ofSize: 14)
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .purple
        view.addSubview(tappable)
        self.view = view
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
    }

    func setLayout() {
        tappable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tappable.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tappable.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        tappable.heightAnchor.constraint(equalTo: tappable.widthAnchor, multiplier: 0.42).isActive = true
    }

}
// Present the view controller in the Live View window
 PlaygroundPage.current.liveView = MyViewController()
