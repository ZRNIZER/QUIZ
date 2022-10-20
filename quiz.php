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
            $tablica=[];
            $con = new mysqli("localhost", "root", "", "mydb");
            $ile = $con->query("SELECT count(id) FROM pytania");
            $max = $ile->fetch_array()[0];
            $questions=[];
            if(isset($_POST["pytania"])){
                $questions=unserialize($_POST["pytania"]);
            }
//            }else{
                     $los = rand(1, $max);
//            while(count($questions)<5){
//                if ()
//            }
//            }
            
           
            
            $zap = $con->query("SELECT id, treść FROM pytania WHERE id=$los");
            $wyp = $zap->fetch_all(MYSQLI_ASSOC);
                for($i=0;$i<count($wyp); $i++){
                    echo $wyp[$i]["treść"]."<br>";
                    
                }
            ?>
        </div>
        <div>
            
            <?php
            $odp = $con->query("SELECT `id`, `Treść`,`Poprawna` FROM `odpowiedzi` 
                                JOIN pytania_has_odpowiedzi ON pytania_has_odpowiedzi.Odpowiedzi_id=odpowiedzi.id
                                WHERE pytania_has_odpowiedzi.Pytania_id = $los");
            
            echo '<form method="POST">
            <input type="hidden" name="question" value="'.$los.'"/>
            <input type="hidden" name="pytania" value="'.serialize($questions).'"/>';
            $wypodp = $odp->fetch_all(MYSQLI_ASSOC);
                for($i=0; $i<count($wypodp); $i++){
                    echo '<input type="checkbox" name="'.$wypodp[$i]["id"].'" value="'.$wypodp[$i]["Poprawna"].'">'.$wypodp[$i]["Treść"]."<br>";
                }
            echo '<button type="submit">Sprawdź</button>';
            echo '</form>';
            print_r($_POST);
            
            if(isset($los)){
                $los=0;
            }else{
                if (isset($los["Poprawna"])){
                    $Poprawna=$los["Poprawna"];
                }
            }
                
            
         
            
        ?>
        </div>
    </body>
</html>