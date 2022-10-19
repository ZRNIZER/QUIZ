<html>
    <head>
        <title>Quiz</title>
        <meta charset="utf-8">
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        
        <div class="esia">
        </div>
        
        
        
        
        <div class="pytanie">
        <?php
            $con = new mysqli("localhost", "root", "", "mydb");
            $ile = $con->query("Select count(id) FROM pytania");
            $max = $ile->fetch_array()[0];
            $los = rand(1, $max);
            
            
            $zap = $con->query("Select id, treść FROM pytania WHERE id=$los");
            $wyp = $zap->fetch_all(MYSQLI_ASSOC);
                for($i=0;$i<count($wyp); $i++){
                    echo $wyp[$i]["treść"]."<br>";
                    
                }
            ?>
        </div>
        <div>
            
            <?php
            $odp = $con->query("SELECT `id`, `Treść` FROM `odpowiedzi` 
                                JOIN pytania_has_odpowiedzi ON pytania_has_odpowiedzi.Odpowiedzi_id=odpowiedzi.id
                                WHERE pytania_has_odpowiedzi.Pytania_id = $los");
            
            $wypodp = $odp->fetch_all(MYSQLI_ASSOC);
                for($i=0; $i<count($wypodp); $i++){
                    echo "<button>".$wypodp[$i]["Treść"]."</button><br>";
                }
                
            
         
            
        ?>
        </div>
    </body>
</html>