class UserCatSerializer

    def self.format_user_cats(user_cats)
        {
            data: user_cats.map do |user_cat|
                {
                    id: user_cat.id.to_s,
                    type: 'user_cat',
                    attributes: {
                        user: {
                            name: user_cat.user.name,
                            email: user_cat.user.email 
                            },
                        cat: {

                            name: user_cat.cat.name,
                            mood: user_cat.cat.mood,
                            purr_style: user_cat.cat.purr_style,
                            img_url: user_cat.cat.img_url
                            },
                        times_used: user_cat.times_used
                    }
                }
            end
        }
    end

    def self.format_user_cat(user_cat)
        {
            data:
                {
                    id: user_cat.id.to_s,
                    type: 'user_cat',
                    attributes: {
                        user: {
                            name: user_cat.user.name,
                            email: user_cat.user.email 
                        },
                        cat: {
                            name: user_cat.cat.name,
                            mood: user_cat.cat.mood,
                            purr_style: user_cat.cat.purr_style,
                            img_url: user_cat.cat.img_url
                        },
                        times_used: user_cat.times_used
                    }
                }
            end
        }
    end
end