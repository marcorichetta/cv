# CV

## Descripción

Acá tengo los archivos para generar mi CV tomando como input un archivo `yaml`.
Basado en https://github.com/rendercv/rendercv.

## Instalación

```bash
uv sync
```

## Uso

Modificar archivos `.yaml` en base a la spec. [Docs](https://docs.rendercv.com/user_guide/)

```bash
uv run rendercv render marco-richetta-en.yaml -nopng -nohtml -o cv_en
```
