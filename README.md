Captain's Mistress Workshop
===========================

###Introduction

During his long sea voyages, Captain Cook often retired to his cabin for long periods. The crew used to joke that he had a mistress hidden away. Soon they discovered that the Captain had simply been playing this game with the ship's scientist. Thus it came to be known as 'The Captain's Mistress’.

This repo contains an exercise for our ninth(?) workshop presented by me, David Andrews. This workshop is about teamwork and integration of much of our past workshop topics.

We have provided a repository which mimics the setup we used last time, so it should be familiar. The code to be created is found in the ``lib/`` directory, and we have supplied the beginning of unit tests in the ``spec/`` directory.

###Setup

Here are the steps to get you started with the repo. We assume, naturally, that you have a working development machine with Ruby 1.9 or better on it. At Ryatta Group we use rbenv, and so we've included some optional elements - just skip them if you're using rvm or are not versioning your Ruby.

```sh
% git clone git@github.com:k00ka/captains-mistress.git
% cd captains-mistress
% gem install bundler
Fetching: bundler-1.7.4.gem (100%)
Successfully installed bundler-1.7.4
1 gem installed
% bundle
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Installing rake 10.3.2
...
Using bundler 1.7.4
Your bundle is complete!
Use `bundle show [gemname]` to see where a bundled gem is installed.
```
######Note: if you use rbenv...
```sh
% rbenv rehash
```
You are (almost) there!

===
STOP HERE IF YOU ARE READING THIS BEFORE THE WORKSHOP
===

###Rules

1. The game consists of balls and a rack.  
1. There are 2 coloured sets of 21 balls each, coloured black and white.  
1. The rack has 7 channels (columns) and 6 rows.  
1. The rack is oriented vertically so that the balls create 7 stacks.  
1. Two players take turns dropping balls into the channels.  
1. A ball falls until it lands on top of the existing stack, or the bottom of the rack.  
1. Players cannot drop balls into channels that are full.  
1. The winner is the first player to create a line of four balls in any direction.  

###The game?

No, not Bejeweled.  
It's Connect Four!  
[see the deck for images]  

###From the very(!) high level here is what we need:

* The Game and 2 Players.  
* The Game entity manages  
** the game board  
** enforcing the rules (including flow of play), and  
** game state (including winning conditions).  
* The Player entity answers the question  
** what is your next move?
* The Player entity will want to ask questions about the game state in order to make decisions.  
** How do Players ask questions? Through an API!

###Divide and conquer

Split up into three teams:

1. Strategy Team 1  
1. Strategy Team 2  
1. Game Core Team  

###Plan for development

####Phase 1
> Game Core Team - use TDD to develop the game components  
> Strategy Team 1 & 2 - research play strategies  

####Phase 2
> All - work together to define the API  

####Phase 3
> Game Core Team - build the API  
> Strategy Team 1 & 2 - implement (several?) strategies  

####Phase 4
> All - pit players against each other and play!  


###Useful resources
####Game Core Team 
https://www.pivotaltracker.com/n/projects/1396446  

####Strategy Teams 
http://gizmodo.com/heres-how-to-win-every-time-at-connect-four-1474572099  
https://en.wikipedia.org/wiki/Connect_Four  


If you want to learn (more) about TDD, there are plenty of online resources. For a quick primer, you can review our blog post from the previous workshop: [http://www.ryatta.com/refactoring-in-context/] 

###To play:
```sh
% ruby play.rb
```
