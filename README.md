# redox-remote-euchre
A straight-forward Lua and Love2d app that enables the folks at Redxo to play euchre remotely, in our own way.

## Multiplayer support
The current plan for multiplayer support will be to host a game server using noobhub: https://github.com/Overtorment/NoobHub which is a node backend server.

## Testing the app / Development
Ensure you have love downloaded and setup: https://love2d.org/
And you'll want to alias to the full binary so you can run things like `love "<path to directory containing main.lua>"`
assuming you have the love.app in your app directory, you can use `alias love="/Applications/love.app/Contents/MacOS/love"` in your preferred shell file (.bash_profile, .zshrc, etc..)
