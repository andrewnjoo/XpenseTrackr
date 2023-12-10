edit credentials

```
EDITOR="code --wait" rails credentials:edit
```

db setup
```
rake db:setup
```

migrate

```
bin/rails db:migrate
```

interact with db
```
bin/rails console

article = Article.new(title: "Hello Rails", body: "I am on Rails!")

article.save

Article.find(1)

Article.all
```

inspect what routes are mapped with:
```
bin/rails routes
```

precompile css assets
```
rails assets:precompile
```

testing
```
bundle exec rspec
```

generate model
```
bin/rails generate model Article title:string body:text
```

generate controller
```
bin/rails generate controller Articles index --skip-routes
```

new rails
````
rails new blog --database=postgresql
```

check env
```
Rails c
Rails.env
```

run different env server
```
rails server -e development
```

---

## devise

generate views
```
rails generate devise:views
```