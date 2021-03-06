<div class="githubhyperstackheader">

<p align="center">

<a href="http://ruby-hyperstack.io/" alt="Hyperstack" title="Hyperstack">
<img width="350px" src="http://ruby-hyperstack.io/images/hyperstack-github-logo.png">
</a>

</p>

<h2 align="center">The Complete Isomorphic Ruby Framework</h2>

<br>

<a href="http://ruby-hyperstack.io/" alt="Hyperstack" title="Hyperstack">
<img src="http://ruby-hyperstack.io/images/githubhyperstackbadge.png">
</a>

<a href="https://gitter.im/ruby-hyperstack/chat" alt="Gitter chat" title="Gitter chat">
<img src="http://ruby-hyperstack.io/images/githubgitterbadge.png">
</a>

[![Build Status](https://travis-ci.org/ruby-hyperstack/hyper-store.svg?branch=master)](https://travis-ci.org/ruby-hyperstack/hyper-store)
[![Codeship Status for ruby-hyperstack/hyper-store](https://app.codeship.com/projects/4454c560-d4ea-0134-7c96-362b4886dd22/status?branch=master)](https://app.codeship.com/projects/202301)
[![Gem Version](https://badge.fury.io/rb/hyper-store.svg)](https://badge.fury.io/rb/hyper-store)

<p align="center">
<img src="http://ruby-hyperstack.io/images/HyperStores.png" width="100" alt="Hyperstores">
</p>

</div>

## Hyper-Store GEM is part of Hyperstack GEMS family

Build interactive Web applications quickly. Hyperstack encourages rapid development with clean, pragmatic design. With developer productivity as our highest goal, Hyperstack takes care of much of the hassle of Web development, so you can focus on innovation and delivering end-user value.

One language. One model. One set of tests. The same business logic and domain models running on the clients and the server. Hyperstack is fully integrated with Rails and also gives you unfettered access to the complete universe of JavaScript libraries (including React) from within your Ruby code. Hyperstack lets you build beautiful interactive user interfaces in Ruby.

Everything has a place in our architecture. Components deliver interactive user experiences, Operations encapsulate business logic, Models magically synchronize data between clients and servers, Policies govern authorization and Stores hold local state. 

**Stores** are where the state of your Application lives. Anything but a completely static web page will have dynamic states that change because of user inputs, the passage of time, or other external events.

**Stores are Ruby classes that keep the dynamic parts of the state in special state variables**

## Getting Started

1. Update your Gemfile:
        
```ruby
#Gemfile

gem 'hyperstack'
```

2. At the command prompt, update your bundle :

        $ bundle update

3. Run the hyperstack install generator:

        $ rails g hyperstack:install

4. Follow the guidelines to start developing your application. You may find
   the following resources handy:
    * [Getting Started with Hyperstack](http://ruby-hyperstack.io/start/components/)
    * [Hyperstack Guides](http://ruby-hyperstack.io/docs/architecture)
    * [Hyperstack Tutorial](http://ruby-hyperstack.io/tutorials)

## Community

#### Getting Help
Please **do not post** usage questions to GitHub Issues. For these types of questions use our [Gitter chatroom](https://gitter.im/ruby-hyperstack/chat) or [StackOverflow](http://stackoverflow.com/questions/tagged/hyperstack).

#### Submitting Bugs and Enhancements
[GitHub Issues](https://github.com/ruby-hyperstack/hyperstack/issues) is for suggesting enhancements and reporting bugs. Before submiting a bug make sure you do the following:
* Check out our [contributing guide](https://github.com/ruby-hyperstack/hyperstack/blob/master/CONTRIBUTING.md) for info on our release cycle.

## License

Hyperstack is released under the [MIT License](http://www.opensource.org/licenses/MIT).
