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

    if user_signed_in? && current_user.indi?
      @users = MyStack.select("b.user_id as id, COUNT(b.stack_id) as cnt")
              .joins("INNER JOIN my_stacks b ON my_stacks.stack_id = b.stack_id")
              .where("my_stacks.user_id is not b.user_id AND my_stacks.user_id = #{current_user.id}")
              .group("b.user_id")
              .order("cnt DESC limit 1")
    end

    #모델파일에서 validates_uniqueness_of
    #migrate파일에서 :unique => true

    # select b.user_id as B, count(a.stack_id) as cnt
    # from my_stacks a
    # inner join my_stacks b
    # on a.stack_id = b.stack_id
    # where a.user_id is not b.user_id and a.user_id = 1
    # group by b.user_id
    # order by cnt DESC
    # limit 1;

    # @users = MyStack.select()
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
