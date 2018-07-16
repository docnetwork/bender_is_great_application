### Templates

Templates are a great resource for creating custom configuration files for your
services.  I recommend reading into string interpolation and attributes if you
choose to use this Chef feature.  Without giving too much away, here is a small
example below:

Chef resource:

```
template '/etc/service/service.conf' do
  owner 'my_user'
  group 'my_group'
  source 'file.conf.erb'
  variables(
    user: 'my_user'  
  )
end
```

Template file:
```
service_user: <%= @user %>
```

We can pass values through templates for setting environments, paths, etc.  It's
a really nice feature to have, especially if you have multiple nodes using the
same cookbook, but with different configurations.  For more information:

https://docs.chef.io/resource_reference.html#template
