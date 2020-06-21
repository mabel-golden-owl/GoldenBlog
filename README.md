# Assignment: Blog app

Making a full-featured blog application

#

1. Overview

- A blog site

- This site will allow user register and login with social accounts to write/share blogs (Facebook API, Instagram API(optional), Twitter API(optional))

- Use Bootstrap for site layout [http://getbootstrap.com/](http://getbootstrap.com/) Use this layout (or a same one): [https://github.com/BlackrockDigital/startbootstrap-clean-blog](https://github.com/BlackrockDigital/startbootstrap-clean-blog)​

#

2. Project/Source code management/Workflow

a. Use your personal account to create a new private project (GoldenBlog) on Github

b. Init the repository, dev, commit, push code to this repository.

c. Create at least 3 branches:

- master : for deploying on server

- develop: for developing

- feature-xxx: branch out from dev to develop new features

d. Create branch for each new features. After finish coding for each new feature, create a ""Pull request"" to ""Develop"" branch and assign @peter/@steward to review the code.

e. The code have to be approved before merge into master branch

#

3. Must-have feature

###

User management feature

`can use devise gem for this`

- Allow new user registration with email or social account (Facebook) [http://guides.rubyonrails.org/active_record_callbacks.html](http://guides.rubyonrails.org/active_record_callbacks.html)​

- Allow user to change their profile

###

Write new blog feature

- Allow registered user to post new items in a category

###

Blog display feature

- Display user's registered blogs in dashboard

- Display all bogs for all user or guest in index page

###

Rating and comment features

- Allow user to add rating star, like and share blog( the number of like, share is sum of the number in our website and social network if any)

- Allow user to add comment to blog

- Allow user to share blog to social networks

- Using jobs to get the number like and share of blog

###

Searching feature

- Allow user to search for a blog by category or specifying keyword

###

Blog on social network

- User can post their blog to both social networks and our website

- Customer can check the number of like and share in social network and our website

- When customer delete or edit blog in our website the post in social network will be synchronized

###

Top blogs feature

- Show top hostest blogs in day and week or month.

- Relate blogs base on category and interested blog

###

Mobile view

- Can view web site on mobile, using bootstrap responsive

###

Batch process (optional)

- Send mail for user when system have new blog, change or delete, using delay job or sidekiq to run it in background

- Send mail for user when Admin approved the blog

###

Blog management

- Admin can manage blog status (New, Approved, Rejected)

- Customer can check their blog status

#

4. System testing - Automation test

​[https://github.com/rspec/rspec-rails](https://github.com/rspec/rspec-rails)​

- Write RSpec for all Models - using gem shoulda-matchers [https://github.com/thoughtbot/shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)​

- Write Rspec for all Controllers [https://github.com/thoughtbot/factory_girl_rails](https://github.com/thoughtbot/factory_girl_rails)​

#

5. Deployment[](https://wiki.goldenowl.asia/developers/intern/training/assignment-1-blog-app#5-deployment)

Deploy your app to heroku

6. Project management

- Project code name : Goldenblog

- Use Github - Zenhub to manage project

7. System requirement

- Use Rails version 6.x

- Using PostgreSQL

- Github repository

- Use Bootstrap for layout, template

- Use Rubocop to check your coding style
