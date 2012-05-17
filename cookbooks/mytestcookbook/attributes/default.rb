default["mytestcookbook"]["attr_a"] = "default value"

case platform
when "redhat","centos","fedora","scientific","amazon","oracle"

when "chefspec"
  default["mytestcookbook"]["attr_os"] = "foo value"
end
