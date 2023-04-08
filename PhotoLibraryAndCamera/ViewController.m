//
//  ViewController.m
//  PhotoLibraryAndCamera
//
//  Created by 顏逸修 on 2023/4/8.
//

#import "ViewController.h"
/**
import library to allowd to use image, photo and movie
 @import MobileCoreServices;
 */

@interface ViewController ()

@end

@implementation ViewController

@synthesize imagePickerController;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // initialize imagePickerController
    imagePickerController = [[UIImagePickerController alloc] init];
    
    // let imagePicker can load image and movie.
    // imagePickerController.mediaTypes = @[(NSString *) kUTTypeImage, (NSString *) kUTTypeMovie];
}



- (IBAction)photoLibraryOrCameraButtonPressed:(id)sender {
    // add a alertController.ActionSheet with no title and no message
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // set use photo library alert action
    UIAlertAction *photoLibraryAlertAction = [UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self accessPhotoLibrary];
    }];
    
    // set use user camera action
    UIAlertAction *cameraAlertAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self accessCamera];
    }];
    
    // set cancel alertAction
    UIAlertAction *cancelAlertAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    // add alert action to alertViewController
    [alertController addAction: photoLibraryAlertAction];
    [alertController addAction: cameraAlertAction];
    [alertController addAction: cancelAlertAction];
    
    // show alertViewController
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void) accessPhotoLibrary {
    // set imagePickerController source type to Photo library
    imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    // set imagePickerController delege to self controller
    imagePickerController.delegate = self;
    
    // show photo library to viewController
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
}


- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    
    // create a UIImage to save image which user choose from photo library of user.
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    
    // set image to imageView on viewController
    self.imageView.image = image;
    
    // dismiss the imagePickerContoller
    [imagePickerController dismissViewControllerAnimated:YES completion:nil];
    
}


- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    // user pressed the cancel button, dismiss the imageViewController
    [imagePickerController dismissViewControllerAnimated:YES completion:nil];
}


- (void) accessCamera {
    
    // check to see if the user agrees to use the camera
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        // user agree, set imagePickerController source type to camera
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        // set imagePickerController delege to self controller
        imagePickerController.delegate = self;
        
        // show camera view to viewController
        [self presentViewController:imagePickerController animated:YES completion:nil];
    } else {
        // user does not agree, show alert to user.
        [self showAlert: @"Camera Not Avaliable" message: @"There is no camera avaliable on this device."];
        
    }
}


- (void) showAlert: (NSString *) title message: (NSString *) message {
    
    // set alertController with argument title to and argument message to message
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    // set alert action with "OK" to title.
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    // add alertaction to alertController
    [alertController addAction:alertAction];
    
    // show alertViewController
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
