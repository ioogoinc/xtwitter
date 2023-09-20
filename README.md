# README

# Reasoning behind Practice-lab-1 modeling.


## Summary

Model Name: Practice-lab-1
Model Purpose: Represent things a business needs to remember in order to perform business processes, in this case represent the xtwitter's information structure that will be or had been implemented in a database.
Creation Date: 09/19/2023
Author: Melissa Pleitez

## Context

Problem Context: Adding support for the following features:
* Tweet Reply
* Bookmark
* Likes
* Quotes
* Retweets
* Followers
  
Justification for the Model: The definition of the Active Record Models, Migrations, Associations to create a Twitter database model.

# Model Architecture

## Diagrams

## Entity-Relationship Diagram (ERD)

Description: We have the following tables: USERS, TWEETS, FOLLOWERS, LIKES, BOOKMARKS and REPLIES.
Your relationships:
USERS and TWEETS: They have a One-to-many relationship, since an user can have many tweets, and many tweets can belong to one user.

FOLLOWERS and USERS: They have a One-to-many relationship too, through the IDs: follower_id and followee_id, we can say that a user can have many followers and many followers can follow one user and one user can followe many users.
 
LIKES, USERS and TWEETS: The same with this association, an user can like many tweets and many likes can be from one user, the same with the tweets table.

BOOKMARKS, USERS and TWEETS: They have an One-to-many relationship too, since an user can bookmark many tweets and many bookmarks can be from one user, the same with the tweets table.

REPLIES, USERS and TWEETS: They have an One-to-many relationship too, since an user can reply many tweets and many replies can be from one user, the same with the tweets table.

HASHTAGS, TWEETS AND JOIN_TABLE: Hashtags and Tweets have a Many-to-many relationship, for that reason we create a JOIN TABLE or a PIVOT TABLE, since this table summarizing and organizing large amounts of data from the other two.


## System Architecture Diagram

Purpose: Normalizes the tables and associations to perform business processes.

Components:
* Users
* Tweets
* Follows
* Likes
* Bookmarks
* Replies
* Hashtags
* Hashtags_tweets (Pivot Table).


![Xtwitter_Project](https://github.com/MelissaPleitez/Info/assets/92410851/97807db1-8c7b-4e72-9271-329eebf44655)