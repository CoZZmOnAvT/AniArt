<?php

	/*
		Вся база данных прикреплена в виде sql файла доступного для импорта : /database.sql
		Так же есть	doc файл с таблицами проекта : /tables.doc
	*/

	//Функция которая демонстрирует принцып работы "Таблицы связей"
	//Posts - Главная таблица
	//Posts_tree - Та самая таблица связей
	function closureTable(){
		$DBH = new PDO('mysql:dbname=aniart;host=localhost', 'root', '');
		$DBH->exec('SET NAMES "utf8"');

		//Id должности подчинённых которой нужно выбрать
		$boss_id = 3;

		$STH = $DBH->prepare('SELECT * FROM `posts` WHERE `id` = ?');

        $STH->execute(array($boss_id));

        $data = $STH->fetch(PDO::FETCH_ASSOC);

        echo "<h3>Керівник - ".$data['Name'].'</h3>';

        $STH = $DBH->prepare('SELECT * FROM `posts`
        					  JOIN `posts_tree` ON (`posts`.`id` = `posts_tree`.`descendant`)
        					  WHERE `posts_tree`.`ancestor` = ?');

        $STH->execute(array($boss_id));
        
        while($data = $STH->fetch(PDO::FETCH_ASSOC)){
        	echo "Підлеглий - ".$data['Name'].'<br />';
        }
	}


	//Функция которая демонстрирует принцып работы "Вложеных множеств"
	//nest - Главная таблица
	function nestedSets(){
		$DBH = new PDO('mysql:dbname=aniart;host=localhost', 'root', '');
		$DBH->exec('SET NAMES "utf8"');

		//Id категории вложения которой нужно просмотреть
		$cat_id = 2;

		$STH = $DBH->prepare('	SELECT node.id, node.name, node.level
								FROM nest AS node,
									 nest AS parent
								WHERE node.lft BETWEEN parent.lft AND parent.rgt
								AND parent.id = ?
								ORDER BY node.lft');

        $STH->execute(array($cat_id));
        echo 'ID - NAME - LEVEL<br />';
        while($data = $STH->fetch(PDO::FETCH_ASSOC)){
        	echo $data['id'].' - '.$data['name'].' - '.$data['level'].'<br />';
        }
	}
