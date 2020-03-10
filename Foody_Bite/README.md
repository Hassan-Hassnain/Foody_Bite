#  Errors
some dezignable button not working
dezignable button in FilterVC not working properly
MenuAndPhotosVC collection view dynamic cell sizing not working
button behavier in ChangePasswordVC is not as expected



--------------------------------------------------------------------------
TABLE VIEW CELL BUTTON TAP ACTION
----------------------------------------------------

1) Create a protocol

protocol YourCellDelegate : class {
    func didPressButton(_ tag: Int)
}


2) Subclass your UITableViewCell (if you haven't done so):

class YourCell : UITableViewCell
{
     var cellDelegate: YourCellDelegate?   
      @IBOutlet weak var btn: UIButton!
    // connect the button from your cell with this method
    @IBAction func buttonPressed(_ sender: UIButton) {
        cellDelegate?.didPressButton(sender.tag)
    }         
    ...
}
3) Let your view controller conform to YourCellDelegate protocol that was implemented above.

class YourViewController: ..., YourCellDelegate {  ... }
4) Set a delegate, after the cell has been defined (for reusing).

let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! YourCell
cell.cellDelegate = self
cell.btn.tag = indexPath.row
5) In the same controller (where is your implemented UITableView delegate/datasource), put a method from YourCellDelegate protocol.

func didPressButton(_ tag: Int) {
     print("I have pressed a button with a tag: \(tag)")
}

-------------------------------------------------------------------
https://stackoverflow.com/questions/39947076/uitableviewcell-buttons-with-action
-------------------------------------------------------------------
