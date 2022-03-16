# Rotomdex

After hearing that Swift Playgrounds could publish apps directly to the AppStore, I was intrigued to try that out.  So I downloaded Playgrounds to my iPad and started trying to build something.  I wanted something fairly straightforward but something that would still give me a chance to try out different UIs.  So as a first go, I decided to try a riff on a Pokedex - which my kids have been playing a lot of lately.

## Assets
One important thing for something like this is assets.  I was able to find a few repos that provided a collection of assets. [This repo](https://github.com/fanzeyi/pokemon.json) in particular ended up being my starting spot as the assets were all named to correspond to an ID which made lookups easier.  It was missing about 100 or so which I added to my project from various locations.

## Data
In addition to assets, I needed a data set to show.  There's a really popular [API](https://pokeapi.co/) that can be queried for all sorts of information, but since this was going to be used primarily for my kids on their iPads, I didn't want them to have to rely on an internet connection to make it work.  So opted to try and find a DB of some kind I could embed in my app.

I found [this repo](https://github.com/Purukitto/pokemon-data.json) which has a complete JSON file of all types along with some solid metadata attached that looked like it could give me chances to play with different UIs.  I cleaned up the file by removing translations I wouldn't be using to try and reduce the file size.  One thing I've come to realize is that Swift Playgrounds is not a fan of large files or a large amount of files.

## Playgrounds
Nice Things:
* The feedback loop was nice.  
* Making a change and seeing it reflect on the simulator on the iPad is a nice cycle.  

Not So Nice Things:
* I'm using a 9.7" iPad that's a few years old and it was really slow.  There were lots of instances where I had to force close Playgrounds and re-open it to force it to recompile changes. 
* Autosave didn't always work.  When I'd have to run a force close as mentioned above, there were times I re-opened the app and I was missing changes from a minute or two prior.  That would be beyond frustrating if this was anything more than a toy app. 

Maybe it's more seamless on an iPad Pro ¯\\_(ツ)_/¯

## Final Thoughts
* Out of the box Git integration would have been nice.  For now, Airdropping the .swiftpm file gets the job done for me. 

* Swift Playgrounds was kind of neat - maybe oversold a bit at this stage.  While you could deploy to the AppStore from your iPad, I have yet to find anywhere to set low-level project settings that you'd typically see.  SO if you stay ont he rails, it's probably fine but I'm not sure this could be used for 

* The touch-friendly interface for building an app is cool - albeit cumbersome.  A mouse and keyboard would probably make the experience a lot nicer, but since I don't have either of those, doing it all on the touchscreen made me want to jump off a bridge sometimes.

* Uploading to the AppStore from an iPad basically works as advertised.  It was super low-friction to get my app into TestFlight all from my iPad which was a surprised.

* I never saw a project.pbxproj file, which made my day because that file was the bane of my existence in a past life. 🎉🎉🎉