
def project
  @project = Project.new({
    :name   => "statusglob",
    :status => "beta"
  })
end