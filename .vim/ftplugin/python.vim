let b:ale_python_auto_pipenv = 1

let b:ale_linters = ['flake8', 'mypy', 'pylint', 'pyls']
let b:ale_fixers = ['isort']
let b:ale_python_flake8_change_directory = 0
let b:ale_python_pylint_change_directory = 0


let b:ale_python_mypy_options = '--ignore-missing-imports'
let b:ale_python_pyls_config = {
						\ 'pyls': {
						\	'plugins': {
						\		'pylint': {
						\			'enabled': v:false
						\		}
						\	}
						\}
						\}
