//
//  SideMenuTableViewController.swift
//  DreamCR
//
//  Created by Rashed Alshamsi on 04/04/2019.
//  Copyright © 2019 Rashed Alshamsi. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        NotificationCenter.default.post(name: NSNotification.Name("ToggleMenu"), object: nil)

        switch indexPath.row {

        case 0: NotificationCenter.default.post(name: NSNotification.Name("ShowProfile"), object: nil)
        case 4:NotificationCenter.default.post(name: NSNotification.Name("ShowAppSetting"), object: nil)
        case 5:NotificationCenter.default.post(name: NSNotification.Name("ShowLogOut"), object: nil)
        default:
            break
        }
    }


}
