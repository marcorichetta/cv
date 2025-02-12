# Generate English version CV without PNG/HTML output
cv:
	uv run rendercv render marco-richetta_cv.yaml -nopng -nohtml --design design.yaml -o cv_en

# Same but Spanish 
cv-es:
	uv run rendercv render marco-richetta-es_cv.yaml -nopng -nohtml --design design.yaml -o cv_es

# Watch for changes and regenerate English CV automatically
watch:
	uv run rendercv render marco-richetta_cv.yaml -nopng -nohtml --design design.yaml -o cv_en --watch
