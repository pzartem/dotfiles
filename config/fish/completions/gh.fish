
function __fish_gh_no_subcommand --description 'Test if gh has yet to be given the subcommand'
	for i in (commandline -opc)
		if contains -- $i completion config issue pr repo
			return 1
		end
	end
	return 0
end
function __fish_gh_seen_subcommand_path --description 'Test whether the full path of subcommands is the current path'
	  set -l cmd (commandline -opc)
	  set -e cmd[1]
    set -l pattern (string replace -a " " ".+" "$argv")
    string match -r "$pattern" (string trim -- "$cmd")
end
# borrowed from current fish-shell master, since it is not in current 2.7.1 release
function __fish_seen_argument
	argparse 's/short=+' 'l/long=+' -- $argv
	set cmd (commandline -co)
	set -e cmd[1]
	for t in $cmd
		for s in $_flag_s
			if string match -qr "^-[A-z0-9]*"$s"[A-z0-9]*\$" -- $t
				return 0
			end
		end
		for l in $_flag_l
			if string match -q -- "--$l" $t
				return 0
			end
		end
	end
	return 1
end
complete -c gh -f -n '__fish_gh_no_subcommand; and not __fish_seen_argument -l version' -a completion -d 'Generate shell completion scripts'
complete -c gh -f -n '__fish_gh_no_subcommand; and not __fish_seen_argument -l version' -a config -d 'Set and get gh settings'
complete -c gh -f -n '__fish_gh_no_subcommand; and not __fish_seen_argument -l version' -a issue -d 'Create and view issues'
complete -c gh -f -n '__fish_gh_no_subcommand; and not __fish_seen_argument -l version' -a pr -d 'Create, view, and checkout pull requests'
complete -c gh -f -n '__fish_gh_no_subcommand; and not __fish_seen_argument -l version' -a repo -d 'Create, clone, fork, and view repositories'
complete -c gh -f -n '__fish_gh_no_subcommand'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_no_subcommand' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_no_subcommand'   -l version -d 'Show gh version'
complete -c gh -f -n '__fish_gh_seen_subcommand_path completion' -r -s s -l shell -d 'Shell type: {bash|zsh|fish|powershell}'
complete -c gh -f -n '__fish_gh_seen_subcommand_path completion'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path completion' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path config' -a get -d 'Prints the value of a given configuration key.'
complete -c gh -f -n '__fish_gh_seen_subcommand_path config' -a set -d 'Updates configuration with the value of a given key.'
complete -c gh -f -n '__fish_gh_seen_subcommand_path config'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path config' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path config get'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path config get' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path config set'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path config set' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue' -a create -d 'Create a new issue'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue' -a list -d 'List and filter issues in this repository'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue' -a status -d 'Show status of relevant issues'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue' -a view -d 'View an issue'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue create' -r -s b -l body -d 'Supply a body. Will prompt for one otherwise.'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue create' -r -s t -l title -d 'Supply a title. Will prompt for one otherwise.'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue create'  -s w -l web -d 'Open the browser to create an issue'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue create'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue create' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue list' -r -s a -l assignee -d 'Filter by assignee'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue list' -r -s A -l author -d 'Filter by author'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue list' -r -s l -l label -d 'Filter by label'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue list' -r -s L -l limit -d 'Maximum number of issues to fetch'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue list' -r -s s -l state -d 'Filter by state: {open|closed|all}'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue list'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue list' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue status'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue status' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue view'  -s w -l web -d 'Open an issue in the browser'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue view'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path issue view' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr' -a checkout -d 'Check out a pull request in Git'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr' -a create -d 'Create a pull request'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr' -a list -d 'List and filter pull requests in this repository'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr' -a status -d 'Show status of relevant pull requests'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr' -a view -d 'View a pull request'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr checkout'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr checkout' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr create' -r -s B -l base -d 'The branch into which you want your code merged'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr create' -r -s b -l body -d 'Supply a body. Will prompt for one otherwise.'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr create'  -s d -l draft -d 'Mark pull request as a draft'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr create'  -s f -l fill -d 'Do not prompt for title/body and just use commit info'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr create' -r -s t -l title -d 'Supply a title. Will prompt for one otherwise.'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr create'  -s w -l web -d 'Open the web browser to create a pull request'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr create'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr create' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr list' -r -s a -l assignee -d 'Filter by assignee'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr list' -r -s B -l base -d 'Filter by base branch'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr list' -r -s l -l label -d 'Filter by label'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr list' -r -s L -l limit -d 'Maximum number of items to fetch'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr list' -r -s s -l state -d 'Filter by state: {open|closed|merged|all}'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr list'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr list' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr status'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr status' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr view'  -s w -l web -d 'Open a pull request in the browser'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr view'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path pr view' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo' -a clone -d 'Clone a repository locally'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo' -a create -d 'Create a new repository'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo' -a fork -d 'Create a fork of a repository'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo' -a view -d 'View a repository'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo clone'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo clone' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo create' -r -s d -l description -d 'Description of repository'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo create'   -l enable-issues -d 'Enable issues in the new repository'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo create'   -l enable-wiki -d 'Enable wiki in the new repository'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo create' -r -s h -l homepage -d 'Repository home page URL'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo create'   -l public -d 'Make the new repository public'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo create' -r -s t -l team -d 'The name of the organization team to be granted access'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo create'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo create' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo fork' -r  -l clone -d 'Clone fork: {true|false|prompt}'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo fork' -r  -l remote -d 'Add remote for fork: {true|false|prompt}'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo fork'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo fork' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo view'  -s w -l web -d 'Open a repository in the browser'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo view'   -l help -d 'Show help for command'
complete -c gh -f -n '__fish_gh_seen_subcommand_path repo view' -r -s R -l repo -d 'Select another repository using the `OWNER/REPO` format'
