require "open-uri"
require "json"


class GithubApiService

  GITHUB_URL = "https://api.github.com/orgs/:github_account:path"

  def initialize(github_account)
    @github_account = github_account
    @base_url = GITHUB_URL.gsub(/:github_account/, github_account)

    organisation_data()
    member_data()
    repos_data()

  end


  def repos_public
    public_repos = @organisation_data["public_repos"]
  end

  def total_stars
    stars = 0
    @repos_data.each do |repo|
      stars += repo['stargazers_count']
    end
    return stars
  end

  def total_members
    @member_data.count
  end



  private

  def organisation_data
    api_url = @base_url.gsub(/:path/, "")

    open(api_url) do |stream|
      @organisation_data = JSON.parse(stream.read)
    end
  end

  def member_data
    api_url = @base_url.gsub(/:path/, "/members")
    open(api_url) do |stream|
      @member_data = JSON.parse(stream.read)
    end
  end

  def repos_data
    api_url = @base_url.gsub(/:path/, "/repos")
    open(api_url) do |stream|
      @repos_data = JSON.parse(stream.read)
    end
  end

end
