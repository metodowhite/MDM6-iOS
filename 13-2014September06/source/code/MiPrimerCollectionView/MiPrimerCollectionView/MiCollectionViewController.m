//
//  MiCollectionViewController.m
//  MiPrimerCollectionView
//
//  Created by metodowhite on 06/09/14.
//  Copyright (c) 2014 metodowhite. All rights reserved.
//

#import "MiCollectionViewController.h"
#import "MiCollectionViewCell.h"
#import "LeHeaderCollectionReusableView.h"

@interface MiCollectionViewController ()
@property (nonatomic) NSArray *tipo1Arr;
@property (nonatomic) NSArray *tipo2Arr;
@property (nonatomic) NSArray *tiposArr;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *selectButton;
@property (nonatomic) BOOL selectEnabled;
@property (nonatomic) NSMutableArray *selectedItems;
@end

@implementation MiCollectionViewController

static NSString * const reuseIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.collectionView.backgroundColor = [UIColor redColor];
    self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"congruent_pentagon.png"]];
    
    UICollectionViewFlowLayout *leLayout = (id)self.collectionView.collectionViewLayout;
    leLayout.sectionInset = UIEdgeInsetsMake(0, 20, 0, 20);
    leLayout.headerReferenceSize = CGSizeMake(100, 200);
    leLayout.itemSize = CGSizeMake(70, 70);
    leLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.tipo1Arr = @[@"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla", @"bla"];
    self.tipo2Arr = @[@"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble", @"ble"];
    self.tiposArr = @[self.tipo1Arr, self.tipo2Arr];
    
    self.selectedItems = [NSMutableArray array];
    
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:@selector(share:)];
    
    NSArray *buttons = @[shareButton];

//    [self.navigationController.toolbar setItems:buttons]; // NO FUNCIONA
    self.toolbarItems = buttons;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark <UICollectionViewDataSource>

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableView = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        LeHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind: UICollectionElementKindSectionHeader withReuseIdentifier:@"leHeader" forIndexPath:indexPath];
        
        headerView.leHeaderLabel.text = [NSString stringWithFormat:@"HEADER #%li", indexPath.section +1];
        reusableView = headerView;
    }
    
    return reusableView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.tiposArr count];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[self.tiposArr objectAtIndex:section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    cell.leLabel.text = [NSString stringWithFormat:@"%ld", (long)indexPath.item];
    //    cell.layer.borderColor = (__bridge CGColorRef)([UIColor blueColor]);
    
    cell.layer.borderColor = [[UIColor blueColor] colorWithAlphaComponent:0.3f].CGColor;
    cell.layer.borderWidth = 7.0f;
    cell.layer.cornerRadius = 35.0f;
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
 // Uncomment this method to specify if the specified item should be highlighted during tracking
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
 }
 */

/*
 // Uncomment this method to specify if the specified item should be selected
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 return YES;
 }
 */

/*
 // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
 - (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
 }
 
 - (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
 }
 
 - (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
 }
 */

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.selectEnabled) {
        NSString *selectedItem = [self.tiposArr[indexPath.section] objectAtIndex:indexPath.item];
        [self.selectedItems addObject:selectedItem];
    }
    
    [[self.collectionView cellForItemAtIndexPath:indexPath] setBackgroundColor:[UIColor purpleColor]];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.selectEnabled) {
        NSString *selectedItem = [self.tiposArr[indexPath.section] objectAtIndex:indexPath.item];
        [self.selectedItems removeObject:selectedItem];
    }
    
    [[self.collectionView cellForItemAtIndexPath:indexPath] setBackgroundColor:[UIColor greenColor]];
}

- (IBAction)selectButtonTouched:(id)sender {
//    !self.selectEnabled ?self.selectEnabled = YES :self.selectEnabled = NO;
//    self.selectEnabled = self.selectEnabled? YES:NO;
//    self.selectEnabled != self.selectEnabled;
    
    self.selectEnabled = !self.selectEnabled;
    self.selectButton.title = self.selectEnabled ? @"Done" : @"Select";
    [self.navigationController setToolbarHidden:!self.selectEnabled animated:YES];

//    if (!self.selectEnabled) {
////        (UIBarButtonItem *)sender.text = @"bla";
//        self.selectButton.title = @"bla";
//    }else{
//        
//    }
    
}


- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    return !self.selectEnabled;
}



- (void)share:(id)sender{
    //SLComposeViewController
}











@end
