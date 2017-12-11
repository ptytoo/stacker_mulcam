class RankingController < ApplicationController
  def index

    @indi_users = User.select("users.nickname, COUNT(my_stacks.stack_id) stack_cnt")
                .joins("LEFT OUTER JOIN my_stacks ON users.id = my_stacks.user_id")
                .where(role: "indi")
                .group("my_stacks.user_id")
                .order("stack_cnt DESC")

    @services_cnt = Service.select("services.name, COUNT(service_stacks.stack_id) stack_cnt")
                .joins("LEFT OUTER JOIN service_stacks ON services.id = service_stacks.service_id")
                .group("service_stacks.service_id")
                .order("stack_cnt DESC limit 10")

    # select u.nickname, count(m.stack_id) cnt
    # from users as u join my_stacks as m
    # on u.id = m.user_id
    # where u.role = 'indi'
    # group by m.user_id
    # order by cnt desc;

    # @resources = Resource.select("resources.*, COUNT(votes.id) vote_count")
    #                  .joins("LEFT OUTER JOIN votes ON votes.votable_id = resources.id AND votes.votable_type = 'Resource'")
    #                  .where(language_id: "ruby")
    #                  .group("resources.id")
    #                  .order("vote_count DESC")

    # @resources = Resouce.select("resources.*, COUNT(votes.id) vote_count")
    #                 .joins(:votes)
    #                 .where(language_id: "ruby")
    #                 .group("resources.id")
    #                 .order("vote_count DESC")

  end

  def show
  end
end
