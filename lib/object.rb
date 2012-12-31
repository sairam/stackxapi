class Object
  def my_instance_methods
    self.class.instance_methods - self.class.superclass.instance_methods - [:my_instance_methods]
  end
end