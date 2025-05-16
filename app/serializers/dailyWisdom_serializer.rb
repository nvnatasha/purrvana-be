class DailyWisdomSerializer

    def self.format_wisdoms(wisdoms)
        {
            data: wisdoms.map do |wisdom|
                {
                    id: wisdom.id.to_s,
                    type: 'wisdom',
                    attributes: {
                        quote: wisdom.quote
                    }
                }
            end
        }
    end

    def self.format_wisdom(wisdom)
        {
            data:
                {
                    id: wisdom.id.to_s,
                    type: 'wisdom',
                    attributes: {
                        quote: wisdom.quote
                    }
                }
        }
    end
end