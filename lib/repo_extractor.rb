class RepoExtractor
  USER = 'jmmastey'
  REPO = 'level_up_exercises'


  def retrieve_list_of_forks
    forks = []

    response = Github::Client::Repos::Forks.new.list(USER, REPO)

    response.each_page do |page|
      page.each do |fork_repo|
        forks << {
          fork_owner: fork_repo.owner.login,
          branch_url: fork_repo.branches_url,
          clone_url: fork_repo.clone_url
        }
      end
    end
    forks
  end

  def retrieve_list_of_pulls
    # Might be better to find last overlord PR
  end

end
