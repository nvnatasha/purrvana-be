class SessionSerializer
    def self.format_sessions(sessions)
        {
            data: sessions.map do |session|
                {
                    id: session.id.to_s,
                    type: 'session',
                    attributes: {
                        user_id: session.user_id,
                        cat_id: session.cat_id,
                        duration_seconds: session.duration_seconds,
                        started_at: session.started_at,
                        ended_at: session.ended_at
                    }
                }
            end
        }
    end

    def self.format_session(session)
        {
            data:
                {
                    id: session.id.to_s,
                    type: 'session',
                    attributes: {
                        user_id: session.user_id,
                        cat_id: session.cat_id,
                        duration_seconds: session.duration_seconds,
                        started_at: session.started_at,
                        ended_at: session.ended_at
                    }
                }
        }
    end
end