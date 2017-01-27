SELECT regexp_substr(&prm_lista_codigos, '[^,]+', 1, LEVEL) cd_substr
FROM dual
CONNECT BY regexp_substr(&prm_lista_codigos, '[^,]+', 1, LEVEL) IS NOT NULL;
