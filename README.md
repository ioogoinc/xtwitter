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

# Architecture

## Diagrams

## Entity-Relationship Diagram (ERD)

Description: Represents the structure of the xtweet database create for The x Twitter clone. The relationships between them, providing a clear overview of how data is organized in the system.

Key Entities: 

Users: They are key entities as they represent the users who interact on the platform.

Tweets: They are key entities as they represent the content posted on the platform and are central to many interactions.

Follower Relationships (Follows): They are key entities as they represent the follow relationships between users, which are fundamental to the social experience on the platform.

Interactions (Likes, Bookmarks, Replies): These tables represent key interactions that users have with tweets and with each other.


## System Architecture Diagram

Purpose: Normalizes the tables and associations to perform business processes.

Components:
* Users: Stores information about registered users in the system. It has several columns, but the key components are:
id: The unique user ID (primary key).
name: The user's name.
username: The unique username.
email: The user's email address.

* Tweets: Stores information about tweets posted by users. The key components are:
id: The unique tweet ID (primary key).
body: The content of the tweet.
user_id: The ID of the user who posted the tweet.
retweet_id: A int indicating whether the tweet is a retweet.
quote_id: A int indicating whether the tweet is a quote.

* Follows: Stores information about follower relationships between users. It has three columns: follower_id, followee_id, and created_at. The key components are:
follower_id: The ID of the user who is following another.
followee_id: The ID of the user being followed.


* Likes: Stores information about "Like" interactions on tweets. The key components are:
id: The unique Like interaction ID (primary key).
user_id: The ID of the user who liked the tweet.
tweet_id: The ID of the tweet that received the Like.
  
* Bookmarks: Stores information about tweets that users have bookmarked as favorites. The key components are:
id: The unique bookmark ID (primary key).
user_id: The ID of the user who bookmarked the tweet.
tweet_id: The ID of the tweet that was bookmarked.
  
* Replies: Stores information about replies to tweets. The key components are:
id: The unique reply ID (primary key).
body: The content of the reply.
user_id: The ID of the user who replied.
tweet_id: The ID of the tweet to which the reply was made.
  
* Hashtags: Stores information about hashtags used in tweets. The key components are:
id: The unique hashtag ID (primary key).
name: The name of the hashtag.
  
* Hashtags_tweets (Pivot Table): This table is used to establish a relationship between hashtags and the tweets that use them. The key components are:
hashtag_id: The ID of the hashtag.
tweet_id: The ID of the tweet containing the hashtag.

Interactions: 
* Users can follow other users, which is recorded in the Follows table.
* Users can post tweets, which are recorded in the Tweets table.
* Tweets can receive "Likes" from users, which are recorded in the Likes table.
* Users can bookmark tweets as favorites, which are recorded in the Bookmarks table.
* Users can reply to tweets, which is recorded in the Replies table.
* Tweets can contain hashtags, which are recorded in the Hashtags table, and the relationship between tweets and hashtags is recorded in the Hashtags_tweets table.
  

![Xtwitter_Project](https://github.com/MelissaPleitez/Info/assets/92410851/97807db1-8c7b-4e72-9271-329eebf44655)
