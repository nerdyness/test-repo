
.PHONY: git-deploy
git-deploy: ## Deploy dev -> test -> main branches
	@echo "Pulling latest changes..."
	git checkout dev && git pull && git push
	@echo "Merging dev -> test..."
	git checkout test && git pull && git merge dev -m "Deploy to test" && git push
	@echo "Merging test -> main..."
	git checkout main && git pull && git merge test -m "Deploy to prod" && git push
	git checkout dev
	@echo "Done! Currently on main branch."
