#!/bin/bash

# Installing the 'vagrant-vbguest' plugin. This can take a few minutes...
# Bundler, the underlying system Vagrant uses to install plugins,
# reported an error. The error is shown below. These errors are usually
# caused by misconfigured plugin installations or transient network
# issues. The error from Bundler is:

# conflicting dependencies fog-core (~> 1.43.0) and fog-core (= 2.1.0)
#   Activated fog-core-2.1.0
#   which does not match conflicting dependency (~> 1.43.0)

#   Conflicting dependency chains:
#     fog-core (= 2.1.0), 2.1.0 activated

#   versus:
#     vagrant-libvirt (> 0), 0.0.41 activated, depends on
#     fog-core (~> 1.43.0)


# Ideally, it is just this:
# vagrant plugin install vagrant-vbguest  

# This is required if you see the error
VAGRANT_DISABLE_STRICT_DEPENDENCY_ENFORCEMENT=1 vagrant plugin install vagrant-vbguest  
