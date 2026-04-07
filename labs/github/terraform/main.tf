# Create the repository

resource "github_repository" "terraform" {
  name        = "terraform-example-Julieta-MontoyaQuintero"
  description = "Updated repository description by Julieta Montoya Quintero" 
  visibility  = "public"

  auto_init = true

  has_issues      = true
  has_discussions = true
  has_wiki        = false  

  allow_merge_commit = true
  allow_squash_merge = true
  allow_rebase_merge = true

  topics = ["terraform", "infrastructure-as-code", "learning"]  
}

resource "github_branch_protection" "main" {
  repository_id = github_repository.terraform.node_id
  pattern       = "main"

  required_pull_request_reviews {
    required_approving_review_count = 2  # <-- increase required reviewers
  }
}