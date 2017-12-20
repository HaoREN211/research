# Redshift - SQL script example
-- d_sequence is a sequence containing the numbers from 0 to 14.
"""
SELECT avg(nb_liked) as "nombre moyen de likes", 
        sum(nb_liked) as "nombre total de likes", 
        social_network_name as "réseau social", 
        json_field, count(json_field) as nombre, 
        creation_date as "date"
FROM (                                                                          
    SELECT social_network_name, 
      lower(replace(replace(JSON_EXTRACT_ARRAY_ELEMENT_TEXT(b_posts.tags, seq.i), '@', ''), '#', '')) AS json_field, 
      ROW_NUMBER() OVER(PARTITION BY b_posts.interne_id, b_posts.social_network_name ORDER BY b_posts.observation_date DESC) as nombre_ligne,
      creation_date, 
      nb_liked
    FROM rs.b_posts, rs.d_sequence AS seq
    WHERE seq.i < JSON_ARRAY_LENGTH(b_posts.tags)
    AND b_posts.organisation_name='Elipce Informatique'
    AND is_valid_json_array(b_posts.tags)
  )
WHERE json_field IS NOT NULL
AND nombre_ligne=1
GROUP BY json_field,social_network_name,creation_date;
"""
