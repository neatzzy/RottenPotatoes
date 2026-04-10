# ER Diagram

```md
USER ||--o{ REVIEW : "has_many"
MOVIE ||--o{ REVIEW : "has_many"
MOVIE ||--o{ MOVIE_GENRE : "has_many"
GENRE ||--o{ MOVIE_GENRE : "has_many"
PERSON ||--o{ ROLE : "has_many"
MOVIE ||--o{ ROLE : "has_many"

    USER {
        int id PK
        string username
        string email
        string password_digest
        datetime created_at
        datetime updated_at
    }

    MOVIE {
        int id PK
        string title
        text synopsis
        date release_date
        int duration_minutes
        string poster_url
        datetime created_at
        datetime updated_at
    }

    REVIEW {
        int id PK
        int rating
        text body
        int user_id FK
        int movie_id FK
        datetime created_at
        datetime updated_at
    }

    PERSON {
        int id PK
        string name
        text bio
        date birth_date
        datetime created_at
        datetime updated_at
    }

    ROLE {
        int id PK
        string role_type "Ex: Actor, Director"
        string character_name
        int person_id FK
        int movie_id FK
        datetime created_at
        datetime updated_at
    }

    GENRE {
        int id PK
        string name
        datetime created_at
        datetime updated_at
    }

    MOVIE_GENRE {
        int movie_id FK
        int genre_id FK
    }
```
