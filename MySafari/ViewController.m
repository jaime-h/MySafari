//
//  ViewController.m
//  MySafari
//
//  Created by Jaime Hernandez on 3/12/14.
//  Copyright (c) 2014 Jaime Hernandez. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITextField *myURLTextField;
@property (strong, nonatomic) IBOutlet UIWebView   *myWebView;

- (IBAction)onBackButtonPressed:(id)sender;
- (IBAction)onForwardButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *forwardButton;

@property (strong, nonatomic) IBOutlet UIButton *plusButtonPressed;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.forwardButton.enabled = NO;
    self.backButton.enabled    = NO;
    
    self.myWebView.scrollView.delegate = self;
    
    
	// Do any additional setup after loading the view, typically from a nib.
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSString *appendHTTPer =@"HTTP://";
    appendHTTPer = [appendHTTPer stringByAppendingString:textField.text];
    NSString *completAddress = appendHTTPer;
    NSURL *urlString = [NSURL URLWithString:completAddress];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:urlString];
    
    [self.myWebView loadRequest:request];
    
    return YES;
}

- (IBAction)onBackButtonPressed:(id)sender
{
    
    [self.myWebView goBack];
    
}

- (IBAction)onForwardButton:(id)sender
{
   
    [self.myWebView goForward];
}

- (IBAction)onStopButtonPressed:(id)sender
{
    
    [self.myWebView stopLoading];
}

- (IBAction)onReloadButtonPressed:(id)sender
{
    
    [self.myWebView reload];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    if ([self.myWebView canGoForward]) {
        self.forwardButton.enabled = YES;
    }
    
    if ([self.myWebView canGoBack]) {
        self.backButton.enabled = YES;
    }
    
    // http://stackoverflow.com/questions/2491410/get-current-url-of-uiwebview
    // Getting the Title page using a Javascript and then parsing it then setting it to the url field
    self.myURLTextField.text = [self.myWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
}

- (IBAction)plusButtonPressed:(id)sender {
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"New Features" message:@"Coming Soon!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
    [av show];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // The scrollViewDidScrollToTop was not getting called so..
    // we are testing the view offset and calling it when it's at the top.
    if (scrollView.contentOffset.y == 0) {
        
        self.myURLTextField.alpha = 0.99;
    }
    else
    {
        self.myURLTextField.alpha = 0.0;
    }
}

@end
