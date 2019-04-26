plan apply_class (
  TargetSpec $nodes,
  String[1]  $classname,
) {

  $result = apply($nodes) {
    include($classname)
  }

  apply_class::print_result($result)

  return($result.ok())
}
