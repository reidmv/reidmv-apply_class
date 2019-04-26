plan apply_class (
  TargetSpec $nodes,
  String[1]  $classname,
) {

  $nodes.apply_prep()

  $results = apply($nodes) {
    include($classname)
  }

  $results.apply_class::print_result()

  return($results.ok())
}
