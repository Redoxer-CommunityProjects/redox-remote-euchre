# redox-remote-euchre
A straight-forward Lua and Love2d app that enables the folks at Redox to play euchre remotely, in our own way.

## Why
A couple over-arching reasons compelled me to start this project:
1. We've regularly seen odd numbers of players for our remote euchre night, making it somewhat boring for the players that have to sit out for a particular game. Our current recommended web-app doesn't seem to support "viewing" a table. We can do better than that.
2. Ads - gross. Again - we can do better than that
3. a Redox-community project that ISN'T directly Redox work might be really cool!

Does it still seem unnecessary? Yea, maybe. But I want to push myself and really grow in my technical chops, so at the end of the day this project is bigger than just the end-product and problem it is designed to solve.

## Why Lua and Löve2d?
This one is slightly self-serving - I've been playing around with Lua and Löve2d for a few weeks, getting my wits about me trying to write a retro 2d game with a college buddy of mine. This is mostly born from me poking around here.

In my limited exposure so far, I think I can confidently articulate a couple non-selfish reasons why Lua and Löve2d will work well here:
1. simplicity. nothing extra. Löve2d is just that - a 2d game engine with networking and that's all we need. No need to mess around with more complex engines or languages.
2. Lua is a scripting language, so it might feel familiar to you already. It's widely used in tons of places and games already, so it's proven.
3. Löve2d has a strong community with awesome open source libraries available to help us move quickly and efficiently. Check out the [awesome guide](https://github.com/love2d-community/awesome-love2d)

## Interested in helping?
Awesome! If you haven't written in Lua before, check out [this link](http://tylerneylon.com/a/learn-lua/). I found it particularly helpful for getting me off the ground and writing quickly.

[Löve2d reference](https://love2d.org/wiki/Main_Page)

When you want to grab a to do, feel free to edit this readme and place your name in bold after the item you want to tackle so we can avoid duplicative work!

## Testing the app / Development
- get Lua installed. If you use homebrew, should be as easy as `brew install lua`!
- Ensure you have love downloaded and setup: https://love2d.org/
- Move the resulting `love.app` to your Applications directory
- add `alias love="/Applications/love.app/Contents/MacOS/love"` in your preferred shell file (.bash_profile, .zshrc, etc..)
- compiling and running from terminal will be `love "./"` if you're running directly with in the project folder `redox-remote-euchre` that should start up the game!

## Multiplayer support
The current plan for multiplayer support will be to host a game server using noobhub: https://github.com/Overtorment/NoobHub which is a node backend server. Likely on heroku as that has the lowest barrier to entry and is free

## To Do
### Core Logic
- [X] Game initiation, dealing 
- [ ] Bidding, setting trump **(Alex)**
- [ ] Trick playing (set the suit on led card, update indications in players' hands accordingly, etc..) **(Alex)**
- [ ] Hand clean-up, dealer movement
- [ ] trump indications
- [ ] suit indications
### Meta-game
- [ ] Main menu **(Alex)**
- [ ] setup table (generate table id, put somewhere for person to see)
- [ ] join table
### Networking
- [ ] Get noobhub running on heroku  **(Alex)**
- [ ] support setup table and join game from main menu
- [ ] support table viewing (yay!)
### Assets
- [ ] in-process table layout
- [ ] card backs should have R^ logo in our colors on them :)
### Nice-to-haves
- [ ] player config (coloring, card backs, etc...), persist
- [ ] general record ledger - tricks taken, sets, euchres, overall games won/lost per player
- [ ] Name Generator **(James)**
### Stuff to think through
- [ ] Should we have computer players for when we have 75% of table?
- [ ] Should we allow players to join multiple concurrent tables? (avoid writing computer player logic)
