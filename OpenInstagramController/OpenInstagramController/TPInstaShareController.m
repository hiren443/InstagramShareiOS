//
//  TPInstaShareController.m
//  OpenInstagramController
//
//  Created by digicorp on 24/04/13.
//
//

#import "TPInstaShareController.h"
#import <QuartzCore/QuartzCore.h>

@interface TPInstaShareController ()

@end

@implementation TPInstaShareController
@synthesize docFile = _docFile;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(IBAction)saveToInstagram:(id)sender {
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] > 5.0) {
        float i = [[[UIDevice currentDevice] systemVersion] floatValue];
        NSString *str = [NSString stringWithFormat:@"We're sorry, but Instagram is not supported with your iOS %.1f version.", i];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:str delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
    else{
        CGRect rect = CGRectMake(0 ,0 , 0, 0);
        NSString  *jpgPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Test.ig"];
        
        NSURL *igImageHookFile = [[NSURL alloc] initWithString:[[NSString alloc] initWithFormat:@"file://%@", jpgPath]];
        NSLog(@"JPG path %@", jpgPath);
        NSLog(@"URL Path %@", igImageHookFile);
        self.docFile.UTI = @"com.instagram.photo";
        self.docFile = [self setupControllerWithURL:igImageHookFile usingDelegate:self];
        self.docFile=[UIDocumentInteractionController interactionControllerWithURL:igImageHookFile];
        [self.docFile presentOpenInMenuFromRect: rect    inView: self.view animated: YES ];
        NSURL *instagramURL = [NSURL URLWithString:@"instagram://media?id=MEDIA_ID"];
        if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
            [self.docFile presentOpenInMenuFromRect: rect    inView: self.view animated: YES ];
        }
        else {
            NSLog(@"No Instagram Found");
        }
        
    }
    
}
- (UIDocumentInteractionController *) setupControllerWithURL: (NSURL*) fileURL usingDelegate: (id <UIDocumentInteractionControllerDelegate>) interactionDelegate {
    UIDocumentInteractionController *interactionController = [UIDocumentInteractionController interactionControllerWithURL: fileURL];
    interactionController.delegate = interactionDelegate;
    return interactionController;
}

- (void)documentInteractionControllerWillPresentOpenInMenu:(UIDocumentInteractionController *)controller {
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
