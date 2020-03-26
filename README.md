# FacetimeUI
This repo contains the code of a replica of FaceTime, using just ViewCode.

### View Architecture
So far, the app view architecture is the following:
- Viewcontroller:
    - CameraView (UIView).
    - SmallCameraView (UView).
    - ControllsView (UIView):
        - UIView (Default): 
          - StackView: 
            - Call Icons [UIView]
          - Effect Options (UICollectionView)
        - UIView (Effects):
          - Effects Types (UICollectionView)
    - PrintButton (UIButton).

### Cool things about this project:
- I used Swifitlint, to add more code quality and improve it's maintenance.
- There are several layers of UI tests being mades, from single components to complete UIViews. The pod I'm using to do so is SnapshotTesting.
- To write less verbose view code, I used Stevia. 
