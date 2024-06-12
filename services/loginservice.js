const db_connection =require('../db')

// authenticate user  module
const authUser =async (email,password)=>{
    try {
        // query the database for the credentials provided
        const [user]=await db_connection.query('SELECT * FROM users where email=? and password =?',[email,password])
        console.log(user)
        // check if there is any record
        if(user.length>0){
            // if yes get the first record found
            const userData = user[0]
            // check if the credentials from the database matches with the ones provided
            if(userData.email == email && userData.password == password){
                return {message:`Welcome ${userData.firstName}`,data:userData}
            }
            else{
                return{message:'Incorrect Username or Password'}
            }
           
        }
        else{
             // if no
             return {message:'User not found'};
        }
    } catch (error) {
        // console log the errors if any is found
        console.log(error)
    }
}

// export module
module.exports = {authUser}