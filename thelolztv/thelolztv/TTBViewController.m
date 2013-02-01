//
//  TTBViewController.m
//  thelolztv
//
//  Created by Jabari Bell on 1/31/13.
//  Copyright (c) 2013 Jabari Bell. All rights reserved.
//

#import "TTBViewController.h"
#import "AFJSONRequestOperation.h"

@interface TTBViewController ()
@property (strong, nonatomic) IBOutlet UITextField *searchField;
@end

@implementation TTBViewController {
    NSOperationQueue *queue;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.searchField addTarget:self action:@selector(textFieldFinished:) forControlEvents:UIControlEventEditingDidEndOnExit];
    queue = [[NSOperationQueue alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSURL *)urlWithSearchText
{
    NSString *urlString = [NSString stringWithFormat:@"https://gdata.youtube.com/feeds/api/videos?v=2&alt=jsonc&q=%@&format=1", self.searchField.text];
    return [NSURL URLWithString:urlString];
}

- (void)performSearch
{
    if (self.searchField.text.length > 0) {
        NSLog(@"searching");
        NSURLRequest *request = [NSURLRequest requestWithURL:[self urlWithSearchText]];
        
        AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
            NSLog(@"results: %@", JSON);
        }
        failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON){
            NSLog(@"fail whale: %@", error);
        }];
        
        operation.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", nil];
        
        [queue addOperation:operation];
    }
}

- (void)textFieldFinished:(id)sender
{
    [self performSearch];
}

@end
