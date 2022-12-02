
import UIKit

extension UIImageView {
    func setRounded() {
        self.layer.cornerRadius = (self.frame.width / 2)
        self.layer.masksToBounds = true
    }
}

class FriendViewCell: UITableViewCell {
    @IBOutlet weak var imageFriend: UIImageView!
    @IBOutlet weak var labelFriend: UILabel!
}
