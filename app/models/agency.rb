class Agency < ApplicationRecord

  mount_uploader :photo, PhotoUploader

  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :quotes


  after_create :enrich_github



  def review_mean
   if self.reviews.length == 0
      0
    else
      sum = self.reviews.reduce(0){|memo, review| memo+=review.star}
      sum.fdiv(self.reviews.count)
   end
  end




  def short_description
    "#{self.description[0..140]} ..." unless self.description.nil?
  end


  private

  def enrich_github
    if self.github_account
      GithubEnrichmentJob.perform_now(self.id)
    end
  end




end
