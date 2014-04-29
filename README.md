<h1>AZActionSheet</h1>
<p>
AZActionSheet is an iOS 7 action sheet which uses UIKit Dynamics to create a bouncy effect when the action sheet is displayed.
</p>

<b>Usage</b>

```
#import "ViewController.h"

@interface ViewController ()<AZActionSheetDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{   
    [super viewDidLoad];
    
    [self showAZActionSheet];
}

-(void) showAZActionSheet
{
    [AZActionSheet showActionSheetWithTitle:@"Actions" controller:self cancelButtonTitle:@"Cancel" otherButtonTitles:@[@"Water",@"Fertilize",@"Treat"]];
}

-(void) azActionSheetDidDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Selected Index: %d",buttonIndex);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction) show:(id) sender
{
    [self showAZActionSheet];
}

@end
```

<b>Screenshot</b>
<p>
<img src="http://www.highoncoding.com/articleimages/AZActionSheet.png"/>
</p>

<b>Video</b>
<p>
<a href="https://www.youtube.com/watch?v=t39CGdp4UzA">AZActionSheet on YouTube </a>
</p>

