#!/bin/sh
path="/var/www/pyp-demo-fidelitas"
project_folder="demo_fidelitas"
branch="master"

# Ayuda y modo de empleo
mostrarAyuda () {
echo -e "$0 | USO:"
echo -e "$0 | \t./autopull.sh [-p <PATH> | -w <FOLDER_NAME> | -b <BRANCH_NAME> | -h]"
echo -e "$0 | OPCIONES:"
echo -e "$0 | \t-b\tNombre de la rama de repositorio"
echo -e "$0 | \t-w\tCarpeta donde esta el archivo wsgi.py"
echo -e "$0 | \t-p\tPath completo del directorio del repositorio"
echo -e "$0 | \t-h\tMuestra esta ayuda"
}

# Procesamiento de parámetros
while getopts 'b:w:p:h' OPCION; do
  case $OPCION in
    b)
      branch="$OPTARG"
      ;;
    w)
      project_folder="$OPTARG"
      ;;
    p)
      path="$OPTARG"
      ;;
    h)
      mostrarAyuda
      ;;
    ?)
      echo -e "$0 | ERROR: -$OPTARG no es un parámetro válido."
      mostrarAyuda
      exit 1;
      ;;
  esac
done

wsgi_file="${path}/${project_folder}/wsgi.py"

cd ${path}
/usr/bin/git pull origin ${branch}
. env/bin/activate
python manage.py collectstatic
touch ${wsgi_file}
