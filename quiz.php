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
            
            $count;
            if(isset($_COOKIE["pytania"])){
                $count=$_COOKIE["pytania"];
                $count++;
            }
            else{
                $count=0;
            }
            setcookie("pytania",$count);
            
            $tablica=[];
            $con = new mysqli("localhost", "root", "", "mdb12");
            $ile = $con->query("SELECT count(id) FROM pytania");
            $max = $ile->fetch_array()[0];
            $questions=[];
            $index=0;
            if(isset($_POST["pytania"]) && isset($_POST["index"])){
                $questions=unserialize($_POST["pytania"]);
                $index=$_POST["index"];
            }
            else{
                while(count($questions)<5){
                    $los = rand(1, $max);
                    if(!in_array($los,$questions)){
                        $questions[]=$los;
                        
                    }
                }        
            }
            
           
            
            $zap = $con->query("SELECT id, treść FROM pytania WHERE id=".$questions[$index].";");
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
                                WHERE pytania_has_odpowiedzi.Pytania_id = $questions[$index]");
            
            echo '<form method="POST">
            <input type="hidden" name="question" value="'.$questions[$index].'"/>
            <input type="hidden" name="pytania" value="'.serialize($questions).'"/>
             <input type="hidden" name="index" value="'.($index+1).'"/>';
            $wypodp = $odp->fetch_all(MYSQLI_ASSOC);
                for($i=0; $i<count($wypodp); $i++){
                    echo '<input type="checkbox" name="'.$wypodp[$i]["id"].'" value="'.$wypodp[$i]["Poprawna"].'">'.$wypodp[$i]["Treść"]."<br>";
                }
            echo '<button type="submit">Sprawdź</button>';
            echo '</form>';
            print_r($_POST);
            
            //if(isset()){
            //    $los=0;
            //}else{
              //  if (isset($los["Poprawna"])){
                //    $Poprawna=$los["Poprawna"];
                //}
            //}
            
                
            
         
            
        ?>
        </div>
    </body>
</html>