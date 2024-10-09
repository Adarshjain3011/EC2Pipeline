
const express = require("express");

const app = express();

app.use(express.json());

app.get("/",(req,res)=>{
    
    res.send("Welcome to the API!");

})

app.get("/user",(req,res)=>{

    res.status(200).json({

        data:{
            name:"temp",
            email:"temp@gmail.com",
        },
        message:"done ",
        error:null,

    })
})


app.listen(3000,()=>{

    console.log("Server is running on port 3000");
 
});

