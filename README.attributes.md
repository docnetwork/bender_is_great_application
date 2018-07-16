### Attributes

Attributes offer Chef a very dynamic way of setting the state of your nodes.  
Attributes grant users a reliable way of modifying/setting variables, environments,
paths, etc.  Below is a small example:

In our `default.rb` attributes file:
```
default['cookbook_name']['apt_packages'] = ['vim', 'nano', 'wget']
```

Inside a recipe:
```
apt_package node['cookbook_name']['apt_packages'] do
  action :install
end
```

Chef will read the default attribute you have assigned to the Chef resource and
install the desired packages as described.  For more information about Attributes
inside of your cookbooks:

https://docs.chef.io/attributes.html
