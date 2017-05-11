# Steam API binding for Red and Red/System

Steam is a pioneering online gaming platform that provides the ability to distribute games and other content directly to a community of more than 25 million gamers around the world. 

Purpose of this project is to provide access to **Steam API**, which is part of the [Steamworks SDK](https://partner.steamgames.com/).

[Steam.reds](Steam.reds) is full low level API for **Red/System** made by parsing of Steam header files (SDK v1.39) with manual review.
[Steam.red](Steam.red) is minimal binding for **Red** level and could be used as a starting point for more complex work. 

Current test files are only basic console applications, which prints some info (must be compiled!). To get the info, you must also have **Steam** installed and running and get Steam's library file for your OS in the same location like compiled test executables. Red version now automatically creates `steam_appid.txt` file with Valve's sample game ID.

It's possible that more actual version could be found in [this standalone GitHub project](https://github.com/Oldes/Red-Steam).