
rails g model article name author content:text
rails g model comment author url content:text article:references

rails g controller articles index show new edit
rails g controller comments new edit

 
 
