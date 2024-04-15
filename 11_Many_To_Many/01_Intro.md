# Many to Many Intro

Many to many joins are another type of join, some examples of these joins are

Students - Classes 
Many students at a university, connected to many classes 

Blog posts - Tags 
Many blog posts connected to many different tags 

Books - Authors
Many books connected to multiple authors 

Imagine building a tv review application, the key idea is we can have watchers / users, different tv shows, and reviews for each show

We would would need three tables users, shows, reviews in what's known as a Join Table or Union Table

The schemas might look like: 

Reviewers
id
first_name
last_name

Series
id
title
released_year
genre 

Reviews
id
Rating
series_id
reviewer_id

So imagine we want to output reviews on our app, how would we ensure these tables are connected, and when a user views a movie, all the reviews are displayed

We'd need some foreign keys set up, for reviews table, the series_id would link to the id from the series table

And the reviewer_id is the foreign key linked to the Reviewers id

So the Reviews table acts as sort've connection between Reviewers and Series, Reviewers and Series are not directly linked but indirectly through the reviews table