class Agency < ApplicationRecord
  belongs_to :user

  after_create :enrich_github


  private

  def enrich_github
    if self.github_account
      GithubEnrichmentJob.perform_now(self.id)
    end
  end


end
