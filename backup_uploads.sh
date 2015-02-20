date=`date +"%Y%m%d_%H%M%N"`
filename="/home/ubuntu/backups_db/uploads_${date}.zip"
uploads_directory="/home/ubuntu/loyalty/lmg-formosa-fidelitas-2/media/uploads/"

zip -r $filename $uploads_directory 
