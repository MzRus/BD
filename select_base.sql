ELECT 
    `salespeople`.`sname`,
    `salespeople`.`city`,
    `salespeople`.`comm`
FROM `shop`.`salespeople`;


/* Отбор без повторяющихся значений */
SELECT all
`sales`.`sdate`, `sales`.`snum`
FROM `shop`.`sales`;



/* Отбор по условию (предложение where) */
/* Отбор продавцов из определённых городов*/
SELECT 
    `salespeople`.`sname`,
    `salespeople`.`comm`
FROM 
	`shop`.`salespeople`
	WHERE 
		`salespeople`.`city` = 'Новосибирск' OR `salespeople`.`city` = 'Тверь';
		/* Отбор покупателей по опредленённому рейтингу*/
SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM 
	`shop`.`customers`
	WHERE 
		NOT `customers`.`rating`>=200; 
		    
		   
		   /* Применение условий отбора для NULL-значений*/
    SELECT 
    `customers`.`cname`,
    `customers`.`city`
FROM 
	`shop`.`customers`
	WHERE 
		`customers`.`rating` <> 200 OR  `customers`. `rating` = 200; 
		    /*NULL-значения (неизвестный результат сравнения) не выводятся в результат отбора*/
    
    /*оставные условия с логическими операторами OR, AND, NOT*/
        SELECT 
	    `customers`.`cname`,
	    `customers`.`city`
	FROM 
		`shop`.`customers`
		WHERE 
			`customers`.`city` = 'Санкт-Петербург' AND NOT `customers`.`rating` > 200;
			    
			      SELECT 
			    `customers`.`cname`,
			    `customers`.`city`
			FROM 
				`shop`.`customers`
				WHERE 
					NOT (`customers`.`city` = 'Санкт-Петербург' AND NOT `customers`.`rating` > 200);
					    
					    /*Пример отбора по датам*/
SELECT
	`sales`.`snum`,
	    `sales`.`cnum`,
	    `sales`.`sdate`,
	    `sales`.`amount`
	FROM
		`shop`.`sales`
		WHERE
			(`sales`.`sdate` > '2024-08-31'
				    AND  `sales`.`sdate` < '2024-10-01')
			    AND (NOT (`sales`.`sdate` > '2024-09-12'
					    AND  `sales`.`sdate` < '2024-09-16'))
			    AND NOT cnum = 203 OR (cnum = 203) 
			    AND (`sales`.`sdate` > '2024-09-30' 
				    AND `sales`.`sdate` < '2024-10-31');
