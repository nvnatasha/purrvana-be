class CatSerializer

    def self.format_cats(cats)
        {
            data: cats.map do |cat|
                {
                    id: cat.id.to_s,
                    type: 'cat',
                    attributes: {
                        name: cat.name,
                        mood: cat.mood,
                        purr_style: cat.purr_style,
                        img_url: cat.img_url
                        purr_sound_url: cat.purr_sound_url
                    }
                }
            end
        }
    end

    def self.format_cat(cat)
        {
            data:
            {
                id: cat.id.to_s,
                type: 'cat',
                attributes: {
                    name: cat.name,
                    mood: cat.mood,
                    purr_style: cat.purr_style,
                    img_url: cat.img_url
                    purr_sound_url: cat.purr_sound_url
                }
            }
        }
    end
end