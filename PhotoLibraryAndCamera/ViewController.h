//
//  ViewController.h
//  PhotoLibraryAndCamera
//
//  Created by 顏逸修 on 2023/4/8.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIView *photoLibraryOrCameraButton;

@property (strong, nonatomic) UIImagePickerController *imagePickerController;

@end

