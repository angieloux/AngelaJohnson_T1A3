# AJ RECORDS: Terminal App 
Created by Angela Johnson, October 2021 | [Link to Github](https://github.com/angieloux/AngelaJohnson_T1A3)
# 1. Installation
1. If you don't have Ruby installed, installation information can be found [here](https://www.ruby-lang.org/en/documentation/installation/).
2. Open up terminal
3. Change directory into a directory you would like to install AJ Records in (Games for example)
> `cd Games`
4. Clone the repository to your computer. If you need help doing this, please click [here](https://docs.github.com/en/github/creating-cloning-and-archiving-repositories/cloning-a-repository-from-github/cloning-a-repository).
> `git clone git@github.com:angieloux/AngelaJohnson_T1A3.git`
5. Change into the repository directory
> `cd AngelaJohnson_T1A3`
6. Change into the src directory
> `cd src` 
7. Type the following into the terminal
> `sh run_ajrecords.sh`

This will install Bundler and all gem dependencies required by the program. It will then run ajrecords.rb which will begin the program. 

## System/Requirements 

**NOTE**: This program has been tested only on a Mac operation system. If you are using a Windows or Linux machine and are having troubles loading the .sh file, please read help docs [here](https://www.webservertalk.com/run-sh-files-in-linux-and-windows/).  

## Alternative installation for Windows/Linux 
If you still cannot get the .sh file to run, please follow these steps: 
1. Manually install all gems in the Gem Dependencies list below. For example, to install the gem 'colorize', in your terminal type:
> gem install colorize
2. Once ALL gems have been installed, enter the following:
> `ruby ajrecords.rb`

This will run the program. 

**Gem dependencies:**
- "colorize", "~> 0.8.1"

- "artii", "~> 2.1"

- "tty-prompt", "~> 0.23.1"

- "ruby-progressbar", "~> 1.11"

- "json", "~> 2.5"

- "terminal-table", "~> 3.0"

- "tty-box", "~> 0.7.0"

- "require_all", "~> 3.0"

**Other dependencies**
- Ruby 
- Terminal

# 2. Statement of Purpose & Scope
### *Overview*: 

Endless lockdowns getting in the way of all your record-buying dreams? Well look no further! AJ Records is a 
simple CLI app designed to simulate an in-store record-buying experience.  Users can visit the store and look through hundreds of records, narrow their search by searching for whatever genre/album/price/artist they want, add them to their cart and go and check out. Don't want to buy anything? Try your luck with the blonde at the counter (disclaimer: you will be disappointed).

### *Why?*

As a vinyl-obsessed audiophile myself, this app hits close to home. My uncles opened up record stores in the 90s in LA, while my dad opened up one in Brisbane. I've grown up surrounded by music and pop culture, having worked at the store for a long time. In lockdown, I miss that feeling of wandering around a record store, listening to music, and endlessly digging through to find a good title. So essentially, the app looks to solve the problem of endless lockdown boredom in the MOST exciting way possible -- a terminal app. ;) As this is my Ruby debut, I wanted to ensure I was building something that was intriguing to me personally, so I could stay engaged while learning as much as I could in the process.

### *Target audience*

With the recent resurgence of vinyl among the younger generation, this app is aimed at all ages. Given its record library of just shy of 500 different titles, those with a keen interest in music or pop culture will likely be most interested. 

### *Usage*

AJ Records is very simple to navigate. The user can enter the store, have a look around, go up to the counter and have a chat to the girl there, or go and look at the vinyl. Once they are in the vinyl section, they are able to choose between searching by Genre, Artist, Album or Price. The first three involve typing any number of keywords, and the program will return all of the records that contain those keywords according to the respective search category. Or, if the user is keeping to a budget, they can search by price, which will allow them to type a maximum price they are willing to pay, and the program will only display records less than or equal to that value. They can review their cart, make changes, or go up to the counter and interact with the girl. Once at the counter, they can choose to pay, exit, look around again, or ask her out on a date. Future updates to the game will include a Memorabilia section, Games section and a Listening Station (where users can listen to music!).

# 3. Features

### **Feature 1: Store Navigation**
The user is welcomed to the store by a banner bearing the store name, AJ Records, as well as some introductory text. They can decide whether they'd like to enter or not. If they do enter, they are shown a Store Navigation menu that allows them to choose between 4 options:
 1. Cruise over to the vinyl (includes feature 2)
 2. Review what's in your cart (includes feature 3)
 3. Head over to the counter (includes feature 4)
 4. Turn around and leave (exit)

This Store Navigation module functions as the convergence point for the entire program. It is able to be returned to at various places in the program, based on the user's decisions (i.e. once a user has finished searching for records, or if they go up to the counter then change their mind, and so on).

### **Feature 2: Product Search Filter**
If the user has chosen option 1 from the Store Navigation menu, they are presented with yet another multiple choice menu, that gives them the option of sorting the wide range of records AJ records has in stock via the following tags: 
  1. By genre
  2. By artist
  3. By album
  4. By price 
  5. Go back (takes them back to Store Navigation menu)
#### *Products/stock*
The store's stock is located within a json file (data/vinyl.json). The data is an array of 498 hashes (i.e., records), that each contain keys (Catalogue number, Price, Year, Album, Artist, Genre & Subgenre) All include their own unique value data pertaining to each key (e.g. The Beatles, Revolver, etc). 

#### *Search by genre/artist/album*
If the user decides to filter the products by either genre, artist or album, they are prompted to input text of their choosing into the program. 
When the user searches for a particular keyword, their input is manipulated so it matches the format of the json file and can be compared effectively. Then, the program loops through the data and prints out any matches that it finds. 

#### *Search by maximum price*
If the user is on a budget, they can choose to search by typing in a maximum amount they are willing to pay. Similarly to the above, the program will loop through the vinyl.json data and print out any records that are equal to or less than the user input. If the input is invalid, it will display a message and a helpful hint for the user and allow them to try again.

## **Feature 3: Cart**
#### *Add to cart*
- If product search returns results, user is asked whether they would like to add any items to their cart, or not. 
- If yes, they can type the corresponding catalogue number to remove it (if valid input).
- If the number is invalid, an error and hint message will display and they can try again. 
#### *Review cart*
- From the Store Navigation menu, the user can review all the items in their cart, displaying catalogue numbers, artist name, album name and price.
- If their cart is empty, it will just return to the Store Navigation menu with a message letting them know their cart is empty. 
- While reviewing their cart, they are asked if they would like to remove anything. 
#### *Remove from cart*
- If they choose to remove something, they can type the respective catalogue number to remove the item and it will be removed (if valid).
- If invalid, an error and hint message will display and they can try again if they want, or if not, they can return to the Store Navigation menu. 
## **Feature 4: Checkout**
- From the Store Navigation menu, if the user selects option 3, they will be greeted by the girl at the counter. A menu will be displayed, and the user can select between multiple options: 

#### *Option 1. Pay for items*
Two scenarios can happen:
- If cart is empty -> the girl will be confused by the user and tell the user to come back when they have some records. 
- If their cart is not empty -> a table of the user's order summary (courtesy of the terminal-table gem) and cart total will print out on the screen. The girl will ask the user to confirm. 
  - If they aren't ready to pay, a message will be displayed from the girl and the user will return to the Store Navigation menu.
  - If they choose to pay, payment confirmation messages will print out, the girl will thank you and the program will exit. 

#### *Option 2. Second look around*
- If the user chooses option 2, a message from the girl will display and the user will be redirected back to the Store Navigation menu
#### *Options 3 & 4. Changed mind, want to leave*
- Only one of Option 3 and 4 is displayed on the screen depending on if cart is empty or not (3 when empty, 4 when not)
- If 3 is selected, a friendly message from the girl will print, she will say goodbye and the program will exit. 
- If 4 is selected, the girl will be passive aggressively frustrated with you because she has to sort your records. A message will display and the program will exit. 
#### *Option 5. Ask on a date*
- If the user decides to take the leap and ask the girl out (option 5), any 1 of 4 separate rejection messages will print out, and the user can then choose another counter menu option. 

# 4. User Interaction & Experience
> #### **How does the user finds out how to interact with each feature?**
The user interaction in AJ Records is purposefully straightforward, in order to mimic a real in-store experience. The user will find out how to interact with each of the four features after being directly prompted by the program at various points by displaying multiple choice menus.

#### **Accessing Feature 1: Store Navigation:**
![Entering AJ Records, Displaying Feature 1: Store Navigation](./docs/AppScreenshots/AccessingStoreNavigation.gif "Entering AJ Records, Displaying Feature 1: Store Navigation")

#### **Accessing Feature 2: Product Search Filter:**
![Displaying Feature 2: Product Search Filter](./docs/AppScreenshots/AccessingProductFilterSearch.gif "Displaying Feature 2: Product Search Filter")

#### **Accessing Feature 3: Cart:**
![Displaying Feature 3: Cart](./docs/AppScreenshots/AccessingCart.gif "Displaying Feature 3: Cart")

#### **Accessing Feature 4: Checkout:**
![Displaying Feature 4: Checkout](./docs/AppScreenshots/AccessingCheckout.gif "Displaying Feature 4: Checkout")

> ### **How does the user interacts with features?**

### **Interacting with Feature 1: Store Navigation**
The menu is the point of convergence for the program. It is returned to many times based on the user's decisions and input. The user simply scrolls through the menu items and selects which option they would like to explore. Depending on whether the user's cart is empty or not, the fourth option will display a slightly different choice and outcome (the girl at the counter is a little moody): 

#### *Exiting the store with an empty cart:*

![Feature 1: Store Navigation: Exiting with an empty cart](./docs/AppScreenshots/StoreNavigationExitWithEmptyCart.gif "Feature 1: Store Navigation: Exiting with an empty cart")

#### *Exiting the store and dumping records on the counter for the girl to sort:*

![Feature 1: Store Navigation: Exiting with items in cart](./docs/AppScreenshots/StoreNavigationExitWithoutEmptyCart.gif "Feature 1: Store Navigation: Exiting with items in cart")


### **Interacting with Feature 2: Product Filter Search**

#### *Genre/Album/Artist/Price search:* 
Users can select to search by genre/album/artist or price and then type some manual input to search through the store's stock and find a record to add to their cart.


![Feature 2: Product Filter Search (Genre/Artist/Album/Price)](./docs/AppScreenshots/ProductFilterSearchAllOptions.gif "Feature 2: Product Filter Search (All Genre/Artist/Album/Price)")

### **Interacting with Feature 3: Cart**
As shown above, users are prompted to add items to cart after they have searched successfully (i.e. it has returned results). They can review their cart and remove items by catalogue number. 
![Feature 3: Cart - Remove item](./docs/AppScreenshots/CartRemoveItem.gif "Feature 3: Cart - Remove item")

### **Interacting with Feature 4: Checkout**
Users are able to select from four different options at the counter:

#### *1. Go ahead and pay*
This will print cart summary in a table, and user can either select YES (to confirm, pay and exit) or NO (redirected to Store Navigation menu, as shown here:
![Feature 4: Checkout - Pay](./docs/AppScreenshots/CheckoutPayOptions.gif "Feature 4: Checkout - Pay")

#### *2. Keep looking around*
Redirect user to Store Navigation menu
![Feature 4: Checkout - Keep looking around](./docs/AppScreenshots/CheckoutKeepLooking.gif "Feature 4: Checkout - Keep looking around")

#### *3. Leave store*
Two separate options are displayed, depending if the user's cart is empty or not. If empty: 
![Feature 4: Checkout - Leave (empty cart)](./docs/AppScreenshots/CheckoutLeaveWithEmptyCart.gif "Feature 4: Checkout - Leave (empty cart)")

If not empty (she REALLY doesn't like sorting): 
![Feature 4: Checkout - Leave (empty cart)](./docs/AppScreenshots/CheckoutLeaveWithItemsInCart.gif "Feature 4: Checkout - Leave (empty cart)")

#### *4. Ask the girl out*
If you ask the girl out, it will randomly choose between 4 different rejection interactions, and then display the counter menu again.

![Feature 4: Checkout - Ask her out](./docs/AppScreenshots/CheckoutAskGirlOut.gif "Feature 4: Checkout - Ask her out")

> #### **How are errors handled by the app and displayed to user?**

Given the nature of this app being dependent on user input, error handling is paramount. The program has been designed to cater for all possible invalid inputs/errors, and assists the user by letting them know the nature of the error and displaying a helpful message so they can try again. 

#### *When adding items to cart*
If the catalogue number doesn't match any of the records in stock, it will display an error, tell the user that catalogue numbers are between 1 and 498, and let them try again. Additionally, "Invalid input" is printed if the user doesn't answer Y/n to the "Should I add anything prompt".

![Feature 2: Product Filter Search Error Handling (Invalid Cat number)](./docs/AppScreenshots/ProductFilterSearchInvalidCatNumber.gif "Feature 2: Product Filter Search Error Handling (Invalid Cat number)")

#### *When searching for records*
If the user's search yields no results, it displays a an error and a helpful hint to the use and lets them try again. For keyword searches (genre/artist/album) it displays a few example searches. For price searches it tells the user that no record is less than $40.


![Feature 2: Product Filter Search Error Handling (Input not found)](./docs/AppScreenshots/ProductFilterSearchInvalidSearches.gif "Feature 2: Product Filter Search Error Handling (Input not found)")

If the user simply hits enter (i.e. an empty string), the program will run a message hinting that they need to type something, and wait for the user to retry input. 
![Feature 2: Product Filter Search Error Handling (Search is empty)](./docs/AppScreenshots/ProductFilterSearchEmptyString.gif "Feature 2: Product Filter Search Error Handling (Search is empty)")


#### *When removing items from cart*
If user types invalid input in response to "Should I put anything back", "Invalid input" will print and they will be asked for input again. 
If the user types an invalid catalogue number or hits enter, "INVALID CAT NO" will display, with a help message noting that cat numbers are in magenta. 

![Feature 3: Cart Error Handling (Invalid input)](./docs/AppScreenshots/CartRemoveItemInvalidInput.gif "Feature 3: Cart Error Handling (Invalid input)")

# 5. Implementation
To keep track of the design and implementation process, I used Trello. Click [here](https://trello.com/b/gAYhSMJx/t1a3-terminal-app) to see my full board. Here are a few screenshots of it throughout the week.

Feature 1

![Feature 1: Trello](./docs/TrelloScreenshots/Feature1.png "Feature 1: Trello")

Feature 2

![Feature 2: Trello](./docs/TrelloScreenshots/Feature2.png "Feature 2: Trello")

Feature 3

![Feature 3: Trello](./docs/TrelloScreenshots/Feature3.png "Feature 3: Trello")

Feature 4

![Feature 4: Trello](./docs/TrelloScreenshots/Feature4.png "Feature 4: Trello")

Early On

![Early: Trello](./docs/TrelloScreenshots/EarlyOn.png "Early: Trello")

In Progress

![WIP: Trello](./docs/TrelloScreenshots/InProgress1.png "WIP: Trello")

More Progress

![WIP: Trello](./docs/TrelloScreenshots/InProgress2.png "WIP: Trello")

Currently
![Currently: Trello](./docs/TrelloScreenshots/Currently.png "Currently: Trello")

# 6. Control Flow Diagram

![Control flow diagram](./docs/AppScreenshots/ControlFlowDiagram.png "Control Flow Diagram")

Full size diagram located here:
> `./docs/ControlFlowDiagram.png`

# 7. Testing
Manual testing was performed throughout the development process. The testing spreadsheet can be found here:
>`./docs/ManualTesting.pdf`

# 8. References

Associated Ruby gems
- [colorize](https://rubygems.org/gems/colorize/versions/0.8.1)

- [artii](https://rubygems.org/gems/artii/versions/2.1.2)

- [tty-prompt](https://github.com/piotrmurach/tty-prompt)

- [ruby-progressbar](https://github.com/jfelchner/ruby-progressbar)

- [json](https://rubygems.org/gems/json/versions/2.5.1)

- [terminal-table](https://github.com/tj/terminal-table)

- [bundler](https://rubygems.org/gems/bundler)

- [tty-box](https://github.com/piotrmurach/tty-box)

- [require_all](https://github.com/jarmo/require_all)
