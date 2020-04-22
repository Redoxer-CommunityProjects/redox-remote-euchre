# redox-remote-euchre
A straight-forward Lua and Love2d app that enables the folks at Redox to play euchre remotely, in our own way.

## Multiplayer support
The current plan for multiplayer support will be to host a game server using noobhub: https://github.com/Overtorment/NoobHub which is a node backend server. Likely on heroku as that has the lowest barrier to entry and is free

## Testing the app / Development
- Ensure you have love downloaded and setup: https://love2d.org/
- You'll want to alias to the full binary so you can run things like `love "<path to directory containing main.lua>"`
- assuming you have the love.app in your app directory, you can use `alias love="/Applications/love.app/Contents/MacOS/love"` in your preferred shell file (.bash_profile, .zshrc, etc..)

## To Do
### Core Logic
- [] Game initiation, dealing
- [] Bidding, setting trump
- [] Trick playing
- [] Hand clean-up, dealer movement
### Meta-game
- [] Main menu (Alex)
- [] setup table
- [] join table
### Networking
- [] Get noobhub running on heroku
- [] support setup table and join game from main menu
- [] support table viewing (yay!)
### assets
- [] in-process table layout (Alex)
