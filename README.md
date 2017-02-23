# Thug Lyfe 2000 (Terminal Chase Game using Emoji)

## Description

Thug Lyfe 2000 is a retro life-changing game - coming to reputable stores near you!  Right from the start, you are immersed in the game as a bank-robber! The local Sydney Police have been notified, are not happy with you and therefore are chasing after you! Your job is to get through Sydney by answering a few simple questions without being caught... and make your way onto a getaway helicopter!

## Installation instructions

Thug Lyfe 2000 is written in Ruby and must have it installed (Ruby 2.4 or higher).

1. Clone the repo.

2. Thug Lyfe 2000 uses ```bundler``` to install dependencies.
```
$ gem install bundler
$ bundler install
```
The ```bundler install``` command must be called in the root directory of the repo.

## Usage installation

To run the file in terminal: ```$ ruby index.rb```

## Design Journey/Process

The challenge of designing an engaging and educational game in Terminal excited us all!

The idea of an anxiety arousing quiz game came to mind with an original theme of vegetables. Players were to choose from an option of vegetables, which vegetable they disliked the most. Players then would be chased by the vegetable, with their only chance to get away dependant on getting the correct answers to a vegetable themed trivia. This was then to be complemented with the use of a timer to add the anxiety and excitement to go with the game.

To begin the design process, we did quite well to build together a strong list of user stories and developer stories. From this session, we were able to realise that the most important classes which we had to make were ‘Questions’, ‘Players’, ‘Computer’, ‘Animation’ and ‘Picture’. This allowed us to build a skeleton code for our program. So as a team, we split up and began creating the different Classes and debugging the resulting issues.

![alt tag](https://github.com/Firmanc/CFA-Thug-Lyfe/blob/master/images/classes.png)

With great progress on the ‘Questions’, ‘Players’ and ‘Computer’ classes - we now had to tackle the other two challenging classes of ‘Animation’ and ‘Picture’. The reason for us wanting to create these classes was so we could make our program more engaging and responsive. Hence we tried using Catpix as one of the gems as it allows you to produce any image available and to reproduce it on the Terminal. With some progress, we did manage to get a ‘carrot vegetable’ to go left to right, which was quite an achievement for the team.

![alt tag](https://github.com/Firmanc/CFA-Thug-Lyfe/blob/master/images/carrot.png)

Soon after we as a team decided against the gem Catpix because of its bug-prone build and how it was very time-consuming and inefficient for us as team. Hence, instead of pictures we decided to use ASCII/unicode based emoticons which are already included in the Ruby library. This made it easier for us to focus on the other issues of the program, like that of making the ‘vegetable’ move right or left depending on a situation. However, after deciding to use unicode emoticons and finding that there weren’t enough vegetables to our liking - we decided against the whole vegetable based game. We still figured out how to move a certain emoticon left or right etc, but now we needed a theme and a storyline to base the game around. It was essentially a pivot which we had to make.

![alt tag](https://github.com/Firmanc/CFA-Thug-Lyfe/blob/master/images/thuglife.png)

## Authors
Jess Ngo, Firman Cahyandi, Shouhei Yamauchi, Divij Mehra

Mentorship and insight was sought from Jamie, Peter and other peer students.

## Contact Info

Please contact our lawyers should you wish to invest billions onto our program.
