run-docs: ## Run in development mode
	hugo serve -D

docs: ## Build the site
	hugo -t hugo-theme-learn -d public --gc --minify --cleanDestinationDir && sh deploy.sh
