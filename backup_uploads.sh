#!/bin/sh

uploads_directory="/home/ubuntu/loyalty/lmg-formosa-fidelitas-2/media/uploads/"

# Ayuda y modo de empleo
mostrarAyuda () {
echo -e "$0 | USO:"
echo -e "$0 | \t./backups_uploads.sh [-i <PATH> | -f <PATH> | -h]"
echo -e "$0 | OPCIONES:"
echo -e "$0 | \t-i\tPath completo del archivo origen."
echo -e "$0 | \t-f\tPath completo del archivo destino."
echo -e "$0 | \t-h\tMuestra esta ayuda"
}

# Procesamiento de parámetros
while getopts 'i:f:h' OPCION; do
  case $OPCION in
    i)
      uploads_directory="$OPTARG"
      ;;
    f)
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

date=`date +"%Y%m%d_%H%M%N"`
filename="${path}/uploads_${date}.zip"

zip -r $filename $uploads_directory 
