# mushroom-spot
example of a SwiftUI app with login, list and details

### Requirements

##### Login screen 
- Email and password fields
- Handle email validation
- Handle password validation (must contain at least eight characters, at least one number and both lower and uppercase letters and special characters)
- Implement login API
- Should be the first screen of the app
- Logged in user should be redirected to the Home screen

##### Home screen
- Toolbar with the profile button and a list of available mushrooms
- Implement mushrooms API
- The cell should display the name of the mushroom and an image in the right corner
- Tap on a specific cell should transition to a screen showing details of the selected mushroom
Click on the profile button should open modal with the logged user info

##### Mushroom details screen
- Display mushroom details
- Tap on Back returns to Home screen (List)

##### Profile screen
- Display logged user info
- Implement me API (fetch on Profile button tap)

### API

##### Login:
[POST] https://demo5845085.mockable.io/api/v1/users/login

##### Fetch mushrooms
[GET] https://demo5845085.mockable.io/api/v1/mushrooms

##### Fetch profile
[GET] https://demo5845085.mockable.io/users/me

### Unit tests

