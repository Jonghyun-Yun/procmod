run-drafts: ## Run in development mode (include content marked as drafts)
	hugo serve -D

deploy-docs: ## Build the site
	hugo -t hugo-theme-learn -d public --gc --minify --cleanDestinationDir && sh deploy.sh

run-docs: ## enables full re-renders on changes
	hugo server --disableFastRender
