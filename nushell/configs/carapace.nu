def --env get-env [name] { $env | get $name }
def --env set-env [name, value] { load-env { $name: $value } }
def --env unset-env [name] { hide-env $name }

export-env {
  let uv_completer = {|spans|
    if ($spans | length) <= 2 and ($spans | last) == "" {
      [
        {value: "auth", description: "Manage authentication"}
        {value: "run", description: "Run a command or script"}
        {value: "init", description: "Create a new project"}
        {value: "add", description: "Add dependencies to the project"}
        {value: "remove", description: "Remove dependencies from the project"}
        {value: "version", description: "Read or update the project's version"}
        {value: "sync", description: "Update the project's environment"}
        {value: "lock", description: "Update the project's lockfile"}
        {value: "export", description: "Export the project's lockfile to an alternate format"}
        {value: "tree", description: "Display the project's dependency tree"}
        {value: "format", description: "Format Python code in the project"}
        {value: "tool", description: "Run and install commands provided by Python packages"}
        {value: "python", description: "Manage Python versions and installations"}
        {value: "pip", description: "Manage Python packages with a pip-compatible interface"}
        {value: "venv", description: "Create a virtual environment"}
      ]
    } else {
      []
    }
  }

  let carapace_completer = {|spans|
    # if the current command is an alias, get it's expansion
    let expanded_alias = (scope aliases | where name == $spans.0 | get -o 0 | get -o expansion)

    # overwrite
    let spans = (if $expanded_alias != null  {
      # put the first word of the expanded alias first in the span
      $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
    } else {
      $spans
    })

    carapace $spans.0 nushell ...$spans
    | from json
  }

  let external_completer = {|spans|
    let expanded_alias = (scope aliases | where name == $spans.0 | get -o 0 | get -o expansion)

    let spans = (if $expanded_alias != null  {
      # put the first word of the expanded alias first in the span
      $spans | skip 1 | prepend ($expanded_alias | split row " " | take 1)
    } else {
      $spans
    })

    match $spans.0 {
      uv => $uv_completer
      z => {|spans| null }  # Let nushell's native completer handle z command
      _ => $carapace_completer
    } | do $in $spans
  }

  mut current = (($env | default {} config).config | default {} completions)
  $current.completions = ($current.completions | default {} external)
  $current.completions.external = ($current.completions.external
  | default true enable
  | default { $external_completer } completer)

  $env.config = $current
}
