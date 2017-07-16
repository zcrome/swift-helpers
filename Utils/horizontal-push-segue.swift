//Set this class on InterfaceBuilder

class SegueFromLeft: UIStoryboardSegue {
    
    override func perform(){

      let src = self.source
      let dst = self.destination
      
      src.view.superview?.insertSubview(dst.view, aboveSubview: src.view)
      //Change if destination vc appears on the lef or right
      dst.view.transform = CGAffineTransform(translationX: (X)src.view.frame.size.width, y: 0)
      
      UIView.animate(withDuration: 0.25,
                     delay: 0.0,
                     options: UIViewAnimationOptions.curveEaseInOut,
                     animations: {
                      dst.view.transform = CGAffineTransform(translationX: 0, y: 0)},
                     completion: { finished in
                      src.present(dst, animated: false, completion: nil)})
    }

}