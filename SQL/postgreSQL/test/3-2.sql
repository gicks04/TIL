-- 장르별 상위 3개 아티스트 및 트랙 수
WITH genre_album AS (
    SELECT
        g.genre_id,
        g.name AS 장르명,
        t.album_id,
        COUNT(t.track_id) AS 장르별트랙수
    FROM genres g
    JOIN tracks t ON g.genre_id = t.genre_id
    GROUP BY g.genre_id, g.name, t.album_id
),
genre_artist AS (
    SELECT
        ga.장르명,
        a.artist_id,
        SUM(ga.장르별트랙수) AS 총트랙수
    FROM genre_album ga
    JOIN albums a ON a.album_id = ga.album_id
    GROUP BY ga.장르명, a.artist_id
),
ranked_artist AS (
    SELECT
        ga.장르명,
        ga.artist_id,
        ga.총트랙수,
        RANK() OVER (PARTITION BY ga.장르명 ORDER BY ga.총트랙수 DESC, ar.name ASC) AS 순위
    FROM genre_artist ga
	join artists ar on ar.artist_id = ga.artist_id
)
SELECT
    ra.장르명,
    ar.name AS 아티스트명
FROM ranked_artist ra
JOIN artists ar ON ar.artist_id = ra.artist_id
WHERE ra.순위 <= 3
ORDER BY ra.장르명, ra.순위;