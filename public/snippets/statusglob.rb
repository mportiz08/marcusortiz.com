
def project
  @project = Project.new({
    :name   => "statusglob",
    :status => "pre-alpha"
  })
end