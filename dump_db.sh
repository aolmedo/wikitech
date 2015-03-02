#!/bin/sh
path="/home/ubuntu/backups"
dbname="formosa"

# Ayuda y modo de empleo
mostrarAyuda () {
echo -e "$0 | USO:"
echo -e "$0 | \t./dump_db.sh [-d <DBNAME> | -f <PATH> | -h]"
echo -e "$0 | OPCIONES:"
echo -e "$0 | \t-d\tNombre de la base de datos."
echo -e "$0 | \t-u\tUsuario de la base de datos"
echo -e "$0 | \t-p\tPassword del usuario de la base de datos"
echo -e "$0 | \t-f\tPath completo del archivo destino."
echo -e "$0 | \t-h\tMuestra esta ayuda"
}

# Procesamiento de parámetros
while getopts 'd:u:p:f:h' OPCION; do
  case $OPCION in
    d)
      dbname="$OPTARG"
      ;;
    u)
      user="$OPTARG"
      ;;
    p)
      password="$OPTARG"
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
filename="${path}/${dbname}_${date}.gz"
pg_dump -U $user -W $password $dbname | gzip > $filename
