@{
  RepoName = 'ArchitectJourney'

  # Folders that must exist for the repo to be considered structurally healthy.
  ExpectedFolders = @(
    'src\01_Reference'
    'src\02_Learning'
    'src\03_Interview-Prep'
    'docs'
    'tools\psscripts'
  )

  # Roots (relative to repo root) where YAML/line-length checks should run.
  YamlCheckRoots = @(
    'src\01_Reference'
    'src\02_Learning'
    'src\03_Interview-Prep'
  )

  # Repo-specific policy toggles
  DisallowInterviewLanguage = $false
}
