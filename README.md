# bender_is_great_application

Application challenge time!  Here at DocNetwork, we (mainly Pat) has a love for
Futurama and all of Bender's glory.  This cookbook is designed to test your
knowledge of automation practices using Chef as your system's provisioner, and
if you're not familiar with Chef, do not worry!  This cookbook is designed to be
straight-forward and educational.  All Chef docs can be found at
https://www.chef.io/

![bender](https://www.reactiongifs.us/wp-content/uploads/2016/04/remember_me_futurama.gif)

Here is what you'll need to participate in this challenge:

- ChefDK:  https://downloads.chef.io/chefdk
- Vagrant: https://www.vagrantup.com/downloads.html
- VirtualBox: https://www.virtualbox.org/wiki/Downloads

#### Challenge:
This cookbook lacks a fundamental part of Chef functionality, which is
_idempotency_.  What does this mean, exactly?  Essentially, Chef should only need to
run a resource once to verify/install your desired package, configuration, etc
is in a desired state.  If the resource is in its desired state, then there is
no need to touch it again.  Chef is great for this process.  Typically, running
an installation script will likely run through the entire script.  This is okay,
but it can be vastly improved.

All resources are set as `execute` resources, which Chef will run every time.
As stated in the paragraph above, this is not a "best practice" for effective and
fast provisioning.  We would like you to go through each resource and find a way
to rebuild these resources with idempotent functionality.  Here's an example:

```
# Create a user

# Bash command:
sudo useradd -u 1234 -m /home/username -s /bin/bash username

# Chef resource:
user 'username' do
  comment 'My default user'
  uid     '1234'
  home    '/home/username'
  shell   '/bin/bash'
end
```

Resource documentation can be found here: https://docs.chef.io/resource_reference.html.

To get started, `cd` into this cookbook directory and run `kitchen converge`.  After the first run
is completed, you should be able to see your webserver's page at `localhost:8080`.  

Commands to note:

- `kitchen converge`: Creates a VM and installs what's inside your cookbook.  Also used to apply cookbook changes to current VM.
- `kitchen destroy`: Destroys the VM.
- `kitchen login`: SSH into VM managed by cookbook.

There are a lot of different resources available, but don't fret over them.  We
will be focusing on the simpler parts of Chef to grasp these concepts. Resources
To start, I advise looking into `user`, `group`, `apt_package`, and `template` resources.

#### BONUS!

Bonus!  There are a few additional challenges you can complete
with this cookbook to help increase your knowledge.  It isn't mandatory, but will
be recognized if the extra effort is put forward.  There will be further
instructions as you approach different BONUS challenges inside this cookbook.

- Change resource values into attributes for Chef to reference.
  - https://docs.chef.io/attributes.html
- Create multiple recipes for Chef to use to install your web service.
  - https://docs.chef.io/recipes.html
  - https://docs.chef.io/run_lists.html
- Write unit tests for your cookbook using ChefSpec in ./spec/unit/recipes/recipe_name_spec.rb
  - https://github.com/chefspec/chefspec
