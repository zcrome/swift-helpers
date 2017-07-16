//
//  ViewController.swift
//  Testing_Nav
//
//  Created by zcrome on 7/15/17.
//  Copyright © 2017 zcrome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var originButton: UIButton! //<--Trigger button
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue for the popover configuration window
        if segue.identifier == "" {  //identifier name setted on InterfaceBuilder
            if let controller = segue.destination as? PopoverVC {
                controller.popoverPresentationController!.delegate = self
                controller.preferredContentSize = CGSize(width: width, height: height) //Popover Size
            }
        }
    }
    func closePopOver(){
        self.presentedViewController?.dismiss(animated: true, completion: nil)
    }
}

extension ViewController: UIPopoverPresentationControllerDelegate{

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none //This is the style of presentation
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController){
        popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirection() // delete arrow
        popoverPresentationController.sourceView = originButton // set trigger button reference
        popoverPresentationController.sourceRect = CGRect(x: 0, y: 0, width: width, height: height) // set coords XY in relation of trigger button
        
        //Add close button
        if let popVC = popoverPresentationController.presentedViewController as? PopoverVC{
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            button.setTitle("CLOSE POPOVER", for: .normal)
            button.addTarget(self, action: #selector(closePopOver), for: UIControlEvents.touchUpInside)
            popVC.view.addSubview(button)
        }
    }
}

