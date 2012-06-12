@user ||= locals[:object]
object @user
@ability = Ability.new(@user)
node :abilities do
  {
    signin:       @ability.can?(:create, :session), 
    signout:      @ability.can?(:destroy, :session),
    read_posts:   @ability.can?(:read, Post),
    manage_posts: @ability.can?(:manage, Post) 
  }
end
node(:roles) do
  @user.roles
end
