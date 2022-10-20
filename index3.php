<html>
    <head>
        <meta charset="utf-8">
        <title>tak</title>
    </head>
    <body>
        <?php
        $count;
            print_r ($_POST);
        if(isset($_POST["c"])){
            $count=$_POST["c"];
            $count++;
        }else{
            $count=0;
        }
        ?>
        <form method="post">
            <input type="hidden" name="c" value="<?php echo $count; ?>">
            <input name="imie">
            <input name="Nazwisko">
            <input type="submit">
        </form>
    </body>
</html>