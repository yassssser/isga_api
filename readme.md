# Academic project
## Isga APi

### you will find the database in the same folder isga_app.sql 

1. to start the server : symfony server:start
2. to show all route : **php bin/console debug:router**
3. the route for login is : http://127.0.0.1:8000 **/login/{email}/{password}** with  **Method GET** and password must be crypted with **md5** , the return will be **Etudiant object** if it's correct
4. Or use jwt auth in route http://127.0.0.1:8000 **/login_check
    1. by default the password of the Etudiant is : password123
    2. you will find all the information in the object["hydra:member"]
5. to get more information about the object exemple : list of absences of a user : **http://127.0.0.1:8000/api/etudiants/{user id}/absences** , and the same thing go for the other entity 
    1. list of absence on matiere **http://127.0.0.1:8000/api/matieres/{matiere id}/absences** 


