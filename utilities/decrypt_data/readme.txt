Step 1:
Create a DB snapshot in RDS for backup.



Step 2:
Copy the original table into a backup table.

#Create backup table
CREATE TABLE eg_user_decpt AS SELECT * FROM eg_user;




Step 3:
Verify the data in the backup table whether all data inserted correctly by making count.
SELECT count(*) from eg_user;
SELECT count(*) from eg_user_backup;



Step 4:
List the tables and fields that need to be decrypted



Step 5:
Update the Configuration in the decrypt.py



Step 6:
Verify python3 is installed and the psycopg2 package is installed via pip3



Step 7:
Port forward the encryption service in portnumber 8094
kubectl port-forward "${POD}" 8094:8080 -n egov



Step 8:
Run the script and verify the data.
python3 decrypt.py