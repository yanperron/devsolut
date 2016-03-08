class Agency < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :quotes


  after_create :enrich_github


  def short_description
    "#{self.description[0..140]} ..."
  end


  private

  def enrich_github
    if self.github_account
      GithubEnrichmentJob.perform_now(self.id)
    end
  end

end
