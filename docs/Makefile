run-docs: ## Run in development mode (include drafts)
	hugo serve -D

docs: ## Build the site
	hugo -t hugo-theme-learn -d public --gc --minify --cleanDestinationDir && sh deploy.sh

build-server: ## Hugo server and browse
	hugo server --disableFastRender
