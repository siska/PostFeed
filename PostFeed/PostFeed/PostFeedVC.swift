//
//  PostFeedVC.swift
//  SiskaLabs
//
//  Created by S on 11/17/20.
//

import UIKit

class PostFeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tableView: UITableView!
    var posts = [Dictionary<String, Any>]()
    var users = [Dictionary<String, Any>]()
    var postImages = [Dictionary<String, Any>]()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TextAndImageTableViewCell.nib(), forCellReuseIdentifier: TextAndImageTableViewCell.identifier)
        tableView.register(TextOnlyTableViewCell.nib(), forCellReuseIdentifier: TextOnlyTableViewCell.identifier)
    }
/*
    override func viewWillAppear(_ animated: Bool) {
        self.returnAllPosts()
    }

    func returnAllPosts() {
        CFDataService.instance.returnPosts { (returnedPosts) in
            var postsArray = returnedPosts
            postsArray.sort { ($0["publishDate"] as! String) > ($1["publishDate"] as! String) }
            self.posts = postsArray
            CFDataService.instance.returnUsers { (returnedUsers) in
                self.users = returnedUsers
                self.returnAllImages()
            }
        }
    }

    func returnAllImages() {
        for post in self.posts {
            let postImageID = post["postImageID"] as! String
            if postImageID != "nil" {
                StorageService.instance.fetchPostImageData(forID: postImageID) { (data) in
                    let dict = [postImageID: UIImage(data: data)!]
                    self.postImages.append(dict)
                    self.tableView.reloadData()
                }
            }
        }
    }
*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var poster = String()
        var postImage = UIImage()

        let post = self.posts[indexPath.row]
        let postText = post["text"] as! String
        let postImageID = post["postImageID"] as! String

        for user in self.users {
            if user["uid"] as! String == post["posterUID"] as! String {
                let returnedPoster = user["name"] as! String
                let publishDate = determineDateFormat(dateAsString: post["publishDate"] as! String)
                poster = returnedPoster + "  |  " + publishDate
            }
        }

        if postImageID == "nil" {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextOnlyTableViewCell.identifier, for: indexPath) as! TextOnlyTableViewCell
            cell.configureTextOnlyCell(poster: poster, text: postText)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextAndImageTableViewCell.identifier, for: indexPath) as! TextAndImageTableViewCell

            for image in self.postImages {
                if let img = image[post["postImageID"] as! String] {
                    postImage = img as! UIImage
                }
            }
            
            cell.configureTextAndImageCell(poster: poster, text: postText, image: postImage)
            return cell
        }
    }

    func determineDateFormat(dateAsString: String) -> String {

        let receivedDate = Double(dateAsString)!
        let eventDate = Date(timeIntervalSince1970: receivedDate)

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let dateString = dateFormatter.string(from: eventDate)

        return dateString
    }


}
