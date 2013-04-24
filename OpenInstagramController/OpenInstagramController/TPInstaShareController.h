//
//  TPInstaShareController.h
//  OpenInstagramController
//
//  Created by digicorp on 24/04/13.
//
//

#import <UIKit/UIKit.h>

@interface TPInstaShareController : UIViewController<UIDocumentInteractionControllerDelegate>
{
    IBOutlet UIImageView *imageView;
}
@property(nonatomic,retain)UIDocumentInteractionController *docFile;
-(IBAction)saveToInstagram:(id)sender;

@end
