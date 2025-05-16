class UserSerializer

    def self.format_users(users)
        {
            data: users.map do |user|
                {
                    id: user.id.to_s,
                    type: 'user',
                    attributes: {
                        name: user.name,
                        email: user.email,
                        cats: user.user_cats.includes(:cat).map do |user_cat|
                            {
                                name: user_cat.cat.name,
                                mood: user_cat.cat.mood,
                                purr_style: user_cat.cat.purr_style,
                                img_url: user_cat.cat.img_url
                            }
                        end,
                        sessions: user.sessions.map do |session|
                            {
                                duration_seconds: session.duration_seconds,
                                started_at: session.started_at
                            }
                        end
                    }
                }
            end
        }
    end

    def self.format_user(user)
        {
            data:{
                id: user.id.to_s,
                type: 'user',
                    attributes: {
                        name: user.name,
                        email: user.email,
                        cats: user.user_cats.includes(:cat).map do |user_cat|
                            {
                                name: user_cat.cat.name,
                                mood: user_cat.cat.mood,
                                purr_style: user_cat.cat.purr_style,
                                img_url: user_cat.cat.img_url
                            }
                        end,
                        sessions: user.sessions.map do |session|
                            {
                                duration_seconds: session.duration_seconds,
                                started_at: session.started_at
                            }
                        end
                    }
                }
            end
        }
    end
end