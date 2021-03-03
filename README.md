# Cased CLI User Impersonation example

This is an example application of using [Cased CLI](https://cased.com/cli) to add tamper proof approval workflows to user impersonation flows.

[Cased CLI](https://cased.com/cli) allows you to monitor usage, require peer approvals for sensitive operations, and receive intelligent alerts to suspicious activity.

![image](https://user-images.githubusercontent.com/79995/109850081-f828bf00-7c06-11eb-80e9-95bc4d1d9359.png)

## Setup

1. [Sign up](https://app.cased.com/signup) for Cased.
2. [Create a new](https://app.cased.com/cli/programs/new) Cased CLI program.
3. Grab the `GUARD_APPLICATION_KEY` from your program's settings.

## Integrating

_There is a [reference pull request](https://github.com/cased/cased-demo-user-impersonation/pull/2) you can use to integrate Cased CLI into your application._

1. Install the [cased-rails](https://github.com/cased/cased-rails) gem into your application:

```ruby
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.1.3'
gem 'cased-rails'
```

2. Mount the Rails engine in your routes:

```ruby
Rails.application.routes.draw do
  mount Cased::Rails::Engine => '/cased'

  root to: 'home#show'
end
```

3. You can add approval workflows, require a reason, or just record that something happend in your Rails application by adding a `before_action :guard` to your action:

```ruby
class SessionsController < ApplicationController
  before_action :require_current_user, only: %i[impersonate destroy]
  before_action :require_no_current_user, only: :create
  before_action :guard, only: :impersonate

  def create
    self.current_user = User.find(params[:user_id])
  end

  def impersonate
    self.current_user = User.find(params[:user_id])
  end

  def destroy
    cookies.clear
    redirect_to root_path
  end
end
```

4. Start your server:

```sh
$ GUARD_APPLICATION_KEY=guard_application_1pG43CjBKeRS9vPmnB9vN70be7g rails server
```

5. Trigger your action:

![image](https://user-images.githubusercontent.com/79995/109853581-e2b59400-7c0a-11eb-9127-16db7428336c.png)
